// f. beachler
// longevity software d.b.a. terawatt industries

include <configuration.scad>;
use <lm8uu_mount_retainer.scad>;
use <../moreparts/00str00der/src/00str00der.scad>;

$fn=50;

width = 75;
leadout = 138;
thickness = 5.5;
base_mnt_screw_sep = 35;	// distance between mounting screws on each mnt
base_mnt_sep = 45;
smooth_rod_sep = 50;
belt_distance = 7;		// distance to nearest smooth rod
m4 = m4_diameter;

rotate([0, 180, $t * 360]) {
slim_x_carriage();

// lm8uu mounts
% for (y = [width / 2 - smooth_rod_sep / 2, width / 2 + smooth_rod_sep / 2]) {
	for (x = [leadout / 2 - base_mnt_sep / 2, leadout / 2 + base_mnt_sep / 2]) {
		translate([x - 22.75, y + 18, 17.5 + 7 / 2]) {
			rotate([-90, 0, 90]) lm8uu_mount_retainer(22, 15.55, 17.5, 6, false, true, 6, 35, m4_diameter);
		}
	}
}
}	// animation rotation

/*** extruder ***/

bigP = 40.9;    // large pulley diameter - 65T 8mm bore
smallP = 10.2;  // small pulley diameter - 16T 4mm bore
belt_len = 88 * 2;  // for gt2 pulleys #of teeth x 2mm pitch

// Calculate parameters for pulley separation
Aval = (belt_len/2)-0.7855*(bigP+smallP);
Bval = Aval/(bigP-smallP);

///// Calculate the correction factor
///// fit from tabulated data @ http://www.york-ind.com/print_cat/engineering.pdf
corr = 0.001937038323*pow(Bval,10) - 0.05808154202*pow(Bval,9) + 0.761293059*pow(Bval,8) - 5.736122913*pow(Bval,7) + 27.47727309*pow(Bval,6) - 87.33413058*pow(Bval,5) + 186.371874*pow(Bval,4) - 263.6175218*pow(Bval,3) + 236.7515116*pow(Bval,2) - 122.301777*pow(Bval,1) + 28.86267614;

// Calculate the pulley separation distance
Cval = Aval/corr;

echo(Aval);
echo(Bval);
echo(Cval);
echo(corr);
motor_maxdist = 34.85;  //ctc dist from motor center to hob center at zero offset
block_offset = Cval - motor_maxdist;

rotate([0, 180, $t * 360]) {
% translate([30, 53, -30]) rotate([0, 180, 0]) {
union(){
difference(){
union(){
extruder_base();

// Position the extruder block
translate([-9,block_offset,0]) rotate([0,0,180]) extruder_block();

// Add mounts for hinge
translate([-8,9+block_offset,11/2-42.3/2-5.5]) cube([12.5,26,8],center=true);
translate([-8,17+block_offset,-17]) rotate([0,90,0]) cylinder(r=10/2,h=12.5,center=true);
translate([-14.20,11+block_offset,11/2-42.3/2-5.5]) rotate([0,0,-90]) fillet(2,8);
translate([-1.825,11+block_offset,11/2-42.3/2-5.5]) rotate([0,0,180]) fillet(2,8);
}

/// Make a hole for the filament 3.5mm wide w/ a little slot room
for (i = [0:0.25:1.25]){
translate([-8,block_offset+6.75-i,0]) color("Blue",1) cylinder(r=3.5/2,h=100,center=true);}

// Make a hole for the hotend (j-head style)
translate([-8,block_offset+6.75,-20.5]) hotend_w_screws();

// Make a hole for the hinge mount
translate([0,block_offset+17,-16.5]) rotate([0,90,0]) cylinder(r=3/2+0.2,h=100,center=true);
}
}
}

}
/*** done extruder ***/

