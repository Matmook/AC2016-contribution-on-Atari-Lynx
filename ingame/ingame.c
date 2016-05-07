#include <stdlib.h>
#include <lynx.h>
#include <tgi.h>
#include <6502.h>
#include "../include/global.h"
#include <joystick.h>

#include "ingame.h"

#define MAX_SPRITE 71
#define SPRITE_BASE 1
#define SPRITE_GAMEA 64
#define SPRITE_GAMEB 65
#define SPRITE_RABBIT 57
#define SPRITE_COCOTTE 66
#define SPRITE_BIP 67
#define SPRITE_LIFE 68
#define VISIBLE 3
#define FADE    2
#define HIDDEN  0

#define PAD_SPEED 3
#define BASE_SPEED 5
#define INTER_SPEED_A 7
#define INTER_SPEED_B 5
#define COCOTTE_MAX_TIME 40

int score;
void update_score()
{
  sprite_t *sprptr;
  unsigned char scorenum[5];
  
  /* score */
  r = score;
  for(j=0;j<5;j++)
  {	
	  t = (r/10); 
	  scorenum[j] = r-(10*t); 
	  r = t;
  }
  
  sprptr = (sprite_t *) &SCBscore0;
  for(j=5;j>0;j--)
  {
    switch(scorenum[j-1])
    {
      case 0 : sprptr->bitmap = n0; break;
      case 1 : sprptr->bitmap = n1; break;
      case 2 : sprptr->bitmap = n2; break;
      case 3 : sprptr->bitmap = n3; break;
      case 4 : sprptr->bitmap = n4; break;
      case 5 : sprptr->bitmap = n5; break;
      case 6 : sprptr->bitmap = n6; break;
      case 7 : sprptr->bitmap = n7; break;
      case 8 : sprptr->bitmap = n8; break;
      case 9 : sprptr->bitmap = n9; break;	  
    }
    sprptr = sprptr->next;
  }
  
}

typedef struct {
    unsigned char *music0;
    unsigned char *music1;
    unsigned char *music2;
    unsigned char *music3;
} song_t;

extern song_t musicptr;

