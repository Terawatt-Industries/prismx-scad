// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

use <heatbed.scad>;
use <../y-motor-bracket-univy.scad>;
use <../y-rod-support.scad>;
use <../y-rod-support-clamp.scad>;

$fn=50;

% translate([0, 0, -3]) heatbed();
plate1();

module plate1() {
	for (o = [115, 145]) {
		translate([o, 25, 0]) yrodsupport();
		translate([o, 100, 0]) yrodsupport();
	}
	translate([30, 120, 0]) rotate([0, 0, -90]) ymotormount();
	for (o = [50, 80]) {
		translate([o, 35, 0]) yrodsupportclamp();
		translate([o, 140, 0]) yrodsupportclamp();
	}
}
