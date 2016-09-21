
module bracket() {
    or=21; //outerradius
    foh=60;//full outer height
    ih=45;
    uh=foh-ih;//upper inner height
    insetx=or+5;
    rcylr=10;
    rinsetx=insetx-rcylr/2; //insetx*0.8;        
    rcylz=ih-rcylr*2; //
    
    iw=or;//innerwidth    
    tr=4/2;//teardropdia
    
	difference() {        
		difference() {
			cylinder(r=or, h=foh, $fn=20);
	
			translate([0,0,ih])
                cube([50,iw,40], center=true);
	
			translate([insetx,0,ih])
                cube([30,50,40], center=true);
	
			translate([-insetx,0,ih])
                cube([30,50,40], center=true);

			translate([0,0,50])
                rotate(90, [1,0,0])
                    rotate(90, [0,0,1])
                        teardrop(r=tr, h=60);
	
			translate([rinsetx,0,rcylz])
                rotate(90, [1,0,0])
                    cylinder(r=rcylr, h=60, center=true);
	
			translate([-rinsetx,0,rcylz])
                rotate(90, [1,0,0])
                    cylinder(r=rcylr, h=60, center=true);
		}

		translate([0,0,50])
            difference() {
                cube([60,60,ih+5], center=true);

                #rotate(90, [1,0,0])
                    cylinder(r=(or-insetx/2)+2.5, h=60, center=true);	
                
                translate([0,0,-20])
                    cube([60,60,40], center=true);
            }
	}
}

module teardrop(r, h) {
	union(){
		cylinder(h=h,r=r, center = true, $fn=20);
		intersection() {
			rotate(45,[0,0,1]) 
			cube([2*r, 2*r, h], center = true);
			
			translate([1.75*r, 0, 0]) 
			cube([2*r, 2*r, h], center = true);
		}
	}
}