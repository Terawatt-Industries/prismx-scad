PrismX 3D Printer
Plates SCAD Readme
----------------------------------------
Compile al the scads in this folder and print them to obtain an entire set of printed parts for a PrismX 3D Printer.

Bill of Materials (BOM)
-----------------------
plate #		| contents
1 (pla)		| 4x yrodsupport; 1x ymotormount; 1x slim_xend_idler_mount; 1x slim_xend_motor_mount
2 (pla)		| 1x topguidler; 1x y_idler_pulley; 2x yidler; 1x belt_clamps; 2x square_peg_round_hole
3 (pla)		| 4x y_lm8uu_mount_retainer; 4x lm8uu_mount_retainer (base = false); 4x lm8uu_mount_retainer (base = true)
4 (pla)		| 2x zleads; 2x zleads_upper
5 (pla)		| 1x zmotorbracket; 1x z_endstop; 2x z_idler_pulley; 1x z_idler_mount
6 (pla)		| 2x prism60end_topvertex; 2x prism60end_spacer; 2x y_and_z_bottom
7 (pla)		| 2x slim_xend -- PRINT 2x OF THIS PLATE!
8 (abs)		| 2x rodholder_clamp; 1x slim_x_carriage; 4x yrodsupportclamp; 1x 00str00der
9 (pla)		| 4x prism60inside (2 mirrored, 2 normal); 4x prism60end 
10 (pla)	| 4x prism90 (2 mirrored, 2 normal)
11 (pla)	| 4x prism90spacer (2 mirrored, 2 normal) 
12 (pla/abs)	| 4x 60-inside-top (2 mirrored, 2 normal) 
13 (pla/abs)	| 1x psu_mnt
14 (pla/abs)	| 1x term_mnt_5mm_2hole; 1x power_switch_mount; 1x term_mnt_atx_psubrd; 1x term_mnt_ramps14
15 (pla/abs)	| 5x nut_clamp_pair; 2x 80mm fan mount for extrusion; 1x 40mm fan mount for extrusion; 1x Brix 40mm fan mount for x-carriage;
16 (pla/abs)	| 1x filament_spool_holder; 2x dowel discs for filament holder
--------------------------------
total		| 91 parts

Notes:
- If heatbed.stl is there - don't print it - it shouldn't be getting compiled!
- Parts calibration is key to proper assembly and great machine performance.  The best way to get proper calibration is with a well-calibrated extruder and printer.  Several parts are clamping and press-fit, such as bushing mounts and smooth rail mounts.  Parts from a well-calibrated printer generally makes assembly easier and almost always improves machine performance.
- Z-calibration is important in terms of printing parts that are vertically straight.  Many parts are short to minimize this but it's still important.
- Part sets for linear bearings and acetal bushings are for press-fit part tolerances.  It is OK if you have to use a (soft) mallet or a press to assemble the part.  It is not OK to have the bearing or bushing move around or slide out of the holder.  If you don't have an 00str00der you can tweak the corresponding SCAD file (usually the "o" variable), re-compile, and re-slice.
- Recommended slicing settings:  50% honeycomb infill, 5 perimeters, 200 micron layer height, 10 solid layers top/bottom
- p#7 print this plate twice
- p#8 Print with 85%+ rectilinear infill - especially important for the 00str00der.  This plate should be printed in ABS since the 00str00der holds the hotend.
- p#12 recommended to print with brim = 10mm
- p#13 (the PSU mount) is large and barely fits on a 200mm bed - A 1mm brim (or no brim) is recommended.
- p#14 You may have to drill a second screw hole on the RAMPS mnt.
- p#14, p#15, p#16 Contains post-assembly parts only.

Filament Spool Holder
---------------------
The plates set now includes a filament spool holder that attaches to the frame-base.  We also have a detached version but the parts are in their own folder (in their own repository, linked to this one at hardware/prismx/moreparts).  Again, we strongly recommend the attaching holder, because the footprint of the detached one is notably larger.  If you want a detached one the parts are:

file - count
------------
spool_holder.stl - 2x
spool_holder_base.stl - 1x
spool_holder_dowel_disc.stl - 2x
spool_holder_feet.stl - 2x (for PrismX)
spool_holder_mnt_attach.stl - 1x (for PrismX)

total = 8 parts
