module bar(width, length, thickness){
    color("#F5F5F5")
    cube([width, length, thickness]);
}

module hole(height, radius=1.4) {
    $fn = 360;
    color("#FF0000")
    cylinder(height+0.2, radius, radius);
}


module slot(height, width, thickness) {
    h=height;
    r1=width-thickness;
    r2=r1;
    $fn=360;
 
    color("blue")
    difference(){
        cylinder(h, r1, r2, center=true);
        cylinder(h+1, r1-thickness, r2-thickness, center=true);
    }
}


//

module candle_wick_holder(
    width, 
    length,
    jar_radius,
    jar_radius_2,
    thickness) {
   
   difference(){
        bar(width, length, thickness);
        
       translate([width/2, length/4, -0.1])
            hole(thickness);
       
        translate([width/2, length/2, -0.1])
            hole(thickness);
       
        translate([width/2, 3*length/4, -0.1])
            hole(thickness);
       
        translate([width/2, length/2, -0.1])
            slot(thickness, jar_radius, thickness);
       
       translate([width/2, length/2, -0.1])
            slot(thickness, jar_radius_2, thickness);
   }
   
}



height = 3;
length = 80;
width = 20;
jar_radius = 20;
jar_radius_2 = 35;

translate([
    -1*(width/2), 
    -1*(length/2), 
    -1*(height/2)])
    candle_wick_holder(width, length, jar_radius, jar_radius_2, height);
