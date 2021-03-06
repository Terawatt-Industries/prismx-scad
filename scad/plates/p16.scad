// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

use <heatbed.scad>;
use <../filament_spool_holder.scad>;
use <../../moreparts/filament-spool-holder/src/spool_holder_dowel_disc.scad>;

$fn=50;

% translate([0, 0, -3]) heatbed();
plate1();

module plate1() {
	translate([70, 160, 0]) {
		spool_holder_clamp();
		translate([60, 0, 0]) spool_mount();
	}
	for (i = [60, 130]) {
		translate([i, 60, 0]) spool_holder_dowel_disc();
	}
}
