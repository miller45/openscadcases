// core vars

h=10; 
b=60;
t=25;
wt=0.5;
brt=4;
toplid=false;
box();

module box(){

	union(){
      if(toplid){
			translate([0,0,h/2+wt/2-0.01]){
				difference(){
			   	cube([b,t,wt],center=true);
				   cube([b-brt,t-brt*2,wt+0.1],center=true);
				}
			}
		}


		difference(){
		   cube([b,t,h],center=true);
		 
			translate([0,0,wt+0.01])
					cube([b-wt*2,t-wt*2,h-wt*2],center=true);

		}
	}
}



