// f. beachler
// longevity software d.b.a. terawatt industries

include <configuration.scad>;

m1 = m4_diameter; 
m2 = m8_diameter; 
h = 6;   				// base thickness
o = 0.01;					//  overlap amount - fb note used to prevent manifold and reduces total volume
w = 2.5;					// wall thickness
adj_len = 12;			// length of adjustment slot
st = 2;					// slot tab depth 2=normal, -1=none

$fn=50;

yidler(h, w, m1, m2, adj_len, st);
translate([-5,0,0]) mirror([1,0,0]) yidler(h, w, m1, m2, adj_len, st);

module yidler(yih, yiw, yim, bim, adj, yst)
{
	// FIXME move rotation outta here
	translate([22.5, 2, 0]) rotate([90,0,180]) wall(yih, yim, yst, adj);
	translate([0, h+2-o, 0]) base(yih, yiw, bim, adj);
}


module base(bh, bw, bm, adj)
{
	difference() {
		cube([25, 25 + adj, bh]);
		translate([-10, 25 - 1 + adj, -o]) rotate([0,0,-45]) cube([10, 20, bh+2*o]);
		translate([28, 25 - 1 + adj - 10 * cos(45), -o]) rotate([0,0,45]) cube([10, 20, bh+2*o]);
		translate([25 / 2, 15, -0.1]) cylinder(r = bm / 2, h = 9);
		translate([25 / 2, 15 + adj, -o]) cylinder(r = bm / 2, h = 9);
		translate([25 / 2 - bm / 2, 15, -o]) cube([bm, adj, bh * 2]);
	}
}


module wall(whh, wm, wst, adj)
{
	difference()
	{
		cube([20, 20, whh]);
		translate([10, 14, -o]) cylinder(r = wm/2, h = 9);
	}
	// side walls
	translate([-2.5, -o, 0]) cube([whh - 1.5, 20 + o, 25 + adj]);
	translate([25 + 2.5, -o, 0]) cube([whh - 1.5, 20 + o, 25 + adj]);
	// extrusion tab
	translate([7.5, 0, -wst]) cube([5, 7.5, wst + o]);

}

