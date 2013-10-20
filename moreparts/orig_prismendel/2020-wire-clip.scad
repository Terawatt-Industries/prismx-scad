// C. Strang		
// cstrang@????
// funfor.us

include <configuration.scad>;

h = 4;   				// base thickness
o = 0.1;				//  overlap amount

$fn=30;

wireclip(h);
translate([19,6,0]) mirror([1,0,0]) wireclip(h);


module wireclip(wch)
{
	difference()
	{
		union()
		{
			cube([2,24.5,wch]);
			translate([2,0,0]) arm(wch);
			translate([2,24.5,0]) mirror([0,1,0]) arm(wch);
		}
		translate([2.35,2,-o]) rotate([0,0,135]) springnotch(wch+2*o);
		translate([2,22.15,-o]) rotate([0,0,45]) springnotch(wch+2*o);

		translate([1.6,0,-o]) rotate([0,0,135]) cube([3,2,wch+2*o]);
		translate([1.6,24.5,-o]) rotate([0,0,135]) cube([2,3,wch+2*o]);
	}
}


module arm(ah)
{
	difference()
	{
		union()
		{
			cube([11,2,ah]);
			translate([9.8,1.3,0]) cylinder(r=2,h=ah);
		}
		translate([11,0,-o]) cube([3,5,ah+2*o]);
		translate([0,0,-o]) rotate([0,0,2.5]) mirror([0,1,0]) cube([12,2,ah+2*o]);
	}
}

module springnotch(snh)
{
	difference()
	{
		cube([.5,1,snh]);
		translate([.5,0,-o]) rotate([0,0,15]) cube([.5,1.5,snh+2*o]);
		translate([0,0,-o]) rotate([0,0,-15]) mirror([1,0,0]) cube([.5,1.5,snh+2*o]);
	}
}