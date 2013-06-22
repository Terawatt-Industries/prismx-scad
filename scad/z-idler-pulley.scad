// f. beachler
// longevity software d.b.a. terawatt industries

include <configuration.scad>;
use <y-idler-pulley.scad>;

bore_size = 22.2 + 0.3;
pulley_dia = 30.1;
pulley_width = 12;	// overall width including flange
flange_height = 3;
flange_width = 1.6;

module z_idler_pulley(id, od, w, fh, fw) {
	difference() {
		union() {
			// pulley wheel
			translate([0, 0, fw - 0.01]) cylinder(r = od / 2, h = w - fw * 2 + 0.02, $fn = 50);
			// flanges
			cylinder(r = od / 2 + fh, h = fw, $fn = 50);
			translate([0, 0, w - fw]) cylinder(r = od / 2 + fh, h = fw, $fn = 50);
		}
		// bore - 1mm
		translate([0, 0, -0.01]) cylinder(r = id / 2 - 2, h = w + 0.02, $fn = 50);
		// 608 bore
//		translate([0, 0, -0.02]) cylinder(r = id / 2, h = 5, $fn = 50);
		translate([0, 0, w - 9 + 0.01]) cylinder(r = id / 2 + 0.5, h = 10	, $fn = 50);
	}
}

module m4_608_bushing() {
	difference() {
		union() {
			cylinder(r = 30 / 2 + 3 / 2, h = 2.5, $fn = 50);
			translate([0, 0, 2.5 - 0.01]) cylinder(r = m8_diameter / 2 + 2.5, h = 2, $fn = 50);
			translate([0, 0, 2.5 - 0.01]) cylinder(r = m8_diameter / 2 - 0.25 , h = 9 + 2.5 + 2, $fn = 50);
		}
		translate([0, 0, -0.01]) cylinder(r = 4 / 2 + 0.2, h = 30, $fn = 50);
	}
}

z_idler_pulley(bore_size, pulley_dia, pulley_width, flange_height, flange_width);
//translate([40, 0, 0]) m4_608_bushing();
