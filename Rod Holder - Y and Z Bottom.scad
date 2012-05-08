// C. Strang		
// cstrang@????
// funfor.us

h = 6;       	// base thickness
m = h-1;	// marker height
o = 0.1;	//  overlap amount
hh = 14;	// bar holder height


include <metric.scad>;

m3=m3_diameter;
m3n=m3_nut_diameter_horizontal;
m4=m4_diameter ; 
m8=smooth_bar_diameter_horizontal;

$fn=30;

translate([0,0,0]) yzrodholder();

module yzrodholder()
{
	difference()
	{
		union()
		{
			translate([0,0,0]) rotate([0,0,0]) cube([20,50,h]);
			translate([20-0.1,24.4,0]) marker();
			translate([0.1,24.4,0]) mirror() marker();
			translate([0,16.5,h-o]) rodholder();
		}
		translate([16,0,-o]) rotate([0,0,-30]) cube([10,10,h+2*o]);
		translate([4,0,-o]) mirror() rotate([0,0,-30]) cube([10,10,h+2*o]);
		translate([-9,47,-o]) rotate([0,0,-30]) cube([10,10,h+2*o]);
		translate([29,47,-o]) mirror() rotate([0,0,-30]) cube([10,10,h+2*o]);
		translate([10,10,-o]) cylinder(r=m4/2,h=h+4);
		translate([10,40,-o]) cylinder(r=m4/2,h=h+4);
		translate([10,25,-o]) cylinder(r=m8/2,h=h+hh+4);
	}

}

module marker()
{
	difference()
	{
		cube([1.1,1.2,m]);
		translate([1,-1.77,-o]) rotate([0,0,30]) cube([2,2,m+2*o]);
		translate([0,1.23,-o]) rotate([0,0,-30]) cube([2,2,m+2*o]);
	}
}

module rodholder()
{
	difference()
	{
		union()
		{
			translate([0,0,0]) rotate([0,0,0]) cube([10,17,hh+o]);
			translate([10,8.5,0]) cylinder(r=(m8),h=hh+o,$fn=50);
		}
		translate([2.5,8.5,10.4]) rotate([90,90,90]) cylinder(r=m3n/2,h=5,$fn=6);
		translate([-0.1,8.5,10.4]) rotate([90,90,90]) cylinder(r=m3/2,h=9);
		translate([2.5,5.85,10.4]) rotate([0,0,0]) cube([5,m3n-0.8,m3n]);

	}
}


