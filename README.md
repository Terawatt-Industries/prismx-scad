The PrismX 3D Printer - fast, reliable, precise, and affordable.

This repository contains the CAD design files for the PrismX 3D Printer.

Getting Started
---------------
See dist/plates/README.txt for more details on printing PrismX parts.  Please read LICENSE and NOTICE.TXT for licensing details.  The complete PrismX 3D Printer bill of materials is published at http://bit.ly/tw-prismx-bom-1.

Directory Contents
------------------
dist/ - contains STL versions of the OpenSCAD files in scad/, scad/plates

moreparts/ - submodules used by PrismX such as 00str00der and others; original extras from the Prism Mendel

scad/ - OpenSCAD design files including terawatt-prism.scad

tools/ - java-based ANT build tools - not used yet

molding/ - non-public repository

build.xml - Java-based ANT build = automated compilation of SCAD files

*.settings.properties - properties file used by ANT build

Compile PrismX SCAD -> STL
--------------------------
The PrismX SCAD repository comes with an automated ANT build system.  ANT is based on Java and runs on multiple OS platforms.  You will need Java 6+ and ANT to run the build from the command line.  If you cannot install this software, you can still compile SCAD files from within OpenSCAD or using your own command-line tools.

Type "ant -p" from the command line to see a list of available ANT targets with description.

Type "ant" to compile scad/plates/*.scad -> dist/plates/*.stl

NOTE:  References to the phrase "default configuration" mean the PrismX for M4 hardware and LM8UU bearings.  Additional configurations are planned.

Additional Resources
--------------------
http://bit.ly/prismx3dprinter
http://bit.ly/tw-prismx-bom-1
http://bit.ly/terawatt
