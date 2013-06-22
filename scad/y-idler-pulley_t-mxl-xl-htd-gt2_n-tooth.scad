include <Pulley_t-mxl-xl-htd-gt2_n-tooth.scad>;

teeth = 48;
pulley_dia = tooth_spacing (2, 0.254);

yidlerpulley();

module yidlerpulley();
{
	difference() {
		pulley("GT2 2mm", pulley_dia, 0.764, 1.494);
		translate([0, 0, -0.1]) cylinder(r = 4, h = 20);
	}
}