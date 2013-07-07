// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

use <heatbed.scad>;
use <../../moreparts/terawatt-pro-power/src/mnt_4pin_5mmsterm.scad>;
use <../../moreparts/terawatt-pro-power/src/mnt_pwr_sw.scad>;
use <../../moreparts/terawatt-pro-power/src/mnt_atx_psu_brd.scad>;
use <../../moreparts/terawatt-pro-power/src/mnt_ramps14_clip.scad>;
use <../../moreparts/nut-clamps/nut_clamps.scad>;

$fn=50;

% translate([0, 0, -3]) heatbed();
plate1();

module plate1() {
	for (x = [15, 60]) {
		translate([x, 150, 0]) term_mnt_5mm_2hole();
	}
	translate([15, 120, 0]) term_mnt_5mm_2hole();
	translate([15, 75, 0]) power_switch_mount();
	translate([180, 120, 0]) rotate([0, 0, 90]) term_mnt_atx_psubrd();
	translate([120, 20, 0]) term_mnt_ramps14();
	for (y = [90, 135]) {
		translate([80, y, 10]) nut_clamp_pair(20, 4, 3);
	}
	for (x = [35, 85]) {
		translate([x, 45, 10]) nut_clamp_pair(20, 4, 3);
	}
}
