

module shape() {
    polygon([[0,0],[1,0],[1.5,1],[2.5,1],[2,-1],[0,-1]]);
}


innerlen=28;
outerheight=22;
thick=5;
scf=0.454545455;
innerheight=10;

$fn=64;
module make(){
    cyr=outerheight/2*2;
    difference(){
        union(){
            translate([19.018,cyr/2,0]) cutcyl(cyr,thick,12.68,[0,0,-90]);
            cube([innerlen,outerheight,thick]);       
            translate([innerlen-cyr/2-8.03,cyr/2,0]) cutcyl(cyr,thick,12.68,[0,0,90]);
        }
        translate([innerlen/2*scf+1.2,outerheight/2-innerheight/2,-0.5]) scale([scf,scf,1.2]) union(){
            translate([19.05,cyr/2,0]) cutcyl(cyr,thick,12.68,[0,0,-90]);
            cube([innerlen,outerheight,thick]);       
            translate([innerlen-cyr/2-8.04,cyr/2,0]) cutcyl(cyr,thick,12.68,[0,0,90]);
        }  
        translate([1.9,outerheight/2,-0.1]) 
         linear_extrude(height=thick*1.2) 
          polygon(points=[[-6,-3.5],[-6,3.5],[0,2],[4.5,2],[4.5,-2],[0,-2]] );
    }
}

make();
//inset(d=0.3) shape();

// outset(d=0.3) shape();

// rounding(r=0.3) shape();

//fillet(r=0.3) shape();

// shell(d=0.3) shape();

// shell(d=-0.3) shape();

// shell(d=0.3,center=true) shape();

module cutcyla(r,h,cutr=[0,0,0]){
   rotate(cutr) render() difference(){
		cylinder(r=r,h=h);
   	    translate([0,r/2+0.1,h/2]) cube([r*2,r+0.2,h],center=true);
	}
}

module cutcyl(r,h,cutofs,cutr=[0,0,0]){
   rotate(cutr) render() difference(){
			cylinder(r=r,h=h);
   	        translate([0,r/2-cutofs/2,h/2]) cube([r*2,r+cutofs*2,h],center=true);
	}
}

/* 
 * Excerpt from... 
 * 
 * Parametric Encoder Wheel 
 *
 * by Alex Franke (codecreations), March 2012
 * http://www.theFrankes.com
 * 
 * Licenced under Creative Commons Attribution - Non-Commercial - Share Alike 3.0 
*/
 
module arc( height, depth, radius, degrees ) {
    // This dies a horible death if it's not rendered here 
    // -- sucks up all memory and spins out of control 
    render() {
        difference() {
            // Outer ring
            rotate_extrude($fn = 100)
                translate([radius - height, 0, 0])
                    square([height,depth]);
         
            // Cut half off
            translate([0,-(radius+1),-.5]) 
                cube ([radius+1,(radius+1)*2,depth+1]);
         
            // Cover the other half as necessary
            rotate([0,0,180-degrees])
            translate([0,-(radius+1),-.5]) 
                cube ([radius+1,(radius+1)*2,depth+1]);
         
        }
    }
}

