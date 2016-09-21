//-----------------------------------------------------------------------joyvertof
//-- Example: how to use the bevel module to bevel some edges of a Cube
//-----------------------------------------------------------------------

use <obiscad/bevel.scad>
use <obiscad/attach.scad>
use <ISOThread.scad>;
$fn=32;
bw=70;
bh=120;
shth=2;
bth=3.5;  
tth=1.6;
posth=6;
cposth=8;
jh=13; //jostick lower height
ih=jh+posth;
joyd=29;
joyvertof=8;
joyhoriof=-38;
//-- Cube size
size=[bw,bh,ih];

//buttonrig stuff--------------------------------------------------------------------
dbu=7.8;
dpin=2;
dpindist=9.5;
dtoppin=2;
dep=11;
topdep=20;
baseth=2;
topth=0.8;
stth=1;
buth=3.4;
scrh=buth+1.1;
buw=12;
b1x=0;
b2x=20;
b3x=-20;
width=70;//70
  pd=5;



//-- Define the connectors for beveling the for top edges


//-- Top-right beveling (rounded)
ec1a = [ [size[0]/2, 0, size[2]/2], [0,1,0], 0];
en1a = [ ec1a[0],                    [1,0,1], 0];

//top left
ec1b= [ [-size[0]/2, 0, size[2]/2], [0,1,0], 0];
en1b = [ ec1b[0],                    [-1,0,1], 0];
lidzofs=40;
righof=19;
rigvhof=15;
domakelid=false;

*translate([0,0,lidzofs]) lid();
    
color("green")baseplate();
*color("blue") translate([15,19,10]) rotate([0,0,90]) makebuttonrig();

module lid(){
    difference(){        
        scale(1.04) lidm();
        translate([0,0,-tth]) lidm();
        translate([-joyvertof+1,joyhoriof,0]) cylinder(r=joyd/2+0.2,h=10,$fn=64);
        translate([15,19,0]) rotate([0,0,90]){           
            makebuttontopout(b1x,ih/2);
            makebuttontopout(b2x,ih/2);       
            makebuttontopout(b3x,ih/2);
        }
        makeledcutout(22,-52,ih/2);
    }
}

module lidm(){
   
    //-- Debug! Show the connectors
    //connector(ec1b);
    //connector(en1b);

    //-- Perform the beveling!
    difference() {

      //-- Main cube
      cube(size,center=true);

      //-- concave_corners for doing the beveling
      bevel(ec1a, en1a, cr = 8, cres=10, l=size[1]+2);
      bevel(ec1b, en1b, cr = 8, cres=10, l=size[1]+2);


    }
}


module baseplate(){
    scrp1=[0,-10,-2.01];
    scrp2=[0,10,-2.01];
    scrp3=[-27,-10,-2.01];
    scrp4=[-27,10,-2.01];
    phd=3.2;//posthole diamegter
   
    postd=6.5;
 
    difference(){
        union(){
            cube([bw,bh,bth],center=true);
            //joy posts
            translate(scrp1+[joyvertof,joyhoriof,bth]) cylinder(r=postd/2,h=posth,$fn=32);
            translate(scrp2+[joyvertof,joyhoriof,bth]) cylinder(r=postd/2,h=posth,$fn=32);
            translate(scrp3+[joyvertof,joyhoriof,bth]) cylinder(r=postd/2,h=posth,$fn=32);
            translate(scrp4+[joyvertof,joyhoriof,bth]) cylinder(r=postd/2,h=posth,$fn=32);
            //virtual posts for centering
            //#translate(scrp3+[joyvertof+12*2,joyhoriof,bth]) cylinder(r=postd/2,h=posth,$fn=32);
            //#translate(scrp4+[joyvertof+12*2,joyhoriof,bth]) cylinder(r=postd/2,h=posth,$fn=32);
            //case fixings
            fh=6;
            fw=10;
            difference(){               
               translate([-bw/2+fw/2,-bh/2+fh/2,0+bth/2+fh/2]) cube([fw,fh,cposth],center=true);
               //translate([-bw/2+fw/2,-bh/2+fh+0.5,0+bth/2+fh/2]) rotate([90,0,0]) cylinder(r=phd/2,h=fh+1,$fn=32);
               nutholeandholey([-bw/2+fw/2,-bh/2+fh+0.1,0+bth/2+fh/2],fh,phd);
            }
            difference(){
               translate([-bw/2+fw/2,bh/2-fh/2,0+bth/2+fh/2]) cube([fw,fh,cposth],center=true);
               nutholeandholeyr([-bw/2+fw/2,bh/2-fh-0.1,0+bth/2+fh/2],fh,phd);
            }
            difference(){
               translate([bw/2-fw/2,-bh/2+fh/2,0+bth/2+fh/2]) cube([fw,fh,cposth],center=true);
               nutholeandholey([bw/2-fw/2,-bh/2+fh+0.1,0+bth/2+fh/2],fh,phd);
            }
            difference(){
                translate([bw/2-fw/2,bh/2-fh/2,0+bth/2+fh/2]) cube([fw,fh,cposth],center=true);
                nutholeandholeyr([bw/2-fw/2,bh/2-fh-0.1,0+bth/2+fh/2],fh,phd);
            }            
        }
        //joy posts holes 
        translate(scrp1+[joyvertof,joyhoriof,0]){
            scale(1.05) my_din_hex_nut(3);            
            translate([0,0,bth/2+0.1]) cylinder(r=phd/2,h=4+posth,$fn=32);
        }
        translate(scrp2+[joyvertof,joyhoriof,0]){
            scale(1.05) my_din_hex_nut(3);
            translate([0,0,bth/2+0.1]) cylinder(r=phd/2,h=4+posth,$fn=32);
        }
        translate(scrp3+[joyvertof,joyhoriof,0]){
            scale(1.05) my_din_hex_nut(3);
            translate([0,0,bth/2+0.1]) cylinder(r=phd/2,h=4+posth,$fn=32);
        }
        translate(scrp4+[joyvertof,joyhoriof,0]){
            scale(1.05) my_din_hex_nut(3);
            translate([0,0,bth/2+0.1]) cylinder(r=phd/2,h=4+posth,$fn=32);
        }
    }
    
}
  
