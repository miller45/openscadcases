rail_bottomwidth=1.6;
rail_topwidth=1.2;

bolenheight=1.49;
bolenwidth=4;
bolenlen=20.9;
lowergap=13.9;

rails(lowergap);
bolen(12);

module rails(lowergap,raillen){
    translate([0,0,0])
        rail(raillen);
    translate([lowergap+rail_bottomwidth/2#,0,0])
        rail(raillen);
}
module bolen(amount){   
    xf=4;
    bolofs=(bolenlen-lowergap)/2-rail_bottomwidth;
    translate([-bolofs,-bolenheight,4.6]){
        for(i=[0:(amount/xf)-1]){
            echo(i);
            translate([0,0,i*bolenwidth*2*xf])
                cube([bolenlen,bolenheight,bolenwidth]);
        }
        
    }
}

module rail(raillen){
    height=2.41;
    baseheight=bolenheight;
    topwidth=rail_topwidth;
    topscri=0.12;
    topof=0.1;
    bottomwidth=rail_bottomwidth;
    topleftx=(bottomwidth-topwidth)/2;
    toprightx=topleftx+topwidth;
    //polygon([[0,0],[bottomwidth,0],[toprightx,height],[topleftx,height]]);
    linear_extrude(height=raillen)
    polygon([
        [0,-baseheight],[bottomwidth,-baseheight],[bottomwidth,0],
        [toprightx,height-topof], [toprightx-topscri,height],     
        [topleftx+topscri,height], [topleftx,height-topof],
        [0,0]
    ]);
}