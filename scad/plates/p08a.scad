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
	translate([105, 95, 30]) 00str00der();
}
