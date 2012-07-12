// C. Strang		
// cstrang@????
// funfor.us

use <Y Motor Bracket.scad>;

h = 6;   	// base thickness
fmp = true;	// four mount points


$fn=30;

translate([0,0,0]) nema17spacer();

module nema17spacer()
{
	difference()
	{
		nema17motormount(h,fmp);
		translate([8.5,-.1,-.1]) cube([40,33.5,10]);
	}
}


