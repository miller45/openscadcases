$fn=64;
w=60;
l=18.5;
h=15;
d=13;

difference(){
    cube([w,l,h]);
    #translate([w/2,+d/2,-0.05])
       cylinder(d=d,h=h+0.1);
    #translate([w/2,+d/2-0.6,-0.05])
       cylinder(d=d,h=h+0.1);
}
