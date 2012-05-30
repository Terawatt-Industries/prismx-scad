// C. Strang		
// cstrang@????
// funfor.us

use <Pulley_T-MXL-XL-HTD-GT2_N-tooth.scad>;

T5_pulley_dia = tooth_spaceing_curvefit (0.6523,1.591,1.064);

zdrivenpulley();

module zdrivenpulley();
{
	pulley ( "T5" , T5_pulley_dia , 1.19 , 3.264 );
	translate([40,0,0]) pulley ( "T5" , T5_pulley_dia , 1.19 , 3.264 );
}