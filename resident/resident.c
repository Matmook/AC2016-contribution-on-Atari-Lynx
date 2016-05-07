/*
 * The code and data defined here is placed in resident RAM
 */
#include <lynx.h>
#include <stdlib.h>
#include <string.h>
#include <tgi.h>
#include <joystick.h>
#include <6502.h>


#include "../resident/resident.h"
#include "../include/global.h"

/* global root sprite used in all parts */
sprite_t *root_sprptr;
unsigned char current_game_part;
unsigned char joy;
unsigned char clear_screen;
unsigned int frames,frames2;
int i,j,r,t,x,y;

/* cos table like for animation */
unsigned char costable[24] = {0xE,0xE,0xD,0xD,0xB,0xB,0xA,0xA,0x9,0x8,0x7,0x6,0x6,0x5,0x4,0x4,0x3,0x3,0x2,0x2,0x2,0x1,0x1,0x1};


void refresh_screen()
{ 
  if(clear_screen)
    tgi_clear();
  
  tgi_sprite(root_sprptr);	
	tgi_updatedisplay();
  while (tgi_busy());
  frames++;
  frames2++;
 
}

int main(void)
{
	joy_install(&lynx_stdjoy);
	tgi_install(&lynx_160_102_16);
  tgi_init();
  tgi_setcollisiondetection(0);
  tgi_setframerate(75);
 
  
  clear_screen = 0;
  // lynx_snd_init();
  CLI();

  // POKE(SPRSYS, 0xA0);

  current_game_part = GAME_PART_BOOT;
	while(1)
	{
    switch(current_game_part)
    {
      case GAME_PART_BOOT:
      case GAME_PART_TITLE:
      {
        lynx_load(TITLE_FILENR);
        title_init();
      } break;
      
      case GAME_PART_GAME:
      {
        lynx_load(INGAME_FILENR);
        ingame_init();
      }break;
    }
	}

    return 0;
}

