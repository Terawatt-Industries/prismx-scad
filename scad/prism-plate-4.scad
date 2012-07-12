// C. Strang		
// cstrang@????
// funfor.us

include <configuration.scad>;

use <60 Inside.scad>;


for (x = [0:1:2])
{
	translate([(x*25),0,0]) prism60inside(6,2,m4_diameter);
	translate([20+(x*25),55,0]) mirror() prism60inside(6,2,m4_diameter);
}