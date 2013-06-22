// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

include <configuration.scad>;

thickness = 6;   // wall and base thickness
slottabs = 2;    // Slot depth (2 is normal) -1 to remove tabs
holes = m4_diameter;  //m3, m4 or m5=5.1
o = 0.01;						// overlap amount for error-free STLs

$fn=30;

for (x = [0])
{
//	translate([(x*25), 0, 0]) rotate([90, 0, 0]) prism60inside_top_armor(thickness, slottabs, holes, false);
	translate([25, 20, 0]) rotate([90, 0, 0]) mirror([1, 0, 0]) prism60inside_top_armor(thickness, slottabs, holes, false);
}

module prism60inside_top(th,st,hs)
{
	difference() {
		union() {
			translate([-6 * sin(14.5) + 0.5, -6, 0]) cube([20, 40 + 6, 6]);
			rotate([90, -14.7, 0]) cube([20, 40, 6]);
		}
		translate([10, 5 + th, -o]) cylinder(r=hs / 2,h=th + 2*o);
		translate([10, 25 + th, -o]) cylinder(r=hs / 2,h=th + 2*o);
		rotate([90, -14.7, 0]) {
			translate([10, 10 + th, -o]) cylinder(r=hs / 2,h=th + 2*o);
			translate([10, 30 + th, -o]) cylinder(r=hs / 2,h=th + 2*o);
		}
	}
}

module prism60inside_top_armor(th, st, hs, supp)
{
	difference() {
		union() {
			translate([-6 * cos(90 - 14.7 / 2) - 0.1, 0, 0]) cube([45 + 6 * cos(90 - 14.7), 20, 6]);
			translate([-20, 0, 20 * sin(16.7)]) {
				rotate([0, 16.7, 0]) {
					difference() {
						cube([20, 20 + 45, 6]);
						translate([10, 25 + th, -5]) cylinder(r=hs / 2,h = 20 + 2*o);
						translate([10, 45 + th, -5]) cylinder(r=hs / 2,h = 20 + 2*o);
					}
				}
			}
			difference() {
				translate([-6 * cos(90 - 16.7 / 2) - 0.1, 20, 0]) cube([20, 20, 6]);
				translate([27.5, 47.5 - o, -o]) cylinder(r=30,h=10 + 2*o);
			}
		}
		translate([15, 5 + th, -o]) cylinder(r=hs / 2,h=th + 2*o);
		translate([35, 5 + th, -o]) cylinder(r=hs / 2,h=th + 2*o);
	}
	if (supp) {
		for (x = [0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 63]) {
			translate([-20, x, -0.1]) cube([19, 1, 5]);
	}
}

