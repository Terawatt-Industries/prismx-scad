// C. Strang		
// cstrang@????
// funfor.us


include <configuration.scad>;

h = 6;   			// base thickness
o = 0.1;			//  overlap amount
st=2;				// slot tab depth
m=m4_diameter ; 

$fn=30;

translate([0,0,0]) zleads(h,st,m);

module zleads(zlh,zls,zlm)
{
	bearingholder();
	base(zlh,zls,zlm);
}

module base(bh,bs,bm)
{
	difference()
	{
		union()
		{
			translate([0,0,0]) cube([bh,65,20]);
			translate([-bs+o,12,7.5]) cube([bs+2*o,41,5]);
		}	
		translate([o,12-o,7.5]) rotate([0,-45,0]) 
			mirror([1,0,0]) cube([bs+2*o,41+2*o,5]);

		translate([-o,9,10]) rotate([0,90,0]) cylinder(r=bm/2,h=bh+2*o);
		translate([-o,56,10]) rotate([0,90,0]) cylinder(r=bm/2,h=bh+2*o);

	}
}

module bearingholder()
{
	difference()
	{
		union()
		{
			translate([0,14,0]) cube([20,37,20]);
			translate([20,32.5,0]) cylinder(r=37/2,h=20);
		}
		translate([20,32.5,-o]) cylinder(r=10,h=20+2*o);
		translate([20,32.5,13]) cylinder(r=11.5,h=20+2*o);
		translate([8.5,26.5,-o]) cylinder(r=m3_diameter/2,h=20+2*o);
	}

}

