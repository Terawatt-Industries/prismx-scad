// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

use <heatbed.scad>;
use <../../moreparts/terawatt-pro-power/src/mnt_4pin_5mmsterm.scad>;
use <../../moreparts/terawatt-pro-power/src/mnt_pwr_sw.scad>;
use <../../moreparts/terawatt-pro-power/src/mnt_atx_psu_brd.scad>;
use <../../moreparts/terawatt-pro-power/src/mnt_ramps14_clip.scad>;

$fn=50;

% translate([0, 0, -3]) heatbed();
plate1();

module plate1() {
	for (y = [95, 135]) {
		translate([80, y, 0]) rotate([0, 0, 90]) term_mnt_5mm_2hole();
	}
	for (y = [95, 135]) {
		translate([60, y, 0]) rotate([0, 0, 90]) term_mnt_5mm_2hole();
	}
	translate([60, 50, 0]) power_switch_mount();
	translate([160, 120, 0]) rotate([0, 0, 90]) term_mnt_atx_psubrd();
	translate([100, 20, 0]) term_mnt_ramps14();
}
