// f. beachler
// longevity software d.b.a. terawatt industries

$fn = 20;

include <configuration.scad>;
use <60-inside.scad>;
use <60-inside-top.scad>;
use <60-end.scad>;
use <60-end-topvertex.scad>;
use <60-end-topvertex-spacer.scad>;
use <90.scad>;
use <90spacer.scad>;
use <y-rod-support.scad>;
use <y-rod-support-clamp.scad>;
use <y-motor-bracket-univy.scad>;
use <y-idler.scad>;
use <y-idler-pulley.scad>;
use <lm8uu_mount_retainer.scad>;
use <z-motor-bracket.scad>;
use <rod-holder-y-and-z-bottom.scad>;
use <z-top.scad>;
use <z-leadscrew-support.scad>;
use <z-leadscrew-support-upper.scad>;
use <sheliak_xend.scad>;
use <sheliak_xcarriage.scad>;
use <filament-guidler-top.scad>;
use <pulley.scad>;
use <nema.scad>;

prism_width = 400;
prism_depth = 400;
extrusion_size = 20;


// ucomment to animate
/*
anim_cycle = 0;		// used to proportionally move axes during rotation
rotate([0, 0, $t * 360])
*/
terawatt_prism(prism_width, prism_depth, extrusion_size);

module kiss_extrusion(h, w, l) {
	rotate([90, 0, 90]) {
		translate([2.5, 2.5, 0]) color ([0.9, 0.9, 0.9]) cube([h - 5, w - 5, l]);
		translate([0, 0, 0.1]) color ([0, 0, 0]) cube([h, w, l - 0.2]);
	}
}

module smooth_rod(d, l) {
	color([0.9, 0.9, 0.9]) cylinder(r1 = d / 2, r2 = d / 2, h = l);
}

module leadscrew(d, l) {
	color([0.1, 0.1, 0.2]) cylinder(r1 = d / 2, r2 = d / 2, h = l);
}

module gantry_lower(pw, pd, es) {
	for (i = [-pw / 2 + es / 2, pd / 2 - es / 2]) {
		translate([-pw / 2, i, 0]) kiss_extrusion(es, es, pw);
	}
	translate([-pw / 2, -pd / 2 + es / 2, 0]) rotate([0, 0, 90]) kiss_extrusion(es, es, pw);
	translate([pw / 2 + es, -pd / 2 + es / 2, 0]) rotate([0, 0, 90]) kiss_extrusion(es, es, pw);
	// side-60s
	translate([pw / 2 + es + 5, -pd / 2 + es / 2 - 5, es * 2.5]) rotate([-90, 90 + 30, 0]) prism60end(2, 4 + 0.4, 5);
	translate([pw / 2 - es + 7.5, pd / 2 + es / 2 + 5, -es + 5]) rotate([90, -60, 0]) prism60end(2, 4 + 0.4, 5);
	mirror() {
		translate([pw / 2 + es + 5, -pd / 2 + es / 2 - 5, es * 2.5]) rotate([-90, 90 + 30, 0]) prism60end(2, 4 + 0.4, 5);
		translate([pw / 2 - es + 7.5, pd / 2 + es / 2 + 5, -es + 5]) rotate([90, -60, 0]) prism60end(2, 4 + 0.4, 5);
	}
	// feet
	translate([0, 0, -es / 2]) {
		union() {
			translate([pw / 2 + es, -pd / 2 + es / 2, 0]) rotate([0, 0, 90]) prism90(12, 2, 5, 0);
			translate([pw / 2 + es, -pd / 2 + es / 2, 12 / 2]) rotate([180, 0, 90]) prism90spacer(mirr = false);
		}
		union() {
			translate([pw / 2 + es, pd / 2 + es / 2, 0]) rotate([0, 0, 90]) mirror() prism90(12, 2, 5);
			translate([pw / 2 + es, pd / 2 + es / 2 + 3, 12 / 2]) rotate([180, 0, 90]) prism90spacer(mirr = true);
		}
		mirror() {
			union() {
				translate([pw / 2 + es, -pd / 2 + es / 2, 0]) rotate([0, 0, 90]) prism90(12, 2, 5);
				translate([pw / 2 + es, -pd / 2 + es / 2, 12 / 2]) rotate([180, 0, 90]) prism90spacer(mirr = false);
			}
			union() {
				translate([pw / 2 + es, pd / 2 + es / 2, 0]) rotate([0, 0, 90]) mirror() prism90(12, 2, 5);
				translate([pw / 2 + es, pd / 2 + es / 2 + 3, 12 / 2]) rotate([180, 0, 90]) prism90spacer(mirr = true);
			}
		}
	}	// done feet
}

