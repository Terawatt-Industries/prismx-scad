// M8 Y-axes holders for Prism Mendel
// by Terawatt Industries
// author Free Beachler

include <configuration.scad>;

// PARAMETERS
extrusion_width = 20;
holder_height = 35;
holder_width = 75;
mnt_base_thickness = 6;	// need clearance for M4 screws to tnut
overlap = 0.1;			// amount to overlap aluminum t-extrusion
slot_tab_depth = 2;
slot_tab_length = 35;
rod_radius = 8;
roundness = 3;

m4_screw_dia = m4_diameter;

// CALCULATIONS
rod_center_offset_vert = -mnt_base_thickness / 2;			// vertical offset from center in holder

// RENDER
$fn=30;

translate([0,0,0]) yrodsupport(holder_height, holder_width, mnt_base_thickness, overlap, slot_tab_depth, rod_radius, rod_center_offset_vert);

module yrodsupport(yh, yw, ybt,yo,ystd,yrd,yrcov) 
{
	rodsupport(yh, yw, ybt,yo,ystd,yrd,yrcov);
	base(yh,yw, ybt,yo,ystd,yrd,yrcov);
}

module base(yh, yw, ybt, yo, ystd, yrd, yrcov)
{
	difference()
	{
		union()
		{
			translate([0,0,0]) cube([ybt, yw, extrusion_width]);
			translate([-ystd + yo, (yw - slot_tab_length) / 2, 7.5]) cube([ystd + 2 * yo, slot_tab_length, 5]);
		}
		translate([yo, 12 - yo, 7.5]) rotate([0,-45,0]) 
			mirror([1,0,0]) cube([ystd + 2 * yo, 41 + 2 * yo, 5]);
		// TODO parametrize hole distance from endz
		translate([-yo, 10, 10]) rotate([0, 90, 0]) cylinder(r=ybt / 2, h=ybt + 2 * yo);
		translate([-yo, yw - 10,10]) rotate([0,90,0]) cylinder(r=ybt/2, h=ybt + 2 * yo);
	}
}

module rodsupport(yh, yw, ybt, yo, ystd, yrd, yrcov)
{
	difference()
	{
		union()
		{
			translate([ybt, yw / 4, 0]) cube([(yh - ybt) / 2, yw / 2, extrusion_width]);
		minkowski() {
			translate([(yh - ybt) / 2 + ybt, yw / 4, 0]) cube([(yh - ybt) / 2 - roundness * 2, yw / 2, extrusion_width]);
			translate([0, 0, 0]) cylinder(r=roundness,h=0.01);
		}
		}
		translate([ybt + (yh - ybt) / 2 + yrcov, yw / 2, -yo]) cylinder(r=yrd,h=extrusion_width + 2 * yo);
	}

}
