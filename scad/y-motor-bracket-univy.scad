// C. Strang		
// cstrang@????
// funfor.us
// f. beachler
// longevity software d.b.a. terawatt industries

include <metric.scad>;

h = 5;   	// base thickness
hh=6;
o = 0.1;	//  overlap amount
w=2.5;			// wall thickness
fmp = true;	// four mount points
st=2;

m3=m3_diameter + 0.2; 
m4=m4_diameter + 0.2; 
m8 = smooth_bar_diameter_horizontal;

$fn=30;

translate([0,0,0]) ymotormount();

module ymotormount()
{
	translate([0, 5, 0]) rotate([0, 0, 0]) nema17motormount(h,fmp);
	translate([0, 10, 0]) rotate([0,0,0]) walls();
}


module nema17motormount(pt, mp)
{
	difference()
	{
		union()
		{
			difference()
			{
				translate([-1.5, -5, 0]) rotate([0,0,0]) cube([42 + 3, 47, pt]);
		
				translate([21,21,-0.1]) cylinder(r=12,h=pt+2*o);
				if (mp==false)
				{
					translate([28,-0.1,-o])  cube([25,30,21]);
					translate([3,-0.1,-o])  cube([36,15,21]);
				} else {
					translate([55, -15, -o]) rotate([0, 0, 120]) cube([20, 20, 10]);
				}
		
			}
			
			if (mp==false) difference()
			{
				translate([35.6,32.6,0]) cylinder(r=7.3,h=pt);
				translate([42,28,-o]) cube([5,10,pt+2*o]);
				translate([28,30,-o]) cube([17,10,pt+2*o]);
			}
		
			if (mp==false) translate([1,0,0]) difference()
			{
				translate([2.6,9.3,0]) cylinder(r=9.3,h=pt);
				translate([-8,0,-o]) cube([7,20,pt+2*o]);
			}
		}
		translate([5.5,5.5,-o]) cylinder(r=m3/2,h=pt+2*o);
		translate([5.5,36.5,-o]) cylinder(r=m3/2,h=pt+2*o);
		translate([36.5,36.5,-o]) cylinder(r=m3/2,h=pt+2*o);
		if (mp==true)
		{
			translate([36.5,5.5,-o]) cylinder(r=m3/2,h=pt+2*o);
	
		}
	}
}


module walls()
{
	// fill-in space between bottom wall and nema mount
	//translate([0,0,0]) rotate([0,0,0]) cube([30, 42, 5]);
	// nema mount wall
	difference()
	{
			translate([42, 0, 0]) rotate([0,0,0]) cube([h+o, 42, 20]);
			translate([-o + 42, 0, h]) rotate([atan(20/42),0,0]) cube([h+3*o, 47, 25]);
	}
	// support between bottom and nema mount walls
	translate([47, 37, 0]) rotate([0, 0, 90]) cube([h + o, 52,20]);
	// bottom wall
	difference()
	{
			translate([-5, 0, 0]) rotate([0,0,0]) cube([h+o, 42, 20]);
			translate([-o - 5, 0, h]) rotate([atan(20/42),0,0]) cube([h+3*o, 47, 25]);
	}
	// extrusion wall
	difference()
	{
			translate([h,42,0]) rotate([0,0,0]) cube([hh,20,20]);
			translate([h-o,62,12.5]) rotate([atan(1),0,0]) cube([hh+2*o,20,25]);
			translate([h - o, 54, 12]) rotate([0,90,0]) cylinder(r = m4 / 2 , h = hh * 2 + 2*o);
	}
	// extrusion wall support
	difference()
	{
			translate([-h, 42, 0]) rotate([0,0,0]) cube([16,20,h]);
			translate([-h - 8.7, 52, -o]) rotate([0,0,-atan(10/15)]) mirror([0,0,0]) cube([10,20,h+3*o]);
	}
	difference()
	{
			translate([-h, 42, 0]) rotate([0, 0, 0]) cube([16, h, 20]);
			translate([-h - 14, 42 - o, h + 8 + o]) rotate([0, atan(10/15), 0]) mirror([0,0,0]) cube([16,h+3*o,20]);
	}
	// extrusion wall support
	difference()
	{
			translate([31,42,0]) rotate([0,0,0]) cube([16,20,h]);
			translate([47,47,-o]) rotate([0,0,atan(10/15)]) mirror([0,0,0]) cube([10,20,h+3*o]);
	}
	// extrusion wall
	difference()
	{
			translate([31,42,0]) rotate([0,0,0]) cube([hh,20,20]);
			translate([31-o,62,12.5]) rotate([atan(1),0,0]) cube([hh+2*o,20,25]);
			// m4 screw hole
			translate([31 - o, 54, 12]) rotate([0,90,0]) cylinder(r = m4 / 2, h = hh * 2 + 2*o);
	}
	// extrusion wall support
	difference()
	{
			translate([31,42,0]) rotate([0,0,0]) cube([16,h,20]);
			translate([47,42-o,h]) rotate([0,-atan(10/15),0]) mirror([0,0,0]) cube([16,h+3*o,20]);
	}
	// t-slot guide
	translate([18.5,42,0]) rotate([0,0,0]) cube([5, st, h + 15]);
}

