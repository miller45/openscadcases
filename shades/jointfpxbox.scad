 include <dimlines.scad>;
 
 //prefix bo1==>board1
 bo1_th=22;
 bo1_h=35.2;
 bo1_w=31.7;
 bo1_pcbth=1.5;
 
 sc=0.5;
 teardropradius=1.8;
 drawdims=false;

module orgbaseplate(){
    smic=0.1;
    lph=6.072;//lower part height
    hph=11.41-lph;
    tph=lph+hph;
    difference(){ 
        union(){
            //lower part
            linear_extrude(height=lph,convexity=10)
          polygon( points=[ [9.3400,20.7320], [9.9440,20.4100], [10.4740,19.9740], [10.9100,19.4440], [11.2320,18.8400], [11.4320,18.1840], [11.5000,17.5000], [11.5000,13.3920], [13.2540,13.3920], [16.6720,13.3920], [27.9120,5.7540], [33.8920,5.7540], [33.8920,-5.7540], [27.9120,-5.7540], [16.6720,-13.3940], [13.2540,-13.3940], [11.5040,-13.3940], [11.5000,-17.5020], [11.4320,-18.1860], [11.2320,-18.8420], [10.9100,-19.4460], [10.4740,-19.9760], [9.9440,-20.4120], [9.3400,-20.7340], [8.6840,-20.9340], [7.9980,-21.0020], [7.3160,-20.9340], [6.6600,-20.7340], [6.0540,-20.4120], [5.5240,-19.9760], [5.0900,-19.4460], [4.7660,-18.8420], [4.5660,-18.1860], [-0.0020,-16.4380], [-2.5000,-12.1100], [2.4980,-12.1100], [4.9940,-11.6080], [7.5260,-9.6880], [9.6200,-7.8020], [10.8060,-5.7780], [11.7140,-3.0540], [12.2040,-0.0020], [11.7140,3.0540], [10.8060,5.7760], [9.6200,7.8000], [7.5260,9.6860], [4.9940,11.6060], [2.4980,12.1080], [-2.5000,12.1080], [-0.0020,16.4360], [4.5660,18.1840], [4.7660,18.8400], [5.0900,19.4440], [5.5240,19.9740], [6.0540,20.4100], [6.6600,20.7340], [7.3160,20.9320], [7.9980,21.0000], [8.6840,20.9320], [9.3400,20.7320]] );

            //upper two parts
            translate([0,0,lph]) linear_extrude(height=hph,convexity=10)
        polygon( points=[ [11.2320,-18.8420], [11.4320,-18.1860], [11.5000,-17.5020], [11.5040,-13.3940], [7.5260,-9.6880], [4.9940,-11.6080], [2.4980,-12.1100], [-2.5000,-12.1100], [-0.0020,-16.4380], [4.5660,-18.1860], [4.7660,-18.8420], [5.0900,-19.4460], [5.5240,-19.9760], [6.0540,-20.4120], [6.6600,-20.7340], [7.3160,-20.9340], [7.9980,-21.0020], [8.6840,-20.9340], [9.3400,-20.7340], [9.9440,-20.4120], [10.4740,-19.9760], [10.9100,-19.4460], [11.2320,-18.8420]] );
            
            translate([0,0,lph]) linear_extrude(height=hph,convexity=10) polygon( points=[ [9.3400,20.7320], [9.9440,20.4100], [10.4740,19.9740], [10.9100,19.4440], [11.2320,18.8400], [11.4320,18.1840], [11.5000,17.5000], [11.5040,13.3920], [4.9940,11.6060], [2.4980,12.1080], [-2.5000,12.1080], [-0.0020,16.4360], [4.5660,18.1840], [4.7660,18.8400], [5.0900,19.4440], [5.5240,19.9740], [6.0540,20.4100], [6.6600,20.7340], [7.3160,20.9320], [7.9980,21.0000], [8.6840,20.9320], [9.3400,20.7320]] );

        }
     //cutouts     
        
    //topcenter 
        translate([7.9993,17.5,-smic/2]) cylinder(d=4,h=tph+smic,$fn=64);
        translate([7.9993,-17.5,-smic/2]) cylinder(d=4,h=tph+smic,$fn=64);    
    }

    
    

}


