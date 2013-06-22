// f. beachler
// longevity software d.b.a. terawatt industries

include <configuration.scad>;

$fn = 100;

width = 45;
leadout = 60;
slottabs = 2;					// slot tab depth (2 normal, -1 remove)
pulley_offset = 10;
mnt_screw = m4_diameter;
rod_diameter = m8_diameter;

module z_idler_mount(width, leadout, slottabs, pulley_offset, mnt_screw, rod_diameter) {
	difference() {
	union() {
	difference() {
		translate([-leadout / 2, -width / 2, 0]) cube([leadout, width, 5]);
		// corner cuts
		translate([0, 0, 0]) {
			translate([leadout * cos(30), width / 2, 0]) rotate([0, 0, 30]) cube([leadout, width, 15], center = true);
			translate([-leadout * cos(30), width / 2, 0]) rotate([0, 0, -30]) cube([leadout, width, 15], center = true);
		}
	}
	// slottab
	translate([0, -width / 2 + 15 / 2, 5]) cube([leadout - 40, 5, slottabs], center = true);
	}
		// mnt screws
	translate([leadout / 2 - 15, -width / 2 + 15 / 2, -5]) rotate([0, 0, 0]) cylinder(r = mnt_screw / 2, h = 15);
	translate([-leadout / 2 + 15, -width / 2 + 15 / 2, -5]) rotate([0, 0, 0]) cylinder(r = mnt_screw / 2, h = 15);
	// adjustable idler mount
	translate([0, width - 20, 0]) {
		translate([6, -width / 2 + 15 / 2, -5]) rotate([0, 0, 0]) cylinder(r = rod_diameter / 2, h = 15);
		translate([-6, -width / 2 + 15 / 2, -5]) rotate([0, 0, 0]) cylinder(r = rod_diameter / 2, h = 15);
		translate([-6, -width / 2 + 15 / 2 - rod_diameter / 2, -5]) rotate([0, 0, 0]) cube([12, rod_diameter, 15]);
	}
	}
}

z_idler_mount(width, leadout, slottabs, pulley_offset, mnt_screw, rod_diameter);
