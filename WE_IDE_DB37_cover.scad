/************************************************************************

	WE_IDE_DB37_cover.scad
    
	Acorn Archimedes WE IDE Podule (DB37) cover
    Copyright (C) 2020 Simon Inns
    
    This is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.
    
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
	
    Email: simon.inns@gmail.com
    
************************************************************************/

$fn = 30;
sides = 30;

// This is a replacement podule cover for the Watford Electronics IDE
// podules produced in 1991 which has a 37 pin female D-SUB external
// connector.

// D-Sub functions copied from the openscad-model-library:
// https://github.com/cznewt/openscad-model-library/blob/master/lib/connector/connector_dsub.scad
module hex_bolt_extrude(depth, head_h, body, head, clear) {
  translate([0,0,head_h/2]) rotate([0, 0, 90]) hex_head_extrude(head_h, head, clear);
  translate([0,0,head_h]) bolt_body_extrude(depth-head_h+clear, body, clear);
}

module bolt_body_extrude(height, diameter, clear) {
    radius = diameter/2+clear*2;
    cylinder(h=height, r1=radius, r2=radius, center=false, $fn=50);
}

module hex_head_extrude(height, diameter, clear) {
    height = height+clear;
	radius = diameter+1+clear*4;
    angle = 360/6;
	cote = (radius)/tan(angle);

	union() {
		rotate([0,0,0])
			cube([radius,cote,height],center=true);
		rotate([0,0,angle])
			cube([radius,cote,height],center=true);
		rotate([0,0,2*angle])
			cube([radius,cote,height],center=true);
	}
}

// Note: this is modified slightly to get the holes to the right diameter
module m1_6_hex_bolt_extrude(depth, head, clear) {
  translate([0,0,-depth/2]) hex_bolt_extrude(depth, head, 2.5, 3.41, clear);
}

module connector_dsub_extrusion(dimensions,depth,clear)
{
    
    b = dimensions[0];
    d = dimensions[1];
    f = dimensions[2];
    k = dimensions[3];
    h = depth+clear;
    g = clear;

    cut_angle = 10;
    mounting_hole = 3.05;
    o = 2*(g+f-k)*tan(cut_angle);

        union()
        {
            hull()
            {
                translate([-(g+d-k),(g+f-k),-h/2])
                    cylinder(h=h, d=k, $fn=sides);
                translate([(g+d-k),(g+f-k),-h/2])
                    cylinder(h=h, d=k, $fn=sides);
                translate([-(g+d-k)+o,-(g+f-k),-h/2])
                    cylinder(h=h, d=k, $fn=sides);
                translate([(g+d-k)-o,-(g+f-k),-h/2])
                    cylinder(h=h, d=k, $fn=sides);
            }

            translate([-b,0,0])
                m1_6_hex_bolt_extrude(h, 1, 0.1);

            translate([b,0,0])
                m1_6_hex_bolt_extrude(h, 1, 0.1);
        }
}

module connector_dsub_37F_extrusion(depth,clear)
{
    dimensions = [31.75,29.54,6.53,2.11];
    connector_dsub_extrusion(dimensions,depth,clear);
}
// End of copied modules

// Main code to draw podule plate

// Standard plate thickness is 1.6mm
plate_thickness = 1.6;

difference() {
    // Main plate
    cube([128.6, 25.0, plate_thickness], center = false);

    // M2.5 screw hole left
    translate([(128.6 - 122.5) / 2, 7.5, -1.0]) {
        cylinder(plate_thickness + 2, 3.0 / 2, 3.0 / 2);
    }

    // M2.5 screw hole right
    translate([128.6 - ((128.6 - 122.5) / 2), 7.5, -1.0]) {
        cylinder(plate_thickness + 2, 3.0 / 2, 3.0 / 2);
    }

    translate([22 + 31.5,11,0]) {
        connector_dsub_37F_extrusion(plate_thickness + 2, 0.2);
    }
}

// Add some text to the cover
content = "IDE";
font = "Liberation Sans";

translate ([93, (25 / 2) - (10 / 2) , plate_thickness]) {
   linear_extrude(height = 0.5) {
       text(content, font = font, size = 10);
     }
 }