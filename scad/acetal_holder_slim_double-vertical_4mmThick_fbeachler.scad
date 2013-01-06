// Acetal Bushing holder slim
// *********************************************
// Free Beachler
// http://www.terawattindustries.com
// http://www.thingiverse.com/fbeachler
// *********************************************
// derived from:
// http://www.thingiverse.com/thing:24574
// http://www.thingiverse.com/thing:14942

use <jonaskuehling-default.scad>

acetal_dia = 16.1;
acetal_length = 10.8;
rod_dia = 8;

//screw/nut dimensions (M3) - hexagon socket head cap screw ISO 4762, hexagon nut ISO 4032
screw_thread_dia_iso = 3;
screw_head_dia_iso = 5.5;
nut_wrench_size_iso = 5.5;


// screw/nut dimensions for use (plus clearance for fitting purpose)
clearance_dia = 0.5;
screw_thread_dia = screw_thread_dia_iso + clearance_dia;
screw_head_dia = screw_head_dia_iso + clearance_dia;
nut_wrench_size = nut_wrench_size_iso + clearance_dia;
nut_dia_perimeter = (nut_wrench_size/cos(30));
nut_dia = nut_dia_perimeter;
nut_surround_thickness = 2;

// main body dimensions
body_wall_thickness = 4;
body_width = acetal_dia + (2*body_wall_thickness);
body_height = body_width;
body_length = 60;
gap_width = 1.5;
screw_bushing_space = 1;
screw_elevation = acetal_dia + body_wall_thickness + (screw_thread_dia/2) +screw_bushing_space;
bushing_support_padding = 2;

overhang_angle = 60;
r = nut_dia_perimeter/2+nut_surround_thickness;
extra_height_varticalprint = r*sin(90-overhang_angle);

// TEST - uncomment to render in openscad:
//acetal_holder_slim_double_vertical();		



// main body
module acetal_holder_slim_double_vertical()
{
	// rotate vertical and center bearing around z-axis
	translate([0,-(acetal_dia/2+body_wall_thickness),body_length/2])
	rotate([-90,0,0])
	difference()
	{
		union()
		{	
			// body
			translate([-body_width/2 + bushing_support_padding,-body_length/2 ,body_height/2])
				cube([body_width - (2 * bushing_support_padding),body_length,(acetal_dia/2)+screw_bushing_space+(screw_thread_dia/2)+extra_height_varticalprint + 3.25]);
			translate([0,0,(acetal_dia/2)+body_wall_thickness])		
				rotate([90,0,0])
					cylinder(r=(acetal_dia/2)+body_wall_thickness, h=body_length, center=true);
	
			// gap support
			translate([-(gap_width/2)-body_wall_thickness,-(body_length/2),body_height/2])
				cube([body_wall_thickness,acetal_length,(acetal_dia/2)+screw_bushing_space+(screw_thread_dia/2)]);
			translate([gap_width/2,-(body_length/2),body_height/2])
				cube([body_wall_thickness,acetal_length,(acetal_dia/2)+screw_bushing_space+(screw_thread_dia/2)]);
			// trap nut round hole supports
			for(i=[-(body_length/2-acetal_length/2) + 5,(body_length/2-acetal_length/2) - 5])
			{
				// nut trap surround
				translate([gap_width/2 - bushing_support_padding,i,screw_elevation])
					rotate([0,90,0])
						cylinder(r=(((nut_wrench_size+nut_surround_thickness*2)/cos(30))/2), h=(body_width-gap_width)/2, $fn=20);
	
				// Screw hole surround
				translate([-gap_width/2 + bushing_support_padding,i,screw_elevation])
					rotate([0,-90,0])
						cylinder(r=(screw_head_dia/2)+nut_surround_thickness, h=(body_width-gap_width)/2, $fn=20);
			}
		}
	
		// bushing hole
		translate([0,0,acetal_dia/2+2])
			rotate([90,0,0])
				polyhole(d=acetal_dia, h=body_length+1, center=true);
	
		// top gap
		translate([-(gap_width/2),-(body_length/2)-1,body_height/2])
			cube([gap_width,body_length+2,(acetal_dia/2)+screw_bushing_space+(screw_thread_dia/2)+(nut_dia/2)+nut_surround_thickness+1]);
		// trap not holes
		for(i=[-(body_length/2-acetal_length/2) + 5,(body_length/2-acetal_length/2) - 5])
		{
			// screw hole (one all the way through)
			translate([0,i,screw_elevation])
				rotate([0,90,0])
					polyhole(d=screw_thread_dia, h=body_width+3, center=true);
		
			// nut trap
			translate([gap_width/2+body_wall_thickness,i,screw_elevation])
				rotate([0,90,0])
					cylinder(r=nut_dia/2, h=body_width/2-gap_width/2-body_wall_thickness+1,$fn=6);
		
			// screw head hole
			translate([-(gap_width)/2-body_wall_thickness,i,screw_elevation])
				rotate([0,-90,0])
					cylinder(r=screw_head_dia/2, h=body_width/2-gap_width/2-body_wall_thickness+1,$fn=20);

		}	
	}
}

/*
// Based on nophead research
module polyhole(d,h,center=false) {
    n = max(round(2 * d),3);
    rotate([0,0,180])
        cylinder(h = h, r = (d / 2) / cos (180 / n), center=center, $fn = n);
}
*/
