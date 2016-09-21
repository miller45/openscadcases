// core vars
total_w=118; //mm
box_p_row=3; //amount of boxes per ro
box_wall_th=0.8; // mm width of the boxes wall
box_wall_h=25; //mm height of outer box walls
box_bot_th=0.8; // mm thickness of bottom 
smidg=0.05;
corner_ofs=0.25;

//calcs
walls_p_row=box_p_row+1;
box_wall_total_th=box_wall_th*walls_p_row;
total_inner_w=total_w-box_wall_total_th;
box_iw=total_inner_w/box_p_row;
box_ow=box_iw+box_wall_th*2;
box_h=box_ow;
box_wall_ih=box_wall_h-box_bot_th;
box_ih=box_h-box_wall_th*2;


echo("<b>aaa</b>");
echo("total width",total_w);
echo("walls per row", walls_p_row);
echo("total inner width(boxes)",total_inner_w);
echo("<b>aaa</b>");

difference(){
	makeboxes();

	cutcorners();
}

module makeboxes(){
difference(){
   cube([total_w,box_h,box_wall_h]);  
	for(c=[0:box_p_row-1])
	{   
   	translate([c*(box_ow-box_wall_th)+box_wall_th,box_wall_th,box_bot_th+smidg])
		    cube([box_iw,box_ih,box_wall_ih]);	

	}
	
}
}
module cutcorners(){
   boxa=2;
   boxd=boxa*sqrt(2);
 
  	//left top
	translate([-boxd/4+corner_ofs,box_h+boxd/4-corner_ofs,box_wall_h/2])
		   rotate([0,0,45])
		   	cube([boxa,boxa,box_wall_h+1],center=true);

  	//right top
	translate([total_w+boxd/4-corner_ofs,box_h+boxd/4-corner_ofs,box_wall_h/2])
		   rotate([0,0,45])
		   	cube([boxa,boxa,box_wall_h+1],center=true);

  //left bottom
   translate([-boxd/4+corner_ofs,-boxd/4+corner_ofs,box_wall_h/2])
		 rotate([0,0,45])
			cube([boxa,boxa,box_wall_h+1],center=true);

   //right bottom
   translate([total_w+boxd/4-corner_ofs,-boxd/4+corner_ofs,box_wall_h/2])
		   rotate([0,0,45])
		   	cube([boxa,boxa,box_wall_h+1],center=true);

}