module my_din_hex_nut(dia,hi)
// make an DIN nut 
//  dia=diameter, 6=M6 etc.
{
	hi = din934_hex_nut_hi(dia);
	difference()
	{
		cylinder(r = din934_hex_nut_dia(dia)/2,h = hi, $fn=6);

	}
}


//buttonrig stuff--------------------------------------------------------------------

module makebuttonrig(){
        difference(){
        union(){        
             translate([0,0,-baseth/2]) cube([width,dep,baseth],center=true);    
             
        }
        makebuttoncutout(b1x);
        makebuttoncutout(b2x);
        makebuttoncutout(b3x);
    }
    translate([0,0,0]){
        makebuttonclip(b1x);
        makebuttonclip(b2x);
        makebuttonclip(b3x);
        makepole(b1x);
        makepole(b2x);
        makepole(b2x*2);
        makepole(b3x);
   }
}
module makebuttoncutout(tx){
    dxofs=dpindist/2-dpin/4;
    translate([tx,0,0]){
        translate([-dxofs,0,-baseth-0.1]) cylinder(r=dpin/2,h=baseth+0.2);
        translate([+dxofs,0,-baseth-0.1]) cylinder(r=dpin/2,h=baseth+0.2);
        
        //#translate([-5-2/2,0,-baseth-0.2]) cylinder(r=2/2,h=baseth+0.2);
    }
}


module makebuttonclip(tx){
    cld=1;
    clw=2;
    clh=buth+0.1;
    dxofs=buw/2+cld;
    translate([tx,0,0]){
        translate([-dxofs,0,clh/2]){
            cube([1,clw,clh],center=true);
            translate([0.4,0,clh/2+0.4]) cube([1.8,clw,0.8],center=true);
        }
        translate([+dxofs,0,clh/2]){
            cube([1,clw,clh],center=true);
            translate([-0.4,0,clh/2+0.4]) cube([1.8,clw,0.8],center=true);
        }
        //#translate([-5-2/2,0,-baseth-0.2]) cylinder(r=2/2,h=baseth+0.2);
    }
}


module makepole(tx){
  
    cld=1;
    clw=2;
    clh=buth+0.1;
    dxofs=buw/2+pd/2+1.5;
    dyofs=dep/2+pd/2;
    bscrh=scrh+baseth;
    translate([tx,0,0]){
        translate([-dxofs,dyofs,scrh/2-baseth/2]){
            difference(){
                cube([pd,pd,bscrh],center=true);            
                cylinder(r=1.2,h=scrh);
            }
        }
        translate([-dxofs,-dyofs,scrh/2-baseth/2]){
             difference(){
                cube([pd,pd,bscrh],center=true);            
                cylinder(r=1.2,h=scrh);
            }         
        }
        //#translate([-5-2/2,0,-baseth-0.2]) cylinder(r=2/2,h=baseth+0.2);
    }
}

//top

module makebuttontopout(tx,tz){
    cutw=11;
    dxofs=buw/2+pd/2+1.5;
    dyofs=dep/2+pd/2; 
    mledd=3.2;
    translate([tx,0,tz]){
       // translate([0,0,-baseth-tth/2-0.4]) cylinder(r=dbu/2,h=tth+0.4);
       translate([0,0,-tth/2+0.2]) cube([cutw,cutw,tth+1],center=true);
       //screwrholes
       translate([-dxofs,-dyofs,-tth-0.4]){            
            cylinder(r=1.2,h=tth+1);      
       }  
       translate([+dxofs,-dyofs,-tth-0.4]){            
            cylinder(r=1.2,h=tth+1);      
       }  
        translate([-dxofs,dyofs,-tth-0.4]){            
            cylinder(r=1.2,h=tth+1);      
       }  
       translate([+dxofs,dyofs,-tth-0.4]){            
            cylinder(r=1.2,h=tth+1);      
       }  
       //minoled
       translate([-dxofs+14,-dyofs-3,-tth-1.8]){            
            cylinder(r=mledd/2,h=tth+1);      
       }  
    }
    
  
}

module makeledcutout(tx,ty,tz){
    ledd=5.4;
    translate([tx,ty,tz-tth-0.1]) cylinder(r=ledd/2,h=tth+1);
}

module nutholeandholey(t,th,dia){
     nutholeandhole(t,th,dia,[90,0,0]);
}

module nutholeandholeyr(t,th,dia){
     nutholeandhole(t,th,dia,[-90,0,0]);
}

module nutholeandhole(t,th,dia,ro=[0,0,0]){
     hi = din934_hex_nut_hi(dia);
	 r = din934_hex_nut_dia(dia)/2;

     translate(t){
         rotate(ro)
            union(){
                scale(1.05) my_din_hex_nut(dia);
                translate([0,0,hi]) cylinder(r=dia/2,h=th,$fn=32);
            }
     }
}