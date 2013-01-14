// M8 Y-axes holders for Prism Mendel
// by Terawatt Industries
// author Free Beachler

include <configuration.scad>;

// PARAMETERS
a = 30;								// parts angle
extrusion_width = 20;
holder_height = 20;
holder_width = 60;
mnt_base_thickness = 6;	// need clearance for M4 screws to tnut
overlap = 0.1;			// amount to overlap aluminum t-extrusion
slot_tab_depth = 2;
rod_radius = 4;
offset_above_extrusion = 0;	// top of extrusion to rod-center
m4_screw_edge_padding = 6;
m4_screw_dia = m4_diameter;

// CALCULATIONS
rod_center_offset_vert = mnt_base_thickness / 2;
clamp_rod_radius = rod_radius - 0.1;	// -0.1 diameter

// RENDER
$fn=30;

translate([0,-15,-15]) yrodsupportclamp(holder_height, holder_width, mnt_base_thickness, overlap, slot_tab_depth, clamp_rod_radius, rod_center_offset_vert);

module yrodsupportclamp(yh, yw, ybt,yo,ystd,yrd,yrcov) 
{
	difference() {
		rodsupport(yh, yw, ybt,yo,ystd,yrd,yrcov);
		// clamp screws
		translate([10, 3 * yw / 8 + yrd / 4 - m4_diameter / 2, -0.01]) rotate([0, 0, 0]) cylinder(r=m4_diameter / 2, h=extrusion_width + offset_above_extrusion + yrd / 2 + (extrusion_width / 2 * sin(a)) + 0.01);
		translate([10, yw - (3 * yw / 8 + yrd / 4 - m4_diameter / 2), -0.01]) rotate([0,0,0]) cylinder(r=m4_diameter / 2, h=extrusion_width + offset_above_extrusion + yrd / 2 + (extrusion_width / 2 * sin(a)) + 0.01);
		// clamp washers for sqaure mounting
		translate([10, 3 * yw / 8 + yrd / 4 - m4_diameter / 2, -0.01]) rotate([0, 0, 0]) cylinder(r=m4_diameter / 2, h=extrusion_width + offset_above_extrusion + yrd / 2 + (extrusion_width / 2 * sin(a)) + 0.01);
		translate([10, yw - (3 * yw / 8 + yrd / 4 - m4_diameter / 2), -0.01]) rotate([0,0,0]) cylinder(r=m4_diameter / 2 + 1.7, h = 5);
	}
}


module rodsupport(yh, yw, ybt, yo, ystd, yrd, yrcov)
{
	difference()
	{
		translate([0, yw / 4, extrusion_width - (extrusion_width / 2 * sin(a))]) cube([ybt * 2 + extrusion_width * sin(a), yw / 2, offset_above_extrusion + yrd / 2 + (extrusion_width / 2 * sin(a))]);
		translate([-0.01, yw / 2, extrusion_width + offset_above_extrusion + yrd / 2]) rotate([0,90,0]) cylinder(r=yrd,h=extrusion_width + 2 * yo + extrusion_width * sin(a));
	}
}
