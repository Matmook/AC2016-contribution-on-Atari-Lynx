#ifndef GLOBAL_H_INCLUDED
#define GLOBAL_H_INCLUDED

#define NULL 0

#define SPRCTL0_1_bit_per_pixel 0
#define SPRCTL0_2_bits_per_pixel 0x40
#define SPRCTL0_3_bits_per_pixel 0x80
#define SPRCTL0_4_bits_per_pixel 0xc0
#define SPRCTL0_h_flip 0x20
#define SPRCTL0_v_flip 0x10
#define SPRCTL0_shadow 7
#define SPRCTL0_xor_shadow 6
#define SPRCTL0_non_collide 5
#define SPRCTL0_normal 4
#define SPRCTL0_boundary 3
#define SPRCTL0_boundary_shadow 2
#define SPRCTL0_background_no_coll 1
#define SPRCTL0_background_shadow 0

#define SPRCTL1_literal 0x80
#define SPRCTL1_hsize_vsize_strech_tilt 0x30
#define SPRCTL1_hsize_vsize_strech 0x20
#define SPRCTL1_hsize_vsize 0x10
#define SPRCTL1_no_palette 0x08
#define SPRCTL1_skip_sprite 0x04
#define SPRCTL1_start_drawing_up 0x02
#define SPRCTL1_start_drawing_left 0x01

#define SPRCOLL_dont_collide 0x20
#define SPRCOLL_number_0_3 0x00

#define MATHAB 0xfc54
#define MATHCD 0xfc52
#define MATHPN 0xfc56
#define MATHABCD 0xfc52
#define MATHEFGH 0xfc60
#define MATHJKLM 0xfc6c

#define SPRSYS 0xFC92
#define SCBNEXTL 0xFC10
#define SCBNEXTH 0xFC11
#define SPRGO 0xFC91
#define SDONEACK 0xFD90
#define CPUSLEEP 0xFD91


#define LXJOY 		0xFCB0
#define LXJOY_F1 	1
#define LXJOY_F2 	2
#define LXJOY_O2 	4
#define LXJOY_O1 	8
#define LXJOY_RIGHT	16
#define LXJOY_LEFT 	32
#define LXJOY_DOWN 	64
#define LXJOY_UP 	128



typedef struct
{
    unsigned char b0;
    unsigned char b1;
    unsigned char b2;
    void *next;
    void *bitmap;
    int posx, posy;
    int sizex;
    int sizey;
    char palette[8];
} sprite_t;

extern void title_init();
extern void title_loop();
extern void ingame_init();

extern unsigned char current_game_part;
extern unsigned char joy;
extern unsigned char clear_screen;
extern unsigned int frames,frames2;
extern unsigned char costable[24];
extern int i,j,r,t,x,y;
extern sprite_t *root_sprptr;
extern void refresh_screen();
#define GAME_PART_BOOT    0
#define GAME_PART_TITLE   1
#define GAME_PART_GAME    2


#define POKE(a,b) (*(char *)(a))=(b)

#define BUTTON_OPTION1	0x08
#define BUTTON_OPTION2	0x04
#define BUTTON_INNER	0x02
#define BUTTON_OUTER	0x01
#define BUTTON_PAUSE	0x01

#define JOY_BTN_FLIP(v)        (((*(char *)0xFCB0)&BUTTON_OPTION2) && ((*(char *)0xFCB1)&BUTTON_PAUSE))

#endif
