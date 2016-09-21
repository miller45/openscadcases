/**************************************************************************
 * File: ruler.scad
 * Date: 2011-03-04
 * Version: 0.1
 * Author: Miles Lightwood <m@teamteamusa.com>
 * Copyright (C): 2011
 *
 * Parametric ruler for OpenSCAD
 *
 * All measurements in millimeters
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the Attribution Non-Commercial Share Alike
 *  (cc by-nc-sa) License as published by the Creative Commons Corporation;
 *  either version 3 of the License, or (at your option) any later version.
 *  
 *  See http://creativecommons.org/licenses/by-nc-sa/3.0/legalcode for details.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 **************************************************************************/

/* Download OpenSCADFont package http://www.thingiverse.com/thing:6820
 * and update this path to reflect its location on your machine.
 */
// include </path/to/OpenSCADFont/OpenScadFont.scad>

mark_width = 0.125;
mark_depth = 0.05;

module ruler(length)
{
	difference()
	{
		cube( [1, length+5, 8 ] );
		for ( i = [1:length] )
		{
			translate( [mark_depth, i, 0] ) cube( [1, mark_width, 3 ] );
			translate( [-mark_depth, i, 0] ) cube( [1, mark_width, 3 ] );
			if (i % 5 == 0)
			{
				translate( [mark_depth, i, 0] ) cube( [5, mark_width, 5 ] );
				translate( [-mark_depth, i, 0] ) cube( [5, mark_width, 5 ] );
			}
			if (i % 10 == 0)
			{
				translate( [mark_depth, i, 0] ) cube( [10, mark_width, 7 ] );
				translate( [-mark_depth, i, 0] ) cube( [10, mark_width, 7 ] );
				numbers(i);
			}
		}
	}
}

module numbers(number)
{
	y_offset = 27.5;
	
	offsets = [y_offset,
			  (y_offset*2)+0.5,
			  (y_offset*3)+1.5,
			  (y_offset*4)+2.5,
			  (y_offset*5)+3.75,
			  (y_offset*6)+4.75,
			  (y_offset*7)+6,
			  (y_offset*8)+7,
			  (y_offset*9)+8,
			  (y_offset*10)+6.5,
			  (y_offset*11)+8,
			  (y_offset*12)+8.5,
			  (y_offset*13)+9.5,
			  (y_offset*14)+10.5
];

	tenth = number/10;

	if (number < 100)
	{
		scale([1, 0.35, 0.35])
			translate([-mark_depth, offsets[tenth-1], 16])
				rotate([0, 90, 0])
					fnt_str([str(tenth),"0"],2,1,3);				
	}

	if (number >= 100 && number < 200)
	{
		scale([1, 0.35, 0.35])
			translate([-mark_depth, offsets[tenth-1], 16])
				rotate([0, 90, 0])
					fnt_str(["1", str(tenth % 10),"0"],3,1,3);				
	}
}

translate([0, -140/2, 0]) ruler(140);