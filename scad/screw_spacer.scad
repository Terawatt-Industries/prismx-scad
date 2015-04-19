
height = 5;
bore_radius = 4.2;
outer_radius = bore_radius + 3;
tolerance = 0.01;

spacer();

module spacer(h = height, or = outer_radius, br = bore_radius, o = tolerance) {
	difference() {
		cylinder(r = or, h = h);
		translate([0, 0, -o])
			cylinder(r = br, h = h + o * 2);
	}
}