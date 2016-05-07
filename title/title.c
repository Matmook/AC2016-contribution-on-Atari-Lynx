
#include <lynx.h>
#include <tgi.h>
#include <6502.h>
#include "../include/global.h"
#include <joystick.h>

#include "title.h"


void title_init()
{
  current_game_part = GAME_PART_TITLE;
 
  /* use this sprite list */
  root_sprptr = (sprite_t *) &sprite_root;
  
  /* don't screen on each frame */
  clear_screen = 0;
  
  
  while (tgi_busy());
  tgi_clear();
  tgi_setpalette(titre_pal);
  
  while(1)
  {
    joy = joy_read(JOY_1);
    if (JOY_BTN_FIRE(joy) || JOY_BTN_FIRE2(joy))
      break;
    
    refresh_screen();
  }
   
  current_game_part = GAME_PART_GAME;
}




