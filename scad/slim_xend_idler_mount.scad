// f. beachler
// longevity software d.b.a. terawatt industries

include <configuration.scad>;
use <nema.scad>;

height = 75 - 30;
width = 50 + 8 + 2 * 7 - 37.5;
extension = 11;
rod_offset = 2;
rod_diameter = m8_diameter + 0.5;
rod_spacing = 50;
z_bush_dia = 15 + 1;
mnt_screw_dia = m4_diameter;
mnt_screw_cap_dia = 9.5 + 0.2;

slim_xend_idler_mount(height, width, extension, rod_offset, rod_diameter, rod_spacing, z_bush_dia, mnt_screw_dia, mnt_screw_cap_dia);

module slim_xend_idler_mount(h, w, e, ro, rd, rs, zbd, mst, mcap) {
	difference() {
		// base + wall
		union() {
			cube([h, w + 7.5, 7 + 3]);
			translate([0, w + 7.5, 0]) rotate([90, 0, 0]) cube([h, 45, 5]);
		}
		// adjustable idler mount
		translate([h / 2 - 6, h + 47 / 2 - 10, 47 / 2 + 7]) rotate([90, 0, 0]) cylinder(r = rd / 2, h = h + 1 + 0.02);
		translate([h / 2 + 6, h + 47 / 2 - 10, 47 / 2 + 7]) rotate([90, 0, 0]) cylinder(r = rd / 2, h = h + 1 + 0.02);
		translate([h / 2 + 6 - 12, h + 47 / 2 - 10, 47 / 2 + 7 - rd / 2]) rotate([90, 0, 0]) cube([12, rd, 25]);
		// base mnt screws
		for (x = [6.5, h - 6.5]) {
			for (y = [6.5, w - 6.5]) {
				translate([x, y, -0.01]) cylinder(r = mst / 2, h = h + 1 + 0.02);
				translate([x, y, 3.01]) cylinder(r = mcap / 2, h = h + 1 + 0.02);
			}
		}
		// top corner cuts
		translate([2.5, 0, 45 + 10]) {
			translate([10, 0.01, 0]) rotate([0, 30, 0]) cube([h, w + e, 7 + 3]);
			translate([-10, 0.01, -h * sin(30)]) rotate([0, -30, 0]) cube([h, w + e, 7 + 3]);
		}
	} 
	// support rib
	difference() {
		translate([h / 2 + 18 / 2, 30, 0]) rotate([-45, 0, 0]) linear_extrude(height = 20, center = false, convexity = 10, twist = 0, slices = 100) polygon( points=[[0,0],[-9,-9],[-18,0]] );
		translate([0, w + 15, 0]) rotate([90, 0, 0]) cube([h, 45, 10]);
	}
}