module gantry_upper(pw, pd, es) {
	// front arms
	translate([-pw / 2, -pd / 2 + es / 2, es]) rotate([0, -60, 0]) kiss_extrusion(es, es, pw);
	translate([-pw / 2, pd / 2 - es / 2, es]) rotate([0, -60, 0]) kiss_extrusion(es, es, pw);
	// back arms
	mirror([1, 0, 0]) {
		translate([-pw / 2 , -pd / 2 + es / 2, es]) rotate([0, -60, 0]) kiss_extrusion(es, es, pw);
		translate([-pw / 2, pd / 2 - es / 2, es]) rotate([0, -60, 0]) kiss_extrusion(es, es, pw);
	}
}

module prism_top(pw, pd, es) {
	translate([0, -pd / 2 + es / 2, pd * sin(60) + es]) rotate([45, 0, 90]) kiss_extrusion(es, es, pw);
	translate([-es, -pd / 2 + es / 2, pd * sin(60) + es * 2 - 3]) rotate([0, 90 + 30, 0]) prism60inside_top_armor(6, 2, 4 + 0.4);
	mirror([1, 0, 0]) {
		translate([-es, -pd / 2 + es / 2, pd * sin(60) + es * 2 - 3]) rotate([0, 90 + 30, 0]) prism60inside_top_armor(6, 2, 4 + 0.4);
	}
	mirror([0, 1, 0]) {
		translate([-es, -pd / 2 - es / 2, pd * sin(60) + es * 2 - 3]) rotate([0, 90 + 30, 0]) prism60inside_top_armor(6, 2, 4 + 0.4);
		mirror([1, 0, 0]) {
			translate([-es, -pd / 2 - es / 2, pd * sin(60) + es * 2 - 3]) rotate([0, 90 + 30, 0]) prism60inside_top_armor(6, 2, 4 + 0.4);
		}
	}
}

module prism_y_axis(pw, pd, es) {
	for (y = [20, -80]) {
		translate([-pd / 2, y, 0]) {
			yrodsupport(20, 60, 6, 0.1, 2, 4 - 0.1, 6 / 2);
			translate([0, 15, es * 2 - 8]) mirror([0, 0, 1])
				yrodsupportclamp(20, 60, 6, 0.1, 2, 4 - 0.1, 6 / 2);
			translate([-3, 30, es + 6 / 2]) rotate([0, 90, 0]) smooth_rod(8, 406);
		}
	}
	mirror([-1, 0, 0]) {
		for (y = [20, -80]) {
			translate([-pd / 2, y, 0]) {
				yrodsupport(20, 60, 6, 0.1, 2, 4 - 0.1, 6 / 2);
				translate([0, 15, es * 2 - 8]) mirror([0, 0, 1])
					yrodsupportclamp(20, 60, 6, 0.1, 2, 4 - 0.1, 6 / 2);
			}
		}
	}
	translate([pd / 2 + es + 50, 0, es + 10]) rotate([-90, 90, 0]) ymotormount();
}


