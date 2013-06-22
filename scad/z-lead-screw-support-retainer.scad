// f. beachler
// longevity software d.b.a. terawatt industries

zleads_bushing_retainer();

module zleads_bushing_retainer() {
	difference() {
		minkowski() {
			union() {
				cube([9 - 3, 35 - 3, 3]);
				translate([6 / 2, 32 / 2, 0]) cylinder(r = 9, h = 3);
			}
			cylinder(r = 3, h = 0.01);
		}
		// slots
		translate([(6 - 3.5) / 2, 25, -0.1]) cube([3 + 0.5, 10, 5 + 1]);
		translate([(6 - 3.5) / 2, -3, -0.1]) cube([3 + 0.5, 10, 5 + 1]);
		translate([6 / 2, 32 / 2, -0.1]) cylinder(r = 5.75, h = 5 + 1);
	}
}