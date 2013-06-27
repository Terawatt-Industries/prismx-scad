// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

use <heatbed.scad>;
use <../60-inside.scad>;
use <../60-end.scad>;

$fn=50;

% translate([0, 0, -3]) heatbed();
plate1();

module plate1() {
	for (x = [1, 2]) {
		translate([(x*25), 35, 0]) prism60inside();
		translate([20+(x*25), 100, 0]) mirror() prism60inside();
	}
	for (x = [1, 2]) {
		for (y = [1, 2]) {
			translate([75 + (x*50), -65 + (y * 85), 0]) rotate([0, 0, 90]) prism60end();
	}
}
