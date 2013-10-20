// f. beachler
// longevity software d.b.a. terawatt industries

include <configuration.scad>;

h = 25;      //height 14 for normal "thick" parts
//h = 6;		// height 6 for "thin" parts

t = 2;		// tab thickness 2 is normal, -1 to remove
o = 0.01;	//  overlap amount for error free STLs

m4 = m4_diameter;

$fn=30;

prism90spacer(h, t, 5, m4, 0);

module prism90spacer(th = h, st = t, hd = 5, m4 = m4, mirr = false) {
	rotate([180, 0, 0]) {
		if (!mirr) {
			translate([0, 0, -h]) pxspacer(th, st, hd, m4);
		} else {
			translate([-3, 0, -h]) mirror() pxspacer(th, st, hd, m4);
		}
	}
}

module pxspacer(th, st, hd, m4) {
	difference()
	{
		cube([40,60,th]);
		translate([40,20,-o]) rotate([0,0,26.6]) cube([30,50,th+2*o]);
		// holes
		translate([10,10,-o]) cylinder(r = m4/2, h = th+4);
		translate([30,10,-o]) cylinder(r = m4/2, h = th+4);
		translate([10,30,-o]) cylinder(r = m4/2, h = th+4);
		translate([10,50,-o]) cylinder(r = m4/2, h = th+4);
		// countersink holes
		translate([10,10,-o]) cylinder(r = m4 * 1.45, h = 11);
		translate([30,10,-o]) cylinder(r = m4 * 1.45, h = 11);
		translate([10,30,-o]) cylinder(r = m4 * 1.45, h = 11);
		translate([10,50,-o]) cylinder(r = m4 * 1.45, h = 11);
	}
}
