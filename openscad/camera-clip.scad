// a simple and configurable clamp for using your iphone as
// continuity camera on your mac or some other screen
//
// note: OpenScad uses millimeter as its unit of measurement (!)
//
// safety note: use a fine-grained sand paper after printing to get 
// rid of all sharp edges left over from the board adhesion before 
// using the clamp to avoid scratches
//
// @author Marcus Handte (January 10th, 2023)

// settings for a macbook pro with a 13 inch screen
macScreenDepth = 3; // how far the clamp should reach into the screen 
                    // higher values are "safer" but look worse ;-)
                    // for a heavy iphone pro, 3 mm seems ok
macScreenThickness = 4; // how thick is your screen (at the top)
                        // just take a caliper and measure it 

// settings for an iphone 14 pro with an ultrathin arktis pro case
iPhoneDepth = 25; // how far the clamp should reach into the screen
                  // this is limited by the camera position, since
                  // you want the camera to reach over the mac screen
iPhoneThickness = 9.6; // how thick is your iphone (with your case)
                       // just take a caliper and measure it

// decoration (customize to your liking by setting to true or false)
roundDecorators = true;
logoDecorators = true;

// settings for the clamp, you probably do not need to configure this
clampWidth = 10; // the total width of the clamp
clampOffset = 20; // the offset of the round nob holding the phone
clampMaterial = 1.6; // the strength of the material (if you set it too
                     // high, it will not bend and might damage your phone)

/// settings for rendering, 100 angles is ok
$fn = 100;


difference() {

    union() {
        cube([clampWidth, 3 * clampMaterial + macScreenThickness + iPhoneThickness , iPhoneDepth], false);
    
        if (roundDecorators) {
  
            // round shapes at the top
            translate([0, 2 * clampMaterial + iPhoneThickness, iPhoneDepth - 3]) {
                rotate([0, 90, 0]) {
                    cylinder(h = clampWidth, r = clampMaterial + 2, center = false);
                }
            }

            translate([0, 2 * clampMaterial + macScreenThickness + iPhoneThickness, iPhoneDepth - 3]) {
                rotate([0, 90, 0]) {
                    cylinder(h = clampWidth, r = clampMaterial + 2, center = false);
                }
            }
        
        
            // round shapes at the bottom
            translate([0, clampMaterial, clampMaterial / 3]) {
                rotate([0, 90, 0]) {
                    cylinder(h = clampWidth, r = clampMaterial, center = false);
                }
            }

            translate([0, 1 * clampMaterial + iPhoneThickness, clampMaterial / 3]) {
                rotate([0, 90, 0]) {
                    cylinder(h = clampWidth, r = clampMaterial, center = false);
                }
            }
        }
    }

    // iphone cut out
    translate([-1, clampMaterial , clampMaterial]) {
        cube([clampWidth + 2, iPhoneThickness, iPhoneDepth], false);
    }

   
    // iphone stick shortener
    translate([-1, -1, clampOffset]) {
        cube([clampWidth + 2, clampMaterial + 2, iPhoneDepth], false);
    }
    
    // mac display cut out
    translate([-1, 2 * clampMaterial + iPhoneThickness, -clampMaterial]) {
        cube([clampWidth + 2, macScreenThickness, iPhoneDepth], false);
    }

    // mac display stick shortener
    translate([-1, 2 * clampMaterial + iPhoneThickness + macScreenThickness - 1, -clampMaterial - macScreenDepth]) {
        cube([clampWidth + 2, clampMaterial + 8, iPhoneDepth], false);
    }

    // limiter for round shapes at front
    translate([-1, 3 * clampMaterial + iPhoneThickness + macScreenThickness, 2]) {
        cube([clampWidth + 2, clampMaterial + 2, iPhoneDepth], false);
    }
}

// round nob at iphone stick
translate([0, clampMaterial / 2, clampOffset]) {
    rotate([0, 90, 0]) {
        cylinder(h = clampWidth, r = clampMaterial + 0.25, center = false);
    }
}

if (logoDecorators) {
    // camera logo at iphone stick
    translate([clampWidth/2 -6, 0.5, 2]) {
        rotate([90, 0, 0]) {
        linear_extrude(1)
        text("µ", 9, "Webdings");
        }
    }

    // display logo at mac stick
    translate([clampWidth/2 - 4.25, 2 * clampMaterial + iPhoneThickness + 0.5, 2]) {
        rotate([90, 0, 0]) {
        linear_extrude(1)
        text("¿", 7, "Webdings");
        }
    }
}



