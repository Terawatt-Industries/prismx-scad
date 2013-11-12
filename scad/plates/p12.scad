// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

use <heatbed.scad>;
use <../60-inside-top.scad>;

$fn=50;

% translate([0, 0, -3]) heatbed();
plate1();

module plate1() {
	for (x = [0, 1]) {
		translate([50 + (x * 75), 90, 0]) rotate([90, 0, 0])  prism60inside_top_armor();
	}
	// mirrored
	for (x = [0, 1]) {
		translate([75 + (x * 75), 115, 0]) mirror([1, 0, 0])  rotate([90, 0, 0])  prism60inside_top_armor();
	}
}
