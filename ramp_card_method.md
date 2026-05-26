# Ramp Card Focus Calibration Procedure

This procedure describes how to use a ramp card focus test to determine the true focal distance for a fiber laser lens. The process is software-agnostic and can be used with EZCAD, LightBurn, or other laser marking software capable of importing the calibration artwork and applying a hatch/fill pattern.

## Referenced Files

### Fatlab Designs Focus Tools

The Fatlab Designs focus height calibration card and ramp stand files were created by Fatlab Designs and are included courtesy of:

    http://fatlabdesigns.com/

These files were made available by the creator through laser community groups. To the best of my knowledge, they are not currently hosted on the Fatlab Designs website. Attribution is provided here based on the creator name.

- [Fatlab Designs Focus Height Calibration Ramp Card SVG](mechanical/fatlab-designs-focus-tools/fatlab_designs_focus_height_calibration_ramp_card.svg)
- [Fatlab Designs Focus Height Calibration Ramp Left Leg STL](mechanical/fatlab-designs-focus-tools/fatlab_designs_focus_height_calibration_ramp_left.stl)
- [Fatlab Designs Focus Height Calibration Ramp Right Leg STL](mechanical/fatlab-designs-focus-tools/fatlab_designs_focus_height_calibration_ramp_right.stl)

### Ramp Card Jig

The ramp card jig is my own design and is licensed separately under the Creative Commons Attribution 4.0 International License, as included in the ZIP file.

- [Ramp Card Jig ZIP](mechanical/ramp-card-jig/ramp_card_jig.zip)

## Required Materials

- Fatlab Designs ramp card SVG calibration artwork
- Either:
  - Fatlab Designs ramp stand left and right STL files, or
  - Ramp card jig
- Standard black aluminum business cards
  - Typical size: 54 mm x 86 mm x 0.4 mm
- Fiber laser with the lens being calibrated installed
- Laser marking software capable of importing SVG artwork and applying hatch/fill settings
- Calipers, focus stick, or another reliable method for recording the resulting focal distance

## Purpose

A ramp card test helps identify the true focal point of a laser lens by placing the test card at a known angle relative to the laser beam. As the laser marks across the angled card, different portions of the card pass through the focal plane.

The goal is to determine where the laser is most tightly focused by comparing the marked hatch band against the fixed center reference line in the calibration artwork.

This process should be repeated separately for each lens.

## Important Focus Height Offset

The ramp card process identifies the focus position at the midpoint of the angled card.

Because the card sits at a 45-degree angle, that midpoint is 30 mm above the laser bed. This is consistent with the SVG calibration artwork, which includes a defined vector center line positioned precisely at the midpoint of the card.

Because of that, the actual focus position at the bed is 30 mm lower than the position determined during this test.

In other words:

    Ramp card midpoint focus position = focus at 30 mm above the bed
    Actual bed-level focus position = ramp card midpoint focus position minus 30 mm

When recording the result, be clear whether the measurement represents the ramp card midpoint focus position or the adjusted bed-level focus position.

## Important Concept

The ramp card includes a fixed center reference line and a hatched test area.

When the test is run, the hatch marks will shift relative to the fixed center line depending on the focus height.

This can feel counterintuitive:

- If the center of the hatched lines is **below** the fixed center line, the focus position needs to come **up**.
- If the center of the hatched lines is **above** the fixed center line, the focus position needs to go **down**.

Adjusting the focus height moves the position of the hatched lines relative to the fixed center line. The fixed center line does not move.

## Preparing the Artwork

Import the SVG calibration card into your laser marking software.

Only the center rectangle should be hatched or filled. Do not hatch the rest of the card.

Recommended hatch settings:

    Hatch angle: 90 degrees
    Line spacing: 0.5 mm to 1.0 mm

A wide hatch is preferred. The purpose of the test is not to engrave a solid filled area, but to make the focal band easy to see.

The remaining lines in the SVG should be marked as vector lines only.

## Preparing the Ramp

Place a black aluminum business card into the ramp or jig.

The card should be seated consistently each time. Any change in card position can affect the apparent result.

For best repeatability, the ramp or jig should be fixed to the laser bed. My ramp card jig is designed to bolt to the bed with the center of the ramp aligned to the laser's home position.

Position the center of the ramp directly under the laser.

## Running the Test

Use low power for the ramp card test.

On my 100 W MOPA fiber laser, I usually start around:

    Power: 10%

This is only a starting point to find the visible range. As focus is fine-tuned, lower power may make it easier to identify where the fixed center line falls relative to the hatched band.

The laser should not engrave the entire card clearly when it is out of focus. That is expected and useful. The goal is to identify the area where the mark is sharpest and most visible.

Run the test and inspect the relationship between the hatched band and the fixed center line.

## Reading the Result

Compare the center of the hatched lines to the fixed center reference line.

    Hatched band below center line = raise the focus position
    Hatched band above center line = lower the focus position

Adjust the galvo/lens height and repeat the test until the fixed center line falls as close as possible to the center of the hatched band.

The goal is to make the hatched band centered on the fixed center line.

## Recording the Focus Position

Once the hatch band is centered on the fixed center line, record the focus position.

This position represents the true focal distance at the midpoint of the angled ramp card. Since that midpoint is 30 mm above the laser bed, subtract 30 mm to determine the equivalent focus position at the bed surface.

For example:

    Measured ramp card midpoint focus position: 200 mm
    Ramp card midpoint height above bed: 30 mm
    Equivalent bed-level focus position: 170 mm

Because many galvo columns cannot be adjusted numerically with high precision, it is useful to create a physical focus stick or spacer that fits between the lens housing and the material surface. This makes it easier to return to the same focus height later, even when using materials of different thicknesses.

When making a focus stick or spacer, use the focus distance that corresponds to the actual material surface being marked, not the unadjusted ramp card height.

## Repeat for Each Lens

This procedure must be repeated for each lens.

Each lens has its own focal distance, and the actual working distance may vary from the nominal value provided by the manufacturer.

Do not assume that the focus position for one lens applies to another lens.