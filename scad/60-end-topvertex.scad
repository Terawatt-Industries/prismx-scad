// C. Strang
// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

include <configuration.scad>;

$fn=30;

a = 30;								// parts angle
partthickness = 4 + 0.5;			// part thickness
screwdia = m4_diameter;	// hole diameter (i.e m3, m4, m5=5.1)
raildia = m8_diameter;
slottabs = -1;					// slot tab depth (2 normal, -1 remove)
o = 0.01;							// overlay for error free STLs

translate([0, 0, partthickness]) rotate([0, 180, 0]) prism60end_topvertex(slottabs, screwdia, partthickness, raildia);

module prism60end_topvertex(sl, sc, pa, rd)
{
	difference() {
		union() {
			translate([20,0,0]) rotate([0,0,a]) rail(sl,sc,pa, rd);
			translate([54.60,0,0]) rotate([0,0,-a]) mirror([1,0,0]) rail(sl,sc,pa);
			translate([20,0,0]) rotate([0,0,0]) base1(pa);
			translate([57.3,44.65,0]) rotate([0,0,180]) base2(pa);
		}
		// smooth rail
		translate([57.3 - 20, 60 / 2 + 20, 0]) rotate([90, 0, 0]) cylinder(r=rd / 2 + 0.1, h=60, $fn=30);
		translate([0, 10, 0]) {
			// m4 screw holes
			translate([57.3 - 20 + 11, 25, -o]) cylinder(r = m4_diameter / 2, h=pa + 5);
			translate([57.3 - 20 - 11, 25, -o]) cylinder(r = m4_diameter / 2, h=pa + 5);
		}
	}
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
		translate([-5, -15, 0]) cube([50.0, 55, th]);
		translate([-10, -10, -o]) rotate([0,0,61]) cube([60, 25, th+2*o]);
		translate([50.0, -10, -o]) rotate([0,0,29]) cube([25, 60, th+2*o]);
		translate([20.0,-27.32,-o]) rotate([0,0,0]) cylinder(r=30,h=th+2*o,$fn=50);
	}
}


module rail(st,sd,th)
{
	difference()
	{
		cube([21, 53.7, th]);
		translate([10,10,-o]) cylinder(r=sd/2,h=2*o+th);
 		translate([10,30,-o]) cylinder(r=sd/2,h=2*o+th);
	}
//	translate([7.5,1,th-o]) cube([5,6.0,st+o]);
//	translate([7.5,13,th-o]) cube([5,14,st+o]);
//	translate([7.5,33,th-o]) cube([5,7,st+o]);

}
