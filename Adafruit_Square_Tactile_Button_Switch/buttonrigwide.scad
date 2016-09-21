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
b1x=0;
b2x=20;
b3x=-20;
width=20;//70

makebutton(b1x);
makebutton(b2x);
makebutton(b3x);

//upper lane
*difference(){
    translate([0,0,buth+topth/2]) cube([width,topdep,topth],center=true);    
    makebuttontopout(b1x);
    makebuttontopout(b2x);
    makebuttontopout(b3x);
}
//lower lane
difference(){
    union(){
        
        translate([0,0,-baseth/2-0.1]) cube([width,dep,baseth],center=true);        
        translate([0,-dep/2+0.5,-2.5]) cube([width,1,stth],center=true);
        translate([0,dep/2-0.5,-2.5]) cube([width,1,stth],center=true);
    }
    makebuttoncutout(b1x);
    makebuttoncutout(b2x);
    makebuttoncutout(b3x);
}


module makebutton(tx){
    *translate([45+tx,-85,0]) import ("pressed_adafruit_square_tactile_button_1010.stl",convexity=3);
}

module makebuttoncutout(tx){
    dxofs=dpindist/2-dpin/4;
    translate([tx,0,0]){
        translate([-dxofs,0,-baseth-0.2]) cylinder(r=dpin/2,h=baseth+0.2);
        translate([+dxofs,0,-baseth-0.2]) cylinder(r=dpin/2,h=baseth+0.2);
        
        //#translate([-5-2/2,0,-baseth-0.2]) cylinder(r=2/2,h=baseth+0.2);
    }
}

module makebuttontopout(tx){
    
    translate([tx,0,buth+2.6]){
        translate([0,0,-baseth-0.7]) cylinder(r=dbu/2,h=1.1);
        translate([-(4.8-dtoppin/2),4.9-dtoppin/2,-baseth-0.2]) cube([dtoppin,dtoppin,1],center=true);
        translate([+(4.8-dtoppin/2),4.9-dtoppin/2,-baseth-0.2]) cube([dtoppin,dtoppin,1],center=true);
        translate([-(4.8-dtoppin/2),-4.9+dtoppin/2,-baseth-0.2]) cube([dtoppin,dtoppin,1],center=true);
        translate([+(4.8-dtoppin/2),-4.9+dtoppin/2,-baseth-0.2]) cube([dtoppin,dtoppin,1],center=true);
    }
}