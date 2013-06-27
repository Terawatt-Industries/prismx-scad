// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

use <heatbed.scad>;
use <../rod-holder-y-and-z-bottom.scad>;
use <../sheliak_xcarriage.scad>;
use <../sheliak_xend_idler_mount.scad>;
use <../sheliak_xend_motor_mount.scad>;

$fn=50;

% translate([0, 0, -3]) heatbed();
plate1();

module plate1() {
	translate([85, 75, 0]) rotate([0, 0, 180]) rodholder_clamp();
	translate([110, 75, 0]) rotate([0, 0, 180]) rodholder_clamp();
	translate([170, 175, 0]) rotate([0, 0, 180]) slim_x_carriage();
	translate([30, 80, 0]) slim_xend_idler_mount();
	translate([30, 135, 0]) slim_xend_motor_mount();
}
