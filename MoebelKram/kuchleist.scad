$fn=32;
//sppol sizes 52,37,32


leiste(5,7,15,180);

module leiste(td,bd,h,l){    
    fld=1.5;
    flh=6;
    difference(){
        rotate([90,0,90]) linear_extrude(height=l,convexity=10) polygon(points=[[0,0],[0,h],[td,h],[bd,0]],convexity=10);
        translate([-0.01,-0.01,h/2-flh/2])cube([l+0.02,fld,flh]);
    }
}

module pcbpost(x,y){
    color("green")
    difference(){
       //translate([x,y,0]) cylinder(r=postd/2,h=posth);
       mr=0.5;
      
        translate([x-postd/2,y-postd/2,both]) 
        minkowski(){
            cube([postd,postd,posth]);
            cylinder(r=mr,h=1);
        }
        
        
       translate([x,y,both]) cylinder(r=drill/2,h=posth+1.05);
    }
}

module casebot(w,h){
    union(){
        cube([w,h,both]);
        translate([-flapover,-flapover,-flapth+0.01])
           cube([w+flapover*2,h+flapover*2,flapth]);
    }
}