module baseplate(){
    smic=0.1;
    lph=6.072;//lower part height
    hph=11.41-lph;
    tph=lph+hph;
    difference(){ 
        union(){
            //lower part
            linear_extrude(height=lph,convexity=10)
          polygon( points=[ [9.3400,20.7320], [9.9440,20.4100], [10.4740,19.9740], [10.9100,19.4440], [11.2320,18.8400], [11.4320,18.1840], [11.5000,17.5000], [11.5000,13.3920], [13.2540,13.3920], [16.6720,13.3920], [27.9120,5.7540], [33.8920,5.7540], [33.8920,-5.7540], [27.9120,-5.7540], [16.6720,-13.3940], [13.2540,-13.3940], [11.5040,-13.3940], [11.5000,-17.5020], [11.4320,-18.1860], [11.2320,-18.8420], [10.9100,-19.4460], [10.4740,-19.9760], [9.9440,-20.4120], [9.3400,-20.7340], [8.6840,-20.9340], [7.9980,-21.0020], [7.3160,-20.9340], [6.6600,-20.7340], [6.0540,-20.4120], [5.5240,-19.9760], [5.0900,-19.4460], [4.7660,-18.8420], [4.5660,-18.1860], [-0.0020,-16.4380], [-2.5000,-12.1100], [2.4980,-12.1100], [4.9940,-11.6080], [7.5260,-9.6880], [9.6200,-7.8020], [10.8060,-5.7780], [11.7140,-3.0540], [12.2040,-0.0020], [11.7140,3.0540], [10.8060,5.7760], [9.6200,7.8000], [7.5260,9.6860], [4.9940,11.6060], [2.4980,12.1080], [-2.5000,12.1080], [-0.0020,16.4360], [4.5660,18.1840], [4.7660,18.8400], [5.0900,19.4440], [5.5240,19.9740], [6.0540,20.4100], [6.6600,20.7340], [7.3160,20.9320], [7.9980,21.0000], [8.6840,20.9320], [9.3400,20.7320]] );

            //upper two parts
            translate([0,0,lph]) linear_extrude(height=hph,convexity=10)
        polygon( points=[ [11.2320,-18.8420], [11.4320,-18.1860], [11.5000,-17.5020], [11.5040,-13.3940], [7.5260,-9.6880], [4.9940,-11.6080], [2.4980,-12.1100], [-2.5000,-12.1100], [-0.0020,-16.4380], [4.5660,-18.1860], [4.7660,-18.8420], [5.0900,-19.4460], [5.5240,-19.9760], [6.0540,-20.4120], [6.6600,-20.7340], [7.3160,-20.9340], [7.9980,-21.0020], [8.6840,-20.9340], [9.3400,-20.7340], [9.9440,-20.4120], [10.4740,-19.9760], [10.9100,-19.4460], [11.2320,-18.8420]] );
            
            translate([0,0,lph]) linear_extrude(height=hph,convexity=10) polygon( points=[ [9.3400,20.7320], [9.9440,20.4100], [10.4740,19.9740], [10.9100,19.4440], [11.2320,18.8400], [11.4320,18.1840], [11.5000,17.5000], [11.5040,13.3920], [4.9940,11.6060], [2.4980,12.1080], [-2.5000,12.1080], [-0.0020,16.4360], [4.5660,18.1840], [4.7660,18.8400], [5.0900,19.4440], [5.5240,19.9740], [6.0540,20.4100], [6.6600,20.7340], [7.3160,20.9320], [7.9980,21.0000], [8.6840,20.9320], [9.3400,20.7320]] );

        }
        //cutouts     
        
        //topcenter 
        translate([7.9993,17.5,-smic/2]) cylinder(d=4,h=tph+smic,$fn=64);
        //botcenter
        translate([7.9993,-17.5,-smic/2]) cylinder(d=4,h=tph+smic,$fn=64);    
        //top back
        translate([30.8311,2.5734,-smic/2]) cylinder(d=3.4,h=tph+smic,$fn=64);
        translate([30.8311,-2.5734,-smic/2]) cylinder(d=3.4,h=tph+smic,$fn=64);
       
        //30.8311 -2.5734
        //bot back
        
    }

    
    

}

module lbox(w,d,h,sth=2,bth=2,wth=1){//w=width(x) d=depth(y) h=height(z)
    difference(){
        cube([w,d,h],center=true);
        ch=25;
        translate([-sth,0,-(ch/2+sth)]) cube([w-sth,d-wth,ch],center=true);
    }
    
     
}
flapd=2.5;
    flscrd=3.5;
