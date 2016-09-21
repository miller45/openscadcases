//Creative Commons - Attribution - Share Alike license.
//CC BY-SA 3.0
//© 2011 by tagno25

PinX=6;
PinY=2;
xtra=0.1;
/*--------------------------------------------------
-----------------Do Not edit Below------------------
----------Don't blame me if you break it------------
--------------------------------------------------*/

HeaderX=((PinX-1)*2.54)+2.6;
HeaderY=((PinY-1)*2.54)+2.6;

MainX=HeaderX+5.1;
MainY=HeaderY+1.25;

difference() {
	//body
	translate([-(MainX+2.1)/2, -(MainY+2.1)/2, 0]) {
		cube([MainX+2.1, MainY+2.1, 8.345]);	//3x2
	}

	union(){
		//bottom hole
		translate([-HeaderX/2, -HeaderY/2, 0-xtra/2]) {
			cube([HeaderX, HeaderY, 2+xtra]);
		}

		//Main hole
		translate([-MainX/2, -MainY/2, 2]) {
			cube([MainX, MainY, 6.345+xtra]);
		}

		//Side Hole  ==	always same
		translate([-2.625,-(MainY+2.1)/2-xtra/2,2]) {
			cube([5.25,1.06+xtra,6.345+xtra]);
		}
	}
}
