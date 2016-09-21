makelid=false;
makebox=true;

$fn=50;
kw=8;
wmul=16;
l=70; //length
h=10; //height
wt=1;//wall thickness
iwt=0.6;//0.8 before and .4 before that;//inner wall thickness
cr=2; //  corner radius
lidth=0.6; //lid thickness
extracr=0.5;//extra for bottom lip
tw=wmul*(kw+wt);
bt=0.6; //bottom thicksness

ocr=cr+1;
otw=tw+ocr/2;
ol=l+ocr/2;

if(makebox) thebox();
if(makelid) thelid();

module thebox(){
    union(){
        roundbox(tw,l,h,bt=bt);
        septices(kw+wt+cr/8,l,h,0.6,wmul);
    }
}

module thelid(){
    color("green")translate([-ocr/4,-ocr/4,10]) lid(otw,ol,h*0.4,lidth);
}





module roundbox(w,l,h,bt){
  
    union(){
        //#cube([w,l,h]);
        difference(){
            minkowski(){
                cube([w,l,h]);
                cylinder(r=cr,h=0.001);
            }
            translate([wt/2,wt/2,bt+0.002])
            minkowski(){
                cube([w-wt,l-wt,h-bt]);
                cylinder(r=cr,h=0.001);
            }
        }
        translate([-(cr+extracr),-(cr+extracr),0])
            cube([w+(cr+extracr)*2,l+(cr+extracr)*2,bt]);
    }
}

module septices(kw,l,h,bt,wmul){   
    for (i = [1:wmul-1]) {       
        translate([i*kw-cr,-cr,bt])
            cube([iwt/2,l+cr*2,h-bt]);
    }
}

module lid(w,l,h,lidth){
  difference(){
        minkowski(){
            cube([w,l,h]);
            cylinder(r=cr,h=0.001);
        }
        translate([wt/2,wt/2,-lidth-0.002])
            minkowski(){
                cube([w-wt,l-wt,h-lidth]);
                cylinder(r=cr,h=0.001);
            }
    }
}


