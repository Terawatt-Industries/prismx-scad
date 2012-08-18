// C. Strang		
// cstrang@????
// funfor.us


include <configuration.scad>;
use <y-motor-bracket.scad>;

h = 8;   	// base thickness
o = 0.1;	//  overlap amount
w=6;			// wall thickness
fmp = true;	// four mount points

m3=m3_diameter ; 
m4=m4_diameter ; 
m8=smooth_bar_diameter_horizontal;

$fn=30;

translate([0,0,0]) zmotorbracket(h,fmp,w);



module zmotorbracket(zbh, zbf, zbw)
{
	difference()
	{
		translate([0,25,0]) nema17motormount(zbh,zbf);
		translate([21,46,-o]) cylinder(r1=15,r2=12,h=5);
	}
	translate([0,0,0]) rotate([0,0,0]) zmountwalls(zbh,zbw);
}



module zmountwalls(zwh, zww)
{
	difference()
	{
		cube([42+zww,42+2*24+2,zwh]);
		translate([-o,25+o,-o]) cube([42+o,42-2*o,zwh+3*o]);

		translate([zww,0,-o]) rotate([0,0,atan((24-zww)/(42))]) mirror([0,1,0]) cube([42+1+zww,25-zww,zwh+2*o]);
		translate([-o,-o,5]) cube([42+zww+2*o,24-zww+o,4]);

		translate([zww,42+2*24+2,-o]) rotate([0,0,-atan((24-zww)/(42))]) mirror([0,0,0]) cube([42+1+zww,25-zww,zwh+2*o]);
		translate([-o,42+24+2+zww,5]) cube([42+zww+2*o,24-zww+o,4]);
	}

	difference()
	{
		cube([zww,24,20]);
		translate([-o,12,10]) rotate([0,90,0]) cylinder(r=m4/2,h=zww+2*o);
	}
	translate([0,68,0]) difference()
	{
		cube([zww,24,20]);
		translate([-o,12,10]) rotate([0,90,0]) cylinder(r=m4/2,h=zww+2*o);
	}

	translate([43,24-o,zwh-o]) cube([zww-1,44+2*o,7+o]);

	difference()
	{
		union()
		{
			translate([zww-o,24-zww,5]) cube([42+o,zww,15]);
			translate([zww-o,68,5]) cube([42+o,zww,15]);
		}
		translate([zww-o,24-zww-o,20]) rotate([0,atan(5/42),0]) cube([46,58,6]);
	}

}

