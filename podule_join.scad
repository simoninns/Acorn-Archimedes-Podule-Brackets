/************************************************************************

	podule_join.scad
    
	Acorn Archimedes A3xx/A4xx podule joining bracket
    Copyright (C) 2019 Simon Inns
    
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

$fn = 20;

difference() {
    // Main plate
    cube([19.7, 25.0, 3.0], center = false);

    // M2.5 screw thread left
    translate([7.5 - 3.1, 7.5, 0.0]) {
        cylinder(3.0, 2.25 / 2, 2.25 / 2);
    }

    // M2.5 screw thread right
    translate([7.5 + 4.7 + 3.1, 7.5, 0.0]) {
        cylinder(3.0, 2.25 / 2, 2.25 / 2);
    }
}

// Raised centre ridge
translate([7.5, 0.0, 3.0]) {
    cube([4.7, 25.0, 1.6], center = false);
}
