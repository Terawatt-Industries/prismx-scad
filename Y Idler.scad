// C. Strang		
// cstrang@????
// funfor.us

h = 6;   	// base thickness
o = 0.1;	//  overlap amount
hh = 6;		// bar holder height
w=2.5;			// wall thickness

//import("Y Idler.stl");

include <metric.scad>;

m4=m4_diameter ; 
m8=smooth_bar_diameter_horizontal;

$fn=30;

translate([0,0,0]) yidler();

module yidler()
{
	translate([20,2,0]) rotate([90,0,180]) wall();
	translate([0,h+2-o,0]) base();
}


module base()
{
	difference()
	{
		translate([0,0,0]) rotate([0,0,0]) cube([25,22.1,20]);
		translate([w,0,h]) rotate([0,0,-16.3]) cube([19.35-2*w,30,20]);

		translate([5,17,h]) rotate([0,0,0]) cube([25,10,21]);
		translate([0,17,h]) rotate([50.4,0,0]) cube([25,15,25]);
		translate([20,0,-o]) rotate([0,0,-16.3]) cube([10,20,21]);
		translate([-10,1.5,-o]) rotate([0,0,-16.3]) cube([10,25,21]);
		translate([-5,21.2,-o]) rotate([0,0,-45]) cube([10,20,hh+2*o]);
		translate([20,22.1,-o]) rotate([0,0,-45]) cube([10,10,hh+2*o]);

		translate([15,15.1,-0.1]) cylinder(r=m4/2,h=9);

	}
}


module wall()
{
	difference()
	{
		union()
		{
			translate([0,0,0]) rotate([0,0,0]) cube([20,20,hh]);
			translate([7.5,0,-2]) cube([5,11,2.1]);
		}
		translate([10,14,-o]) rotate([0,0,0]) cylinder(r=m4/2,h=9);
	}

}

