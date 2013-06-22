// f. beachler
// longevity software d.b.a. terawatt industries

include <configuration.scad>;

h = 4.0;       	// base thickness - error tolerance
m = h-1;			// marker height
o = 0.01;			//  overlap amount
hh = 4.0 + o;			// bar holder height
m4 = m4_diameter;

m3=m3_diameter;
m3n=m3_nut_diameter;
bar=smooth_bar_diameter_horizontal + o;

$fn=30;

yzrodholder(h, m, hh, m4, bar);
rodholder_clamp(h + 2.0, m4, hh, bar);

module yzrodholder(yzh,yzm,yzhh,yzn, bar)
{
	difference()
	{
		union()
		{
			translate([0,0,0]) rotate([0,0,0]) cube([20,50,yzh]);
			translate([20-o, 24.4, 0]) marker(yzm);
			translate([o, 24.4, 0]) mirror() marker(yzm);
			translate([0, 16.5, yzh - o]) rodholder(yzhh, bar);
		}
		translate([16,0,-o]) rotate([0,0,-30]) cube([10,10,yzh+2*o]);
		translate([4,0,-o]) mirror() rotate([0,0,-30]) cube([10,10,yzh+2*o]);
		translate([-9,47,-o]) rotate([0,0,-30]) cube([10,10,yzh+2*o]);
		translate([29,47,-o]) mirror() rotate([0,0,-30]) cube([10,10,yzh+2*o]);
		translate([10,10 + 4,-o]) cylinder(r=yzn/2,h=yzh+5);
		translate([10,40 - 4,-o]) cylinder(r=yzn/2,h=yzh+5);
	}

}

module marker(mm)
{
	difference()
	{
		cube([1.1,1.2,mm]);
		translate([1,-1.77,-o]) rotate([0,0,30]) cube([2,2,mm+2*o]);
		translate([0,1.23,-o]) rotate([0,0,-30]) cube([2,2,mm+2*o]);
	}
}

module rodholder(rhh, bar)
{
	difference()
	{
		translate([0, -9.625, 0]) rotate([0,0,0]) cube([20, 35.75, bar / 2 + 0.5]);
		translate([-0.01, 8.5, rhh + 0.5 + o]) rotate([0, 90, 0]) cylinder(r = bar / 2, h = 20 + 1);
	}
}

module rodholder_clamp(yzh, yzn, rhh, m8) {
	difference() {
		translate([30, 6.875, 0]) rotate([0,0,0]) cube([20, 35.75, yzh + o]);	// 6.875 = 16.5 - 9.625
		translate([30 - o, 6.875 + 35.75 / 2, yzh]) rotate([0, 90, 0]) cylinder(r = bar / 2 + o, h = 20 + 1);
		translate([30 + 10,10 + 4,-o]) cylinder(r=yzn/2,h=yzh + bar);
		translate([30 + 10,40 - 4,-o]) cylinder(r=yzn/2,h=yzh + bar);
	}
}
