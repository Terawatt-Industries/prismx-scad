// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

use <heatbed.scad>;
use <../y-motor-bracket-univy.scad>;
use <../y-rod-support.scad>;
use <../sheliak_xend_idler_mount.scad>;
use <../sheliak_xend_motor_mount.scad>;

$fn=50;

% translate([0, 0, -3]) heatbed();
plate1();

module plate1() {
	for (o = [115, 145]) {
		translate([o, 25, 0]) yrodsupport();
		translate([o, 100, 0]) yrodsupport();
	}
	translate([30, 120, 0]) rotate([0, 0, -90]) ymotormount();
	translate([60, 25, 0]) slim_xend_idler_mount();
	translate([60, 130, 0]) slim_xend_motor_mount();
}
