# Fiber Laser Setup and Calibration Guide

This guide outlines the technical process for commissioning a new fiber laser and the subsequent calibration required for individual lenses. Precision during the mechanical setup is the single most important factor in achieving consistent, high-quality engraving results.

---

## Part 1: Initial Hardware Commissioning
These procedures are performed during the first-time setup of the machine. They are "one-time" tasks unless the hardware is moved or internal components are serviced.

### 1.1 Electrical & Grounding Audit
Before applying power, perform a thorough inspection of the chassis interior. Shipping vibrations can compromise electrical integrity.
- **Connection Check:** Open the chassis and check every internal wire connection at the terminal blocks to ensure they are seated and tight.
- **Grounding Verify:** Ensure the laser source, control board, and power supplies are all correctly bonded to a common ground point on the chassis.

### 1.2 Mechanical Assembly
- **Mounting:** Secure the vertical tower to the base plate using the primary bolts.
- **Galvo Attachment:** Attach the galvo arm to the lifting bracket on the tower. Ensure the mounting hardware is snug, allowing for the minor adjustments required in the leveling phase.

### 1.3 Rough Squaring of the Tower
Use a machinist square to align the tower body perpendicular to the base plate. This provides a baseline for operation. Note that a precision squaring phase will occur after lens calibration.

### 1.4 Precision Galvo Leveling
A bubble level is insufficient for fiber laser precision. Use a digital angle gauge, such as the Klein Tools 935DAG, to measure and adjust the galvo head relative to the base plate.
- **Measurement:** Zero the gauge on the base plate, then measure the angle of the galvo head at the lens housing, not at the top of the galvo head. I recommend placing a flat reference surface, such as a 1/8" thick aluminum plate, against the lens housing and measuring from that surface. With two different galvo heads, I have personally measured a difference of at least 0.1 degrees between the angle at the lens housing and the angle at the top of the galvo head. Since even a 0.1-degree deviation from parallel can significantly impact marking consistency, the lens housing is the more relevant measurement point.
- **X/Y Plane Measurement:** Measure the galvo head angle independently in both the X and Y planes. Zero the angle gauge separately for each plane before taking the corresponding galvo measurement. Do not assume that a single zeroing operation applies equally to both directions.
- **Adjustment:** If the lifting bracket features 4 mm pre-tapped holes at the four corners, use stainless steel cone-point set screws. These four adjustment points allow for precise three-dimensional control over the leveling of the galvo arm, which is superior to using shims.

  Adjusting the set screws may require loosening the screw that secures the galvo/emitter arm to the lifting bracket. Be aware that tightening this screw after adjustment may slightly change the measured angle, so a small amount of over-adjustment may be necessary. Make small corrections and recheck the angle after the arm is tightened.

  I recommend switching between the X and Y planes each time the lens reaches level relative to the bed. It may take several passes between X and Y before the lens is correctly leveled in both directions. In my experience, adjustment is typically only needed on the two front set screws.

  If the X axis is adjusted before the Y axis, try to adjust both relevant set screws evenly when correcting the Y axis. This helps avoid reintroducing an angle deviation into the X axis while correcting the Y axis.

- **Shim Alternative:** If set screws are not being used, the galvo arm can be shimmed with thin metal shims. If actual shims are not available, a common practice is to use thin aluminum business cards, such as the same type commonly used during the ramp card focus process.

### 1.5 Red Light Preview Calibration

After focus has been dialed in for the lens in use, align the red light preview to the fiber laser path. This is normally a **one-time step at initial laser setup**, not a per-lens procedure.

See the [Red Light Preview Calibration Procedure](red_light_preview_calibration.md).

---

## Part 2: Per-Lens Setup & Calibration
The following steps must be completed for every lens in your collection. These settings are unique to the focal length and optical characteristics of each specific lens.

### 2.1 Establishing Focal Height
Focus must be pinpointed for each lens to ensure maximum energy density at the material surface.
1. **Rough Focus:** Adjust the Z-height until the red light preview dot is at its smallest visible size.
2. **Ramp Card Method:** Use black anodized aluminum business cards for this test.
   - See the [Ramp Card Focus Calibration Procedure](ramp_card_method.md).
3. **EZCAD3 Box Tests:** Use scrap steel for this phase. Since the EZCAD3 board allows for software-level Z-index adjustments per layer, run iterative box tests to find the final, optimized focus position.
   - *[Placeholder: Standalone Box Test parameters and procedure]*

### 2.2 Software Lens Correction (.COR)
For EZCAD3, use the standalone calibration tool to account for pincushion or barrel distortion.
- **Standard Precision:** Run a 9-point (3x3) grid.
- **High Precision:** Run a 25-point (5x5) grid for larger field lenses or complex engravings.

---

## Part 3: Precision Tower Squaring
Once the lens is focused and calibrated, perform the final precision alignment.

### 3.1 Red Light Preview Alignment
This phase uses the red light preview to align the tower rotation against the base plate screw holes.
- *[Placeholder: Precision squaring procedure using red light tracking across Z-axis travel]*
