// C. Strang		
// cstrang@????
// funfor.us

include <configuration.scad>;

m=m4_diameter ; 
h = 6;   				// base thickness
o = 0.1;					//  overlap amount - fb note used to prevent manifold and reduces total volume
hh = 6;					// bar holder height
w=2.5;					// wall thickness
st=2;					// slot tab depth 2=normal, -1=none

$fn=30;

yidler(h,w,m,st);
translate([-5,0,0]) mirror([1,0,0]) yidler(h,w,m,st);

module yidler(yih, yiw, yim, yst)
{
	translate([20,2,0]) rotate([90,0,180]) wall(yih,yim,yst);
	translate([0,h+2-o,0]) base(yih, yiw, yim);
}


module base(bh,bw,bm)
{
	difference()
	{
		cube([25,22.1,20]);
		// translate([bw,0,bh]) rotate([0,0,-16.3]) cube([19.35-2*bw,30,20]);
		translate([bw,0,bh]) rotate([0, 0,0]) cube([19.35-2*bw,30,20]);

		translate([5, 17, bh]) cube([25,10,21]);
		translate([0, 17, bh]) rotate([0,0,0]) cube([25,15,25]);
		translate([20, 0, -o]) rotate([0,0,0]) cube([10,20,21]);
		translate([-10, 1.5, -o]) rotate([0,0,0]) cube([10,25,21]);
		translate([-10, 21.2, -o]) rotate([0,0,-45]) cube([10,20,bh+2*o]);
		translate([15, 22.1, -o]) rotate([0,0,-45]) cube([10,10,bh+2*o]);

		translate([10, 15.1,-0.1]) cylinder(r=bm/2,h=9);

	}
}


module wall(whh,wm,wst)
{
	difference()
	{
		cube([20,20,whh]);
		translate([10,14,-o]) cylinder(r=wm/2,h=9);
	}
	translate([7.5,0,-wst]) cube([5,11,wst+o]);

}