void ingame_init()
{
  unsigned char rpos = 3;
  int sprite_state[MAX_SPRITE];
  sprite_t *wspr;
  int random_position;
  unsigned char  enable_pad = PAD_SPEED;
  int  speed = BASE_SPEED;
  int  speed_counter = 1;
  int  inter_pause = INTER_SPEED_A;
  int  inter_speed = 0;
  int  cocotte_timer = 0;
  unsigned char gamemode = 0;
  unsigned char lock_action = 0;
  unsigned char life = 0;
  
  // lynx_snd_init();
  // lynx_snd_pause();
// lynx_snd_play(0, musicptr.music0);
// lynx_snd_play(1, musicptr.music1);
// lynx_snd_play(2, musicptr.music2);
// lynx_snd_play(3, musicptr.music3);
// lynx_snd_continue();
  
  /* display all sprites */
  wspr = (sprite_t *) &SCBbackg;
  wspr = wspr->next;
  for(i=0;i<MAX_SPRITE;i++)
  {
    wspr->palette[0] = 0x0F;
    sprite_state[i] = VISIBLE;
    wspr = wspr->next;
  }
  
  score = 0;
  update_score();
  
  /* use this sprite list */
  root_sprptr = (sprite_t *) &SCBbackg;
  
  /* don't screen on each frame */
  clear_screen = 0;
  
  
  while (tgi_busy());
  tgi_clear();
  tgi_setpalette(ingame_pal);
  
  
  while(current_game_part == GAME_PART_GAME)
  {  
    /* read joystick */
    joy = joy_read(JOY_1);
    
    if(gamemode == 0)
    {
      srand(frames2);
      
      
      /* display all sprites */
      wspr = (sprite_t *) &SCBbackg;
      wspr = wspr->next;
      for(i=0;i<MAX_SPRITE;i++)
      {
        wspr->palette[0] = 0x0F;
        sprite_state[i] = VISIBLE;
        wspr = wspr->next;
      }
      
      if (JOY_BTN_FIRE(joy))
      {
        gamemode = 1;
        sprite_state[SPRITE_GAMEA] = VISIBLE;
        sprite_state[SPRITE_GAMEB] = FADE;
        inter_speed = INTER_SPEED_A;
      }        
      if (JOY_BTN_FIRE2(joy))
      {
        gamemode = 2;
        sprite_state[SPRITE_GAMEA] = FADE;
        sprite_state[SPRITE_GAMEB] = VISIBLE; 
        inter_speed = INTER_SPEED_B;
      }
      
      if(JOY_BTN_FLIP(joy))
      {
        tgi_flip();
        frames = 0;
        while(frames<50) 
          refresh_screen();
      }      
      
      if(gamemode != 0)
      {
        srand(frames2);
        score = 0;
        update_score();
        enable_pad = PAD_SPEED;
        speed = BASE_SPEED;
        speed_counter = 1;
        inter_pause = inter_speed;
        lock_action = 0;
        life = 3;
        
        for(i=SPRITE_BASE;i<SPRITE_RABBIT;i++)
          sprite_state[i] = FADE;
        
        sprite_state[SPRITE_COCOTTE] = FADE;
        sprite_state[SPRITE_BIP] = FADE;
        
        for(i=0;i<15;i++)
          refresh_screen();
      }
      
      refresh_screen();
      continue;
    }
    
   
    
    /* check pad if enabled */
    if(enable_pad)
    {
      enable_pad--;
    } else {
    
      if (JOY_BTN_RIGHT(joy))
      {
        if(rpos<6) rpos++;
        enable_pad = PAD_SPEED;
      }
      
      if (JOY_BTN_LEFT(joy))
      {
        if(rpos>0) rpos--;
        enable_pad = PAD_SPEED;
      }
      
      /* catch a cocotte ? */
      if ( JOY_BTN_FIRE(joy) && !lock_action)
      {
        lock_action = 1;

        if(sprite_state[SPRITE_COCOTTE] == VISIBLE)
        {
          score+=10;
          sprite_state[SPRITE_BIP] = VISIBLE;
          update_score();
          sprite_state[SPRITE_COCOTTE] = FADE;
          cocotte_timer = 1;
        }        
        else if(sprite_state[SPRITE_COCOTTE] == HIDDEN)
          {
            score -= 10;
            if( score < 0 ) score = 0;
            update_score();
          }
      }
    }
    
    /* unlock action button */
    if ( !JOY_BTN_FIRE(joy) && lock_action)
    {
      lock_action = 0;
    }
    
    /* update rabbit pos */
    for(i=SPRITE_RABBIT;i<SPRITE_RABBIT+7;i++)
    {
      if( rpos == (i-SPRITE_RABBIT) )
        sprite_state[i] = VISIBLE;
      else if(sprite_state[i] == VISIBLE)
        sprite_state[i] = FADE;
    }

    /* hide cocotte if needed */
    if(sprite_state[SPRITE_COCOTTE] == VISIBLE)
    {
      cocotte_timer--;
      if(!cocotte_timer)
        sprite_state[SPRITE_COCOTTE] = FADE;
    }
    
    
    /* update cocos */
    if(speed_counter)
    {
      speed_counter--;
    } else {
      
      if(sprite_state[SPRITE_BIP] == VISIBLE)
        sprite_state[SPRITE_BIP] = FADE;
      
      speed_counter = speed;
      
      
      for(i=0;i<7;i++)
      {
        if(sprite_state[SPRITE_RABBIT-7+i] == VISIBLE )
        {
          if( i == rpos)
          {
            score++;
            sprite_state[SPRITE_BIP] = VISIBLE;
            update_score();
            
          } else {
            
            /* YOU LOOSE !! */
            life--;
            if(!life)
            {
              gamemode = 0;
              refresh_screen();
              continue;
            }
          }
            
        }
        
      }
      
      /* do the "fall" */
      for(i=(SPRITE_RABBIT-8);i>=SPRITE_BASE;i--)
      {
        if(sprite_state[i] == VISIBLE)
        {
          sprite_state[i] = FADE;
          sprite_state[i+7] = VISIBLE;
        } else {
          if(i>=(SPRITE_RABBIT-14))
            sprite_state[i+7] = HIDDEN;
        }
      }
      
      if(!(--inter_pause))
      {
        inter_pause = inter_speed;
        
        /* choose new start position */        
        random_position = rand();
       // if(random_position&0x1)
        {
          random_position&=0x7;
          for(i=0;i<7;i++)
          {
            if(i == random_position)
              sprite_state[SPRITE_BASE+i] = VISIBLE;
            else sprite_state[SPRITE_BASE+i] = HIDDEN;
          }
        }
        
        /* display cocotte */
        if( (rand()&0xFF) > 192 && ( sprite_state[SPRITE_COCOTTE] != VISIBLE ))
        {
          sprite_state[SPRITE_COCOTTE] = VISIBLE;
          cocotte_timer = COCOTTE_MAX_TIME;
        }        
      }
      
      
    }     
    
    /* update lifes */
    if(life>2) 
      sprite_state[SPRITE_LIFE] = VISIBLE;
    else sprite_state[SPRITE_LIFE] = HIDDEN;
    if(life>1) 
      sprite_state[SPRITE_LIFE+1] = VISIBLE;
    else sprite_state[SPRITE_LIFE+1] = HIDDEN;
    if(life>0) 
      sprite_state[SPRITE_LIFE+2] = VISIBLE;
    else sprite_state[SPRITE_LIFE+2] = HIDDEN;
    
    /* update all sprites */
    wspr = (sprite_t *) &SCBbackg;
    wspr = wspr->next;
    for(i=SPRITE_BASE;i<MAX_SPRITE;i++)
    {
      if(sprite_state[i] == VISIBLE)
      {       
        wspr->palette[0] = 0x0F;
      } else if(sprite_state[i] != HIDDEN)
        {
          sprite_state[i]--;
          wspr->palette[0] = 0x09;
        } else {
          wspr->palette[0] = 0x00;
        }
      
      wspr = wspr->next;
    }
    
    refresh_screen();
	}	
}
