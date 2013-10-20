// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

use <heatbed.scad>;
use <../sheliak_xend.scad>;

$fn=50;

% translate([0, 0, -3]) heatbed();
plate1();

module plate1() {
	translate([95, 30, 0]) slim_xend();
	translate([95, 175, 0]) rotate([0, 0, 180]) slim_xend();
}
