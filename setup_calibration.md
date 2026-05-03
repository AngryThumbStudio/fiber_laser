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
A bubble level is insufficient for fiber laser precision. Use a digital angle gauge (e.g., Klein Tools 935DAG).
- **Measurement:** Zero the gauge on the base plate, then measure the angle of the galvo head. Even a 0.1-degree deviation from parallel can significantly impact marking consistency.
- **Adjustment:** If the lifting bracket features 4mm pre-tapped holes at the four corners, utilize **Stainless Steel Cone-Point Set Screws**. These four adjustment points allow for precise three-dimensional control over the leveling of the galvo arm, which is superior to using shims.

---

## Part 2: Per-Lens Setup & Calibration
The following steps must be completed for every lens in your collection. These settings are unique to the focal length and optical characteristics of each specific lens.

### 2.1 Establishing Focal Height
Focus must be pinpointed for each lens to ensure maximum energy density at the material surface.
1. **Rough Focus:** Adjust the Z-height until the red light preview dot is at its smallest visible size.
2. **Ramp Card Method:** Use black anodized aluminum business cards for this test.
   - *[Placeholder: Detailed standalone Ramp Card procedure]*
3. **EZCAD3 Box Tests:** Use scrap steel for this phase. Since the EZCAD3 board allows for software-level Z-index adjustments per layer, run iterative box tests to find the final, optimized focus position.
   - *[Placeholder: Standalone Box Test parameters and procedure]*

### 2.2 Red Light Preview Calibration
Align the visible red light path with the actual (invisible) fiber laser path.
- *[Placeholder: Red light preview calibration steps]*

### 2.3 Software Lens Correction (.COR)
For EZCAD3, use the standalone calibration tool to account for pincushion or barrel distortion.
- **Standard Precision:** Run a 9-point (3x3) grid.
- **High Precision:** Run a 25-point (5x5) grid for larger field lenses or complex engravings.
- **Manual Method:** - *[Placeholder: Manual calibration process via red light preview]*

---

## Part 3: Precision Tower Squaring
Once the lens is focused and calibrated, perform the final precision alignment.

### 3.1 Red Light Preview Alignment
This phase uses the red light preview to align the tower rotation against the base plate screw holes.
- *[Placeholder: Precision squaring procedure using red light tracking across Z-axis travel]*
