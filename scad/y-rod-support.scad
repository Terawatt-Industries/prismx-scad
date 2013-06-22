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
rod_radius = smooth_bar_diameter_horizontal / 2;
offset_above_extrusion = 3;	// top of extrusion to rod-center
m4_screw_edge_padding = 6;
m4_screw_dia = m4_diameter;

// CALCULATIONS
rod_center_offset_vert = mnt_base_thickness / 2;
clamp_rod_radius = rod_radius - 0.1;	// -0.1 diameter

// RENDER
$fn=30;

// for upside down z = holder_height + offset_above_extrusion + rod_radius / 2
translate([0, - holder_width / 2, 0]) rotate([0, 0, 0]) yrodsupport(holder_height, holder_width, mnt_base_thickness, overlap, slot_tab_depth, clamp_rod_radius, rod_center_offset_vert);

module yrodsupport(yh, yw, ybt,yo,ystd,yrd,yrcov) 
{
	difference() {
		union() {
		rodsupport(yh, yw, ybt,yo,ystd,yrd,yrcov);
		base(yh,yw, ybt,yo,ystd,yrd,yrcov);
		}
		// clamp screws
		translate([10, 3 * yw / 8 + yrd / 4 - m4_diameter / 2, -0.01]) rotate([0, 0, 0]) cylinder(r=m4_diameter / 2, h=extrusion_width + offset_above_extrusion + yrd / 2 + (extrusion_width / 2 * sin(a)) + 0.01);
		translate([10, yw - (3 * yw / 8 + yrd / 4 - m4_diameter / 2), -0.01]) rotate([0,0,0]) cylinder(r=m4_diameter / 2, h=extrusion_width + offset_above_extrusion + yrd / 2 + (extrusion_width / 2 * sin(a)) + 0.01);
		// clamp nut countersink for square mounting
		translate([10, 3 * yw / 8 + yrd / 4 - m4_diameter / 2, -0.01]) rotate([0, 0, 0]) cylinder(r=m4_diameter / 2 + 1.7, h = 15, $fn = 6);
		translate([10, yw - (3 * yw / 8 + yrd / 4 - m4_diameter / 2), -0.01]) rotate([0,0,0]) cylinder(r=m4_diameter / 2 + 1.7, h = 15, $fn = 6);
	}
}

module base(yh, yw, ybt, yo, ystd, yrd, yrcov)
{
	difference()
	{
		union()
		{
			translate([0,0,0]) cube([ybt, yw, extrusion_width]);
			translate([ybt, yw / 4, 0]) cube([ybt, yw / 2, extrusion_width]);
			// 	angle supp
			translate([ybt * 2 - (extrusion_width / 2 * cos(a)), yw / 4, extrusion_width / 2 * sin(a)]) rotate([0, a, 0]) cube([extrusion_width / 2, yw / 2, extrusion_width]);
			// extrusion mount slot
			translate([-ystd - 2 * yo, m4_screw_edge_padding + 12.5, yh / 2 - 2.5]) cube([ystd + 2 * yo, yw - 2 * m4_screw_edge_padding - 25, 5]);
		}
		translate([-0.01, yw / 2, extrusion_width + offset_above_extrusion + yrd / 2]) rotate([0,90,0]) cylinder(r=yrd,h=extrusion_width + 2 * yo + extrusion_width * sin(a));
		translate([-yo, m4_screw_edge_padding, extrusion_width / 2]) rotate([0, 90, 0]) cylinder(r=m4_diameter / 2, h=ybt + 2 * yo);
		translate([-yo, yw - m4_screw_edge_padding, extrusion_width / 2]) rotate([0,90,0]) cylinder(r=m4_diameter / 2, h=ybt + 2 * yo);
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
