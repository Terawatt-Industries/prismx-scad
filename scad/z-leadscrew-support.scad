// C. Strang original SCAD from Prism sketchup design file
// f beachler AB mods for bushing and retainer
// longevity software d.b.a. terawatt industries


include <configuration.scad>;
// FIXME use or remove from this project
use <z-leadscrew-support-retainer.scad>;

h = 6;   			// base thickness
o = 0.1;			//  overlap amount
st=2;				// slot tab depth
bushing_dia = 15.79 + 0.45;
m = m4_diameter;

$fn=100;

translate([0,0,0]) zleads(h, st, m, bushing_dia);
//% translate([11, 17, 25]) zleads_bushing_retainer();

module zleads(zlh = h, zls = st, zlm = m, bd = bushing_dia)
{
	translate([0, 0, 0]) bearingholder(bd);
	base(zlh,zls,zlm);
}

module base(bh,bs,bm)
{
	difference()
	{
		union()
		{
			translate([0,0,0]) cube([bh,65 / 3, 20]);
			translate([0,65 - 65/ 3,0]) cube([bh,65 / 3,20]);
			translate([-bs+o,12,7.5]) cube([bs+2*o,41,5]);
		}	
		translate([o,12-o,7.5]) rotate([0,-45,0]) 
			mirror([1,0,0]) cube([bs+2*o,41+2*o,5]);

		translate([-o,9,10]) rotate([0,90,0]) cylinder(r=bm/2,h=bh+2*o);
		translate([-o,56,10]) rotate([0,90,0]) cylinder(r=bm/2,h=bh+2*o);

	}
}

module bearingholder(bd)
{
	difference()
	{
		union()
		{
			translate([-6,15.5,0]) cube([20,34,25]);
			translate([14,32.5,0]) cylinder(r=34 / 2, h=25);
		}
		// remove overhang
		translate([-22.01, 15, -1]) cube([22, 36, 30]);
		// bushing holes
		translate([14,32.5,-o]) cylinder(r = 5, h = 20 + 2 * o);
		translate([14,32.5,14]) cylinder(r= bd / 2, h = 15 + 2 * o);
		translate([14, 32.5, -0.01 ]) cylinder(r = bd / 2, h=11 + 2 * o);
		// bushing retainer holes
/*		translate([14, 20 , -o]) cylinder(r = m3_diameter/2, h = 25 + 2*o);
		translate([14, 45 , -o]) cylinder(r = m3_diameter/2, h = 25 + 2*o); */
	}

}