module flaps(xo=33.9,yo=26.5,zo=50){
    flw=11;
    fld=flapd;
    flh=11;
    vh=32;
    vw=66;
    scrd=8;
    flscrd=3.5;
    flofs=24;
    cc=50;
    dcs=5; dch=20;
    sw=17;
    sh=8;
    
    bw=10;
    rl=vw-sw;
    slf=5.73/bw;


    rofs=116.240+(vw-96);
     union(){
        //flaps
        //top
       render()translate([xo-fld/2-1.15,-flw/2+yo,-6]){
           rotate([0,90,0]) difference(){
                cube([11,11.5,fld]);
                translate([5,5.5,-0.1]) cylinder(r1=flscrd/2*2,r2=flscrd/2,h=3,$fn=32);
                translate([6,5.5,-0.1]) cylinder(r1=flscrd/2*2,r2=flscrd/2,h=3,$fn=32);
          }
        }
        //bot
         render()translate([xo-fld/2-1.15,-flw/2-yo-0.5,-6]){
           rotate([0,90,0]) difference(){
                cube([11,11.5,fld]);
                translate([5,5.5,-0.1])cylinder(r1=flscrd/2*2,r2=flscrd/2,h=3,$fn=32);
                translate([6,5.5,-0.1])cylinder(r1=flscrd/2*2,r2=flscrd/2,h=3,$fn=32);
          }
        }
        
            
        
          //right
        render()translate([xo-fld+0.1,-flw/2,-zo]){
          rotate([0,90,0]) difference(){
                cube([11,11.5,fld]);
                translate([5.5,5.5,-0.1])cylinder(r1=flscrd/2*2,r2=flscrd/2,h=3,$fn=32);
          }
        }
        
    }
}
mboxw=36;
mboxh=44;
mboxwth=10;
tph=50;
pcbz=-33;
module mbox(){
    
    translate([0,0,(50-tph)/2]){
         smic=0.1;
         sflx=7.9993;
         sfly=17.5;
          scid=3.4;
          scod=6.5; 
          rph=3;
          motord=28;
          fld=9;
          flw=18;
          dfld=7.2;
          
        
            difference(){
                translate([+33.89-(mboxw/2),0,-50/2]) lbox(mboxw,mboxh,tph,sth=2,wth=mboxwth);
                union(){
                    translate([sflx,0,-20-smic/2]) cylinder(d=motord+1,h=20+smic,$fn=64);
                    translate([-2.5,0,smic/2-12.7/2-dfld/2]) 
                        cube([(motord+1)/2,motord,13+smic+dfld],center=true);
                }
                    
                translate([sflx+motord/2+fld/2-2.67,0,smic/2-10-dfld/2]) 
                    cube([fld,flw,20+smic+dfld],center=true);
                translate([motord/2+fld/2+6.89,0,smic/2-10-dfld/2-20]) 
                    cube([fld,flw,20+smic+dfld],center=true);
             
                //w18 d=6 xd=31 d=28
                
                translate([sflx,sfly,-rph-smic/2]) cylinder(d=scid,h=rph+smic,$fn=64);
                translate([sflx,-sfly,-rph-smic/2]) cylinder(d=scid,h=rph+smic,$fn=64);
                translate([sflx,sfly,-smic/2-tph-rph]) cylinder(d=scod,h=tph+smic,$fn=64);
                translate([sflx,-sfly,-smic/2-tph-rph]) cylinder(d=scod,h=tph+smic,$fn=64);
                dx=5;
                translate([15-dx/2,0,pcbz])
                        cube([bo1_w+dx,bo1_h+1.5,bo1_pcbth+0.2],center=true);
                  //top back
                translate([30.8311,2.5734,-9.9]) cylinder(d=2.5,h=10,$fn=64);
                translate([30.8311,-2.5734,-9.9]) cylinder(d=2.5,h=10,$fn=64);
                        
            }
            
        
            
        flaps(xo=33.8,yo=27.5);
        

    }
}

