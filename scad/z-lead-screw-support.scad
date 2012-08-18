// C. Strang		
// cstrang@????
// funfor.us


include <configuration.scad>;
use <rod-holder-y-and-z-bottom.scad>;

h = 6;   			// base thickness
o = 0.1;			//  overlap amount
st = 2;				// slot tab depth
ls_rod_spc = 2;		// space between rod and leadscrew
rod_dia = 8;
rod_material_padding = 6;		// minimum padding between rod and edge of base
bearing_rad_l = 10;		// lower inner diameter on bearing holder
bearing_rad_h = 11.5;		// lower inner diameter on bearing holder
m = m4_diameter;

$fn=30;

translate([0, 0, 0]) zleads(h, st, m);
translate([h + rod_dia / 2 + rod_material_padding - 15, 32.5 - 25, 20]) yzrodholder(6, 5, 14, m4_diameter);

module zleads(zlh,zls,zlm)
{
	bearingholder();
	base(zlh,zls,zlm);
	hubs();
	topsupport();
}

module base(bh,bs,bm)
{
	difference()
	{
		union()
		{
			translate([0, 0, 0]) cube([bh + 14, 65, 20]);
			translate([-bs+o, 12, 7.5]) cube([bs+2*o, 41, 5]);
		}	
		translate([h + rod_dia / 2 + rod_material_padding - 5, 32.5, -0.01]) cylinder(r=rod_dia / 2, h=20 + 0.02);
		translate([o, 12-o, 7.5]) rotate([0, -45, 0]) 
		mirror([1, 0, 0]) cube([bs+2*o, 41+2*o, 5]);

		translate([-o, 9, 10]) rotate([0, 90, 0]) cylinder(r=bm/2, h=bh+2*o);
		translate([-o, 56, 10]) rotate([0, 90, 0]) cylinder(r=bm/2, h=bh+2*o);

	}
}

module bearingholder()
{
	difference() {
			translate([h,14,0]) cube([rod_material_padding + rod_dia,37,20]);
			translate([h + rod_dia / 2 + rod_material_padding - 5, 32.5, -0.01]) cylinder(r=rod_dia / 2, h=20 + 0.02);
	}
	x_off = h + rod_material_padding + rod_dia;
	difference()
	{
		union()
		{
			translate([x_off,14,0]) cube([ls_rod_spc,37,20]);
			translate([x_off + ls_rod_spc,14,0]) cube([32.5 / 2,37,20]);
			translate([x_off + 20,32.5,0]) cylinder(r=37/2,h=20);
		}
		translate([x_off + 20,32.5,-o]) cylinder(r=bearing_rad_l,h=20+2*o);
		translate([x_off + 20,32.5,13]) cylinder(r=bearing_rad_h,h=20+2*o);
		translate([x_off + 8.5,26.5,-o]) cylinder(r=m3_diameter/2,h=20+2*o);
	}
}

module hubs() {
	hull() {
		translate([h, 0, 0]) cube([h, h, 6]);
		translate([h + rod_material_padding + rod_dia / 2 + ls_rod_spc + 20, 14, 0]) cube([h, h, 6]); 
	}
	hull() {
		translate([h, 65 - h, 0]) cube([h, h, 6]);
		translate([h + rod_material_padding + rod_dia / 2 + ls_rod_spc + 20, 51 - h, 0]) cube([h, h, 6]);
	}
}

module topsupport() {
	hull() {
		translate([-6, 7.5, 20]) cube([20, 65 - 15, 6]);
		translate([-16, 0, 20]) cube([5, 65, 6]);
	}
}