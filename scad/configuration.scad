// PRUSA Mendel  
// Configuration file
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

// PLEASE SELECT ONE OF THE CONFIGURATIONS BELOW
// BY UN-COMMENTING IT

// Uncomment for metric settings
// METRIC METRIC METRIC METRIC METRIC METRIC METRIC METRIC 

include <metric.scad>;

// Uncomment for imperial settings
// IMPERIAL IMPERIAL IMPERIAL IMPERIAL IMPERIAL IMPERIAL IMPERIAL 

//include <sae.scad>;

//thin_wall = 3;
// LM8UU
//linear = false;

// override settings by customizing below
// CUSTOM CUSTOM CUSTOM CUSTOM CUSTOM CUSTOM CUSTOM CUSTOM CUSTOM

threaded_rod_diameter = 8.2;
threaded_rod_diameter_horizontal = 8.2;
smooth_bar_diameter = 8.3;
smooth_bar_diameter_horizontal = 8.3;

// Nuts and bolts

m8_diameter = 8.3;
m8_nut_diameter = 15;

m4_diameter = 4.2;
m4_nut_diameter = 9;

m3_diameter = 3.3;
m3_nut_diameter = 5.8;

///counted stuff
m3_nut_diameter_bigger = ((m3_nut_diameter  / 2) / cos (180 / 6))*2;

// functions 
include <functions.scad>

