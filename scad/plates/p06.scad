// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

use <heatbed.scad>;
use <../rod-holder-y-and-z-bottom.scad>;
use <../60-end-topvertex-spacer.scad>;
use <../60-end-topvertex.scad>;

$fn=50;

% translate([0, 0, -3]) heatbed();
plate1();

module plate1() {
	for (o = [20, 75]) {
		translate([100, o, 0]) prism60end_topvertex();
	}
	translate([155, 20, 0]) rotate([0, 0, 90]) prism60end_spacer();
	translate([120, 155, 0]) rotate([0, 0, -90]) prism60end_spacer();
	for (o = [125, 70]) {
		translate([o, 140, 0]) rotate([0, 0, 90]) y_and_z_bottom();
	}
}
