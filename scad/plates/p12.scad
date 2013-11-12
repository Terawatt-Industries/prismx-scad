// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

use <heatbed.scad>;
use <../60-inside-top.scad>;

$fn=50;

% translate([0, 0, -3]) heatbed();
plate1();

module plate1() {
	for (x = [0, 1]) {
		translate([50 + (x*50), 90, 0]) prism60inside_top(th = 6);
	}
}
