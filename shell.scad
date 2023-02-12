use <bcube.scad>

cr=1;
cres=360;

module column() {

bcube([14,16,10],cr,cres);
translate([0,-16.5,0])
    bcube([14,16,10],cr,cres);
translate([0,16.5,0])
    bcube([14,16,10],cr,cres);
}


module right_keys() {
translate([20,-13,0])
    rotate([0,0,10])
    union(){
    column(); //index 1
    translate([15,0,0])
        column(); //index 2
    translate([30,5,0])
        column(); //middle
    translate([45,0,0])
        column(); //ring
    translate([60,-10,0])
        column(); //pinky
    
    translate([7,-43,0])
        rotate([0,0,90])
        column(); //thumb
    }
}

//translate([0,65,7])
//    cube([198,7,7], center = true);

difference(){
    // Main body
    bcube([198,137,7],4,cres);
    translate([0,0,4])
        bcube([196,135,2],4,cres);
    translate([0,0,-1])
        bcube([196,135,6],4,cres);
    // Touchpad
    translate([0,35,0])
        bcube([62,34,10],cr,cres);
    // Touchpad Buttons
    translate([0,-44,0])
        bcube([44,7,10],2,cres);
    // On/Off
    translate([0,-25,0])
        cylinder(10,5.5,5.5);
    
    // Keys
    union() {
    right_keys();
        mirror([180,0,0])
            right_keys();
    }
    //swivel gap
    translate([0,67,0])
        rotate([0,0,90])
        bcube([14,55,10],cr,cres);
    
}
