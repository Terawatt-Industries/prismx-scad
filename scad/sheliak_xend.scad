// f. beachler
// longevity software d.b.a. terawatt industries

include <configuration.scad>;
use <nema.scad>;
use <lm8uu_mount_retainer.scad>;

$fn=40;
height = 75;
width = 50 + smooth_bar_diameter_horizontal + 2 * 7;
rod_offset = 2;
rod_diameter = 7.75;
rod_spacing = 50;
z_bush_dia = 15 + 0.25;

bearing_id = 15 + 0.25;
bearing_od = 22;
lm8uu_thickness = 6;
lm8uu_mnt_height = 17.5;
mount_screws = true;
mnt_screw_thickness = m4_diameter;

leadscrew_nut_mnt_spacing = 16;
//[ 0.00, 0.00, 0.00 ][ 75.00, 0.00, 139.80 ]
//rotate([0, $t * 360, 0])
//rotate([0, 0, $t * 360])
slim_xend(height, width, rod_offset, rod_diameter, rod_spacing, z_bush_dia, leadscrew_nut_mnt_spacing, bearing_od, bearing_id, lm8uu_mnt_height, lm8uu_thickness, mount_screws, mnt_screw_thickness);

module slim_xend(height = height, width = width, rod_offset = rod_offset, rod_diameter = rod_diameter, rod_spacing = rod_spacing, z_bush_dia = z_bush_dia, leadscrew_nut_mnt_spacing = leadscrew_nut_mnt_spacing, bearing_od = bearing_od, bearing_id = bearing_id, lm8uu_mnt_height = lm8uu_mnt_height, lm8uu_thickness = lm8uu_thickness, mount_screws = mount_screws, mnt_screw_thickness = mnt_screw_thickness) {
	// TODO parametrize spacing between leadscrew and smooth rod
	difference() {
		union() {
			translate([0, 0, 0]) x_rod_holder(height, width, rod_offset, rod_diameter, rod_spacing, z_bush_dia, leadscrew_nut_mnt_spacing, bearing_od, bearing_id, lm8uu_mnt_height, lm8uu_thickness, mnt_screw_thickness);
			// motor base
			translate([-(height - 30) - 0.1, 37.5 / 2, 0]) motor_base(height - 30, width - 37.5, rod_offset, rod_diameter, rod_spacing, z_bush_dia, mnt_screw_thickness);
			// % translate([-47 / 2, (width + 47 + 21 + 12) / 2, 42 / 2 + rod_offset + rod_diameter]) rotate([0, 0, 0]) nema17(47);
			// lm8uu holder
			// %translate([height / 2 - 20, width / 2 + (bearing_od + lm8uu_thickness) / 2, rod_offset + rod_diameter / 2]) rotate([0, 0, 270]) lm8uu_mount_retainer(bearing_od, bearing_id, lm8uu_mnt_height, lm8uu_thickness, mount_screws, mnt_screw_thickness);
		}
		// 60 corners front
		translate([height - 10 / 2 + 0.1, -1.5, -0.01]) mirror([1, 0]) corner60(rod_offset + rod_diameter / 2 + 1);
		translate([height - 10 / 2 + 0.1, width + 1.5 + 0.1, -0.01]) mirror([1, 0]) mirror([0, 1]) corner60(rod_offset + rod_diameter / 2 + 1);
		// 60 corners back
		translate([5, -1.5, -0.01]) corner60(rod_offset + rod_diameter / 2 + 1);
		translate([5, width + 1.5, -0.01]) mirror([0, 0]) mirror([0, 0]) mirror([0, 1]) corner60(rod_offset + rod_diameter / 2 + 1);
	}
}

