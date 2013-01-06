outer_diameter = 35;
height = 10;
hole_diameter = 8;

module square_peg_round_hole()
{
//	rotate([-90,0,0])
	difference()
	{
		cylinder(h = height, r1 = outer_diameter / 2 + 0.1, r2 = outer_diameter / 2 + 0.1, center = false, $fn = 24);
		translate([0, 0, -0.01])
		cylinder(h = height + 0.02, r1 = hole_diameter / 2 + 0.1, r2 = hole_diameter / 2 + 0.1, center = false, $fn = 24);
	}
}

translate([0, 0, height / 2])
square_peg_round_hole();
