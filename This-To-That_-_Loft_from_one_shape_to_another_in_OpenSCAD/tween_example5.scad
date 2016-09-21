/*
	Author: Ezra Reynolds
            thingiverse@shadowwynd.com

	Function:
		Example. Hanging hopper of some sort - demonstrates use in part of larger assembly
*/

use <tween_loft.scad>			// Define all functions (this is the main file with full documentation)
include <tween_shapes.scad>	// Define all tween shape geometries

// ------------------------Parameters -----------------------------------------------

// The lower shape
shape1				= tween_circle;
shape1Size 		= 40;				// Size of the lower shape
shape1Rotation 	= 0;				// Rotation of the lower shape
shape1Extension 	= 100;				// Extend the profile (space for tube clamp, etc.)
shape1Centroid  	= [0,0];			// Location of center point

// The upper shape
shape2				= tween_cross;		
shape2Size 		= 200;				// Size of the upper shape
shape2Rotation 	= 0;				// RotationSize of the upper shape
shape2Extension 	= 100;				// Extend the profile (space for tube clamp, etc.)
shape2Centroid	= [0,0];			// Location of center point
shape2ExtensionAdjustment	= 0;	// Moves top extension down by n slices.

wallThickness		= 20;				// Wall Thickness - higher values add material but will seal gaps
										// Thickness is added to the exterior diameter of tu be, no effect on solids
				
isHollow 			= 1;				// If 1, create a tube.  If 0, create a solid.

extrusionHeight	= 100;				// Height of the loft

extrusionSlices 	= 30;	
sliceAdjustment	= 0;				// Ensure the slices intersect by this amount, 
										// needed if OpenSCAD is generating more than 2 volumes for an STL file

sliceHeight = extrusionHeight * 1.0 / extrusionSlices;	// Calculate the height of each slice

// Generate the top level part

difference()
{
	// Make the container
	tweenLoft(shape1, shape1Size, shape1Rotation, shape1Centroid, shape1Extension,
			shape2, shape2Size, shape2Rotation, shape2Centroid, shape2Extension, shape2ExtensionAdjustment,
			extrusionSlices, sliceHeight, sliceAdjustment, wallThickness/2, isHollow);

	// Make some holes
	translate ([0,0,150]) rotate ([0,90,0]) cylinder (500, 10, 10, center=true);
	translate ([0,0,150]) rotate ([90,90,0]) cylinder (500, 10, 10, center=true);
}

// END OF FILE	S.D.G.