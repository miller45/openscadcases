$fn=64;
d=19.5;
w=d+3;
h1=39;
h2=43;

h3a=9;
t3a=6;
h3b=51;
t3b=10;


//stutzvorne();
stutzhinten();

module stutzvorne(){
    difference(){
        union(){
           cube([w,w,h2]);
           translate([-2,-w/2,0]) cube([w*1.5,w*2,4]);
        }
        translate([w/2,w/2,h1])
           cylinder(d=d,h=h2-h1+0.01);        
    }
}

module stutzhinten(){    
    difference(){
        union(){
           cube([w,w,h2]);
           translate([0,-w/2,0]) 
                cube([w*1.5-2,w*2,4]);
        }
        translate([w/2,w/2,h1])
           cylinder(d=d,h=h2-h1+0.01);                
        translate([-0.01,-w/2-0.1,-0.01])
           cube([t3b,w*2+0.2,h3a]);
      
    }
}