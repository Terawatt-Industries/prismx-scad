// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

use <heatbed.scad>;
use <../z-leadscrew-support.scad>;
use <../z-leadscrew-support-upper.scad>;
use <../rod-holder-x-and-z-bottom.scad>;

$fn=50;

% translate([0, 0, -3]) heatbed();
plate1();

module plate1() {
	for (o = [90, 170]) {
		translate([o, 105, 0]) rotate([0, 0, 90]) zleads();
	}
		translate([180, 50, 0]) rotate([0, 0, 90]) zleads_upper();
		translate([15, 95, 0]) rotate([0, 0, 270]) zleads_upper();
		translate([75, 120, 0]) rotate([0, 0, 0]) xzrodholder();
		translate([100, 120, 0]) rotate([0, 0, 0]) xzrodholder();
}
