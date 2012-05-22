// C. Strang		
// cstrang@????
// funfor.us

include <configuration.scad>;

m3=m3_diameter;
m3n=m3_nut_diameter;
m4=m4_diameter ; 
m8=smooth_bar_diameter_horizontal;

h = 6;       	// base thickness
mh = h-1;			// marker height
o = 0.1;			//  overlap amount
hh = 6;				// bar holder height
m=m4_diameter ;// attachment hole diameter;
st=2;				// slot depth 2=normal, -1 = none
rh=smooth_bar_diameter_horizontal;

$fn=30;

translate([0,0,0]) ztopholder(m,h,hh,st,mh,rh);
translate([-6,0,0]) mirror() ztopholder(m,h,hh,st,mh,rh);

module ztopholder(ztm,zth,zthh,ztst,ztmh,ztrh)
{
	difference()
	{
		union()
		{
			translate([0,10.7,0]) cube([20,28.38,zth]);
			translate([20-o,24.4,0]) marker(ztmh);
			//rod holder frame
			translate([0,10.7,zth-o]) rotate([0,0,0]) cube([10,28.38,zthh+o]);
			translate([10,25,zth-o]) cylinder(r=(ztrh),h=zthh+o,$fn=50);

			//translate([0,25,zth-o]) rodholder(zthh);
		}
		translate([10,25,-o]) cylinder(r=ztrh/2,h=zth+zthh+2*o);
		translate([2.5,25,zth+2.5]) rotate([90,90,90]) cylinder(r=m3n/2,h=ztrh+o,$fn=6);
		translate([-0.1,25,zth+2.5]) rotate([90,90,90]) cylinder(r=m3/2,h=9);
		translate([2.5,22.35,zth+2.5]) rotate([0,0,0]) cube([ztrh+o,m3n-0.8,m3n]);


	}
	translate([0,39.08,0]) rotate([60,0,0]) slantbase(zthh,ztst,ztm);
	translate([0,10.7,0]) mirror([0,1,0]) rotate([60,0,0]) slantbase(zthh,ztst,ztm);
}

module marker(mmh)
{
	difference()
	{
		cube([1.1,1.2,mmh]);
		translate([1,-1.77,-o]) rotate([0,0,30]) cube([2,2,mmh+2*o]);
		translate([0,1.23,-o]) rotate([0,0,-30]) cube([2,2,mmh+2*o]);
	}
}

module slantbase(sbhh,sbst,sbm)
{
	difference()
	{
		translate([0,0,0]) rotate([0,0,0]) cube([20,21.5,sbhh]);
		translate([10,15.45,-o]) rotate([0,0,0]) cylinder(r=sbm/2,h=sbhh+2*o);
	}
	difference()
	{
		translate([7.5,0,-sbst]) cube([5,11,sbst+o]);
		translate([7.4,-2.42,0]) rotate([-60,0,0]) cube([5.2,11,sbst+o]);
	}



}

