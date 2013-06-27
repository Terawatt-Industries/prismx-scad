// C. Strang		
// cstrang@????
// funfor.us
// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

include <configuration.scad>;

thickness = 6;   // wall and base thickness
slottabs = 2;    // Slot depth (2 is normal) -1 to remove tabs
holes = m4_diameter;  //m3, m4 or m5=5.1
o = 0.01;				// overlap amount for error-free STLs

$fn=50;

for (x = [0, 1])
{
	translate([(x*25),0,0]) prism60inside(thickness,slottabs,holes);
	translate([20+(x*25),55,0]) mirror() prism60inside(thickness,slottabs,holes);
}

module prism60inside(th = thickness, st = slottabs, hs = holes)
{
	translate([20,(th/cos(30)),0]) rotate([0,0,150]) walls(th,st,hs);
	base(th,hs);
}

module walls(wth,wst,whs)
{
	an=atan((20)/(50-11.55-wth));
	ln=(20/cos(30))-(wth*tan(30));
	echo(ln);
	translate([7.5,wth-o,0]) cube([5,wst+o,12]);

	difference()
	{
		cube([ln,wth,20+wth]);
		translate([8,-0.1,16]) rotate([-90,0,0]) cylinder(r=whs/2,h=7);
	}

	translate([ln,wth,0,]) rotate([0,0,210]) difference()
	{
		cube([wth,(50-11.55),20+wth]);
		translate([-o,(50-11.55),wth]) rotate([-an,0,0]) mirror([0,1,0]) cube([wth+2*o,50,20+wth]);
	}

}


module base(bth,bhs)
{
	trn = 20-((bth/cos(30))*tan(30));
	difference()
		{
			cube([20,50,bth]);
			translate([20,0,-o]) rotate([0,0,-30]) mirror([1,1,0]) cube([10,25,bth+2*o]);
			translate([bth,50,-o]) rotate([0,0,-120]) mirror([1,0,0]) cube([10,25,bth+2*o]);

			translate([trn,0,-o]) rotate([0,0,-30]) cube([10,15,6.5]);
			translate([13,15+bth,-o]) cylinder(r=bhs/2,h=bth+2*o);
			translate([13,35+bth,-o]) cylinder(r=bhs/2,h=bth+2*o);
		}
}

