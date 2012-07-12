// C. Strang		
// cstrang@????
// funfor.us

include <configuration.scad>;

use <Rod Holder - Y and Z Bottom.scad>;
use <90.scad>;
use <Pulley_T-MXL-XL-HTD-GT2_N-tooth.scad>;


translate([2,65,0]) rotate([0,0,0]) yzrodholder(6,5,14,m4_diameter);
translate([50,125,0]) rotate([0,0,90]) yzrodholder(6,5,14,m4_diameter);
translate([64,65,0]) rotate([0,0,0]) yzrodholder(6,5,14,m4_diameter);
translate([0,0,0]) rotate([0,0,0]) prism90(6,2,5);
translate([85,0,0]) rotate([0,0,0]) mirror() prism90(6,2,5);

translate([150,0,0]) rotate([0,0,90]) prism90(14,2,5);
translate([88,73,0]) rotate([0,0,270]) prism90(14,2,5);
translate([88,77,0]) rotate([0,0,-90]) mirror() prism90(14,2,5);
translate([150,150,0]) rotate([0,0,-270]) mirror() prism90(14,2,5);

translate([43,62,0]) pulley( "T5" , tooth_spaceing_curvefit(0.6523,1.591,1.064), 1.19 , 3.264 );
translate([43,102,0]) pulley( "T5" , tooth_spaceing_curvefit(0.6523,1.591,1.064), 1.19 , 3.264 );
