// F. Beachler, Longevity Software LLC. d.b.a. Terawatt Industries

use <heatbed.scad>;
use <../moreparts/00str00der/src/00str00der.scad>;
use <../moreparts/terawatt-terminal-mounts/src/mnt_psu.scad>;
use <../moreparts/terawatt-terminal-mounts/src/mnt_pwr_sw.scad>;
use <../moreparts/terawatt-terminal-mounts/src/mnt_atx_psu_brd.scad>;
use <../moreparts/terawatt-terminal-mounts/src/mnt_ramps14_clip.scad>;
use <../moreparts/nut-clamps/nut_clamps.scad>;

$fn=50;

% translate([0, 0, -3]) heatbed();
plate1();

module plate1() {
	// TODO implement
}
