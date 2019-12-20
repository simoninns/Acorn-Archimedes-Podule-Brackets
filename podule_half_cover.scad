/************************************************************************

	podule_half_cover.scad
    
	Acorn Archimedes A3xx/A4xx half-width podule cover
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
    cube([128.6, 25.0, 1.6], center = false);

    // M2.5 screw hole left
    translate([(128.6 - 122.5) / 2, 7.5, 0.0]) {
        cylinder(3.0, 3.0 / 2, 3.0 / 2);
    }

    // M2.5 screw hole right
    translate([128.6 - ((128.6 - 122.5) / 2), 7.5, 0.0]) {
        cylinder(3.0, 3.0 / 2, 3.0 / 2);
    }
}

