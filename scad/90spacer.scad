// C. Strang		
// cstrang@????
// funfor.us

include <configuration.scad>;

h = 20;      //height 14 for normal "thick" parts
//h = 6;		// height 6 for "thin" parts

t = 2;		// tab thickness 2 is normal, -1 to remove
o = 0.1;	//  overlap amount for error free STLs


$fn=30;
rotate([180, 0, 0]) {
	translate([0, 0, -h]) prism90spacer(h, t, 5);
	//translate([-3,0,-h]) mirror() prism90spacer(h,t,5);
}

module prism90spacer(th, st, hd) {
	difference()
	{
		cube([40,60,th]);
		translate([40,20,-o]) rotate([0,0,26.6]) cube([30,50,th+2*o]);
		// holes
		translate([10,10,-o]) cylinder(r=hd/2,h=th+4);
		translate([30,10,-o]) cylinder(r=hd/2,h=th+4);
		translate([10,30,-o]) cylinder(r=hd/2,h=th+4);
		translate([10,50,-o]) cylinder(r=hd/2,h=th+4);
		// countersink holes
		translate([10,10,-o]) cylinder(r=hd * 1.1,h=6);
		translate([30,10,-o]) cylinder(r=hd * 1.1,h=6);
		translate([10,30,-o]) cylinder(r=hd * 1.1,h=6);
		translate([10,50,-o]) cylinder(r=hd * 1.1,h=6);
	}
}
