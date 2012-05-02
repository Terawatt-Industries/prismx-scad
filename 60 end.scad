// C. Strang		
// cstrang@????
// funfor.us

include <metric.scad>;

//translate([0,35,0]) rotate([0,0,-90])import("60 End.stl");

$fn=30;

part();



module part()
{
	#translate([20,0.35,0]) rotate([0,0,30]) rail();
	#translate([37.3,10.35,0]) rotate([0,0,-30]) rail();
	#translate([20,0.35,0]) rotate([0,0,0]) base1();
//	#translate([-47,0,0]) rotate([0,0,0]) base2();
	#translate([57.3,45,0]) rotate([0,0,180]) base2();
}

module base1()
{
	difference()
	{
		translate([0,0,0]) rotate([0,0,0]) cube([34.65,13,6]);
		translate([0,0,-0.1]) rotate([0,0,35]) cube([34.65,13,7]);
		translate([34.65,0,-0.1]) rotate([0,0,55]) cube([13,34.65,7]);

	}

}

module base2()
{
	difference()
	{
		translate([0,0,0]) rotate([0,0,0]) cube([40.0,35,6]);
		translate([0,0,-0.1]) rotate([0,0,61]) cube([40,23,7]);
		translate([40.0,0,-0.1]) rotate([0,0,29]) cube([23,40,7]);
		translate([20.0,-22.32,-0.1]) rotate([0,0,0]) cylinder(r=30,h=7,$fn=50);

	}

}


module rail()
{
	difference()
		{
			union()
			{	
				translate([0,0,0])cube([20,40,6]);
				translate([7.5,1,5.9]) rotate([0,0,0]) cube([5,6.8,2.1]);
				translate([7.5,12.25,5.9]) rotate([0,0,0]) cube([5,15.5,2.1]);
				translate([7.5,32.3,5.9]) rotate([0,0,0]) cube([5,7.7,2.1]);
			}
			translate([10,10,-0.1]) cylinder(r=m4_diameter/2,h=7);
 			translate([10,30,-0.1]) cylinder(r=m4_diameter/2,h=7);
		}
}

 