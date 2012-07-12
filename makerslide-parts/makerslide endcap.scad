// Prism   
// Makerslide vertical X-Motor mount prototype
// GNU GPL v2
// Charles Strang

include <configuration.scad>
use <..\Y Motor Bracket.scad>
$fn = 30;

h = 6;				// thickness
fp = true;		// four mounting points
o=0.1;

translate([0,0,0]) rotate([0,0,90]) difference()
{
	cube([40+2*h,20+2*h,6]);
	translate([h,h,1.5])makerslide(5+2*o,true);
}

translate([-35,0,0]) rotate([0,0,90]) difference()
{
	cube([40+2*h,20+2*h,6]);
	translate([h,h,2])makerslide(5+2*o,true);
}


module makerslide(mh,profile)
{
	difference()
	{
		union()
		{
			translate([0,0,0]) rotate([0,0,0]) cube([40,20,mh]);
			translate([-3.15,20+(4.75/2),0]) rotate([0,0,-90]) msrail(mh);
			translate([40+3.15,20-(4.75/2),0]) rotate([0,0,90]) msrail(mh);
		
		}
		if (profile!=true)
		{
			translate([10,10,-o]) rotate([0,0,0]) cylinder(r=2.1,h=mh+2*o);
			translate([30,10,-o]) rotate([0,0,0]) cylinder(r=2.1,h=mh+2*o);
			translate([4,14,-o]) rotate([0,0,0]) msxslot(mh+2*o);
			translate([24,14,-o]) rotate([0,0,0]) msxslot(mh+2*o);
			translate([4,6,-o]) rotate([0,0,0]) mirror([0,1,0]) msxslot(mh+2*o);
			translate([24,6,-o]) rotate([0,0,0]) mirror([0,1,0]) msxslot(mh+2*o);
			translate([6,4,-o]) rotate([0,0,90]) mirror([0,0,0]) msxslot(mh+2*o);
			translate([34,16,-o]) rotate([0,0,-90]) mirror([0,0,0]) msxslot(mh+2*o);
		}
	}

}

module msxslot(sh)
{
	difference()
	{
		translate([0,0,0]) rotate([0,0,0]) cube([12,6,sh]);

		translate([3,0,-o]) rotate([0,0,135]) cube([12,6,sh+2*o]);
		translate([9,0,-o]) rotate([0,0,45]) mirror([0,1,0]) cube([12,6,sh+2*o]);
		translate([-o,4,-o]) rotate([0,0,0]) cube([3+o,3,sh+2*o]);		
		translate([9,4,-o]) rotate([0,0,0]) cube([3+o,3,sh+2*o]);
	}	
}

module msrail(rh)
{
	difference()
	{
		cube([4.75,6.35/2,rh]);
		translate([4.75/2,0,-o]) rotate([0,0,135]) cube([12,6,rh+2*o]);
		translate([4.75/2,0,-o]) rotate([0,0,45]) mirror([0,1,0]) cube([12,6,rh+2*o]);
	}
}

