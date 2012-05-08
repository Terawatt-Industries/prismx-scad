// Prism   
// Makerslide vertical X-end prototype for
// GNU GPL v2
// Charles Strang
// derived from
// Josef Průša
// josefprusa@me.com


include <configuration.scad>
corection = 1.17; 
use <bushing.scad>
use <teardrop.scad>

$fn=30;

axis_diameter_real=4;
axis_diameter_larger=4.5;
add_strength=false;
xend_height=15.8;
xend_length=40;
solid_end_width=3;
slot_width=1;

pad_height=5.2;
pad_width=7;
pad_connector_height=3.3;
bushing_support_width=17;
rod_support_width=10;
pad_groove_depth=0.7;

module xend(endstop_mount=false,closed_end=true,curved_sides=false,override_height=-1,luu_version=false)
{
	translate([-9.5,10,0]) rotate([0,0,-90]) z_linear_bearings(luu_version=false,override_height=override_height);

	translate([-15,-40,0]) makerslidemount();

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
			#translate([0,-20,8.5]) 
			cylinder(h=4,r=m8_nut_diameter/2+thin_wall,$fn=6,center=true);
		}
		translate([0,-20,52]) 
		cylinder(h=90,r=m8_diameter/2,$fn=9,center=true);
	}
}

module makerslidemount()
{
	
	difference()
	{
		translate([0,0,0]) cube([6,70,40]);
		translate([-1,42.5,16]) cube([8,15,5]);
		// holes
		translate([-1,6,10]) rotate([0,90,0]) cylinder(h=10,r=m4_diameter/2);
		translate([-1,6,30]) rotate([0,90,0]) cylinder(h=10,r=m4_diameter/2);
		translate([-1,35,10]) rotate([0,90,0]) cylinder(h=10,r=m4_diameter/2);
		translate([-1,35,30]) rotate([0,90,0]) cylinder(h=10,r=m4_diameter/2);
		translate([-1,65,10]) rotate([0,90,0]) cylinder(h=10,r=m4_diameter/2);
		translate([-1,65,30]) rotate([0,90,0]) cylinder(h=10,r=m4_diameter/2);
	}
	// triangle supports
	translate([5.9,23.15,0])difference()
	{
		translate([0,0,0]) cube([4,7,40]);
		translate([0,0,-0.1]) rotate([0,0,-30]) cube([4,9,41]);
	}

	translate([5.9,17,0]) mirror([0,1,0]) difference()
	{
		translate([0,0,0]) cube([4,7,40]);
		translate([0,0,-0.1]) rotate([0,0,-30]) cube([4,9,41]);
	}
}


xend(endstop_mount=true,closed_end=true,curved_sides=true,override_height=65,luu_version=true);
