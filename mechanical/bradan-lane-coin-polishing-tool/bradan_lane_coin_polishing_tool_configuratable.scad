/*
    Parameterized cylindrical holder / shroud body

    Design by bradanlane
    https://gitlab.com/bradanlane
    https://gitlab.com/bradanlane/fiber_laser_coins
    License: MIT
    https://gitlab.com/bradanlane/fiber_laser_coins/-/blob/main/LICENSE

    Polishing workflow reference (buffing section):
    https://gitlab.com/bradanlane/fiber_laser_coins/-/blob/main/polishing.md

    Units:
    ------
    OpenSCAD does not enforce units automatically.
    This file is designed in millimeters.

    Example:
    45 = 45 mm
    3  = 3 mm

    OpenSCAD preview note:
    ---------------------
    Because this model uses configurable 2D profile geometry for the bottom
    edge treatment, the fast preview may occasionally display incomplete or
    incorrect geometry. If the model looks wrong in preview, use a full render
    before assuming the geometry is broken.    

*/

$fn = 192;  // Circle smoothness. Higher values look smoother but render slower.


// ==================================================
// USER PARAMETERS
// ==================================================

// Total vertical height of the complete part.
overall_height = 45;


// ---------- Coin / top recess ----------

// Actual coin/object diameter.
coin_dia = 44;

// Extra clearance added to the coin pocket diameter.
// Example: 0.25 means a 44 mm coin gets a 44.25 mm pocket.
coin_pocket_clearance = 0.25;

// Depth of the top recess measured downward from the top face.
coin_recess_depth = 2;

// ---------- Diameter offsets ----------

// The main through-hole diameter is:
// coin_recess_dia - inner_dia_offset
//
// Example:
// 44 mm coin recess - 6 mm offset = 38 mm through-hole.
inner_dia_offset = 6;

// The top outside diameter is:
// coin_recess_dia + top_outer_dia_offset
//
// Example:
// 44 mm coin recess + 2 mm offset = 46 mm top outside edge.
top_outer_dia_offset = 2;


// ---------- Upper outside chamfer ----------

// Vertical height of the upper outside chamfer.
// This chamfer starts at the top outside edge and expands outward as it goes down.
chamfer_height = 5;

// Angle of the upper outside chamfer in degrees.
// At 45 degrees, the body grows outward 1 mm for every 1 mm of vertical drop.
chamfer_angle = 45;


// ---------- Bottom edge treatment ----------

// Choose the bottom outside edge style:
//
// "none"    = sharp square bottom edge
// "fillet"  = rounded bottom outside edge
// "chamfer" = angled bottom outside edge
bottom_edge_style = "fillet";

// Vertical height of the bottom chamfer, in mm.
// Only used when bottom_edge_style = "chamfer".
bottom_chamfer_height = 3;

// Angle of the bottom chamfer, in degrees.
// Only used when bottom_edge_style = "chamfer".
bottom_chamfer_angle = 45;


// ---------- Finger indexing cutouts ----------

// Diameter of the vertical cylinders used to cut the two mirrored finger scallops.
// Larger values create wider, shallower-feeling finger indexing cuts.
finger_cut_dia = 36;


// ==================================================
// DERIVED DIMENSIONS
// These are calculated automatically from the parameters above.
// You usually should not edit these directly.
// ==================================================

// Diameter of the top recess/pocket.
// Matches Fusion 360 style formula:
// coin_recess_dia = coin_dia + coin_pocket_clearance
coin_recess_dia = coin_dia + coin_pocket_clearance;

// Main center through-hole diameter.
inner_dia = coin_recess_dia - inner_dia_offset;

// Outside diameter at the very top edge of the part.
top_outer_dia = coin_recess_dia + top_outer_dia_offset;

// Radial growth caused by the upper chamfer on one side.
top_chamfer_radial_change = chamfer_height / tan(chamfer_angle);

// Largest outside diameter of the body.
// This occurs below the upper chamfer and continues down to the bottom edge.
body_outer_d = top_outer_dia + top_chamfer_radial_change * 2;

// Radius versions of the key diameters.
body_outer_r = body_outer_d / 2;
top_outer_r  = top_outer_dia / 2;

// Automatically calculated bottom fillet radius.
// Matches Fusion 360 formula:
//
// body_outer_radius - (coin_recess_dia - inner_dia_offset) / 2
//
// Since inner_dia = coin_recess_dia - inner_dia_offset,
// this is equivalent to:
//
// body_outer_r - inner_dia / 2
bottom_fillet_radius = body_outer_r - inner_dia / 2;