module xbox(){
    shri=0.15;
    zs=50;
    xboxtph0=10;
    xboxtph1=50;
    
    
    translate([+33.89-(mboxw/2),0,-zs/2+5-((xboxtph1-50)/2)])
    {
        difference(){
            union() 
            {
                translate([-mboxwth/8,0,xboxtph1/2+xboxtph0/2]){
                    stdbox(mboxw-mboxwth/4,mboxh-mboxwth-shri,xboxtph0);               
                }
                //mid
                difference(){
                    stdbox(mboxw,mboxh,xboxtph1); //2.para=> -mboxwth-shri
                    translate([mboxw/2-flapd/2,0.25,xboxtph1/2-11/2])            
                    {
                        rotate([0,90,0])             
                            difference(){
                            cube([11+shri,11.5,flapd+shri],center=true);
                                translate([0,0,-0.1-flapd/2]){
                                    difference(){
                                        cylinder(r1=flscrd/2*2-shri,r2=flscrd/2-shri,h=3,$fn=32);
                                        translate([0,0,-2]) cylinder(r=flscrd/2,h=10,$fn=32);
                                    }
                                    
                                    
                                }
                        }
                    }
                    translate([10,0.2,xboxtph1/2-5.5]) rotate([0,90,0]) {
                        cylinder(r=flscrd/2,h=10,$fn=32);                        
                    }
                    translate([12.99,0.2,xboxtph1/2-5.5]) rotate([0,90,0]) {
                        cylinder(r1=flscrd/2*2-shri,r2=flscrd/2-shri,h=3,$fn=32);
                    }
                    //cylinder(r1=flscrd/2*2-shri,r2=flscrd/2-shri,h=3,$fn=32);
                      //
                   // #flaps(xo=17.91,yo=27.5,zo=-50/2-11/2);
                }
                 
          }//union
          translate([-mboxwth+5,0,+xboxtph0/2+shri/2]) stdbox(mboxw,mboxh-15,xboxtph1+xboxtph0+shri*2);
          //bottom teeth
          translate([-mboxw/2-shri,mboxh/2-mboxwth/3,-xboxtph1/2+3])  toothcut();
          translate([-mboxw/2-shri,-mboxh/2+mboxwth/3,-xboxtph1/2+3])  toothcut();
      }//diff
  }
     
}

module toothcut(shrink=1,l=mboxh){
    union(){
       td=3;
       rotate([0,90,0]) cylinder(d=td*shrink,h=l,$fn=64);
       translate([l/2,0,-td*0.6]) cube([l,td*0.6*shrink,3],center=true);       
    }
}

module stdbox(w,d,h,cw=0,cd=0,ch=0){
    translate([cw*w/2,cd*d/2,ch*h/2])
       cube([w,d,h],center=true);
}

module botlida(){
      shri=0.15;
    zs=10;
    xboxtph0=0;
    xboxtph1=50;
    bod=5;
    translate([+33.89-(mboxw/2),0,-zs/2+12.4])
    {
        union(){
            stdbox(mboxw,mboxh,bod);
            translate([-mboxw/2-shri,-mboxh/2+mboxwth/3,bod+0.6])  toothcut(0.95,36.2);
            translate([-mboxw/2-shri,mboxh/2-mboxwth/3,bod+0.6])  toothcut(0.95,36.2);
           translate([-10.4,0,0]){ // color("red")
                difference(){
                    stdbox(15,21.5,8,0,0,1);
                    translate([1.01,0,0]) stdbox(13+1.01,18.5,8.1,0,0,1);
                    //stdbox(
                }
                translate([15/2,0,0]) stdbox(1.5,11.5,2.7,-1,0,1);
            }
        }
    }
    
    //socket 13 tief 18.5 breit 8 hoch zunge 10breit
}

module botlidb(){
      shri=0.15;
    zs=10;
    xboxtph0=0;
    xboxtph1=50;
    bod=5;
    translate([+33.89-(mboxw/2),0,-zs/2+12.4])
    {
        union(){
           difference(){
               stdbox(mboxw,mboxh,bod);
               translate([-mboxw/2-shri,-mboxh/2+mboxwth/3,0])  toothcut(1,36.2);
               translate([-mboxw/2-shri,mboxh/2-mboxwth/3,0])  toothcut(1,36.2);
               translate([2,mboxh/2-9,0]) stdbox(mboxw-10,2.8,bod+0.1);
           }
           translate([-mboxw/2-shri,-mboxh/2+mboxwth/3,bod+0.6])  toothcut(0.92,36.2);
           translate([-mboxw/2-shri,mboxh/2-mboxwth/3,bod+0.6])  toothcut(0.92,36.2);
           translate([-10.4,0,0]){ // color("red")
                difference(){
                    stdbox(15,21.5,8,0,0,1);
                    translate([1.01,0,0]) stdbox(13+1.01,18.5,8.1,0,0,1);
                    
                }
               //doenst fit any moretranslate([15/2,0,0]) stdbox(1.5,11.5,2.7,-1,0,1);
            }
        }
    }
    
