// f. beachler
// longevity software d.b.a. terawatt industries

include <configuration.scad>;
use <slim_xend.scad>;

h = 6.55;   			// base thickness
l = 30;			// leadout
st=2;				// slot tab depth
m=m4_diameter; 
slot_od = 6.5;		// slot outer diameter
slot_id = 4.5;		// slot outer diameter
o = 0.01;			//  overlap amount

$fn=30;

topguidler(h, l, st, m, slot_od, slot_id);

module topguidler(h, l, st, m, so, si)
{
	base(h, l, st, m, so, si);
	translate([l / 2, 30, 0]) clamp(h, l, st, m, so, si);
}

module base(bh, l, bs, bm, so, si)
{
	difference()
	{
		translate([0, 0, 0]) cube([l, 50 / 3, bh]);
		beveled_channel(bh, l, so, si);
	}
	translate([0, 0, -o]) channel_holder(bh, l, so, si);
	difference() {
		union() {
			translate([l / 2, -2 - o, 0]) fancy_wing(4, bh);
			translate([l / 2, 50 / 3 + 4 / 2 - o, 0]) rotate([0, 0, 180]) fancy_wing(4, bh);
		}
		// cutoff overhangs in fancywings
		translate([0, 0, bh - o]) cube([l, 50 / 3, bh]);
		// screw holes
		translate([l / 2, -2, -o]) cylinder(r = m / 2, h = l);
		// translate([l / 2, 50 / 3 + 4 / 2, -o]) cylinder(r = m / 2, h = l);
	}
}

module clamp(bh, l, bs, bm, so, si)
{
	difference()
	{
		translate([0, 0, 0]) cube([l, 50 / 3, bh]);
		beveled_channel(bh, l, so, si);
	}
	translate([0, 0, -o]) channel_holder(bh, l, so, si);
	difference() {
		union() {
			translate([l / 2, -2 - o, 0]) fancy_wing(4, bh);
			translate([l / 2, 50 / 3 + 4 / 2 - o, 0]) rotate([0, 0, 180]) fancy_wing(4, bh);
		}
		// cutoff overhangs in fancywings
		translate([0, 0, bh - o]) cube([l, 50 / 3, bh]);
		// screw holes
		translate([l / 2, -2, -o]) cylinder(r = m / 2, h = l);
		// translate([l / 2, 50 / 3 + 4 / 2, -o]) cylinder(r = m / 2, h = l);
	}
}

module beveled_channel(bh, l, so, si) {
	translate([0, 50 / 6, bh / 2 + so / 2]) {
		translate([3 - o, 0, 0]) rotate([0, -90, 0]) cylinder(r1 = so / 2, r2 = so * 0.6, h = 3);
		translate([0, 0, 0]) rotate([0, 90, 0]) cylinder(r = so / 2, h = l);
		translate([l - 3 + o, 0, 0]) rotate([0, 90, 0]) cylinder(r1 = so / 2, r2 = so * 0.6, h = 3);
	}
}

module channel_holder(bh, l, so, si) {
	difference() {
		union() {
			translate([3 * 2 - o, 50 / 6, bh / 2 + so / 2]) rotate([0, -90, 0]) cylinder(r = so / 2, h = 2.5);
			translate([l - 3 * 2 + o, 50 / 6, bh / 2 + so / 2]) rotate([0, 90, 0]) cylinder(r = so / 2, h = 2.5);
		}
		translate([0, 50 / 6, bh / 2 + so / 2]) rotate([0, 90, 0]) cylinder(r = si / 2, h = l);
		translate([-o, -o, bh - o]) cube([l + o * 2, 50 / 3 + bh * 2, bh]);
	}
}

