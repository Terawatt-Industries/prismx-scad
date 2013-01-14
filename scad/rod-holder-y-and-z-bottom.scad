// C. Strang		
// cstrang@????
// funfor.us

include <configuration.scad>;

h = 3;       	// base thickness
m = h-1;			// marker height
o = 0.1;			//  overlap amount
hh = 14;			// bar holder height
an=m4_diameter ; 


m3=m3_diameter;
m3n=m3_nut_diameter;
bar=smooth_bar_diameter_horizontal;

$fn=30;

yzrodholder(h, m, hh, an);
rodholder_clamp(h, an, hh);

module yzrodholder(yzh,yzm,yzhh,yzn)
{
	difference()
	{
		union()
		{
			translate([0,0,0]) rotate([0,0,0]) cube([20,50,yzh]);
			translate([20-o, 24.4, 0]) marker(yzm);
			translate([o, 24.4, 0]) mirror() marker(yzm);
			translate([0, 16.5, h-o]) rodholder(yzhh);
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

module rodholder(rhh)
{
	difference()
	{
		union()
		{
			translate([0, -9.625, 0]) rotate([0,0,0]) cube([20, 35.75, 8 / 2 + 0.5 + o]);
//			translate([10,8.5,0]) cylinder(r=(bar),h=rhh+o,$fn=50);
		}
//		translate([2.5,8.5,10.4]) rotate([90,90,90]) cylinder(r=m3n/2,h=5,$fn=6);
//		translate([-0.1,8.5,10.4]) rotate([90,90,90]) cylinder(r=m3/2,h=9);
//		translate([2.5,5.85,10.4]) rotate([0,0,0]) cube([5,m3n-0.8,m3n]);

		translate([-0.01, 8.5, 8 / 2 + 0.5 + 0.1]) rotate([0, 90, 0]) cylinder(r = 8 / 2 + o, h = 20 + 1);
	}
}

module rodholder_clamp(yzh, yzn, rhh) {
	difference() {
		translate([30, 6.875, 0]) rotate([0,0,0]) cube([20, 35.75, 3.5 + 4 + 0.5 + o]);	// 6.875 = -9.625 + 16.5
		translate([30 - o, 6.875 + 35.75 / 2, 3.5 + 8 / 2 + 0.5 + 0.1]) rotate([0, 90, 0]) cylinder(r = 8 / 2 + o, h = 20 + 1);
		translate([30 + 10,10 + 4,-o]) cylinder(r=yzn/2,h=yzh + 8);
		translate([30 + 10,40 - 4,-o]) cylinder(r=yzn/2,h=yzh + 8);
	}
}