module prism_z_axis(pw, pd, es) {
	translate([25, pw / 2 + 10, 20]) { 
		union() {
			rotate([0, 90, 90]) yzrodholder(4.5, 3.5, 4.1, 4);
			translate([0, 14, -50]) rotate([0, -90, 90]) rodholder_clamp(4.5, 4, 4.1);
		}
		//translate([0, 0, pd - 70]) rotate([0, 180, 90]) ztopholder(4, 6, 6, -1, 5, 8);
		union() {
			translate([12.5, 8, pd - 45]) {
				translate([0, -4.5, 0]) rotate([-90, 0, 0]) prism60end_topvertex(-1, 4, 4.5);
				translate([0, -4.5, 0]) rotate([-90, 0, 180]) prism60end_spacer(4, 4, 3.5);
				translate([-12.5, 14 - 8, -75]) rotate([0, -90, 90]) rodholder_clamp(4.5, 4, 4.1);
			}
		}
		translate([-25, 8.5, -25]) smooth_rod(8, 356);
	}
	mirror([0, 1, 0])
	translate([25, pw / 2 - 10, 20]) { 
		union() {
			rotate([0, 90, 90]) yzrodholder(4.5, 3.5, 4.1, 4);
			translate([0, 14, -50]) rotate([0, -90, 90]) rodholder_clamp(4.5, 4, 4.1);
		}
		//translate([0, 0, pd - 70]) rotate([0, 180, 90]) ztopholder(4, 6, 6, -1, 5, 8);
		union() {
			translate([12.5, 8, pd - 45]) {
				translate([0, -4.5, 0]) rotate([-90, 0, 0]) prism60end_topvertex(-1, 4, 4.5);
				translate([0, -4.5, 0]) rotate([-90, 0, 180]) prism60end_spacer(4, 4, 3.5);
				translate([-12.5, 14 - 8, -75]) rotate([0, -90, 90]) rodholder_clamp(4.5, 4, 4.1);
			}
		}
		translate([-25, 8.5, -25]) smooth_rod(8, 356);
	}
	translate([-32.5, pw / 2 - es / 2, 0]) rotate([0, 0, -90]) zleads(6, 2, 4);
	translate([-130 / 2, pw / 2 - es / 2, 295]) rotate([0, 0, -90]) zleads_upper(130, 6, 2, 4, 15.79 + 0.45);
	translate([0, pw / 2 - es / 2 - 14, -20]) leadscrew(8, 330);
	mirror([0, 1, 0]) {
		translate([-32.5, pw / 2 - es / 2 - es, 0]) rotate([0, 0, -90]) zleads(6, 2, 4);
		translate([-130 / 2, pw / 2 - es / 2 - es, 295]) rotate([0, 0, -90]) zleads_upper(130, 6, 2, 4, 15.79 + 0.45);
		translate([0, pw / 2 - es / 2 - 14 - es, -20]) leadscrew(8, 330);
	}

}

module prism_x_axis(pw, pd, es, zcoord) {
	translate([0, 0, es + 40]) {
		translate([50 / 2, 495 / 2, zcoord + 8 / 2 + 2]) rotate([90, 0, 0]) smooth_rod(8, 495);
		translate([-50 / 2, 495 / 2, zcoord + 8 / 2 + 2]) rotate([90, 0, 0]) smooth_rod(8, 495);
		translate([-(58 + 14) / 2, pw / 2 + 75 / 2 - 2, zcoord]) rotate([0, 0, -90]) slim_xend(75, 58 + 14, 2, 8, 50, 15 + 1, 16, 22, 15 + 1, 17.5, 6, true, 4 + 0.4);
		translate([(58 + 14) / 2, pw / 2 + 75 / 2 - 2, zcoord + 12 + 1]) rotate([0, 180, 90]) slim_xend(75, 58 + 14, 2, 8, 50, 15 + 1, 16, 22, 15 + 1, 17.5, 6, true, 4 + 0.4);
		// lm8uu holder
		translate([28 / 2, pw / 2 + 75 / 2 - 20, zcoord + 12 + 1]) rotate([0, 0, 180]) lm8uu_mount_retainer(22, 15 + 1, 17.5, 6, true, 4.04);
		translate([42, pw / 2 + 75 - 42 / 2, zcoord + 12 + 1 + 42 / 2]) rotate([0, 0, -90]) nema17(47);
		mirror([0, 1, 0]) {
			translate([-(58 + 14) / 2, pw / 2 + 75 / 2 - 2 - 20, zcoord]) rotate([0, 0, -90]) slim_xend(75, 58 + 14, 2, 8, 50, 15 + 1, 16, 22, 15 + 1, 17.5, 6, true, 4 + 0.4);
			translate([(58 + 14) / 2, pw / 2 + 75 / 2 - 2 - 20, zcoord + 12 + 1]) rotate([0, 180, 90]) slim_xend(75, 58 + 14, 2, 8, 50, 15 + 1, 16, 22, 15 + 1, 17.5, 6, true, 4 + 0.4);
			// lm8uu holder
			translate([28 / 2, pw / 2 + 75 / 2 - 20 - 20, zcoord + 12 + 1]) rotate([0, 0, 180]) lm8uu_mount_retainer(22, 15 + 1, 17.5, 6, true, 4.04);
		}
	}
}

