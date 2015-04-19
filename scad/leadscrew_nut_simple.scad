// f. beachler
// longevity software d.b.a. terawatt industries

use <thread-library.scad>;

outer_diameter = 25;
height = 15;
bore_diameter = 7.95;
wrench_height = 8;
wrench_size = 13;

square_peg_round_hole(outer_diameter, bore_diameter, height, wrench_height, wrench_size);

module square_peg_round_hole(od = outer_diameter, bd = bore_diameter, h = height, wh = wrench_height, ws = wrench_size)
{
translate([0, 0, 15])
rotate([180,0,0])
	difference()
	{
		cylinder(h = h, r1 = od / 2, r2 = od / 2, center = false, $fn = 24);
		translate([-od - 1, ws / 2, -.01]) cube([100, od, wh]);
		translate([-od - 1, -ws / 2 - od, -0.01]) cube([100, od, wh]);

		translate([0, 0, -0.01])
			cylinder(h = h + 0.02, r1 = bd / 2, r2 = bd / 2, center = false, $fn = 24);
		translate([0, 0, -15])
		rotate([0, 0, 90])
		trapezoidThreadNegativeSpace( 
			length = h + 20, 			// axial length of the threaded rod
			pitch = 1.25,				// axial distance from crest to crest
			pitchRadius = 4, 			// radial distance from center to mid-profile
			threadHeightToPitch = 0.75, 	// ratio between the height of the profile and the pitch
								// std value for Acme or metric lead screw is 0.5
			profileRatio = 0.5,			// ratio between the lengths of the raised part of the profile and the pitch
								// std value for Acme or metric lead screw is 0.5
			threadAngle = 30, 			// angle between the two faces of the thread
								// std value for Acme is 29 or for metric lead screw is 30
			RH = true, 				// true/false the thread winds clockwise looking along shaft, i.e.follows the Right Hand Rule
			countersunk = 0.5, 		// depth of 45 degree chamfered entries, normalized to pitch
			clearance = 0.1, 			// radial clearance, normalized to thread height
			backlash = 0.1, 			// axial clearance, normalized to pitch
			stepsPerTurn = 24 			// number of slices to create per turn
			);
	}
}

