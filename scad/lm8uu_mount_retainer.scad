// f. beachler
// longevity software d.b.a. terawatt industries

include <configuration.scad>;

$fn=50;

mnt_id = 15 + .25;
mnt_od = 22;
lm8uu_thickness = 6;
lm8uu_mnt_height = 15.05;
mount_screws = true;
mnt_screw_dia = m4_diameter;
base = false;	// true for horizontal base
base_thickness = 6;		// ignored if base=false
base_mnt_sep = 35;

lm8uu_mount_retainer(mnt_od, mnt_id, lm8uu_mnt_height, lm8uu_thickness, mount_screws, mnt_screw_dia, base, base_thickness, base_mnt_sep);

module lm8uu_mount_retainer(lo, li, h, t, mnt, mntd, base, bt, bmntsep, boreoffset = true) {
	difference() {
		union() {
			if (!base) {
				cube([lo + t, li + t, h]);
			} else {
				cube([lo + t, li - bt, h]);
			}
			translate([(lo + t) / 2, 0, 0]) cylinder(r = (lo + t) / 2, h = h);
		}
		if (!base && mnt) {
			translate([t, lo - t, -0.01]) cylinder(r = mntd / 2, h = h + 0.02);
			translate([lo, lo - t, -0.01]) cylinder(r = mntd / 2, h = h + 0.02);
		}
		if (base) {
			// base mounting hole clearance
			rotate([90, 0, 0]) {
				translate([(lo + t) / 2, h / 2, -bt * 2 - 0.01]) {
					translate([-bmntsep / 2, 0, 0]) cylinder(r = mntd * 1.25, h = h * 2 + 0.02);
					translate([bmntsep / 2, 0, 0]) cylinder(r = mntd * 1.25, h = h * 2 + 0.02);
				}
			}
			if (boreoffset) {
				// offset bore
				translate([(lo + t) / 2, (lo - li) / 2, -0.01]) cylinder(r = li / 2, h = h + 0.02);
			} else {
				// normal bore
				translate([(lo + t) / 2, 0, -0.01]) cylinder(r = li / 2 , h = h + 0.02);
			}
			// cutoff bottom
			translate([0, -bt - lo - (lo - li) / 2, -0.01]) cube([lo + t, li + t + 1, h + 0.02]);
		} else {
			// normal bore
			translate([(lo + t) / 2, 0, -0.01]) cylinder(r = li / 2 , h = h + 0.02);
		}
	}
	if (base) {
		// base mounting holes
		difference() {
			translate([-mntd * 2.25, lo / 2 - t / 2, 0]) cube([lo + t + mntd * 4.5, bt, h]);
			rotate([90, 0, 0]) {
				translate([(lo + t) / 2, h / 2, -h]) {
					translate([-bmntsep / 2, 0, 0]) cylinder(r = mntd / 2, h = h + 0.02);
					translate([bmntsep / 2, 0, 0]) cylinder(r = mntd / 2, h = h + 0.02);
				}
			}
			if (boreoffset) {
				// offset bore
				translate([(lo + t) / 2, (lo - li) / 2, -0.01]) cylinder(r = li / 2, h = h + 0.02);
			}
		}
	}
}