// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

use <heatbed.scad>;
use <../z-leadscrew-support.scad>;
use <../z-leadscrew-support-upper.scad>;

$fn=50;

% translate([0, 0, -3]) heatbed();
plate1();

module plate1() {
	for (o = [90, 170]) {
		translate([o, 140, 0]) rotate([0, 0, 90]) zleads();
	}
	for (o = [50, 90]) {
		translate([170, o, 0]) rotate([0, 0, 90]) zleads_upper();
	}
}
