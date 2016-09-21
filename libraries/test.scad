include <morphology.scad>;

module shape() {
    polygon([[0,0],[1,0],[1.5,1],[2.5,1],[2,-1],[0,-1]]);
}
$fn=32;


shell(d=0.3) scale([2,2,2]) shape();