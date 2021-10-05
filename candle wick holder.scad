use <threads.scad>  ;

module bar(width, length, thickness){
    color("#F5F5F5")
    cube([width, length, thickness]);
}

module wick_hole(height, radius=1.4) {
    $fn = 360;
    color("#FF0000")
    translate([-3, 0, 0])
    cylinder(height+0.2, radius, radius);

    translate([0, 0, 0])
        cylinder(height+0.2, 0.5, 0.5);

    translate([-2.5, -0.5, 0])
        cube([2.4, 1., height+0.2]);
}


module jar_groove(width, thickness) {
    $fn=360;
 
    translate([0, 0, 0])
        color("red")
        metric_thread(
            diameter=width, 
            pitch=2.6, 
            length=thickness,
            thread_size=5.90
       );
}

module candle_wick_holder(width, length, jar_radius, thickness, hole_thickness) {
   
   difference(){
        bar(width, length, thickness);
        
       translate([width/2, (length/2) - 10, -0.1])
            wick_hole(thickness);
       
        translate([width/2, length/2, -0.1])
            wick_hole(thickness);
       
        translate([width/2, (length/2) + 10, -0.1])
            wick_hole(thickness);
       
       translate([width/2, length/2, -0.1])
            jar_groove(jar_radius, 5);
   }
   
   
   
}


//translate([0, 0, -20])
//jar_groove(jar_radius, 5);


///

height = 8;
length = 80;
width = 20;
jar_radius = 67.5;

translate([
    -1*(width/2), 
    -1*(length/2), 
    -1*(height/2)])
    candle_wick_holder(width, length,jar_radius, height);


