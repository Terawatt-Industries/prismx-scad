// Prism   
// Makerslide vertical X-mount prototype
// GNU GPL v2
// Charles Strang
// derived from
// Josef Průša
// josefprusa@me.com


include <configuration.scad>
use <bushing.scad>

$fn=30;

corection = 1.17;
oh  =65; 		//override height
lv = false; 	// luu version
ps = 80;		// mounting plate length (min 70mm)
					// the makerslide profile is fixed at 40mm and the 
					// slots are fixed at 10 and 30mm from one of the edges.
					// there is no reason to make the mounting holes
					// parametric
pt = 6;		// mounting plate thickness
sp = 5;			// space between parts

makerslidexmount();
translate([21+pt+sp,-10,0]) mirror([0,1,0]) makerslidexmount();

module makerslidexmount()
{
	translate([-9.5,10,0]) 
		rotate([0,0,-90]) 
			z_linear_bearings(override_height=oh,luu_version=lv);

	leadscrewmount();

	translate([0,0,0]) msmount();


}

module msmount()
{
	
	difference()
	{
		translate([-9,20+((ps-50)/2),0]) rotate([0,0,180]) cube([pt,ps,40]);
		translate([-8,17.5,16]) rotate([0,0,180]) cube([pt+2,15,5]);

		// Mounting holes
		translate([-8,-34,10]) 
			rotate([0,90,180]) 
				cylinder(h=pt+2,r=m4_diameter/2);
		translate([-8,-34,30]) 
			rotate([0,90,180]) 
				cylinder(h=pt+2,r=m4_diameter/2);
		translate([-8,25,10]) 
			rotate([0,90,180]) 
				cylinder(h=pt+2,r=m4_diameter/2);
		translate([-8,25,30]) 
			rotate([0,90,180]) 
				cylinder(h=pt+2,r=m4_diameter/2);
	}

	// triangle supports
	translate([-9.1,-16.85,0])difference()
	{
		translate([0,0,0]) cube([4,7,40]);
		translate([0,0,-0.1]) rotate([0,0,-30]) cube([4,9,41]);
	}

	translate([-9.1,-23,0]) mirror([0,1,0]) difference()
	{
		translate([0,0,0]) cube([4,7,40]);
		translate([0,0,-0.1]) rotate([0,0,-30]) cube([4,9,41]);
	}
}

module leadscrewmount()
{
	difference()
	{
		union ()
		{
			//Nut Trap
			translate([0,-20,0]) 
			cylinder(h=40,r=m8_nut_diameter/2+thin_wall*corection,$fn=6);
		}

		// Slider cutout. 
		translate([0,10,32.5]) 
		cube([22.5,22.5,70],center=true);

		//Rod hole.
		difference()
		{
			translate([0,-20,39.5]) 
			cylinder(h=90,r=m8_nut_diameter/2,$fn=6,center=true);
			translate([0,-20,8.5]) 
			cylinder(h=4,r=m8_nut_diameter/2+thin_wall,$fn=6,center=true);
		}

		translate([0,-20,52]) 
		cylinder(h=90,r=m8_diameter/2,$fn=9,center=true);
	}
}




