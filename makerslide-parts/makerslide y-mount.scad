// Prism   
// Makerslide vertical X-end prototype for
// GNU GPL v2
// Charles Strang


include <configuration.scad>
corection = 1.17; 

$fn=30;

t=6;  //thickness

translate([0,0,0]) makerslideymount();
translate([60,0,0]) mirror([1,0,0]) makerslideymount();
translate([0,55,0]) mirror([0,1,0]) makerslideymount();
translate([60,55,0]) mirror([0,1,0]) mirror([1,0,0]) makerslideymount();

module makerslideymount()
{
	
	difference()
	{
		union()
		{		
			translate([0,0,0]) cube([17.5,25,t]);
			translate([17.4,0,0]) cube([8.6,20,t]);
			translate([0,0,0]) cube([t,25,17]);
		}

		// holes
		translate([-1,15,10]) rotate([0,90,0]) cylinder(h=10,r=m4_diameter/2);
		translate([15,10,-1]) rotate([0,0,0]) cylinder(h=10,r=m4_diameter/2);
	}

	// triangle supports
	translate([19.9,6,2.9]) rotate([0,-90,90]) difference()
	{
		translate([0,0,0]) cube([14,14,t]);
		translate([0,0,-0.1]) rotate([0,0,-45]) cube([14,30,t+1]);
		translate([-0.1,0,-0.1]) cube([9,3,t+0.1]);
	}

	translate([19.9,25,2.9]) rotate([0,-90,90]) difference()
	{
		translate([0,0,0]) cube([14,14,t]);
		translate([0,0,-0.1]) rotate([0,0,-45]) cube([14,30,t+1]);
		translate([-0.1,0,-0.1]) cube([9,3,t+0.1]);

	}

}

8 - 14
14 - x
