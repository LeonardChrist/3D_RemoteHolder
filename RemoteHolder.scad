remoteDimensions = [45, 26, 170] * 1.1;
wallThickness = 2;

includeScrewholes = false;
screwholeDiameter = 5;

$fn = 64;

holderDimensions = [remoteDimensions[0] + wallThickness * 2, remoteDimensions[1] + wallThickness * 2, remoteDimensions[2] / 3 + wallThickness];
materialSaverScale = 0.6;


difference()
{
    cube(holderDimensions);

    translate([wallThickness, wallThickness, wallThickness])
        cube(remoteDimensions);

    translate([(holderDimensions[0] - (holderDimensions[0] * materialSaverScale)) / 2, 0, wallThickness])
        cube([holderDimensions[0] * materialSaverScale, wallThickness, holderDimensions[2]]);

    if(includeScrewholes)
        translate([holderDimensions[0] / 2, holderDimensions[1] - wallThickness, holderDimensions[2] / 3 * 2])
            rotate([-90, 0, 0])
                cylinder(d = screwholeDiameter, h = wallThickness);
}