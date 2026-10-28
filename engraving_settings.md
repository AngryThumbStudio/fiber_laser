# Known Engraving Settings (Copper, Brass & High Carbon Steel)

These settings were developed on a **JPT M7 MOPA 100W (YDFLP-100-M7-M-R)** with an **F160Q / 110 mm fused-quartz lens**, using **BJJCZ EZCAD3**. They document results on this machine, not universal recommendations. Material differences, optics, focus, and controller configuration can change the result.

For adapting pulse-related parameters to another MOPA source, see the [fiber laser pulse parameter converter](https://acedapig.github.io/fiber-laser-pulse-calc/).

Settings recorded: **June 7, 2026** (copper and brass), **June 15, 2026** (conventional high-carbon-steel engraving), and **October 27, 2026** (high-carbon-steel 3D depth-map engraving), and **October 28, 2026** (cartridge-brass 3D depth-map test).

## Contents

- [Quick Reference](#quick-reference)
- [Understanding the Workflows](#understanding-the-workflows)
- [Shared Cleaning Pen Settings](#shared-cleaning-pen-settings)
- [Copper](#copper)
- [Brass](#brass)
  - [3D Depth Map: Cartridge Brass](#3d-depth-map-cartridge-brass)
  - [Conventional Engrave, Clean & Blackening](#conventional-engrave-clean--blackening)
- [High Carbon Steel](#high-carbon-steel)
  - [3D Depth Map: Clean Relief](#3d-depth-map-clean-relief)
  - [Conventional Engrave, Clean & Polish](#conventional-engrave-clean--polish)

---

## Quick Reference

| Material and method | How depth is built | Laser finishing |
| :--- | :--- | :--- |
| Copper, conventional hatching | 16 sets of 20 engrave passes + 1 clean pass | One blackening hatch |
| Brass, conventional hatching | 16 sets of 5 engrave passes + 1 clean pass | One blackening hatch |
| **Cartridge brass, 3D depth map** | **256 complete slices, one hatch per slice; 0.300 mm nominal model Z range** | **No laser cleaning or finishing passes** |
| High carbon steel, conventional hatching | 8–24 sets of 20 engrave passes + 1 clean pass | One 32-count polish hatch |
| **High carbon steel, 3D depth map** | **416 complete slices, one hatch per slice** | **No cleaning or finishing passes** |

For the successful steel 3D relief, see the [steel 3D depth-map settings](#3d-depth-map-clean-relief): 1800 mm/s, 67.5% power, 75 kHz, 100 ns, 0.020 mm line spacing, and 68.77° rotation per slice. The [cartridge-brass 3D test](#3d-depth-map-cartridge-brass) used the same parameters at **45% power**; it produced **0.430 mm measured depth** against a **0.300 mm nominal model Z range**.

Line density in LPI (lines per inch) is calculated as **25.4 ÷ line spacing (mm)**.

## Understanding the Workflows

Two different depth-engraving methods are documented on this page. **Do not carry conventional engrave/clean pass counts or finishing settings into the 3D depth-map process.**

### Terms Used in This Guide

| Term | Meaning |
| :--- | :--- |
| **Pen settings** | Laser parameters such as speed, frequency, power, and pulse width. |
| **Hatch settings** | Scan pattern, line spacing, count, and angle or rotation. |
| **Hatch count** | Number of times the programmed hatch is marked during that operation. It is **not** a count of individual scan lines. |
| **Object A Count** | Number of times EZCAD3 repeats a conventional hatch set using the **A** field under Object Properties (when Axis Solution is set to **Z only**). |
| **Repetition** | One complete cycle of the conventional paired Engrave + Clean operations, controlled by **Object A Count**. |
| **3D slice** | One height level in a sliced depth-map object, processed in sequence with the other slices. |
| **Programmed Z depth** | The Z progression requested by the sliced model. This is not necessarily equal to the physical depth removed. |

### Conventional Engrave, Clean and Finish

This workflow repeats a paired **Engrave + Clean** hatch set to build depth. For example, an Engrave hatch Count of 20 followed by a Clean hatch Count of 1 means 20 complete engrave-hatch passes, then one clean-hatch pass in each repetition.

#### Repeating the Hatch Set with Object Property A

In EZCAD3, set **Axis Solution** to **Z only** (rotary / ZA disabled). Under **Object Properties**, the position fields include **X**, **Y**, **Z**, and **A**. When A is not being used for rotary motion, set its **Count** to the desired number of repetitions of the complete Engrave + Clean hatch set. Do not increase the individual hatch Count fields to achieve these repetitions.

For example, when the Engrave hatch Count is 20, the Clean hatch Count is 1, and **Object A Count is 16**, the result is 16 cycles of 20 engrave passes followed by 1 clean pass: **320 engrave passes and 16 clean passes**.

| Material | Engrave hatch Count | Clean hatch Count | Object A Count | Total engrave / clean passes |
| :--- | ---: | ---: | ---: | :--- |
| Copper | 20 | 1 | 16 | 320 / 16 |
| Brass | 5 | 1 | 16 | 80 / 16 |
| High carbon steel (conventional) | 20 | 1 | 8–24 | 160–480 / 8–24 |

Perform the final blackening or polishing hatch as a **separate operation with one execution**, outside the repeated hatch set. Otherwise it would also be repeated by Object A Count.

For the same A Count technique applied to cutting, see [Repeating hatch sets with Object Property A](./cutting_high_carbon_steel.md#repeating-hatch-sets-with-object-property-a).

Unless an individual section specifies otherwise, these conventional hatch options apply:

- **Enable** and **All calc:** enabled.
- **Mark Contour**, **Contour prior**, **Follow edge once**, **Cross hatch**, and **Average distribute line:** disabled.
- Conventional engraving hatches rotate by **68.75°**. Bidirectional hatch orientations repeat after 144 steps, since 0° and 180° produce equivalent line directions. Cleaning hatches use a fixed 0° angle unless specified otherwise.

### EZCAD3 Sliced 3D Depth Map

EZCAD3 processes a grayscale heightmap as a sliced 3D object. Each slice is engraved with a **single bidirectional hatch**, rotating the angle by **68.77° per slice**. EZCAD3 advances the programmed Z position through the slices automatically.

The successful steel relief used **416 complete slices**; the cartridge-brass test used **256 complete slices**. Both used hatch count **1** per slice, not 416 or 256 conventional hatch repetitions. Neither used laser cleaning, polishing, or finishing passes. Actual engraving depth must be measured: the model's nominal Z range does not limit how much material the laser can physically remove.

---

## Shared Cleaning Pen Settings

These pen settings are shared by **Copper Clean**, **Brass Clean**, and **High Carbon Steel Clean** in the conventional workflows. They are **not used** for the clean 3D depth-map workflow.

| Parameter | Value |
| :--- | :--- |
| Mark speed | 4000 mm/s |
| Frequency | 125 kHz |
| Power | 15% |
| Pulse width | 80 ns |

---

## Copper

### Procedure

1. Configure the **Copper Engrave** hatch with **Count 20** and the **Copper Clean** hatch with **Count 1**.
2. With **Axis Solution = Z only**, set **Object Properties → A → Count = 16** to repeat the paired hatch set 16 times (320 engraving passes and 16 cleaning passes total).
3. Run the **Copper Black** hatch **once as a separate blackening operation**, outside the repeated hatch set.

### Engrave

**Pen settings**

| Parameter | Value |
| :--- | :--- |
| Mark speed | 2400 mm/s |
| Frequency | 96 kHz |
| Power | 45% |
| Pulse width | 100 ns |

**Hatch settings**

| Parameter | Value |
| :--- | :--- |
| Pattern | Bidirectional |
| Count | 20 |
| Line spacing | 0.04 mm (635 LPI) |
| Auto-rotate hatch angle | 68.75° |

### Clean

**Pen settings:** Use the [shared cleaning pen settings](#shared-cleaning-pen-settings).

**Hatch settings**

| Parameter | Value |
| :--- | :--- |
| Pattern | Bidirectional |
| Count | 1 |
| Line spacing | 0.025 mm (1016 LPI) |
| Angle | 0° |

### Finish: Blackening

**Pen settings**

| Parameter | Value |
| :--- | :--- |
| Mark speed | 250 mm/s |
| Frequency | 75 kHz |
| Power | 40% |
| Pulse width | 200 ns |

**Hatch settings**

| Parameter | Value |
| :--- | :--- |
| Pattern | Unidirectional |
| Count | 1 |
| Line spacing | 0.005 mm (5080 LPI) |
| Angle | 30° |

---

## Brass

### 3D Depth Map: Cartridge Brass

*Recorded October 28, 2026. First completed 3D relief test on a 19.2 mm cartridge-brass coin.*

This process uses a short, **100 ns** pulse and reduced power instead of the **500 ns** pulse used for conventional brass engraving below. It produced fine sculptural detail with no prominent raised reflow ridges visible in the test photograph. **The measured engraving depth exceeded the nominal imported model height**, so these settings are a successful visual test, **not** a calibrated recipe for a 0.300 mm physical cut.

#### Procedure

1. Prepare a grayscale relief depth map for a **19.05 mm target engraving diameter** on a **19.20 mm diameter** cartridge-brass coin.
2. Import it into EZCAD3 as a **3D sliced tangent** object with a **0.300 mm nominal model Z range**, generating **256 complete slices**.
3. Apply the pen and hatch settings below. Use **one bidirectional hatch per slice**, with **68.77° auto-rotation** between slices. EZCAD3 handles the Z progression automatically.
4. Engrave all **256 slices**. Use **no laser cleaning, polishing, or finishing passes**.
5. The test coin was washed and brushed with a nylon brush afterward. A satisfactory final cleaning method has **not yet been established**.

#### Pen Settings

| Parameter | Value |
| :--- | :--- |
| Mark speed | 1800 mm/s |
| Frequency | 75 kHz |
| Power | 45% |
| Pulse width | 100 ns |

#### Hatch Settings

| Parameter | Value |
| :--- | :--- |
| Pattern | Bidirectional |
| Count | 1 per slice |
| Line spacing | 0.020 mm (1270 LPI) |
| Auto-rotate hatch angle | 68.77° per slice |
| Cross hatch | Disabled |

#### Slicing and Measured Result

| Parameter | Value |
| :--- | :--- |
| Material | Cartridge brass |
| Coin diameter | 19.20 mm |
| Target X/Y engraving diameter | 19.05 mm |
| EZCAD3 nominal model Z range | 0.300 mm |
| Complete slices | 256 |
| Laser cleaning or finishing passes | None |
| Reference measurement | 8.66 mm |
| Engraved measurement | 8.23 mm |
| **Measured depth removed** | **0.430 mm** |
| **Excess over nominal model depth** | **0.130 mm (43.3%)** |
| Average measured depth per slice | 0.00168 mm (1.68 µm) |

The per-slice average is the **final measured depth divided by 256**, not a verified constant removal rate. EZCAD3 automatically changes Z through the sequence; the model's Z range is **not a physical depth stop**. The test does not establish linear removal or imply that lowering power will reduce depth proportionally.

#### Observations and Next Test

- Fine detail in the hat, face, beard, and fur remained distinct at coin scale.
- Background hatch lines were barely visible to the naked eye, and no prominent reflow ridges were apparent in the photograph.
- Dark material remained in some recesses after washing and nylon brushing; its composition and optimal cleaning method were not established.
- **Untested next adjustment:** try **40% power**, keeping all other parameters and the 256-slice model unchanged, to investigate reducing the overshoot toward a 0.300 mm physical depth. Measure the result before treating it as a calibrated setting.

### Conventional Engrave, Clean & Blackening

*Recorded June 7, 2026. Existing 500 ns conventional hatch process, retained separately from the 3D relief test.*

#### Procedure

1. Configure the **Brass Engrave** hatch with **Count 5** and the **Brass Clean** hatch with **Count 1**.
2. With **Axis Solution = Z only**, set **Object Properties → A → Count = 16** to repeat the paired hatch set 16 times (80 engraving passes and 16 cleaning passes total).
3. Run the **Brass Black** hatch **once as a separate blackening operation**, outside the repeated hatch set.

#### Engrave

**Pen settings**

| Parameter | Value |
| :--- | :--- |
| Mark speed | 1500 mm/s |
| Frequency | 67 kHz |
| Power | 30% |
| Pulse width | 500 ns |

**Hatch settings**

| Parameter | Value |
| :--- | :--- |
| Pattern | Bidirectional |
| Count | 5 |
| Line spacing | 0.04 mm (635 LPI) |
| Auto-rotate hatch angle | 68.75° |

#### Clean

**Pen settings:** Use the [shared cleaning pen settings](#shared-cleaning-pen-settings).

**Hatch settings**

| Parameter | Value |
| :--- | :--- |
| Pattern | Bidirectional |
| Count | 1 |
| Line spacing | 0.05 mm (508 LPI) |
| Angle | 0° |

#### Finish: Blackening

**Pen settings**

| Parameter | Value |
| :--- | :--- |
| Mark speed | 80 mm/s |
| Frequency | 50 kHz |
| Power | 27% |
| Pulse width | 200 ns |

**Hatch settings**

| Parameter | Value |
| :--- | :--- |
| Pattern | Bidirectional |
| Count | 1 |
| Line spacing | 0.01 mm (2540 LPI) |
| Angle | 45° |

---

## High Carbon Steel

The conventional method was developed on **4 mm+ 1095 and 80CrV2** stock. The 3D depth-map method was tested on high-carbon-steel bar stock. Material removal varied between steel bars even when the laser settings were unchanged.

For through-cutting 3.0–4.5 mm high-carbon steel, see [Cutting High Carbon Steel](./cutting_high_carbon_steel.md).

### 3D Depth Map: Clean Relief

*Recorded October 27, 2026. Successful full mountain-man bas-relief.*

This method prioritizes sculptural clarity, particularly the convex claw surface, braided cord, feather, facial features, beard, and fur. It uses no laser cleaning or finishing passes.

#### Procedure

1. Prepare and import the grayscale heightmap as an EZCAD3 **3D sliced tangent** object.
2. Configure the model for a **0.500 mm nominal Z range** and generate **416 complete slices**. Confirm the actual slice count in EZCAD3 before engraving. The exact slice-thickness field entry from this successful run was not separately recorded.
3. Apply the pen and hatch settings below to the 3D slice process, using **one bidirectional hatch per slice** and **68.77° rotation per slice**.
4. Engrave the **entire 416-slice sequence**. Do not stop after 416 slices of a larger stack. Do not add laser cleaning, polishing, or finishing passes.

EZCAD3 automatically advances the programmed Z position through the model. Programmed depth is **not** a guarantee of physical material removed, especially on a different steel bar.

#### Pen Settings

| Parameter | Value |
| :--- | :--- |
| Mark speed | 1800 mm/s |
| Frequency | 75 kHz |
| Power | 67.5% |
| Pulse width | 100 ns |

#### Hatch Settings

| Parameter | Value |
| :--- | :--- |
| Pattern | Bidirectional |
| Count | 1 per slice |
| Line spacing | 0.020 mm (1270 LPI) |
| Auto-rotate hatch angle | 68.77° per slice |
| Cross hatch | Disabled |

#### Slicing and Finishing

| Parameter | Value |
| :--- | :--- |
| EZCAD3 object | 3D sliced tangent (grayscale depth map) |
| Nominal model Z range | 0.500 mm |
| Complete slices | 416 |
| Laser cleaning passes | None |
| Laser finishing/polishing passes | None |

The absence of laser cleaning or finishing passes does **not** prohibit separate mechanical post-processing. Such post-processing is not included in the laser settings above.

#### Development Notes

**Why 75 kHz?** The frequency is deliberately below the JPT M7's full-power cutoff for 100 ns pulses, in its reduced-average-power (down-power) operating region. It was selected for clarity and better edge geometry, not maximum removal speed.

In controlled tests of an **8.892 mm cropped relief on a different steel bar**, the following frequency series used 256 complete slices at 100 ns, 67.5% power, 1800 mm/s, 0.020 mm line spacing, and 68.77° rotation:

| Frequency | Measured depth removed |
| :--- | ---: |
| 75 kHz | 0.270 mm |
| 100 kHz | 0.360 mm |
| 120 kHz | 0.420 mm |
| 160 kHz | 0.710 mm |

Although higher frequencies removed more material, the 160 kHz result was much rougher. The 75 kHz result was preferred for detail and clarity; the full engraving therefore used **more slices** rather than higher frequency to develop the relief. This comparison is experimental data from the test bar, **not** a depth calibration for the full portrait on the other bar.

#### Observed Result

The full mountain-man engraving preserved fine relief detail with a convincing convex claw and clean recessed background. The final physical engraving depth was **not measured** to avoid marring its surface. The 416-slice configuration is a successful visual reference, **not a universal 0.500 mm removal recipe**.

### Conventional Engrave, Clean & Polish

*Recorded June 15, 2026. Original conventional hatch process, retained for reference.*

This method is independent of the 3D depth-map procedure above.

#### Procedure

1. Configure the **High Carbon Steel Engrave** hatch with **Count 20** and the **High Carbon Steel Clean** hatch with **Count 1**.
2. With **Axis Solution = Z only**, set **Object Properties → A → Count** to the required repetition count. The documented tests used **8, 12, 16, 20, or 24**, corresponding to 160–480 engraving passes and 8–24 cleaning passes.
3. After depth engraving, run the polish hatch **once as a separate operation**, with its hatch **Count fixed at 32**. Do not include polishing in the repeated A Count hatch set.

#### Engrave

**Pen settings**

| Parameter | Value |
| :--- | :--- |
| Mark speed | 2400 mm/s |
| Frequency | 96 kHz |
| Power | 45% |
| Pulse width | 200 ns |

**Hatch settings**

| Parameter | Value |
| :--- | :--- |
| Pattern | Bidirectional |
| Count | 20 |
| Line spacing | 0.04 mm (635 LPI) |
| Auto-rotate hatch angle | 68.75° |

#### Clean

**Pen settings:** Use the [shared cleaning pen settings](#shared-cleaning-pen-settings).

**Hatch settings**

| Parameter | Value |
| :--- | :--- |
| Pattern | Bidirectional |
| Count | 1 |
| Line spacing | 0.05 mm (508 LPI) |
| Angle | 0° |

#### Material Removal

All values below are **total material removed** relative to untreated stock. Each test used the repeated Engrave + Clean pair followed by **one 32-count polish hatch**. These results apply only to this conventional workflow.

| Engrave + Clean repetitions | Material removed (mm) |
| :--- | ---: |
| 8 | 0.22 |
| 12 | 0.31 |
| 16 | 0.37 |
| 20 | 0.39 |
| 24 | 0.47 |

#### Polish

This conventional polish hatch smooths pitting in the bottom of the engraved area and can leave a bluish annealing color. **Defocus the polish layer by 2 mm.**

On thinner stock (1.8 mm or 1/16"), annealing color may appear on the **opposite side** after 32 polish passes but not after 16. That behavior was not observed on the 4 mm+ stock used for these settings.

**Pen settings**

| Parameter | Value |
| :--- | :--- |
| Mark speed | 3500 mm/s |
| Frequency | 3500 kHz |
| Power | 70% |
| Pulse width | 2 ns |

**Hatch settings**

| Parameter | Value |
| :--- | :--- |
| Pattern | Bidirectional |
| Count | 32 |
| Line spacing | 0.025 mm (1016 LPI) |
| Angle | 30° |
| Auto-rotate hatch angle | 68.75° |
