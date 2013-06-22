// f. beachler
// longevity software d.b.a. terawatt industries

include <configuration.scad>;

h = 12;		// height 6 for "thin" parts

t = 2;		// tab thickness 2 is normal, -1 to remove
o = 0.01;	//  overlap amount for error free STLs

m4 = m4_diameter;

$fn=30;

prism90(h, t, 5, m4, 0);

module prism90(th, st, hd, m4, mirr) {
	if (!mirr) {
		translate([0, 0, 0]) px90(th, st, 5, m4);
	} else {
		translate([-3,0,0]) mirror() px90(th, st, 5, m4);
	}
}

module px90(th, st, hd, m4)
{
	difference()
	{
		union()
		{
			cube([40,60,th]);
			// slots tabs
			translate([0,7.5,th-o]) cube([7.5,5,st+2*o]);
			translate([12.5,7.5,th-o]) cube([15,5,st+2*o]);
			translate([32.5,7.5,th-o]) cube([7.5,5,st+2*o]);
			translate([7.5,21,th-o]) cube([5,6.5,st+2*o]);
			translate([7.5,32.5,th-o]) cube([5,15,st+2*o]);
			translate([7.5,52.5,th-o]) cube([5,7.5,st+2*o]);

		}
		
		translate([40,20,-o]) rotate([0,0,26.6]) cube([30,50,th+2*o]);
		// holes
		translate([10,10,-o]) cylinder(r=m4/2,h=th+4);
		translate([30,10,-o]) cylinder(r=m4/2,h=th+4);
		translate([10,30,-o]) cylinder(r=m4/2,h=th+4);
		translate([10,50,-o]) cylinder(r=m4/2,h=th+4);
	}

}


