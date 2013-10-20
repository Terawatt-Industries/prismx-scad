// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

use <heatbed.scad>;
use <../y-lm8uu-mount-retainer.scad>;
use <../lm8uu_mount_retainer.scad>;

$fn=50;

% translate([0, 0, -3]) heatbed();
plate1();

module plate1() {
	for (o = [80, 135]) {
		translate([o, 35, 0]) y_lm8uu_mount_retainer();
		translate([o, 70, 0]) y_lm8uu_mount_retainer();
	}
	for (o = [80, 135]) {
		translate([o, 105, 0]) lm8uu_mount_retainer();
		translate([o, 145, 0]) lm8uu_mount_retainer();
	}
	for (o = [40, 80, 120, 160]) {
		translate([30, o, 0]) lm8uu_mount_retainer(base = true);
	}
}
