// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

use <heatbed.scad>;
use <../rod-holder-y-and-z-bottom.scad>;
use <../sheliak_xcarriage.scad>;
use <../../moreparts/00str00der/src/00str00der.scad>;
use <../y-rod-support-clamp.scad>;

$fn=50;

% translate([0, 0, -3]) heatbed();
plate1();

module plate1() {
	translate([70, 75, 0]) rotate([0, 0, 180]) rodholder_clamp();
	translate([95, 75, 0]) rotate([0, 0, 180]) rodholder_clamp();
	translate([180, 175, 0]) rotate([0, 0, 180]) slim_x_carriage();
	translate([92, 95, 30]) 00str00der();
	for (o = [15, 45]) {
		translate([o, 75, 0]) yrodsupportclamp();
		translate([o, 115, 0]) yrodsupportclamp();
	}
}
