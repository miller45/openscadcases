// Menger Sponge
// By Nathan Hellweg, May 13, 2013
// CC-BY-SA license

// Size of edge of sponge
D=100;
// Fractal depth (number of iterations)
n=3;

menger_sponge(side=D,maxlevel=n);

module menger_sponge (side=100,maxlevel=3) {
   difference() {
      cube(D,center=true);
      for (v=[[0,0,0], [0,0,90], [0,90,0]]) 
        rotate(v) sierpinski_neg(side=side,maxside=side,level=maxlevel);
   }
}

module sierpinski_neg(side=1,maxside=1,level=1) {
   l=side/3;
   cube([maxside*1.1,l,l],center=true);
   if(level > 1) {
      for (i=[-1:1], j=[-1:1]) if (i || j)
        translate([0,i*l,j*l]) 
            sierpinski_neg(side=l,maxside=maxside,level=level-1);
   }
}