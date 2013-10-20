// f. beachler
// longevity software d.b.a. terawatt industries
// the parasitic spool holder attaches to the frame,
// as opposed to a detached standalone spool holder
// such as the sheliak spool holder, which this borrows from

include <configuration.scad>;
use <../moreparts/nut-clamps/nut_clamps.scad>;

o = 0.01;			//  overlap amount

$fn=50;

spool_holder_clamp();
translate([60, 0, 0]) spool_mount();

module spool_holder_clamp(holes = true)
{
		difference() {
			union() {
				translate([-30, -53 + o, 0]) cube([60, 10, 40]);
				translate([0, 0, 10]) nut_clamp_pair(20, 4, 0);
				translate([0, 0, 30 - 0.01]) nut_clamp_pair(20, 4, 0);
				// slot holder walls
				translate([-30 + o, -43, 0]) cube([10, 30, 40]);
				translate([20 - o, -43, 0]) cube([10, 30, 40]);
			}
			if (holes) {
				translate([14.5, -22, 10]) rotate([90, 0, 0]) cylinder(r = 4.5, h = 35);
				translate([14.5, -22, 30]) rotate([90, 0, 0]) cylinder(r = 4.5, h = 35);
				translate([-14.5, -22, 10]) rotate([90, 0, 0]) cylinder(r = 4.5, h = 35);
				translate([-14.5, -22, 30]) rotate([90, 0, 0]) cylinder(r = 4.5, h = 35);
			} else {
				translate([-30, -61 + o, 0]) cube([60, 10, 40]);
			}
		}
}

module spool_mount() {
	translate([0, 30, 14]) {
		intersection() {
			translate([0, -2, 0]) spool_mount_foot(0.95);
			spool_mount_foot(1.05);
		}
	}
	// base
	translate([-20, -44 + 0.1, 0]) cube([40, 50, 15]);
	// rail holder
	difference() {
		union() {
			translate([-20, -55, 0]) {
				translate([0, 0, 0]) cube([40, 30, 25]);
				translate([0, 15, 25]) rotate([0, 90, 0]) cylinder(r = 30 / 2, h = 40);
			}
		}
		translate([-25, -40, 18 + 4.1]) rotate([0, 90, 0]) cylinder(r = 4.1, h = 50);
	}
}

module spool_mount_foot(s = 1.0) {
	difference() {
		translate([-30 * s + o * 2, -50 * s + o * 2, 0 + o]) cube([60 * s - o * 4, 23 * s - o * 4, 40 - o * 4]);
		translate([0, -1 + s, 0]) scale([s, s, 1]) spool_holder_clamp(holes = false);
		// remove extraneous from clamp
		translate([-30, -10 + o, 1])  cube([60, 20, 40]);
		// remove more
//		translate([19.5, -50, 0]) cube([0.5, 40, 40]);
//		translate([-20, -50, 0]) cube([0.5, 40, 40]);
//		translate([-8, -33.5, 0]) cube([16, 40, 40]);
//		translate([-8, -28.5, 0]) rotate([0, 0, 45]) cube([16, 40, 40]);
//		translate([-8, -21.8, 0]) rotate([0, 0, 0]) cube([16, 40, 40]);
	}
}