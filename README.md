# Fiber Laser Processes and References

A collection of processes, tasks, and digital tools curated for fiber laser engraving. This repository hosts a mix of original methods and community resources, with attribution provided for shared materials. It serves as a functional guide for streamlining workflows and improving precision in fiber laser operations.

---

## Equipment & Tools

All materials and process descriptions are specific to the following hardware and software.

* **Laser Source:** JPT M7 MOPA 100W (YDFLP-100-M7-M-R)
* **Controller:** BJJCZ DLC2-M4-2D EZCAD3 control board
* **Optics:** 70mm, 110mm, and 210mm fused quartz lenses
* **Support Hardware:** Prusa XL FDM 3D Printer

## Software

While various open-source alternatives exist, these workflows default to specific commercial and node-based applications.

* **Design & Vector:** Adobe Illustrator and Adobe Photoshop
* **Modeling & Slicing:** OpenSCAD, Fusion360, and PrusaSlicer
* **Generative & Automation:** ComfyUI and EZCAD3

## Setup and Configuration

This section focuses on the mechanical foundation of the laser. Before any engraving begins, the machine must be properly aligned and calibrated to ensure consistent results. Initial documentation covers squaring the tower to the bed, leveling the galvo head, and accurately finding the focal point for different lenses.

* [**Laser Setup and Calibration Guide**](./setup_calibration.md): Step-by-step procedures for mechanical alignment and lens calibration.

## Workflows

The repository outlines several core processes:

1.  **Raster to Vector Conversion:** ComfyUI workflow to upscale, threshold, and trace black-and-white raster art into SVG. See [**Black and White Raster to SVG**](./workflows/raster-to-svg/README.md).
2.  **Layout and Export:** Using Adobe Illustrator for final layout and preparing files for EZCAD3. To ensure compatibility, all files are exported as Legacy Adobe Illustrator v8 format.
3.  **Physical Workholding:** Designing and printing 3D printed jigs to ensure repeatable positioning and focal consistency during production runs. See [**Mechanical Files**](./mechanical/README.md) for parametric models and focus calibration hardware.

## Reference Settings

Documented EZCAD3 pen and hatch parameters for coin engraving on non-ferrous metals, plus validated high carbon steel cutting:

* [**Known Engraving Settings (Copper & Brass)**](./engraving_settings.md): Reference speeds, pulse parameters, and hatch configurations for the YDFLP-100-M7-M-R with an F160Q / 110 mm lens.
* [**Cutting High Carbon Steel (3.0–4.5 mm)**](./cutting_high_carbon_steel.md): Validated focus schedule, kerf geometry, and process notes for through-cutting on the YDFLP-100-M7-M-R with a 110 mm lens.
