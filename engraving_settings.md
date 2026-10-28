# Known Engraving Settings (Copper, Brass & High Carbon Steel)

> These settings were developed using a **JPT M7 MOPA 100W (YDFLP-100-M7-M-R)** laser source, an **F160Q / 110 mm** fused-quartz lens, and **BJJCZ EZCAD3**. They document observed results on this machine, not universal settings. Material, focus, optics, and laser configuration can change the outcome.
>
> For adapting pulse-related parameters to another MOPA source, see the [fiber laser pulse parameter converter](https://acedapig.github.io/fiber-laser-pulse-calc/).

Settings recorded: June 7, 2026 (copper and brass); June 15, 2026 (high-carbon-steel engrave/clean/polish); October 27, 2026 (high-carbon-steel 3D depth map).

## Contents

- [Quick Reference](#quick-reference)
- [Workflow Types](#workflow-types)
- [Shared Cleaning Pen Settings](#shared-cleaning-pen-settings)
- [Copper](#copper)
- [Brass](#brass)
- [High Carbon Steel](#high-carbon-steel)
  - [3D Depth Map: Clean Relief](#3d-depth-map-clean-relief)
  - [2D Engrave, Clean & Polish](#2d-engrave-clean--polish)

---

## Quick Reference

| Material / method | Depth process | Finishing process |
| :--- | :--- | :--- |
| Copper, conventional hatch | 16 sets of 20 engrave passes + 1 clean pass | Blackening hatch |
| Brass, conventional hatch | 16 sets of 5 engrave passes + 1 clean pass | Blackening hatch |
| High carbon steel, conventional hatch | 8–24 sets of 20 engrave passes + 1 clean pass | 32-pass polish hatch |
| **High carbon steel, 3D depth map** | **416 complete EZCAD3 slices, one bidirectional hatch per slice** | **No laser cleaning or finishing passes** |

For the clean steel 3D relief, the primary settings are **1800 mm/s, 67.5% power, 75 kHz, 100 ns, 0.020 mm hatch spacing, and 68.77° rotation per slice**. See [the full 3D setup](#3d-depth-map-clean-relief).

LPI (lines per inch) is calculated as `25.4 ÷ line spacing (mm)`.

## Workflow Types

The conventional hatch workflow and the 3D depth-map workflow are separate processes. Do not carry cleaning/finishing passes or hatch counts from one into the other.

### Conventional engrave, clean & finish

Copper, brass, and the earlier high-carbon-steel process use paired **Engrave + Clean** hatches. Repeat the pair to build depth, then run the material-specific blackening or polishing hatch once. A hatch `Count` of 20 means 20 marking passes through that hatch, not 20 individual scan lines.

Common hatch options for those conventional layers, unless specified otherwise:

- `Enable` and `All calc`: enabled.
- `Mark Contour`, `Contour prior`, `Follow edge once`, `Cross hatch`, and `Average distribute line`: disabled.
- Primary engrave hatches use 68.75° auto-rotation. A bidirectional hatch at 0° is geometrically equivalent to 180°; 68.75° yields 144 distinct directions before repeating. Cleaning hatches use a fixed 0° unless otherwise noted.

### EZCAD3 sliced 3D depth map

For the clean high-carbon-steel relief, EZCAD3 generates a complete stack of slices from the grayscale heightmap. Each slice uses **one bidirectional hatch**, with the hatch angle advanced by **68.77° per slice**. EZCAD3 automatically advances the programmed Z position through the sliced model.

The 416 slices are **not** a hatch `Count` of 416, nor are they 416 repetitions of an engrave/clean pair. All 416 slices are engraved. There are no separate laser cleaning or finishing passes.

---

## Shared Cleaning Pen Settings

These values apply to the conventional **Copper Clean**, **Brass Clean**, and **High Carbon Steel Clean** hatches. They are not used in the clean 3D depth-map process.

| Parameter | Value |
| :--- | :--- |
| Mark speed | 4000 mm/s |
| Frequency | 125 kHz |
| Power | 15% |
| Pulse width | 80 ns |

---

## Copper

### Phase 1: Depth (Engrave + Clean Hatch Set)

| Parameter | Value |
| :--- | :--- |
| **Repetitions** | 16 |
| **Engrave hatch** | Copper Engrave, count 20 per repetition (320 total) |
| **Clean hatch** | Copper Clean, count 1 per repetition (16 total) |

#### Copper Engrave

**Pen**

| Parameter | Value |
| :--- | :--- |
| **Mark speed** | 2400 mm/s |
| **Frequency** | 96 kHz |
| **Power** | 45% |
| **Pulse width** | 100 ns |

**Hatch**

| Parameter | Value |
| :--- | :--- |
| **Pattern** | Bidirectional |
| **Count** | 20 |
| **Line space** | 0.04 mm (635 LPI) |
| **Auto rotate hatch angle** | 68.75° |

#### Copper Clean

Uses the [shared cleaning pen settings](#shared-cleaning-pen-settings).

**Hatch**

| Parameter | Value |
| :--- | :--- |
| **Pattern** | Bidirectional |
| **Count** | 1 |
| **Line space** | 0.025 mm (1016 LPI) |
| **Angle** | 0° |

### Phase 2: Blackening

#### Copper Black

**Pen**

| Parameter | Value |
| :--- | :--- |
| **Mark speed** | 250 mm/s |
| **Frequency** | 75 kHz |
| **Power** | 40% |
| **Pulse width** | 200 ns |

**Hatch**

| Parameter | Value |
| :--- | :--- |
| **Pattern** | Unidirectional |
| **Count** | 1 |
| **Line space** | 0.005 mm (5080 LPI) |
| **Angle** | 30° |

---

## Brass

### Phase 1: Depth (Engrave + Clean Hatch Set)

| Parameter | Value |
| :--- | :--- |
| **Repetitions** | 16 |
| **Engrave hatch** | Brass Engrave, count 5 per repetition (80 total) |
| **Clean hatch** | Brass Clean, count 1 per repetition (16 total) |

#### Brass Engrave

**Pen**

| Parameter | Value |
| :--- | :--- |
| **Mark speed** | 1500 mm/s |
| **Frequency** | 67 kHz |
| **Power** | 30% |
| **Pulse width** | 500 ns |

**Hatch**

| Parameter | Value |
| :--- | :--- |
| **Pattern** | Bidirectional |
| **Count** | 5 |
| **Line space** | 0.04 mm (635 LPI) |
| **Auto rotate hatch angle** | 68.75° |

#### Brass Clean

Uses the [shared cleaning pen settings](#shared-cleaning-pen-settings).

**Hatch**

| Parameter | Value |
| :--- | :--- |
| **Pattern** | Bidirectional |
| **Count** | 1 |
| **Line space** | 0.05 mm (508 LPI) |
| **Angle** | 0° |

### Phase 2: Blackening

#### Brass Black

**Pen**

| Parameter | Value |
| :--- | :--- |
| **Mark speed** | 80 mm/s |
| **Frequency** | 50 kHz |
| **Power** | 27% |
| **Pulse width** | 200 ns |

**Hatch**

| Parameter | Value |
| :--- | :--- |
| **Pattern** | Bidirectional |
| **Count** | 1 |
| **Line space** | 0.01 mm (2540 LPI) |
| **Angle** | 45° |

---

---

## High Carbon Steel

The conventional settings below were used on 4 mm+ **1095** and **80CrV2** stock. The newer 3D settings were developed for a full sculptural relief on high-carbon-steel bar stock. Results may vary between bars, even at identical laser settings.

For through-cutting 3.0–4.5 mm high-carbon steel, see [Cutting High Carbon Steel](./cutting_high_carbon_steel.md).

### 3D Depth Map: Clean Relief

*Recorded October 27, 2026. Visually successful full mountain-man bas-relief.*

This process was selected to preserve convex contours, fine feather and beard detail, and a comparatively clean recessed field while minimizing the raised-edge reflow seen with longer pulses. The final full engraving was not depth-measured, to avoid marking its finished recessed background.

#### Pen and hatch settings

| Parameter | Setting |
| :--- | :--- |
| EZCAD3 object | 3D sliced tangent (grayscale depth map) |
| Mark speed | **1800 mm/s** |
| Power | **67.5%** |
| Frequency | **75 kHz** |
| Pulse width | **100 ns** |
| Pattern | Bidirectional, single hatch |
| Hatch count | 1 per slice |
| Line spacing | **0.020 mm (1270 LPI)** |
| Auto-rotate hatch angle | **68.77° per slice** |
| Complete slices | **416** |
| Target model Z range | 0.500 mm |
| Cross hatch | Off |
| Cleaning passes | None |
| Finishing/polishing passes | None |

Run the **complete 416-slice stack**, not only the first 416 slices of a larger stack. EZCAD3 advances the programmed Z position per slice automatically. The programmed model depth and slice count do not guarantee the same physical material removal on every steel bar.

#### Why 75 kHz?

The 75 kHz setting is **intentional**: at 100 ns it operates in the JPT M7's reduced-average-power (down-power) range, below the nominal full-power cutoff frequency. It is not a mistaken frequency entry.

In controlled tests on a *different* steel bar, using the same 8.892 mm relief crop, 256 complete slices, 100 ns, 67.5% power, 1800 mm/s, 0.020 mm spacing, and 68.77° rotation, frequency affected both depth and surface appearance:

| Frequency | Measured removal, 256 slices |
| :--- | ---: |
| 75 kHz | 0.270 mm |
| 100 kHz | 0.360 mm |
| 120 kHz | 0.420 mm |
| 160 kHz | 0.710 mm |

Higher frequency increased removal, but the 160 kHz sample was visibly much rougher. The 75 kHz test was preferred for clarity and detail, so depth was developed by increasing the number of complete slices instead of forcing frequency upward. These measurements are from the test bar and should **not** be taken as calibrated depths for the finished full portrait on the other bar.

#### Result and scope

The full-portrait result retained fine braids, feather, facial features, beard, and fur, with a clean convex claw profile and no separate laser clean or polish operation. The actual finished depth was **not measured**. Record new material batches and geometry separately rather than treating 416 slices as a universal 0.5 mm recipe.

### 2D Engrave, Clean & Polish

*Recorded June 15, 2026. Conventional repeated hatch workflow, retained for reference.*

This is a different process from the 3D depth-map settings above.

#### Phase 1: Depth (Engrave + Clean Hatch Set)

| Parameter | Value |
| :--- | :--- |
| Engrave hatch | High Carbon Steel Engrave, count 20 per repetition |
| Clean hatch | High Carbon Steel Clean, count 1 per repetition |

Repeat the paired engrave + clean hatch set for the desired depth (see [Material Removal](#material-removal)), then run [Phase 2: Polish](#phase-2-polish) once.

##### High Carbon Steel Engrave

**Pen**

| Parameter | Value |
| :--- | :--- |
| Mark speed | 2400 mm/s |
| Frequency | 96 kHz |
| Power | 45% |
| Pulse width | 200 ns |

**Hatch**

| Parameter | Value |
| :--- | :--- |
| Pattern | Bidirectional |
| Count | 20 |
| Line space | 0.04 mm (635 LPI) |
| Auto rotate hatch angle | 68.75° |

##### High Carbon Steel Clean

Uses the [shared cleaning pen settings](#shared-cleaning-pen-settings).

**Hatch**

| Parameter | Value |
| :--- | :--- |
| Pattern | Bidirectional |
| Count | 1 |
| Line space | 0.05 mm (508 LPI) |
| Angle | 0° |

#### Material Removal

All values below are total material removed relative to untreated stock. Each test repeated the paired Engrave + Clean hatches for the count shown and then used 32 polish passes once. These results apply to the conventional workflow, **not** the 3D sliced depth-map workflow.

| Engrave + Clean repetitions | Material removed (mm) |
| :--- | ---: |
| 8 | 0.22 |
| 12 | 0.31 |
| 16 | 0.37 |
| 20 | 0.39 |
| 24 | 0.47 |

#### Phase 2: Polish

The conventional polish hatch smooths pitting in the bottom of the engrave and leaves a bluish annealing color on the marked surface. Defocus this polish layer by **2 mm**.

On thinner stock (1.8 mm or 1/16"), annealing color can appear on the *opposite* side at 32 polish passes, but not at 16. That has not been observed on the thicker 4 mm+ stock used for these settings.

##### High Carbon Steel Polish

**Pen**

| Parameter | Value |
| :--- | :--- |
| Mark speed | 3500 mm/s |
| Frequency | 3500 kHz |
| Power | 70% |
| Pulse width | 2 ns |

**Hatch**

| Parameter | Value |
| :--- | :--- |
| Pattern | Bidirectional |
| Count | 32 |
| Line space | 0.025 mm (1016 LPI) |
| Angle | 30° |
| Auto rotate hatch angle | 68.75° |
