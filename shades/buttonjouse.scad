btn6r_pind=1.1; //0.8 
btn6r_pigap=5;//
btn6r_topth=1.5;
btn6r_twth=1.8;
btn6r_sockh=5;
btn6r_zpind=3.8; //3.5 org
btn6r_expind=1.8; //1.5org
btn6r_exr=7.4/2;
btn6r_od=12.4;//12
btn6r_id=9.5; //10
btn6r_edge=0.7;


    
    mboxh=45+10;
    mboxw=45;
    mboxwth=10;
    
tbd=4+0.2;
pbd=4-0.2;
tbw1=6.45;
tbw2=8.2;
tbg=3.8-0.2;
tbh=6.65;
zsni=0.05;
xsni=0.02;
ysni=xsni;
sockh=10;
bd=4;
sockxs=10;
sockys=10;

slotofs=36.5;
slotw=18;
sloth=4;


bpth=3; //baseplate thickness

*bplate();

//translate([0,0,20]) bpen();

*translate([0,0,20]){
    difference(){
        bplate();
        translate([-18.5,8,bpth/2-zsni/2]) cube([sockxs,sockys,bpth+zsni*2],center=true);
        translate([-18.5,-8,bpth/2-zsni/2]) cube([sockxs,sockys,bpth+zsni*2],center=true);
        translate([mboxh/2-slotofs,0,1]) cube([sloth,slotw,bd+1],center=true);
    }
}
//translate([-18.5,8,20]) bclosure();
//*translate([-18.5,-8,20]) bclosure();
//translate([-18.5,8,20]) btn6r_closure();


module btn6r_closure(){
      difference(){
           iw=sockxs-btn6r_twth*2;
           ih=sockys-btn6r_twth*2;
           translate([-sockxs/2,-sockys/2,0]) cube([sockxs,sockys,btn6r_sockh]);
          //back cutout
           translate([-iw/2,-ih/2,-btn6r_topth]) cube([iw,ih,btn6r_sockh]);
          //solderpins
           translate([-btn6r_pigap/2,-btn6r_pigap/2,sockh/2+zsni/2]) cube([btn6r_pind,btn6r_pind,btn6r_sockh+zsni*2],center=true);
          translate([-btn6r_pigap/2,+btn6r_pigap/2,sockh/2+zsni/2]) cube([btn6r_pind,btn6r_pind,btn6r_sockh+zsni*2],center=true);
           translate([+btn6r_pigap/2,+btn6r_pigap/2,sockh/2+zsni/2]) cube([btn6r_pind,btn6r_pind,btn6r_sockh+zsni*2],center=true);
           translate([+btn6r_pigap/2,-btn6r_pigap/2,sockh/2+zsni/2]) cube([btn6r_pind,btn6r_pind,btn6r_sockh+zsni*2],center=true);
          //plastic pins
           cylinder(d=btn6r_zpind,h=btn6r_sockh+zsni*2,$fn=64);
           translate([-btn6r_exr,0,-zsni+btn6r_sockh-btn6r_topth]) 
                cylinder(d=btn6r_expind,h=btn6r_topth+zsni*2,$fn=64);
          translate([btn6r_exr,0,-zsni+btn6r_sockh-btn6r_topth]) 
                cylinder(d=btn6r_expind,h=btn6r_topth+zsni*2,$fn=64);
           translate([0,0,-zsni+btn6r_sockh-btn6r_topth]) 
              ring(btn6r_id,btn6r_od,btn6r_topth+zsni*2);
           translate([-iw/2,btn6r_id/2-btn6r_edge-ysni,+btn6r_sockh-btn6r_topth-zsni]) 
              cube([iw,btn6r_edge+ysni*2,btn6r_topth+0.1]);
                
       }
}

module ring(id,od,h){
    difference(){
        cylinder(d=od,h=h,$fn=64);
        cylinder(d=id,h=h+0.01,$fn=128);
    }
}



module bplate(){

  
    tph=50;
    pcbz=-33;
    translate([0,0,bpth/2]) cube([mboxh,mboxw,bpth],center=true);
}

module bpen(){
   buozs=5;
   buzs=1;
   buxs=sockxs+2;
   buys=sockys+2;   
   pexh=1.2;
   ph=bd+pexh;
   bugap=0.6;
   union(){
        translate([0,0,ph*2+buzs/2]) cube([buxs,buys,buzs],center=true);        
        translate([0,0,ph*2-buozs/2]){
            difference(){
                cube([buxs,buys,buozs],center=true);
                translate([0,0,-0.01])
                   cube([sockxs+bugap,sockys+bugap,buozs],center=true);
            }
             
        }
        
   }
   translate([0,0,ph-0.5]) cylinder(d=pbd, h=ph+0.5,$fn=64);
   
   
}

module bclosure(){

       difference(){
           translate([-sockxs/2,-sockys/2,0]) cube([sockxs,sockys,sockh]);
           translate([0,0,0]) bsockcutout();           
       }
       
}

module bsockcutout(){
    pd=sockh-bd;
    
        difference(){
           cutw=(tbw2-tbw1)/2;
           translate([0,0,pd/2-zsni]) cube([tbw2,tbh,pd],center=true);
           translate([-tbw1/2-cutw/2-xsni*2,0,pd/2-zsni]) cube([cutw,tbg,pd+zsni*4],center=true);
           translate([tbw1/2+cutw/2+xsni*2,0,pd/2-zsni]) cube([cutw,tbg,pd+zsni*4],center=true);
        }
        
      translate([0,0,-zsni]) cylinder(d=tbd,h=sockh+zsni*2,$fn=64);
    
}


module makepole(){
   union(){
       for(i=[0:3]) {
              translate([0,0,-polezs[i]]) cylinder(d=poledias[i],h=poleheights[i],$fn=64);
       }
       translate([0,0,-polezs[1]]) cylinder(d2=poledias[1],d1=poledias[2],h=0.5,$fn=64);   
   }
}

module makepolecut(){
    union(){
        for(i=[0:3]) {
             translate([0,0,-polehzs[i]]) cylinder(d=polediasfc[i]+0.4,h=poleheightsfc[i]+0.02,$fn=64);                   
        }
   }
}

module makehousing(){
  //halfs for demo housing
  ehousel=housel/2;
  difference(){
    translate([0,-housed/2,-househ]) cube([ehousel,housed,househ]);
   translate([0,0,poleheights[0]+2]) makepolecut();
  }
}



housel=8;
househ=10;
housed=10;
housetoprth=2; //thickness of lid retenation plane

poleheights=[3,3,2,4];
poleheightsfc=[3,3,4,4]; //heights for plunger coutout
polezs=[poleheights[0],
        poleheights[0]+poleheights[1],
        poleheights[0]+poleheights[1]+poleheights[2],
        poleheights[0]+poleheights[1]+poleheights[2]+poleheights[3]
        ];
polehzs=[poleheightsfc[0],
        poleheightsfc[0]+poleheightsfc[1],
        poleheightsfc[0]+poleheightsfc[1]+poleheightsfc[2],
        poleheightsfc[0]+poleheightsfc[1]+poleheightsfc[2]+poleheightsfc[3]
        ];
poledias=[6,4,6,3];
polediasfc=[6,4,6,3.8];

*color("red") makepole();
#translate([0,0,-(polezs[1]-housetoprth)])  makehousing();

