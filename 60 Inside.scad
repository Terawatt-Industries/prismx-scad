// C. Strang		
// cstrang@????
// funfor.us

include <metric.scad>;


$fn=30;

translate([-1,0,0]) part();

translate([1,0,0]) mirror() part();


module part()
{
	translate([23.65,5.2,0]) rotate([0,0,150]) walls();
	translate([0,0,0]) rotate([0,0,0]) base();
}

module walls()
{
	translate([7.5,5.9,0]) rotate([0,0,0]) cube([5,2.1,13.8]);

	difference()
	{
		union()
		{
			translate([0,0,0]) rotate([0,0,0]) cube([20,6,26]);
			translate([20,6,0]) rotate([0,0,210]) cube([5,40,26]);
		}

		translate([10,-0.1,16]) rotate([-90,0,0]) cylinder(r=m4_diameter/2,h=7);
		translate([22.9,3,26]) rotate([-29.07,0,210]) cube([8,45,26]);

	}

}


module base()
{
	difference()
		{
			translate([3.5,0,0])cube([20,50,6]);
			translate([18,-10,-0.1]) rotate([0,0,60]) cube([10,25,6.5]);
			translate([25.5,40,-0.1]) rotate([0,0,60]) cube([10,25,6.5]);
			translate([17.7,-5,-0.1]) rotate([0,0,-30]) cube([10,15,6.5]);
			translate([13.5,20,-0.1]) cylinder(r=m4_diameter/2,h=7);
			translate([13.5,40,-0.1]) cylinder(r=m4_diameter/2,h=7);
		}
}

