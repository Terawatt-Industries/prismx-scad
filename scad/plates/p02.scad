// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

use <heatbed.scad>;
use <../y-idler.scad>;
use <../y-idler-pulley.scad>;
use <../filament-guidler-top.scad>;
use <../belt_tensioner.scad>;
use <../leadscrew_nut_simple.scad>;

$fn=50;

% translate([0, 0, -3]) heatbed();
plate1();

module plate1() {
	translate([105, 40, 0]) topguidler();
	translate([80, 50, 0]) y_idler_pulley();
	for (o = [35, 90]) {
		translate([30, o, 0]) yidler();
	}
	translate([80, 100, 0]) belt_clamps();
	for (o = [110, 145]) {
		translate([120, o, 0]) square_peg_round_hole();
	}
}
