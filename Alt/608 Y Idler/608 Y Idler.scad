// C. Strang		
// cstrang@????
// funfor.us

include <..\..\configuration.scad>;

m=m4_diameter ;
m2=threaded_rod_diameter; 
h = 6;   				// base thickness
o = 0.1;				//  overlap amount
hh = 6;					// bar holder height
w=2.5;					// wall thickness
st=2;					// slot tab depth 2=normal, -1=none

$fn=30;

//import("608 Y Idler.stl");

y608idler(h,w,m,st,m2);
translate([-6,0,0]) mirror([1,0,0]) y608idler(h,w,m,st,m2);


module y608idler(yih, yiw, yim, yst, yim2)
{
	translate([20,2,0]) rotate([90,0,180]) wall(yih,yim,yst);
	translate([0,h+2-o,0]) base(yih, yiw, yim2);
}


module base(bh,bw,bm)
{
	difference()
	{
		union()
		{
			cube([28,25,25]);
			translate([20,-bh+o,0]) cube([3,bh,25]);
		}
		translate([bw,0,bh]) rotate([0,0,-7]) cube([21.35-2*bw,30,20]);
		translate([bw,0,bh]) rotate([0,0,-19]) cube([21.35-2*bw,30,20]);

		translate([-o,17,bh]) cube([30,10,21]);
		translate([-o,17,bh]) rotate([41.8,0,0]) cube([30,15,30]);
		translate([20,-6,-o]) rotate([0,0,-19]) cube([10,25,30]);
		translate([-9.9,1.2,-o]) rotate([0,0,-7]) cube([10,25,30]);
		translate([-5.05,24.1,-o]) rotate([0,0,-45]) cube([10,20,bh+2*o]);
		translate([20.12,25,-o]) rotate([0,0,-45]) cube([15,10,bh+2*o]);

		translate([15,15.1,-0.1]) cylinder(r=bm/2,h=9);

	}
}


module wall(whh,wm,wst)
{
	difference()
	{
		cube([20,25,whh]);
		translate([10,19,-o]) cylinder(r=wm/2,h=9);
	}
	translate([7.5,0,-wst]) cube([5,16,wst+o]);

}

