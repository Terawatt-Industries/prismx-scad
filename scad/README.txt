PrismX 3D Printer
SCAD Readme
----------------------------------------
This folder contains all CAD design files for the PrismX 3D Printer.  These files are in OpenSCAD format.  The PrismX OpenSCAD files are highly modular.

There are optional and experimental parts in the /scad folder.  Some parts, such as the spool holder, have multiple options.  Some parts are not-recommended but remain to provide context and confuse us all.  Other optional parts are experimental.  Experimental parts differ from optional parts in that they are intended for an upcoming PrismX revision, and may become standard.

/scad contains all the scad files used for printing and configuration.  It also contains optional and experimental parts.  
/scad/plates contains sets of plates which comprise the entire PrismX printed bill of materials (BOM).  Optional plates are contained in their own file(s) - i.e. optional parts are not mixed in with required parts in scad/plates.
/scad/plates/README.TXT lists the plastic parts BOM.

Printing Parts
--------------
As mentioned before, the /scad folder contains optional parts.  PrismX builders should use /scad/plates to obtain the parts needed for assembly.  If you can't use the plates we've created for you then /scad/plates/README.txt has the entire printed parts BOM.

Printing Materials
------------------
We recommend using two materials for printed kits.  ABS works well for the sheliak x-carriage and 00str00der parts, PLA works well for the rest of the frame.  We make this suggestion because ABS has a higher melting point than PLA so it withstands heat from the hotend better.  If you have to choose one material that's OK - just be aware of this.  The total amount of material required for a complete printed set exceeds 1.25kg at approximately 50% honeycomb infill - it is about 3lbs. with the PSU mount.  If you choose ABS for everything, use a "brim width" of 12-15mm in your slicing software and avoid cooling directly on the part to reduce and/or eliminate warping.  The PrismX has fewer overhangs and bridged parts so cooling requirements are reduced.

Making Modifications
--------------------
Any pull requests must consist of field-tested parts or design modifications.  Code modifications should follow our published OpenScad Coding Conventions (http://blog.terawattindustries.com/2013/04/20/openscad-coding-conventions/).

Also, the PrismX OpenSCAD code follows these conventions to maintain a consistently high degree of modularity (and parametrization).  Pull requests to this project should also follow these conventions:
1)  Every module's declaration should contain all of the variables used within the module, and by all of its submodules(!).  This is so we can customize every module and submodule, and ultimately this affords better code reusability.
2)  Variables in a module's declaration should have defaults defined in the file or in an <include>.  The point is to be able to call module() to get the default part, or module(params…) to get a customized part.
3)  Machine-wide globals can be overriden in configuration.scad.

Finally, use terawatt-prism.scad to model your changes and for (limited) virtual motion testing.  Again, only tested modifications will be considered seriously.

terawatt-prism.scad
-------------------
This SCAD is a model of the entire machine, sans hotend, wiring, and many small details.  This tool is indispensable for making properly aligned modifications.  It has parameters for animation and for positioning the x, y, and z axes.

NOTE:  the animation in terawatt-prism.scad is commented-out by default.  This is done to reduce the already lengthy rendering time.
