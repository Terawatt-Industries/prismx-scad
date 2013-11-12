// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

use <heatbed.scad>;
use <../../moreparts/nut-clamps/nut_clamps.scad>;
use <../../moreparts/fan-mounts/src/fan_mount.scad>;

$fn=50;

% translate([0, 0, -3]) heatbed();
plate1();

module plate1() {
	for (y = [80, 125]) {
		translate([70, y, 10]) nut_clamp_pair(20, 4, 3);
	}
	for (y = [80, 125]) {
		translate([130, y, 10]) nut_clamp_pair(20, 4, 3);
	}
	translate([160, 130, 10]) rotate([0, 0, 90]) rotate([0, 0, 180]) fan_mount(fan_ctc = 71.5, mounting_pos = -0.75, mounting_screw = 3);
	// brixs fan mount
	translate([100, 155, 0]) rotate([0, 0, -90]) import("../../moreparts/brixs-fan-mount/fan_mount_fan.stl");
	translate([62, 140, 0])  import("../../moreparts/brixs-fan-mount/fan_mount_mount.stl");
}
