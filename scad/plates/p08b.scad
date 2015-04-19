// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

use <heatbed.scad>;
use <../rod-holder-x-and-z-bottom.scad>;
use <../sheliak_xcarriage.scad>;
use <../../moreparts/00str00der/src/00str00der.scad>;
use <../y-rod-support-clamp.scad>;
use <../belt_tensioner.scad>;

$fn=50;

% translate([0, 0, -3]) heatbed();
plate1();

module plate1() {
	translate([180, 170, 0]) rotate([0, 0, 180]) slim_x_carriage();
	for (x = [80, 105]) {
		translate([x, 80, 0]) rotate([0, 0, 180]) rodholder_clamp();
	}
	for (y = [55, 95]) {
		translate([50, y, 0]) rotate([0, 0, 0]) rodholder_clamp();
	}
	for (o = [30, 55]) {
		translate([o, 78, 0]) yrodsupportclamp();
		translate([o, 112, 0]) yrodsupportclamp();
	}
	translate([80, 160, 0]) rotate([0, 0, 90]) belt_clamps();
}