module x_rod_holder(h, w, ro, rd, rs, zbd, lsms, bod, bid, lmh, lt, mst) {
	difference() {
		cube([h, w, ro + rd / 2]);
		// leadscrew nut hole
		translate([h / 2 + 22, w / 2, -0.01]) rotate([0, 0, 90]) cylinder(r = 7.5 + 0.5, h = h + 0.02);
		// leadscsrew flange holes
		translate([h / 2 + 22, w / 2, -0.01]) {
			for (x = [-lsms / 2, lsms / 2]) {
				for (y = [-x, x]) {
					translate([x, y, -0.01]) rotate([0, 0, 90]) cylinder(r = mst / 2, h = h + 0.02);
				}
			}
		}
		// TODO parametrize spacing between leadscrew and smooth rod
		// leadscrew
		// z-axis smooth rod
		translate([h / 2 - 20, w / 2, -0.01]) rotate([0, 0, 90]) cylinder(r = zbd / 2, h = h + 0.02);
		// captive retainer freedom
		translate([h / 2 - 20, w / 2, -0.01]) rotate([0, 0, 90]) cylinder(r = zbd / 2 + 5, h = 2 + 0.02);
		// bearing mount holes
		translate([h / 2 - 20 + bod / 2 + lt - 1, w / 2 - bod / 2 + lt / 2, -0.01]) cylinder(r = mst / 2 + 0.2, h = h + 0.02);
		translate([h / 2 - 20 + bod / 2 + lt - 1, w / 2 + bod / 2 - lt / 2, -0.01]) cylinder(r = mst / 2 + 0.2, h = h + 0.02);
		// x-axis smooth rods
		translate([-0.01, w / 2 - rs / 2, ro + rd / 2]) rotate([0, 90, 0]) cylinder(r = rd / 2 + 0.2, h = h + 0.02);
		translate([-0.01, w / 2 + rs / 2, ro + rd / 2]) rotate([0, 90, 0]) cylinder(r = rd / 2 + 0.2, h = h + 0.02);
	}
	// x-axis smooth rod clamps
	difference() {
		union() {
			translate([h - 15, -8 + 4.1, 0]) fancy_wing(8, rod_offset + rod_diameter / 2);
			translate([15, -8 + 4.1, 0]) fancy_wing(8, rod_offset + rod_diameter / 2);
			translate([0, w, 0]) mirror([0, 1]) {
				translate([h - 15, -8 + 4.1, 0]) fancy_wing(8, rod_offset + rod_diameter / 2);
				translate([15, -8 + 4.1, 0]) fancy_wing(8, rod_offset + rod_diameter / 2);
			}
		}
		translate([h - 15, -8 + 4.1, -0.01]) cylinder(r = mst / 2, h = h + 0.02);
		translate([15, -8 + 4.1, -0.01]) cylinder(r = mst / 2, h = h + 0.02);
		translate([0, w, -0.01]) mirror([0, 1]) {
			translate([h - 15, -8 + 4.1, -0.01]) cylinder(r = mst / 2, h = h + 0.02);
			translate([15, -8 + 4.1, -0.01]) cylinder(r = mst / 2, h = h + 0.02);
		}
	}
}

module corner60(h) {
	rotate([0, 0, 90]) difference() {
		rotate([0, 0, 60]) cube([20, 20, h]);
		translate([-10, 10, -0.01]) cube([30, 30, h + 0.02]);
		translate([0, 0, -0.01]) rotate([0, 0, 90]) cube([30, 30, h + 0.02]);
	}
}

module fancy_wing(r, h) {
	cylinder(r = r, h = h + 0.02);
	//translate([-3 * r, r / 2 - 0.1, 0]) cube([3 * r * 2, 4, h]);
	// round corner 1
	translate([-r / 8, -r / 2, 0]) 
	difference() { 
		translate([r - 0.01, 0.01, 0.01]) cube([r, r, h]);
		intersection() {
			cube([r * 2, r * 2, h + 1]);
			translate([r * 2, 0, 0]) cylinder(r = r, h = h + 1 + 0.02);
		}
	}
	// round corner 2
	mirror([1, 0]) translate([-r / 8, -r / 2, 0])
	difference() { 
		translate([r - 0.01, 0.01, 0.01]) cube([r, r, h]);
		intersection() {
			cube([r * 2, r * 2, h + 1]);
			translate([r * 2, 0, 0]) cylinder(r = r, h = h + 1 + 0.02);
		}
	}
}

module motor_base(h, w, ro, rd, rs, zbd, mst) {
	difference() {
		cube([h, w, ro + rd / 2]);
		for (x = [6.5, h - 6.5]) {
			for (y = [6.5, w - 6.5]) {
				translate([x, y, -0.01]) cylinder(r = mst / 2, h = h + 1 + 0.02);
			}
		}
	}
}