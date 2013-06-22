// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

include <configuration.scad>;

thickness = 6;   // wall and base thickness
slottabs = 2;    // Slot depth (2 is normal) -1 to remove tabs
holes = m4_diameter;  //m3, m4 or m5=5.1
o = 0.1;						// overlap amount for error-free STLs

$fn=30;

for (x = [0])
{
	translate([(x*25),0,0]) prism60inside_hotext(thickness,slottabs,holes);
}

module prism60inside_hotext(th,st,hs)
{
	difference() {
		union() {
			cube([20, 40, 6]);
			rotate([90, 0, 0]) cube([20, 45, 6]);
		}
		translate([10, 5 + th, -0.1]) cylinder(r=hs / 2,h=th + 2*o);
		translate([10, 25 + th, -0.1]) cylinder(r=hs / 2,h=th + 2*o);
		rotate([90, 0, 0]) {
			translate([10, 10 + th, -0.1]) cylinder(r=hs / 2,h=th + 2*o);
			translate([10, 30 + th, -0.1]) cylinder(r=hs / 2,h=th + 2*o);
		}
	}
}

