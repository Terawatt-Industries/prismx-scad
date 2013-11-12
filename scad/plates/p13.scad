// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

use <heatbed.scad>;
use <../../moreparts/terawatt-pro-power/src/mnt_psu.scad>;

$fn=50;

% translate([0, 0, -3]) heatbed();
plate1();

module plate1() {
	translate([50, 10, 0]) power_mount(5.1, 8.2, 3.2);
}
