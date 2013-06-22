// C. Strang
// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

include <configuration.scad>;


$fn=50;

a = 30;								// parts angle
partthickness = 5;			// part thickness
screwdia = m4_diameter;		// hole diameter (i.e m3, m4, m5=5.1)
slottabs = 2;					// slot tab depth (2 normal, -1 remove)
o = 0.01;							// overlay for error free STLs

prism60end(slottabs,screwdia,partthickness);

module prism60end(sl,sc,pa, o)
{
	translate([20,0,0]) rotate([0,0,a]) rail(sl,sc,pa);
	translate([54.60,0,0]) rotate([0,0,-a]) mirror([1,0,0]) rail(sl,sc,pa);
	translate([20,0,0]) rotate([0,0,0]) base1(pa);
	translate([57.3,44.65,0]) rotate([0,0,180]) base2(pa);
}

module base1(th)
{
	difference()
	{
		cube([34.65,13,th]);
		translate([0,0,-o]) rotate([0,0,a]) cube([34.65,13,th+(2*o)]);
		translate([34.65,0,-o]) rotate([0,0,(90-a)]) cube([13,34.65,th+2*o]);
	}
}

module base2(th)
{
	difference()
	{
		cube([40.0,35,th]);
		translate([0,0,-o]) rotate([0,0,61]) cube([40,23,th+2*o]);
		translate([40.0,0,-o]) rotate([0,0,29]) cube([23,40,th+2*o]);
		translate([20.0,-22.32,-o]) rotate([0,0,0]) cylinder(r=30,h=th+2*o,$fn=50);
	}
}


module rail(st,sd,th)
{
	difference()
	{
		cube([20,40,th]);
		screw_holes(st,sd,th);
	}
	translate([7.5,1,th-o]) cube([5,6.0,st+o]);
	translate([7.5,13,th-o]) cube([5,14,st+o]);
	translate([7.5,33,th-o]) cube([5,7,st+o]);
}

module screw_holes(st,sd,th) {
	translate([10,10,-o]) cylinder(r=sd/2,h=2*o+th);
	translate([10,30,-o]) cylinder(r=sd/2,h=2*o+th);
}