// Radial reduction at the bottom caused by the bottom chamfer.
// Only affects the model when bottom_edge_style = "chamfer".
bottom_chamfer_radial_change =
    bottom_chamfer_height / tan(bottom_chamfer_angle);

// Radius of the finger scallop cutter.
finger_cut_radius = finger_cut_dia / 2;

// Positions the vertical finger cut cylinder.
//
// The cut cylinder is placed so its inner tangent just touches
// the top outside diameter circle. This keeps the finger cutout
// related to the top edge, even when finger_cut_dia changes.
finger_cut_offset = top_outer_r + finger_cut_radius;


// ==================================================
// MODEL
// ==================================================

difference() {
    // Solid outer body, including upper chamfer and optional bottom treatment.
    outer_body();

    // Main hollow center through the entire part.
    translate([0, 0, -0.1])
        cylinder(h = overall_height + 0.2, d = inner_dia);

    // Top coin/object recess.
    translate([0, 0, overall_height - coin_recess_depth])
        cylinder(h = coin_recess_depth + 0.3, d = coin_recess_dia);

    // Two mirrored vertical finger indexing scallops on opposite sides.
    finger_index_cutouts();
}


// ==================================================
// MODULES
// ==================================================

module outer_body() {
    /*
        Builds the outside body by rotating a 2D side profile around the Z axis.
        This makes it easy to control the upper chamfer and bottom edge shape.
    */
    rotate_extrude()
        outer_body_profile();
}

module outer_body_profile() {
    /*
        2D side profile of the outside body.

        Points are written as:
        [radius_from_center, height_above_bottom]

        Only the bottom outside edge changes based on bottom_edge_style.
        The top chamfer and finger cutout are not changed by this setting.
    */

    if (bottom_edge_style == "fillet") {
        polygon(points = concat(
            [
                // Center bottom to start of bottom fillet.
                [0, 0],
                [body_outer_r - bottom_fillet_radius, 0]
            ],

            bottom_fillet_points(),

            [
                // Straight outer wall after bottom fillet.
                [body_outer_r, overall_height - chamfer_height],

                // Upper chamfer slopes inward to the top edge.
                [top_outer_r, overall_height],

                // Close the top face back to center.
                [0, overall_height]
            ]
        ));

    } else if (bottom_edge_style == "chamfer") {
        polygon(points = [
            // Center bottom.
            [0, 0],

            // Bottom face ends before full body radius.
            [body_outer_r - bottom_chamfer_radial_change, 0],

            // Bottom chamfer rises outward to full body radius.
            [body_outer_r, bottom_chamfer_height],

            // Straight outer wall.
            [body_outer_r, overall_height - chamfer_height],

            // Upper chamfer slopes inward to the top edge.
            [top_outer_r, overall_height],

            // Close the top face back to center.
            [0, overall_height]
        ]);

    } else {
        // No bottom treatment: sharp square lower edge.
        polygon(points = [
            [0, 0],
            [body_outer_r, 0],
            [body_outer_r, overall_height - chamfer_height],
            [top_outer_r, overall_height],
            [0, overall_height]
        ]);
    }
}

function bottom_fillet_points(steps = 16) = [
    /*
        Creates a quarter-circle arc only at the bottom outside edge.

        More steps = smoother fillet but slower render.
        This does not round the top edge or the upper chamfer.
    */
    for (i = [0 : steps])
        let (
            angle = 270 + (90 * i / steps),
            r = bottom_fillet_radius,
            center_x = body_outer_r - r,
            center_z = r
        )
        [
            center_x + r * cos(angle),
            center_z + r * sin(angle)
        ]
];

module finger_index_cutouts() {
    /*
        Two vertical cylinders placed on opposite sides of the body.

        Subtracting these cylinders creates two perfectly mirrored
        crescent/scallop-shaped cuts in the outer wall.
    */

    // Front / negative Y side
    translate([0, -finger_cut_offset, -0.1])
        cylinder(
            h = overall_height + 0.2,
            d = finger_cut_dia
        );

    // Back / positive Y side
    translate([0, finger_cut_offset, -0.1])
        cylinder(
            h = overall_height + 0.2,
            d = finger_cut_dia
        );
}