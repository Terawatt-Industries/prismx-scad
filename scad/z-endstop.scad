// M8 Y-axes holders for Prism Mendel
// by Terawatt Industries
// author Free Beachler

include <configuration.scad>;
use <y-rod-support-clamp.scad>;

// PARAMETERS
a = 30;								// parts angle
holder_height = 20;
holder_width = 60;
mnt_base_thickness = 6;	// need clearance for M4 screws to tnut
overlap = 0.01;			// amount to overlap aluminum t-extrusion
slot_tab_depth = 2;
rod_radius = 4;
offset_above_extrusion = 0;	// top of extrusion to rod-center
m4_screw_edge_padding = 6;
m4 = m4_diameter;
m3 = m3_diameter;

// CALCULATIONS
rod_center_offset_vert = mnt_base_thickness / 2;
clamp_rod_radius = rod_radius;

// RENDER
$fn=30;

translate([0, 0, 0]) z_endstop(holder_height, holder_width, mnt_base_thickness, overlap, slot_tab_depth, clamp_rod_radius, rod_center_offset_vert, m4, m3);

module z_endstop(yh = holder_height, yw = holder_width, ybt = mnt_base_thickness, yo = overlap, ystd = slot_tab_depth, yrd = clamp_rod_radius, yrcov = rod_center_offset_vert, m4 = m4, m3 = m3) 
{
	
	difference() {
		union() {
			translate([0, 10, 0]) yrodsupportclamp(yh, yw, ybt, yo, ystd, yrd, yrcov, m4);
			translate([0, 50, 0]) yrodsupportclamp(yh, yw, ybt, yo, ystd, yrd, yrcov, m4);
			translate([-2.5 - 0.75, -15 + 2.5, 0]) {
				minkowski() {
					cube([yh + 10 - 1.5, 15 - 1.5, ybt + 1]);
					cylinder(r = 1.5, h = 0.01, center = true);
				}
			}
		}
		translate([1, (-12.5 - m4) / 2 + m3 / 2 + 0.01, -0.01]) cylinder(r = m3 / 2, h = 15, center = true);
		translate([1, (-12.5 - m4) / 2 + 0.01, -0.01]) cube([20, m3, ybt + 5]);
		translate([1 + 20, (-12.5 - m4) / 2 + m3 / 2 + 0.01, -0.01]) cylinder(r = m3 / 2, h = 15, center = true);
	}
}

