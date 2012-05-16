// C. Strang		
// cstrang@????
// funfor.us

h = 5;   	// base thickness
o = 0.1;	//  overlap amount
hh = 6;		// bar holder height
w=2.5;			// wall thickness
fmp = true;	// four mount points

//import("Y Motor Bracket.stl");

include <metric.scad>;

m3=m3_diameter ; 
m4=m4_diameter ; 
m8=smooth_bar_diameter_horizontal;

$fn=30;

translate([0,0,0]) ymotormount();

module ymotormount()
{
	translate([5,0,0]) nema17motormount(h,fmp);
	//translate([20,2,0]) rotate([90,0,180]) wall();
}


module nema17motormount(pt,mp)
{
	difference()
	{
		union()
		{
			difference()
			{
				translate([0,0,0]) rotate([0,0,0]) cube([42,42,pt]);
		
				translate([21,21,-0.1]) cylinder(r=12,h=pt+2*o);
				if (mp==false)
				{
					translate([28,-0.1,-o])  cube([25,30,21]);
					translate([3,-0.1,-o])  cube([36,15,21]);
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
				#translate([-8,0,-o]) cube([7,20,pt+2*o]);
			}
		}
		translate([5.5,5.5,-o]) cylinder(r=m3/2,h=pt+2*o);
		translate([5.5,36.5,-o]) cylinder(r=m3/2,h=pt+2*o);
		translate([36.5,36.5,-o]) cylinder(r=m3/2,h=pt+2*o);
		if (mp)
		{
			translate([36.5,5.5,-o]) cylinder(r=m3/2,h=pt+2*o);
	
		}
		}
	}

}


module wall()
{
	difference()
	{
		union()
		{
translate([-32,-23.3,0]) 
			translate([0,0,0]) rotate([0,0,0]) cube([20,20,hh]);
			translate([7.5,0,-2]) cube([5,11,2.1]);
		}
		translate([10,14,-o]) rotate([0,0,0]) cylinder(r=m4/2,h=9);
	}

}