module x_carriage(pw, pd, es, zcoord, xcoord) {
	translate([-20, 0, es + 40 + 4]) {
		color([0, 0.1, 0.9]) translate([-50, xcoord - pw / 2 + 75 + 72 - 10, zcoord + 8 / 2 + 2]) rotate([0, 0, -90]) slim_x_carriage(75, 138, 5.5, 35, 45, 50); // slim_x_carriage([100, 75, 10]);
	}
}

module universal_y_plate_with_heatbed(pw, pd, es, ycoord) {
	// terawatt industries universal y-axis plate
	color([0.9, 0.9, 0.9]) translate([-ycoord, -230 / 2, es + 20 / 2 + 14]) rotate([0, 0, 0]) cube([230, 230, 2.54]);
	// lm8uu mounts
	translate([-ycoord + 30, -13.5 - 50, es + 2]) rotate([90, 0, 90]) lm8uu_mount_retainer(22, 15 + 1, 17.5, 6, true, 4.04);
	translate([-ycoord + 30, -13.5 + 50, es + 2]) rotate([90, 0, 90]) lm8uu_mount_retainer(22, 15 + 1, 17.5, 6, true, 4.04);
	translate([150 - ycoord, -13.5 - 50, es + 2]) rotate([90, 0, 90]) lm8uu_mount_retainer(22, 15 + 1, 17.5, 6, true, 4.04);
	translate([150 - ycoord, -13.5 + 50, es + 2]) rotate([90, 0, 90]) lm8uu_mount_retainer(22, 15 + 1, 17.5, 6, true, 4.04);
	// heatbed
	color([1, 0, 0]) translate([-ycoord + 15 / 2, -215 / 2, es + 20 / 2 + 10 + 20]) rotate([0, 0, 0]) cube([215, 215, 2]);
}

module terawatt_prism(pw = prism_width, pd = prism_depth, es = extrusion_size) {
	gantry_lower(pw, pd, es);
	gantry_upper(pw, pd, es);
	prism_top(pw, pd, es, 200, 180);
	prism_y_axis(pw, pd, es);
	prism_z_axis(pw, pd, es);
	prism_x_axis(pw, pd, es, 200);
	x_carriage(pw, pd, es, 200, 110);
 	universal_y_plate_with_heatbed(pw, pd, es, 105);
// uncomment to animate
/*	assign(anim_cycle = floor($t * 1000 / 250)) { 
		echo(anim_cycle);
		if (anim_cycle == 0) {
			prism_x_axis(pw, pd, es, $t * 2 * 200);
			x_carriage(pw, pd, es, $t * 2 * 200, $t * 4 * 220);
			universal_y_plate_with_heatbed(pw, pd, es, $t * 4 * 210);
		}
		if (anim_cycle == 1) {
			prism_x_axis(pw, pd, es, $t * 2 * 200);
			x_carriage(pw, pd, es, $t * 2 * 200, 220 - ($t * 4 * 220 % 220));
			universal_y_plate_with_heatbed(pw, pd, es, 210 - ($t * 4 * 210 % 210));
		}
		if (anim_cycle == 2) {
			prism_x_axis(pw, pd, es, 200 - ($t * 2 * 200 % 200));
			x_carriage(pw, pd, es, 200 - ($t * 2 * 200 % 200), $t * 4 * 220 - 440);
			universal_y_plate_with_heatbed(pw, pd, es, $t * 4 * 210 - 420);
		}
		if (anim_cycle == 3) {
			prism_x_axis(pw, pd, es, 200 - ($t * 2 * 200 % 200));
			x_carriage(pw, pd, es, 200 - ($t * 2 * 200 % 200), 220 - ($t * 4 * 220 % 220));
			universal_y_plate_with_heatbed(pw, pd, es, 210 - ($t * 4 * 210 % 210));
		}
	} */
}

