// C. Strang		
// cstrang@????
// funfor.us

include <configuration.scad>;

h = 14;      //height 14 for normal "thick" parts
//h = 6;		// height 6 for "thin" parts

t = 2;		// tab thickness 2 is normal, -1 to remove
o = 0.1;	//  overlap amount for error free STLs


$fn=30;

translate([3,0,0]) prism90(h,t,5);
translate([-3,0,0]) mirror() prism90(h,t,5);

module prism90(th,st,hd)
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
		translate([10,10,-o]) cylinder(r=hd/2,h=th+4);
		translate([30,10,-o]) cylinder(r=hd/2,h=th+4);
		translate([10,30,-o]) cylinder(r=hd/2,h=th+4);
		translate([10,50,-o]) cylinder(r=hd/2,h=th+4);
	}

}


