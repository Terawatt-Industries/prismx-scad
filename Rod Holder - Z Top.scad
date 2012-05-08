// C. Strang		
// cstrang@????
// funfor.us

h = 4;       	// base thickness
m = h-1;	// marker height
o = 0.1;	//  overlap amount
hh = 6;	// bar holder height

//import("Rod Holder - Ztop.stl");

include <metric.scad>;

m3=m3_diameter;
m3n=m3_nut_diameter_horizontal;
m4=m4_diameter ; 
m8=smooth_bar_diameter_horizontal;

$fn=30;

translate([26,0,0]) ztopholder();
translate([21,0,0]) mirror() ztopholder();

module ztopholder()
{
	difference()
	{
		union()
		{
			translate([0,10.7,0]) rotate([0,0,0]) cube([20,28.38,h]);
			translate([20-0.1,24.4,0]) marker();
			translate([0,16.5,h-o]) rodholder();
		}
		translate([10,25,-o]) cylinder(r=m8/2,h=h+hh+4);

	}
	translate([0,39.08,0]) rotate([60,0,0]) slantbase();
	translate([0,10.7,0]) mirror([0,1,0]) rotate([60,0,0]) slantbase();
}

module marker()
{
	difference()
	{
		cube([1.1,1.2,m]);
		translate([1,-1.77,-o]) rotate([0,0,30]) cube([2,2,m+2*o]);
		translate([0,1.23,-o]) rotate([0,0,-30]) cube([2,2,m+2*o]);
	}
}

module rodholder()
{
	difference()
	{
		union()
		{
			translate([0,-5,0]) rotate([0,0,0]) cube([10,27,hh+o]);
			translate([10,8.5,0]) cylinder(r=(m8),h=hh+o,$fn=50);
		}
		translate([2.5,8.5,2.5]) rotate([90,90,90]) cylinder(r=m3n/2,h=5,$fn=6);
		translate([-0.1,8.5,2.5]) rotate([90,90,90]) cylinder(r=m3/2,h=9);
		translate([2.5,5.85,2.5]) rotate([0,0,0]) cube([5,m3n-0.8,m3n]);

	}
}

module slantbase()
{
	difference()
	{
		union()
		{
			translate([0,0,0]) rotate([0,0,0]) cube([20,21.5,hh]);
			translate([7.5,0,-2]) cube([5,11,2.1]);
		}
		translate([10,15.45,-o]) rotate([0,0,0]) cylinder(r=m4/2,h=9);
		translate([7.4,-2.42,0]) rotate([-60,0,0]) cube([5.2,11,2.1]);
	}

}

