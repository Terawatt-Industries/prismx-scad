// F. Beachler

include <configuration.scad>;
use <lm8uu_mount_retainer.scad>;

$fn=50;

mnt_id = 15 + .25;
mnt_od = 22;
lm8uu_thickness = 6;
lm8uu_mnt_height = 15.1;
mount_screws = true;
mnt_screw_dia = m3_diameter;
base_thickness = 7.5;		// ignored if base=false
base_mnt_sep = 31;

y_lm8uu_mount_retainer(mnt_od, mnt_id, lm8uu_mnt_height, lm8uu_thickness, mount_screws, mnt_screw_dia, true, base_thickness, base_mnt_sep, false);

module y_lm8uu_mount_retainer(lo = mnt_od, li = mnt_id, h = lm8uu_mnt_height, t = lm8uu_thickness, mnt = mount_screws, mntd = mnt_screw_dia, base = true, bt = base_thickness, bmntsep = base_mnt_sep, bo = false) {
	lm8uu_mount_retainer(lo, li, h, t, mnt, mntd, base, bt, bmntsep, bo);
}