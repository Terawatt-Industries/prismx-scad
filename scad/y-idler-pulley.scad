// f. beachler
// longevity software d.b.a. terawatt industries

bore_size = 22.2 + 0.3;
pulley_dia = 29.1;
pulley_width = 20;	// overall width including flange
flange_height = 3;
flange_width = 1.6;

y_idler_pulley(bore_size, pulley_dia, pulley_width, flange_height, flange_width);

module y_idler_pulley(id = bore_size, od = pulley_dia, w = pulley_width, fh = flange_height, fw = flange_width) {
	difference() {
		union() {
			// pulley wheel
			translate([0, 0, fw - 0.01]) cylinder(r = od / 2, h = w - fw * 2 + 0.02, $fn = 50);
			// flanges
			cylinder(r = od / 2 + fh, h = fw, $fn = 50);
			translate([0, 0, w - fw]) cylinder(r = od / 2 + fh, h = fw, $fn = 50);
		}
		// bore - 2mm
		translate([0, 0, -0.01]) cylinder(r = id / 2 - 2, h = w + 0.02, $fn = 50);
		// 608 bore
		translate([0, 0, -0.02]) cylinder(r = id / 2, h = 5, $fn = 50);
		translate([0, 0, w - 5 + 0.01]) cylinder(r = id / 2, h = 5, $fn = 50);
	}
}

