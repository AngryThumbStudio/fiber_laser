# Engraving a Grayscale Depthmap in EZCAD3

This guide documents my own workflow for preparing an existing grayscale depthmap, converting it into a 3D surface in EZCAD3, and slicing it for engraving. It is based on observations and tests using my equipment. It is not an authoritative or comprehensive guide to EZCAD3. Other methods may work, and behavior may vary by software version.

## Understanding Image Resolution in EZCAD3

To generate a 3D model with predictable mesh complexity, match the exported image's embedded DPI to the DPI entered in EZCAD3. With those values matched, the image's pixel dimensions determine how many vertices and faces EZCAD3 generates. Size X/Y controls the physical dimensions of the model, not its mesh complexity, based on my testing.

There are two practical rules:

1. **Match the DPI.** If the image contains 72 DPI metadata, use 72 DPI in EZCAD3. If it contains 300 DPI, use 300 DPI. There is no particular DPI value required for this workflow.
2. **Use pixel dimensions to control mesh complexity.** With matching DPI, a 1000 × 1000 pixel image generates fewer vertices and faces than a 2000 × 2000 pixel image. When DPI values do not match, EZCAD3 appears to resample the image, potentially producing an unexpectedly large or small mesh.

In one test, two PNG files with identical 1000 × 1000 pixel data were imported at 635 DPI and 40 × 40 mm. The file with embedded 635 DPI produced approximately 2 million faces; the file with embedded 72 DPI produced 155.7 million. The [optional appendix](#technical-appendix-optional-reading) documents the controlled tests and inferred relationships.

The practical approach is to choose the image's pixel dimensions deliberately, verify its embedded DPI after export, and enter the same DPI in EZCAD3. Set Size X/Y separately to establish the model's physical dimensions.

**Who this is for**: Fiber laser users already familiar with basic image editing, image resolution metadata, EZCAD3 operation, and slicing STL models for 2.5D engraving.

**Not covered**: Creating a depthmap from scratch, selecting pen and hatch parameters, or calibrating material-removal rates.

The procedure has two parts:

1. [Prepare an existing depthmap](#part-1-prepare-the-depthmap)
2. [Convert and slice the depthmap in EZCAD3](#part-2-convert-and-slice-the-depthmap-in-ezcad3)

The [Technical Appendix](#technical-appendix-optional-reading) records the tests and explains the underlying reasoning. It is optional. You do not need to read it to complete the workflow.

---

## Part 1: Prepare the Depthmap

### 1. Finish and save the working artwork

Begin with an existing depthmap from whatever source you prefer. Finish adjusting its grayscale levels, proportions, and positioning to achieve the relief you want.

Save the completed working file before preparing the EZCAD3 export. The working artwork does not need to have the same pixel dimensions as the file imported into EZCAD3. For example, I worked on one design at 1208 × 1208 pixels and exported a smaller copy. Working at a higher resolution is not required; it is simply how I developed that artwork.

### 2. Choose the export's pixel dimensions

Choose how much XY detail you want the generated mesh to contain. This depends on your artwork and intended engraving size, not on a required DPI value.

One useful way to estimate an appropriate image width is:

```text
Pixels along an axis ≈ Physical size along that axis (mm) / Desired XY sample spacing (mm)
```

For example, a 31.75 mm square engraving with an intended sampling interval of about 0.04 mm calls for:

```text
31.75 / 0.04 = 793.75  →  approximately 794 pixels per axis
```

I often use 0.04 mm hatch line spacing, so this is a practical starting point for my work. Hatch spacing is not a mandatory bitmap resolution; finer or coarser image sampling may be appropriate for different artwork. More pixels create more mesh geometry, but do not automatically produce a better engraving.

### 3. Resize and export a separate bitmap

Using your preferred image editor:

1. Resize a copy of the finished depthmap to the desired pixel dimensions, using your preferred resampling method.
2. Verify the proportions and grayscale transitions after resizing.
3. Export as TIFF, PNG, or BMP, preserving the intended grayscale information.
4. Check the exported file's embedded DPI metadata. Do not assume that the editor's working-document DPI, or a DPI value in the filename, survived the export unchanged.

The embedded DPI can be 72, 300, 635, or another value. Use that same value when importing into EZCAD3.

I prefer resizing in an image editor because it offers explicit resampling controls that EZCAD3 does not expose in this dialog. Keep the original working artwork so you can produce other exports later.

---

## Part 2: Convert and Slice the Depthmap in EZCAD3

The screenshots show a 31.75 × 31.75 mm model imported at 635 DPI with a height of 0.5 mm. These are example settings, not requirements.

### 4. Switch to 3D View

Switch from the normal EZCAD3 workspace into 3D View:

- Press Ctrl + W, or
- Click the 3D View button on the main toolbar (the globe with the red and blue 3D symbol).

<img src="./images/01_switch_to_3d_view.png" width="800" alt="EZCAD3 main toolbar showing the globe-shaped 3D View button with red and blue 3D lettering.">

*Figure 1. Switch to EZCAD3's 3D View.*

### 5. Open Bitmap to curved surface

In 3D View, click Bitmap to curved surface on the 3D toolbar. Its name appears when you hover over the button.

<img src="./images/02_bitmap_to_curved_surface.png" width="540" alt="EZCAD3 3D toolbar with the Bitmap to curved surface button highlighted and its tooltip visible.">

*Figure 2. Open Bitmap to curved surface.*

### 6. Load the bitmap and set the model dimensions

The Bitmap to curved surface dialog opens. Click Bitmap and select the exported image from Part 1.

<img src="./images/03_bitmap_to_curved_surface_dialog.png" width="760" alt="EZCAD3 Bitmap to curved surface dialog before loading an image, with the Bitmap, Invert, DPI, Size, Height, Border, and Refresh controls visible.">

*Figure 3. Bitmap to curved surface dialog before loading an image.*

Configure the fields for your artwork:

| Control | Example | What to do |
| --- | --- | --- |
| Bitmap | Exported depthmap | Select the image to convert. |
| DPI X / DPI Y | 635 / 635 | Enter the DPI embedded in the exported file. |
| Size X / Size Y | 31.75 / 31.75 mm | Set the intended physical dimensions of the 3D model. These values do not independently determine mesh complexity in my tests. |
| Height | 0.5 mm | Set the model's Z height. |
| Invert | Checked | Use when the depthmap treats white as the highest elevation and black as the lowest. Without Invert, I have observed EZCAD3 interpret these in the opposite direction. |
| Border | 0 | Leave at zero for this workflow; I have not tested its behavior. |

Check DPI X/Y against the exported file's embedded metadata before generating the surface.

Click Refresh to generate the 3D surface. In my experience, clicking OK without first using Refresh does not create the object.

### 7. Inspect the generated surface

After clicking Refresh, the default preview is a top-down wireframe view. From above, a relief may look like a nearly flat gray square.

<img src="./images/04_default_top_wireframe_preview.png" width="760" alt="Top-down wireframe preview in EZCAD3's Bitmap to curved surface dialog, where the model looks like a nearly uniform gray square.">

*Figure 4. Default top-down wireframe preview; the relief is difficult to judge.*

To see the relief more clearly, select:

1. Display render mode: The solid globe, second icon from the left in the dialog's toolbar.
2. Isometric view: The far-right view icon.

In this dialog, gray means the view button is selected; blue means it is not selected. The dialog does not display the helpful tooltips available in the main 3D workspace.

<img src="./images/05_rendered_isometric_preview.png" width="760" alt="EZCAD3 isometric rendered preview of the mountain man depthmap showing its raised and recessed details, with Invert enabled and model settings visible.">

*Figure 5. Rendered isometric view makes the model's relief visible.*

These controls change only the preview. Once the model looks correct, click OK to return to the main 3D workspace.

From this point forward, the process is the same as slicing an imported STL model.

### 8. Open the slicing dialog

Click Surface delamination in the main 3D toolbar. Its tooltip describes the function as *Slice the surface in a layered way*.

<img src="./images/06_surface_delamination.png" width="365" alt="EZCAD3 Surface delamination toolbar button with the tooltip Slice the surface in a layered way.">

*Figure 6. Surface delamination opens the slicing dialog.*

### 9. Choose the Z range and slice thickness

The Stratified section dialog controls the range and spacing of the slices.

<img src="./images/07_stratified_section_dialog.png" width="395" alt="EZCAD3 Stratified section dialog with Min Z 0 mm, Max Z 0.5 mm, Thickness 0.00196 mm, and Layer 256.">

*Figure 7. Example of a 0.5 mm model divided into 256 layers.*

For this workflow:

- Leave Using selected two-dimensional object hierarchy unchecked.
- Leave Z values range from large to small checked.
- Set Min Z / Max Z to cover the model's intended Z range. Each ← Z button copies the actual model boundary shown to its right into the corresponding field.
- Enter Thickness. EZCAD3 displays the resulting Layer count.
- Leave Rotate angle unchanged.

Normally, calibrated material removal determines the slice thickness. Choose Thickness based on how much material the complete pen-and-hatch operation removes per layer. Slice thickness defines the model's vertical intervals; it does not control the actual depth removed by the laser.

The 0.00196 mm thickness in Figure 7 yields 256 layers for this example's 0.5 mm model. It is an illustration, not a recommended setting or required layer count. The [optional appendix](#d-grayscale-values-slice-count-and-material-removal) discusses how slice count may affect grayscale relief fidelity.

Click OK to generate the slices.

### 10. Review the Slicing tangent object

EZCAD3 adds a Slicing tangent object to the Object list. Select it to review its properties and layer count.

<img src="./images/08_slicing_tangent_object_properties.png" width="410" alt="EZCAD3 Object list showing a Slicing tangent object; Object property panel shows approximately 28.42 mm square dimensions, 0.5 mm height, and 256 layers.">

*Figure 8. Generated Slicing tangent object and its properties.*

Check the resulting object's dimensions. My example is imported with a 31.75 mm square canvas but creates an approximately 28.4227 mm square sliced object because the artwork occupies less than the full image canvas. The resulting sliced bounds can differ from the configured import size.

### 11. Account for hatch settings and optional cleaning

The main Hatch button above Dynamic hatch configures the hatch applied to every layer. Cross-hatching, hatch counts greater than one, and other hatch settings all affect material removal per layer. Account for the complete operation when selecting slice thickness.

The optional Clear section lets me apply a separate operation at regular intervals, which I sometimes use for cleaning. For example, Inc. count = 20 runs that operation every 20 layers. I use Original contour for Edge type, although I have not evaluated the other choices.

<img src="./images/09_periodic_clear_configuration.png" width="410" alt="EZCAD3 Object property panel with Clear enabled, Original contour selected, Inc. count set to 20, and the separate Clear hatch control visible.">

*Figure 9. Optional cleaning operation every 20 layers.*

Click Apply after changing Clear settings. EZCAD3 can lose changes that have not been applied before other settings are modified. Any cleaning operation may also remove material, so include its effect when calibrating the process.

The depthmap has now been converted and sliced. Continue with your normal 3D engraving setup.

---

## Technical Appendix (Optional Reading)

You do not need this appendix to perform the workflow. It preserves the measurements and reasoning behind the two DPI rules, plus additional information about image sampling and slicing.

### A. What the controlled DPI tests established

The strongest test used two 1000 × 1000 pixel PNG files with identical pixel data, processed using the same EZCAD3 settings except where stated. The key difference between those two exports was embedded DPI metadata.

| Embedded image DPI | EZCAD3 DPI X/Y | Size X/Y | Vertices | Faces |
| --- | --- | --- | ---: | ---: |
| Approximately 72 | 635 / 635 | 40 × 40 mm | 77,845,325 | 155,655,360 |
| 635 | 635 / 635 | 40 × 40 mm | 1,001,997 | 1,999,992 |
| 635 | 300 / 300 | 40 × 40 mm | 224,672 | 447,450 |
| 635 | 635 / 635 | 31.75 × 31.75 mm | 1,001,997 | 1,999,992 |

All tests used Height = 0.5 mm and Invert enabled. The 300 DPI test was repeated and reproduced the same counts.

Three observations follow directly from these tests:

1. Matching the image and EZCAD3 DPI avoids unintended mesh resampling in the tested workflow. Changing only the PNG's embedded resolution from approximately 72 DPI to 635 DPI reduced the face count from 155.7 million to 2 million, with the same pixels and the same import settings.
2. Changing EZCAD3 DPI relative to the embedded DPI changes mesh complexity. Entering 300 DPI for the 635 DPI bitmap reduced its mesh sampling density.
3. Changing Size X/Y alone did not change mesh complexity. It changed the model's X/Y bounds from −20 to +20 mm to −15.875 to +15.875 mm, while vertex and face counts remained identical.

These are measured outcomes from my EZCAD3 installation and PNG exports, not a published specification of EZCAD3's internal implementation. Behavior with other software versions and image formats has not been independently verified.

#### Earlier exploratory tests

Before isolating the embedded-DPI effect, I also tested the same artwork exported at two sizes. These results are retained for reference; I did not independently record every file's embedded DPI metadata during that initial series.

| Source image | EZCAD3 DPI X/Y | Model size | Vertices | Faces |
| --- | ---: | ---: | ---: | ---: |
| 794 × 794 | 635 / 635 | 31.75 mm square | 632,021 | 1,260,864 |
| 1110 × 1110 | 888 / 888 | 31.75 mm square | 1,234,317 | 2,464,192 |
| 794 × 794 | 888 / 888 | 31.75 mm square | 1,236,540 | 2,468,634 |
| 1110 × 1110 | 635 / 635 | 31.75 mm square | 632,021 | 1,260,864 |

Those results are consistent with the DPI-ratio behavior demonstrated more directly in the later tests.

### B. An inferred model for mesh complexity

Our measurements suggest that EZCAD3 uses the ratio between its entered DPI and the bitmap's embedded DPI to determine approximately how many samples to use along each axis:

```text
Mesh samples per axis ≈ Source pixels per axis × (EZCAD3 DPI / Embedded image DPI)
```

When the two DPI values match, this reduces to approximately one mesh sample per source pixel. When they differ, EZCAD3 appears to resample the image. We have not verified its interpolation method or exact rounding rules.

For the square images tested, every reported mesh count matched this observed geometry pattern for some integer sample count N:

```text
Vertices = (N + 1)^2 - 4
Faces    = 2 × N^2 - 8
```

For example, a matched-DPI 1000 × 1000 image produced:

```text
Vertices = (1000 + 1)^2 - 4 = 1,001,997
Faces    = 2 × 1000^2 - 8   = 1,999,992
```

The 72-to-635 DPI mismatch produced counts corresponding exactly to N = 8822, while the 635-to-300 DPI test corresponded exactly to N = 473. The simple DPI-ratio calculation predicts values close to, but not always equal to, those sample counts. Thus, these relationships are empirical approximations, not a documented EZCAD3 algorithm.

This also means increasing the source bitmap from 1000 to 2000 pixels per axis, with DPI matched in both cases, should produce roughly four times as many mesh faces. More geometry is not automatically more engraving detail.

### C. Pixel dimensions, physical size, and hatch spacing

When DPI is matched, image pixel dimensions govern mesh complexity, while Size X/Y governs physical dimensions. The physical distance represented by one image sample is therefore approximately:

```text
XY sample spacing (mm) ≈ Model size along axis (mm) / Pixels along that axis
```

For example, a 1000-pixel image spread across 40 mm represents approximately 0.04 mm per sample. A 794-pixel image spread across 31.75 mm gives nearly the same spatial interval.

I commonly use a 0.04 mm hatch spacing. That motivated my initial choice of approximately 25 image samples per millimeter, or 635 samples per inch. But hatch spacing does not set the DPI required in the bitmap or EZCAD3. The actual XY sample spacing comes from the source image's pixel dimensions and the physical Size X/Y entered in EZCAD3, assuming matched DPI.

An estimated laser spot size near 0.038 mm for my 110 mm lens also influenced my earlier thinking, but I have not confirmed that figure through reliable documentation or measurement. Neither the hatch spacing nor this estimated spot size establishes an optimal bitmap pixel count. Finer source sampling may help some contours, but it also produces more geometry.

### D. Grayscale values, slice count, and material removal

Use calibrated material removal to guide slice thickness. The amount removed by a complete layer depends on the material, pen settings, hatch count, cross-hatching, and any periodic cleaning operations. Slice thickness does not make the laser remove that amount of material.

An 8-bit grayscale depthmap has 256 possible intensity values, from 0 to 255. If the artwork uses most or all of that range, the number of slices may affect how faithfully its intended vertical transitions are represented:

- Fewer slices can combine nearby elevations and lose subtle height differences.
- More slices can produce redundant or nearly identical contours, especially with stepped or terraced artwork, without adding new source grayscale values.

This is not a strict 256-layer limit. EZCAD3 may interpolate between source values as it builds a surface, and more than 256 slices can yield distinct contours. Conversely, many depthmaps use far fewer than 256 meaningful grayscale levels.

For reference, a 0.5 mm model divided into 256 slices has approximately 0.001953 mm (1.95 µm) slice thickness. The 256 grayscale values span 255 intervals between the endpoints; this calculation is not proof that EZCAD3 maps each grayscale value to a single slicing layer.

I have not established whether EZCAD3 can use greater than 8-bit depthmap precision, how it interpolates between samples, or how many distinct engraved elevations can be achieved in the finished material.

### E. Z range and layer count

Min Z and Max Z define the portion of the 3D model included in slicing. The adjacent ← Z buttons copy the model's detected Z bounds.

The observed layer count is consistent with:

```text
Layers ≈ round up [(Max Z - Min Z) / Thickness]
```

For a model with Z from 0 to 0.5 mm, using 0.0026 mm thickness generated 193 layers. Raising Min Z to 0.25 mm, with the same Max Z and thickness, sliced only the upper half and generated 97 layers. I did not test whether partial-range slicing preserves absolute Z coordinates in subsequent operations.

### F. Controls not investigated

I have not characterized Border in Bitmap to curved surface, Rotate angle in Stratified section, Using selected two-dimensional object hierarchy, or the differences among the Clear Edge type options (*Edge box*, *Original contour*, and *Convex Hull contour*). These are mentioned only as needed to document the settings I use.

---

*Documented from hands-on EZCAD3 testing for Angry Thumb Studio. Adjust dimensions and engraving parameters for your own equipment, lens, material, and artwork.*
