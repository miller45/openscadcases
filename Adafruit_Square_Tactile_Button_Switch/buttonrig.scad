$fn=32;
dpin=1.5;
dep=7;
baseth=2;
stth=1;

makebutton(0);
makebutton(20);
makebutton(-20);
difference(){
    union(){
        translate([0,0,-baseth/2-0.1]) cube([70,dep,baseth],center=true);    
        translate([0,-dep/2+0.5,-2.5]) cube([70,1,stth],center=true);
        translate([0,dep/2-0.5,-2.5]) cube([70,1,stth],center=true);
    }
    makebuttoncutout(0);
    makebuttoncutout(20);
    makebuttoncutout(-20);
}


module makebutton(tx){
    %translate([45+tx,-85,0]) import ("pressed_adafruit_square_tactile_button_1010.stl",convexity=3);
}

module makebuttoncutout(tx){
    translate([tx,0,0]){
        translate([-(5.7-dpin/2),0,-baseth-0.2]) cylinder(r=dpin/2,h=baseth+0.2);
        translate([+(5.7-dpin/2),0,-baseth-0.2]) cylinder(r=dpin/2,h=baseth+0.2);
    }
}