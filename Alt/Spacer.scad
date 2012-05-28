// C. Strang		
// cstrang@????
// funfor.us

include <..\configuration.scad>;

m=m4_diameter ;
h = 8;   				// base thickness
o = 0.1;				//  overlap amount

$fn=30;


Spacer(h,m);
translate([25,0,0]) Spacer(h,m);


module Spacer(sh, sm)
{
	difference()
	{
		cube([20,39,sh]);
		translate([15,0,-o]) rotate([0,0,-60]) cube([5,30,sh+2*o]);
		translate([5,0,-o]) rotate([0,0,-135]) mirror([0,1,0]) cube([5,30,sh+2*o]);
		translate([20,36,-o]) rotate([0,0,60]) cube([5,30,sh+2*o]);
		translate([0,34,-o]) rotate([0,0,135]) mirror([0,1,0]) cube([5,30,sh+2*o]);
		difference()
		{
			translate([-o,14.5,-o]) rotate([0,0,0]) cube([8,10,sh+2*o]);
			translate([-o,24.5,-o]) rotate([0,0,-124]) mirror([1,0,0]) cube([8,10,sh+2*o]);
			translate([-o,14.5,-o]) rotate([0,0,-146]) mirror([1,0,0]) cube([10,8,sh+2*o]);

		}
		translate([10,9.5,-o]) cylinder(r=sm/2,h=sh+2*o);
		translate([10,29.5,-o]) cylinder(r=sm/2,h=sh+2*o);
	}
}

