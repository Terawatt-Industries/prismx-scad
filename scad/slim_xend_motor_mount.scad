// f. beachler
// longevity software d.b.a. terawatt industries

include <configuration.scad>;
use <nema.scad>;

$fn = 30;
height = 75 - 30;
width = 50 + 8 + 2 * 7 - 37.5;
extension = 11;
rod_offset = 2;
rod_diameter = 8 + 0.4;
rod_spacing = 50;
z_bush_dia = 15 + 1;
mnt_screw_dia = m4_diameter;
mnt_screw_cap_dia = 9.5 + 0.2;
m3 = m3_diameter;
m3n = m3_nut_diameter;

slim_xend_motor_mount(height, width, extension, rod_offset, rod_diameter, rod_spacing, z_bush_dia, mnt_screw_dia, mnt_screw_cap_dia, m3, m3n);
% translate([height / 2, 47 + extension, 47 / 2 + 7.5]) rotate([0, 0, 0]) nema17(47);

module slim_xend_motor_mount(h, w, e, ro, rd, rs, zbd, mntd, mcap, m3, m3n) {
	difference() {
		union() {
			cube([h, w + 7.5, 7 + 3]);
			translate([0, w + 7.5, 0]) rotate([90, 0, 0]) cube([h, 47 + 15, 5]);
		}
		translate([h / 2, h + 47 / 2 - 10, 47 / 2 + 7]) rotate([90, 0, 0]) cylinder(r = 13.5, h = h + 1 + 0.02);
		for (x = [6.5, h - 6.5]) {
			for (y = [6.5, w - 6.5]) {
				translate([x, y, -0.01]) cylinder(r = mntd / 2, h = h + 1 + 0.02);
				translate([x, y, 3.01]) cylinder(r = mcap / 2, h = h + 1 + 0.02);
			}
		}
		translate([0, h + 7, 0]) rotate([90, 0, 0]) 
			for (x = [7, h - 7]) {
			for (y = [h + 2, w - 18.5]) {
				translate([x, y, -0.01]) cylinder(r = m3 / 2 + 0.5, h = h + 1 + 0.02);
				translate([x, y, -e + 7.01]) cylinder(r = m3n, h = 15 + 1 + 0.02);
			}
		}
		// top corner cuts
		translate([2.5, 0, 47 + 15 + 10]) {
			translate([10, 0.01, 0]) rotate([0, 30, 0]) cube([h, w + e, 7 + 3]);
			translate([-10, 0.01, -h * sin(30)]) rotate([0, -30, 0]) cube([h, w + e, 7 + 3]);
		}
	}
}