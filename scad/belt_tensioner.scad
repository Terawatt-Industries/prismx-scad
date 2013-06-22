// Gregs configuration file
include <configuration.scad>

belt_width=6;
belt_thickness=1.5; 
tooth_height=1.5;
tooth_spacing=2;
sd = m3_diameter;

belt_clamp_thickness=5.5; 
//belt_clamp_width=m3_diameter+3*belt_clamp_thickness+2;
belt_clamp_width = 12;

belt_clamp_hole_separation=18;

belt_clamp_height=m3_diameter+2*belt_clamp_thickness;
belt_clamp_length=belt_clamp_hole_separation+m3_diameter+2*belt_clamp_thickness;

belt_clamp_channel_height=belt_thickness+tooth_height+belt_clamp_thickness*1.4;
belt_clamp_clamp_height=tooth_height+belt_clamp_thickness*1.75;

belt_clamps(belt_clamp_width, belt_clamp_clamp_height, belt_clamp_channel_height);

module belt_clamps(bcw, clmph, chnh, sd) {
	for (i=[-1, 0])
		translate([0,i*(bcw + 1),0])
	belt_clamp(clmph, sd);

	//belt_clamp_channel(chnh, sd);

	for (i=[1,2,3])
		translate([0,i*(bcw+1),0])
	belt_clamp(5.5);
}

module belt_clamp_socket(bch)
{
	difference()
	{
		translate([0,0,bch/2])
		union()
		{
			cube([belt_clamp_hole_separation,belt_clamp_width,bch],center=true);
			for(i=[-1,1])
			translate([i*belt_clamp_hole_separation/2,0,0])
			cylinder(r=belt_clamp_width/2,h=bch,center=true);
		}
		belt_clamp_holes(sd);
	}
}

module belt_clamp_channel(bcchh, sd)
{
	difference()
	{
		translate([0,0,bcchh/2])
		union()
		{
			cube([belt_clamp_hole_separation,belt_clamp_width,bcchh],center=true);
			for(i=[-1,1])
			translate([i*belt_clamp_hole_separation/2,0,0])
			cylinder(r=belt_clamp_width/2,h=bcchh,center=true);
		}

		for(i=[-1,1])
		translate([i*belt_clamp_hole_separation/2,0,-1])
		rotate(360/16)
		cylinder(r=sd/2, h=bcchh+2, $fn=30);

		translate([-belt_width/2,-belt_clamp_width/2-1,bcchh - belt_thickness-tooth_height])
		cube([belt_width,belt_clamp_width+2,belt_thickness+tooth_height+1]);
	}
}

module belt_clamp_holes(sd)
{
	translate([0,0,belt_clamp_height/2])
	{
		for(i=[-1,1]) {
			translate([i*belt_clamp_hole_separation/2,0,0])
				cylinder(r=m3_diameter/2,h=belt_clamp_height+2,center=true,$fn=30);
		}
	
		rotate([90,0,0])
		rotate(360/16)
		cylinder(r=sd, h=belt_clamp_width+2, center=true, $fn=30);

		rotate([90,0,0]) 
		translate([0,0,belt_clamp_width/2])
		cylinder(r=m3_nut_diameter/2-0.3 /*tight*/ ,h=3.4,center=true,$fn=30);
	}
}

module belt_clamp(bcch)
{
	difference()
	{
		translate([0,0,bcch/2])
		union()
		{
			cube([belt_clamp_hole_separation,belt_clamp_width,bcch],center=true);
			for(i=[-1,1]) {
				translate([i*belt_clamp_hole_separation/2,0,0])
					cylinder(r=belt_clamp_width/2,h=bcch,center=true);
			}
		}

		for(i=[-1,1]) {
			translate([i*belt_clamp_hole_separation/2,0,-1])
			rotate(360/16)
				cylinder(r=m3_diameter/2,h=bcch+2,$fn=30);
		}

		for(i=[-1:1]) {
			translate([-belt_width/2,-tooth_spacing/4+i*tooth_spacing,bcch - tooth_height])
				cube([belt_width,tooth_spacing/2,tooth_height+1]);
		}
	}
}