// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

use <heatbed.scad>;
use <../90.scad>;

$fn=50;

% translate([0, 0, -3]) heatbed();
plate1();

module plate1() {
	for (x = [0, 1]) {
		translate([50 + (x*50), 35, 0]) prism90();
		translate([95 + (x*50), 100, 0]) prism90(mirr = true);
	}
}
