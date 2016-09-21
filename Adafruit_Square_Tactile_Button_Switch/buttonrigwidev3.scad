$fn=32;
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
//lid 
 lidThick=2.9;
 
 doupper=true;
 dolower=false;

//makebutton(b1x);
//makebutton(b2x);
//makebutton(b3x);

//upper lane
if(doupper){

translate([0,0,1])
    difference(){
       // translate([0,0,buth+topth/2]) cube([width,topdep,topth],center=true);    
        makelid();
        translate([+5,-10,0]){
                makebuttontopout(b1x);
                makebuttontopout(b2x);       
                makebuttontopout(b3x);
                makeledcutout(b3x-20,-10);
        }
    }
}

if(dolower){
    //lower lane

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

   


module makebutton(tx){
    translate([45+tx,-85,0]) import ("pressed_adafruit_square_tactile_button_1010.stl",convexity=3);
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

module makeledcutout(tx,ty){
    ledd=5.4;
    translate([tx,ty,scrh-lidThick/2+0.4]) cylinder(r=ledd/2,h=lidThick+0.4);
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


module makebuttontopout(tx){
    cutw=11;
    dxofs=buw/2+pd/2+1.5;
    dyofs=dep/2+pd/2;
  
    translate([tx,0,lidThick+scrh-0.02]){
        translate([0,0,-baseth-lidThick/2-0.4]) cylinder(r=dbu/2,h=lidThick+0.4);
         translate([0,0,-baseth-0.4]) cube([cutw,cutw,lidThick+0.4],center=true);
       //screwrholes
       translate([-dxofs,-dyofs,-baseth-lidThick/2-0.4]){            
            cylinder(r=1.2,h=lidThick+0.4);      
       }  
       translate([+dxofs,-dyofs,-baseth-lidThick/2-0.4]){            
            cylinder(r=1.2,h=lidThick+0.4);      
       }  
        translate([-dxofs,dyofs,-baseth-lidThick/2-0.4]){            
            cylinder(r=1.2,h=lidThick+0.4);      
       }  
       translate([+dxofs,dyofs,-baseth-lidThick/2-0.4]){            
            cylinder(r=1.2,h=lidThick+0.4);      
       }  
    }
    
  
}


module makebuttontopoutprescie(tx){
    
    translate([tx,0,lidThick+scrh-0.02]){
        translate([0,0,-baseth-lidThick/2-0.4]) cylinder(r=dbu/2,h=lidThick+0.4);
        translate([-(4.8-dtoppin/2),4.9-dtoppin/2,-baseth-0.2]) cube([dtoppin,dtoppin,lidThick+0.1],center=true);
        translate([+(4.8-dtoppin/2),4.9-dtoppin/2,-baseth-0.2]) cube([dtoppin,dtoppin,lidThick+0.1],center=true);
        translate([-(4.8-dtoppin/2),-4.9+dtoppin/2,-baseth-0.2]) cube([dtoppin,dtoppin,lidThick+0.1],center=true);
        translate([+(4.8-dtoppin/2),-4.9+dtoppin/2,-baseth-0.2]) cube([dtoppin,dtoppin,lidThick+0.1],center=true);
    }
}

module makebuttontopoutthin(tx){
    
    translate([tx,0,buth+2.6]){
        translate([0,0,-baseth-0.7]) cylinder(r=dbu/2,h=1.1);
        translate([-(4.8-dtoppin/2),4.9-dtoppin/2,-baseth-0.2]) cube([dtoppin,dtoppin,1],center=true);
        translate([+(4.8-dtoppin/2),4.9-dtoppin/2,-baseth-0.2]) cube([dtoppin,dtoppin,1],center=true);
        translate([-(4.8-dtoppin/2),-4.9+dtoppin/2,-baseth-0.2]) cube([dtoppin,dtoppin,1],center=true);
        translate([+(4.8-dtoppin/2),-4.9+dtoppin/2,-baseth-0.2]) cube([dtoppin,dtoppin,1],center=true);
    }
}



module makelid(){    
    innerW=51;
    outerW=57.2;
    innerLen=90;
   
    innerH=10;
    grooveW=2+0.1;
    grooveX=0.1;
    grooveOfs=1.1-grooveX/2;
    grooveThick=1.3+grooveX;
    
    translate([innerLen/2,-outerW/2,scrh/2+lidThick/2]) rotate([0,0,90]){   
        difference(){
            cube([outerW,innerLen,lidThick]);   
            translate([grooveOfs,0,-0.01])cube([grooveW,innerLen,grooveThick]);
            translate([outerW-grooveOfs-grooveW,0,-0.01])cube([grooveW,innerLen,grooveThick]);
        }
        //rightflap
        translate([0,innerLen-grooveThick,-innerH]){
            difference(){
                cube([outerW,lidThick,innerH+lidThick]);
                translate([grooveOfs,-0.01,0])cube([grooveW,grooveThick,innerH+grooveThick]);
                 translate([outerW-grooveOfs-grooveW,-0.01,0])cube([grooveW,grooveThick,innerH+grooveThick]);
            }
            
        }
    }
}