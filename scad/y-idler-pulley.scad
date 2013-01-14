// free beachler

bore_size = 22;
pulley_dia = 30.1;
pulley_width = 20;	// overall width including flange
flange_height = 3;
flange_width = 1.6;

module y_idler_pulley(id, od, w, fh, fw) {
	difference() {
		union() {
			// pulley bore
			translate([0, 0, fw]) cylinder(r = od / 2, h = w - fw * 2, $fn = 24);
			// flanges
			cylinder(r = od / 2 + fh, h = fw, $fn = 24);
			translate([0, 0, w - fw]) cylinder(r = od / 2 + fh, h = fw, $fn = 24);
		}
		translate([0, 0, -0.01]) cylinder(r = id / 2, h = w + 0.02, $fn = 24);
	}
}

y_idler_pulley(bore_size, pulley_dia, pulley_width, flange_height, flange_width);