    //socket 13 tief 18.5 breit 8 hoch zunge 10breit
}

module botlidc(){
      shri=0.15;
    zs=10;
    xboxtph0=0;
    xboxtph1=50;
    bod=5;
    translate([+33.89-(mboxw/2),0,-zs/2+12.4])
    {
        union(){
           difference(){
               stdbox(mboxw,mboxh,bod);
               translate([-mboxw/2-shri,-mboxh/2+mboxwth/3,0])  toothcut(1,36.2);
               translate([-mboxw/2-shri,mboxh/2-mboxwth/3,0])  toothcut(1,36.2);
               translate([2,mboxh/2-9,0]) stdbox(mboxw-10,2.8,bod+0.1);
           }
           translate([-mboxw/2-shri,-mboxh/2+mboxwth/3,bod+0.6])  toothcut(0.92,36.2);
           translate([-mboxw/2-shri,mboxh/2-mboxwth/3,bod+0.6])  toothcut(0.92,36.2);
           translate([-10.4,0,0]){ // color("red")
                difference(){
                    stdbox(15,21.5,8,0,0,1);
                    translate([1.01,0,0]) stdbox(13+1.01,22,8.1,0,0,1);
                    
                }
               //doenst fit any moretranslate([15/2,0,0]) stdbox(1.5,11.5,2.7,-1,0,1);
            }
        }
    }
    
    //socket 13 tief 18.5 breit 8 hoch zunge 10breit
}


module abox(){
    shri=0.15;
    zs=50;
    xboxtph0=10;
    xboxtph1=50;
    
    
    translate([+33.89-(mboxw/2),0,-zs/2+5-((xboxtph1-50)/2)])
    {
        translate([-mboxw/2,-mboxh/2+mboxwth/3,xboxtph1/2+2.6])  toothcut(0.92,36);
          
        translate([-mboxw/2,mboxh/2-mboxwth/3,xboxtph1/2+2.6])  toothcut(0.92,36);
        difference(){
            union() 
            {                
                //mid
                difference(){
                    stdbox(mboxw,mboxh,xboxtph1); //2.para=> -mboxwth-shri                    
                }
                 
          }//union
          translate([-mboxwth+5,0,+xboxtph0/2+shri/2]) stdbox(mboxw,mboxh-15,xboxtph1+xboxtph0+shri*2);
          //bottom teeth
          translate([-mboxw/2-shri,mboxh/2-mboxwth/3,-xboxtph1/2+3])  toothcut();
          translate([-mboxw/2-shri,-mboxh/2+mboxwth/3,-xboxtph1/2+3])  toothcut();
      }//diff
  }
     
}
module bplate(){
    mboxh=45+10;
mboxw=45;
mboxwth=10;
    bpth=3;
tph=50;
pcbz=-33;
    translate([-mboxh/2,0,bpth/2]) cube([mboxh,mboxw,bpth],center=true);
}
   

if(drawdims){
    //outer circle d=23.5
     translate([-20,0,0]) rotate([0,-90,0]) color("black") dimensions(60*sc, 0.25);
     translate([-18,0,0]) rotate([0,-90,0]) color("black") dimensions(25*sc, 0.25);
    translate([-16,0,0]) rotate([0,-90,0]) color("black") dimensions(2*sc, 0.25);
}
        


//baseplate

*translate([0,0,0]){ 
    color("red") render() baseplate();
    
    //cylinder(d=24.096967205522283, h=6.072);
};

*translate([0,0,-1]) mbox();

*translate([0,0,-(1+tph+tph/2-20)-15]) abox();

translate([0,0,-(1+tph+tph/2-20)-70]) botlidc();
*translate([-6,0,-(1+tph+tph/2-43)-88]) rotate([0,90,0]) bplate();