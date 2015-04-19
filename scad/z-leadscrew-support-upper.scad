// C. Strang original SCAD from Prism sketchup design file
// f beachler AB mods for bushing and retainer
// longevity software d.b.a. terawatt industries


include <configuration.scad>;
// FIXME use or remove from this project
use <z-leadscrew-support-retainer.scad>;

width = 135;			// end-to-end width at corners
h = 6;   			// base thickness
o = 0.01;			//  overlap amount
st=2;				// slot tab depth
bushing_dia = 15.79 - 0.1;
m = m4_diameter;

$fn=100;

translate([0,0,0]) zleads_upper();

module zleads_upper(w = width, zlh = h, zls = st, zlm = m, bd = bushing_dia)
{
	translate([0, w / 2 - 34, 0]) bearingholder(bd);
	base(w, zlh, zls, zlm, bd);
}

module base(w, bh, bs, bm, bd)
{
	difference()
	{
		union()
		{
			translate([0,0,0]) cube([bh, w, 15]);
//			translate([0, w - w/ 2, 0]) cube([bh, w / 3, 15]);
//			translate([-bs+o, w / 2 - 41, 7.5]) cube([bs+2*o, 41, 5]);
		}
		// side cuts
		translate([-o, 0, 0]) rotate([60, 0, 0]) cube([bh + 2 * o, 50, 20]);
		translate([-o, w - 50 * sin(30), 50 * cos(30)]) rotate([-60, 0, 0]) cube([bh + 2 * o, 50, 20]);
		// screw holes
		translate([-o, 20 * cos(30), 15 / 2]) rotate([0,90,0]) cylinder(r=bm/2,h=bh+2*o);
		translate([-o, w - 20 * cos(30), 15 / 2]) rotate([0,90,0]) cylinder(r=bm/2,h=bh+2*o);
		// remove inset bearing holder from base
		translate([12, w / 2 - 1.5, -o]) cylinder(r = bd / 2, h = 25 + 2 * o);
	}
}

module bearingholder(bd)
{
	difference()
	{
		union()
		{
			translate([-6,15.5,0]) cube([20, 34, 15]);
			translate([14,32.5,0]) cylinder(r=34 / 2, h=15);
		}
		// remove overhang
		translate([-22.01, 15, -1]) cube([22, 36, 30]);
		// bushing holes
		translate([12, 32.5, -o]) cylinder(r = bd / 2, h = 25 + 2 * o);
		// bushing retainer holes
/*		translate([14, 20 , -o]) cylinder(r = m3_diameter/2, h = 25 + 2*o);
		translate([14, 45 , -o]) cylinder(r = m3_diameter/2, h = 25 + 2*o); */
	}

}

