// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

use <heatbed.scad>;
use <../filament_spool_holder.scad>;

$fn=50;

% translate([0, 0, -3]) heatbed();
plate1();

module plate1() {
	translate([100 - 40 / 2, 100 + 50 / 2, 0]) {
		spool_holder_clamp();
		translate([60, 0, 0]) spool_mount();
	}
}
