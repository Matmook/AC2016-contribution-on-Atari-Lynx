extern char titre_pal[];
extern char titre_spr[];

	
sprite_t sprite_root = {
	 SPRCTL0_4_bits_per_pixel | SPRCTL0_normal,
	 SPRCTL1_hsize_vsize,
	 SPRCOLL_dont_collide,
	 0,
	 &titre_spr,
	 0, 0,
	 0x100, 0x100,
	  {0x01,0x23,0x45,0x67,0x89,0xab,0xcd,0xef}
	};
	