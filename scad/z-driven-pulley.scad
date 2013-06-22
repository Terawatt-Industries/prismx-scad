// f. beachler
// longevity software d.b.a. terawatt industries

include <pulley_t-mxl-xl-htd-gt2_n-tooth.scad>;

teeth = 36;
T5_pulley_dia = tooth_spaceing_curvefit (0.6523, 1.591, 1.064);
GT2_2mm_pulley_dia = tooth_spacing (2, 0.254);

zdrivenpulley();

module zdrivenpulley();
{
	pulley ("GT2", GT2_2mm_pulley_dia, 0.764, 1.494);
	//translate([40,0,0]) pulley ("GT2", GT2_2mm_pulley_dia, 0.764, 1.494);
}