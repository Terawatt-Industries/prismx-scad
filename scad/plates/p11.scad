// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

use <heatbed.scad>;
use <../90.scad>;
use <../90spacer.scad>;

$fn=50;

% translate([0, 0, -3]) heatbed();
plate1();

module plate1() {
	for (x = [0, 1]) {
		translate([50 + (x*50), 90, 0]) prism90spacer();
		translate([95 + (x*50), 160, 0]) prism90spacer(mirr = true);
	}
}
