// PRUSA Mendel  
// Bushings
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>

/**
 * @id bushing
 * @name Bushing
 * @category Printed
 * @id bushing
 */ 

z_linear_bearings(luu_version=false);

luu_height=45;
uu_height=24;

module z_linear_bearings(luu=false,override_height=-1)
{
translate(v=[0,9.5,0]) rotate(a=[0,0,90])
assign (height=(override_height>0)?override_height:luu_version?luu_height+4+1:65)
{
	
	difference()
	{
		union()
		{
			//main block
			translate([-5,0,height/2]) cube([10,20,height],center=true);
			//holder for main block in x-end
			//translate([-5,0,15.8/2]) cube([12,23,15.8],center=true);
			translate([0,0,0]) cylinder(h=height,r=10,$fn=60);
		}
		//main axis
		translate([0,0,-2]) cylinder(h=height+5, r=7.7, $fn=50);
		//main cut
		translate([10,0,height/2]) cube([20,14,height+5],center=true);
		//smooth entry cut
		translate([12,0,height/2]) rotate([0,0,45]) cube([20,20,height+5],center=true);
		translate([0,0,14.5+2]) ziptie();
		translate([0,0,height-(12+2)-5]) ziptie();
	}
	if (luu_version)
	{
	translate([-(10-5.5)/2-5.5,0,0+1]) cube([10-5.5,20,2], center = true);
	translate([-(10-5.5)/2-5.5,0,luu_height+1+2+1]) cube([10-5.5,20,2], center = true);
	}
	else
	{
	translate([-(10-5.5)/2-5.5,0,0+1]) cube([10-5.5,20,2], center = true);
	translate([-(10-5.5)/2-5.5,0,uu_height+1+2+1]) cube([10-5.5,20,2], center = true);
	
	translate([-(10-5.5)/2-5.5,0,65-1]) cube([10-5.5,20,2], center = true);
	translate([-(10-5.5)/2-5.5,0,65-uu_height-1-2-1]) cube([10-5.5,20,2], center = true);
	}
}
}

//ziptie();

module ziptie(){
difference(){
translate(v=[0,0,0]) cylinder(h = 4.5, r=12.1);
translate(v=[0,0,-1]) cylinder(h = 5, r=10.1, $fn=50);
translate(v=[0,0,3]) cylinder(h = 2, r1=10.1, r2=12, $fn=50);
}}