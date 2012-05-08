// C. Strang		
// cstrang@????
// funfor.us

h = 14;      //height 14 for normal "thick" parts
//h = 6;		// height 6 for "thin" parts

t = 2;		// tab thickness
o = 0.1;	//  overlap amount

include <metric.scad>;

$fn=30;

#translate([3,0,0]) 90part();
#translate([-3,0,0]) mirror() 90part();

module 90part()
{
	difference()
	{
		union()
		{
			translate([0,0,0]) rotate([0,0,0]) cube([40,60,h]);
			translate([0,7.5,h-o]) rotate([0,0,0]) cube([7.5,5,t+o]);
			translate([12.5,7.5,h-o]) rotate([0,0,0]) cube([15,5,t+o]);
			translate([32.5,7.5,h-o]) rotate([0,0,0]) cube([7.5,5,t+o]);
			translate([7.5,21,h-o]) rotate([0,0,0]) cube([5,6.5,t+o]);
			translate([7.5,32.5,h-o]) rotate([0,0,0]) cube([5,15,t+o]);
			translate([7.5,52.5,h-o]) rotate([0,0,0]) cube([5,7.5,t+o]);

		}
		translate([40,20,-o]) rotate([0,0,26.6]) cube([30,50,h+4]);
		translate([10,10,-o]) cylinder(r=m4_diameter/2,h=h+4);
		translate([30,10,-o]) cylinder(r=m4_diameter/2,h=h+4);
		translate([10,30,-o]) cylinder(r=m4_diameter/2,h=h+4);
		translate([10,50,-o]) cylinder(r=m4_diameter/2,h=h+4);
	}

}


