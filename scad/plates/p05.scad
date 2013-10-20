// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

use <heatbed.scad>;
use <../z-endstop.scad>;
use <../z-motor-bracket.scad>;
use <../z-idler.scad>;
use <../z-idler-pulley.scad>;

$fn=50;

% translate([0, 0, -3]) heatbed();
plate1();

module plate1() {
	translate([25, 25, 0]) zmotorbracket();
	translate([90, 40, 0]) z_endstop();
	translate([100, 150, 0]) z_idler_pulley();
	translate([50, 150, 0]) z_idler_pulley();
	translate([150, 90, 0]) rotate([0, 0, 90]) z_idler_mount();
}
