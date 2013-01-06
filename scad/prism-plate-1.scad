// C. Strang		
// cstrang@????
// funfor.us

include <configuration.scad>;

use <z-motor-bracket - Belt.scad>;
use <z-lead-screw-support.scad>;
use <y-motor-bracket.scad>;
use <y-idler.scad>;
use <rod-holder-z-top.scad>;
use <rod-holder-y-and-z-bottom.scad>;


translate([92,0,0]) rotate([0,0,90]) zmotorbracket(8,true,6);
translate([65,56,0]) rotate([0,0,90]) zleads(6,2,m4_diameter);
translate([0,138,0]) rotate([0,0,270]) zleads(6,2,m4_diameter);
translate([140,62,0]) rotate([0,0,180]) ymotormount();
translate([80,45,0]) rotate([0,0,-110]) mirror([1,0,0]) yidler(6,2.5,m4_diameter,2);
translate([104,65,0]) rotate([0,0,0]) ztopholder(m4_diameter,6,6,2,5,smooth_bar_diameter_horizontal);
translate([128,65,0]) rotate([0,0,0]) ztopholder(m4_diameter,6,6,2,5,smooth_bar_diameter_horizontal);
translate([55,70,0]) rotate([0,0,0]) yzrodholder(6,5,14,m4_diameter);
translate([80,70,0]) rotate([0,0,0]) yzrodholder(6,5,14,m4_diameter);
translate([120,125,0]) rotate([0,0,90]) yzrodholder(6,5,14,m4_diameter);