module slim_x_carriage(width = width, leadout = leadout, thickness = thickness, base_mnt_screw_sep = base_mnt_screw_sep, base_mnt_sep = base_mnt_sep, smooth_rod_sep = smooth_rod_sep, m4d = m4) {
	difference() {
		slim_x_carriage_base(width, leadout, thickness, base_mnt_screw_sep, base_mnt_sep, smooth_rod_sep, m4d);
		translate([47.5, 0, 0]) {
			translate([-4, 52, 20]) extruder_screwholes_positive(m4d);
			translate([0, (leadout + smooth_rod_sep) / 2 + belt_distance, 20]) belt_tensioner_screw_holes(thickness, m4d);
			// belt management freedom
			translate([-15.6, (leadout + smooth_rod_sep) / 2 + belt_distance - 1, -0.1]) cube([12, 22, thickness + 0.2]);
		}
		// wire clips
		translate([5, leadout / 4 + 5, 0]) rotate([0, 180, 0]) cylinder(r = m4d / 2, h = 35, center=true);
		translate([5, leadout / 2 + 5, 0]) rotate([0, 180, 0]) cylinder(r = m4d / 2, h = 35, center=true);
		translate([5, 3 * leadout / 4 + 5, 0]) rotate([0, 180, 0]) cylinder(r = m4d / 2, h = 35, center=true);
		translate([8, leadout - 8, 0]) rotate([0, 180, 0]) cylinder(r = m4d / 2, h = 35, center=true);
		translate([width - 8, leadout - 8, 0]) rotate([0, 180, 0]) cylinder(r = m4d / 2, h = 35, center=true);
	}
	translate([47.5, (leadout + smooth_rod_sep) / 2 + belt_distance, 20]) belt_tensioner_mount(thickness, m4d);
}

module slim_x_carriage_base(leadout, width, t, base_mnt_screw_sep, base_mnt_sep, smooth_rod_sep, m4d) {
	difference() {
		minkowski() {
			cube([leadout - 8, width - 8, t - 0.1], center = false);
			translate([4, 4, 0]) cylinder(r = 4, h = 0.1);
		}
		// bearing mnt holes
		for (y = [width / 2 - smooth_rod_sep / 2, width / 2 + smooth_rod_sep / 2]) {
			for (x = [leadout / 2 - base_mnt_sep / 2, leadout / 2 + base_mnt_sep / 2]) {
				translate([x, y, -0.01]) {
					translate([0, base_mnt_screw_sep / 2, 0]) cylinder(r = m4d / 2, h = t + 0.02);
					translate([0, -base_mnt_screw_sep / 2, 0]) cylinder(r = m4d / 2, h = t + 0.02);
				}
			}
		}
		// nozzle hole
		translate([leadout / 2, width / 2 + 40, 0]) {
			translate([-(16 + 11) / 2, -leadout / 2 - 1, -0.01]) cube([16 + 11, 30, t + 0.02], center = false);
			translate([0, -80 / 2, -0.01]) cylinder(r = 27 / 2, h = t + 0.02);
			translate([0, -20, -0.01]) cylinder(r = 27 / 2, h = t + 0.02);
		}
	}
}

module extruder_screwholes_positive(dia) {
	translate([0, -4.5, -20]) rotate([0,180,0]) cylinder(r = dia / 2,h = 35,center=true);
	translate([-14, -4.5, -20]) rotate([0,180,0]) cylinder(r = dia / 2,h = 35,center=true);
	translate([-5, -43, -20]) rotate([0,180,0]) cylinder(r = dia / 2,h = 35,center=true);
}

module belt_tensioner_mount(thickness, m4d) {
	difference() {
	union() {
		translate([-20, -2, -20 + (thickness / 2)]) rotate([0, 180, 0]) cylinder(r = 12 / 2, h = thickness, center=true);
		translate([0, -2, -20 + (thickness / 2)]) rotate([0, 180, 0]) cylinder(r = 12 / 2, h = thickness, center=true);
		translate([-26, -2, -20]) cube([12, 14, thickness + 0.02], center = false);
		translate([-6, -2, -20]) cube([12, 14, thickness + 0.02], center = false);
		translate([-20, 14, -20]) cube([20, 4, thickness + 0.02], center = false);
		translate([-20, 12, -20 + (thickness / 2)]) rotate([0, 180, 0]) cylinder(r = 12 / 2, h = thickness, center=true);
		translate([0, 12, -20 + (thickness / 2)]) rotate([0, 180, 0]) cylinder(r = 12 / 2, h = thickness, center=true);
	}
	belt_tensioner_screw_holes(thickness, m4d);
	}
}

module belt_tensioner_screw_holes(thickness, dia) {
	// screw holes
	translate([-20, -2, -20]) rotate([0, 180, 0]) cylinder(r = dia / 2,h = 35,center=true);
	translate([0, -2, -20]) rotate([0, 180, 0]) cylinder(r = dia / 2,h = 35,center=true);
	translate([-20, 18, -20]) rotate([0, 180, 0]) cylinder(r = dia / 2,h = 35,center=true);
	translate([0, 18, -20]) rotate([0, 180, 0]) cylinder(r = dia / 2,h = 35,center=true);
}

