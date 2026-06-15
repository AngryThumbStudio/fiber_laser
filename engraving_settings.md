# Known Engraving Settings (Copper, Brass & High Carbon Steel)

> **Important:** These settings were developed on a **JPT M7 MOPA 100W (YDFLP-100-M7-M-R)** laser source with an **F160Q / 110 mm** fused quartz lens, using **BJJCZ EZCAD3**. They are shared as a reference for what works on this specific machine, not as universal recommendations.
>
> There is **no guarantee** these values will produce the same results on other hardware, optics, or controllers. More efficient combinations may exist for engraving depth, surface finish, or laser blackening/oxidation. These are the settings that work here and, when the engrave + clean hatch set is repeated as noted below, achieve **upward of 0.7 mm** of depth.
>
> To adapt pulse-related parameters for a different MOPA source, see the [fiber laser pulse parameter converter](https://acedapig.github.io/fiber-laser-pulse-calc/).

Settings captured: **2026-06-07** (copper & brass), **2026-06-15** (high carbon steel)

## Contents

* [At a Glance](#at-a-glance)
* [Workflow](#workflow)
* [Shared Pen Settings](#shared-pen-settings)
* [Copper](#copper)
* [Brass](#brass)
* [High Carbon Steel](#high-carbon-steel)

---

## At a Glance

| | Copper | Brass | High Carbon Steel |
| :--- | :--- | :--- | :--- |
| **Hatch set repetitions** | 16 | 16 | 8–24 (see [removal table](#material-removal)) |
| **Engrave → Clean count** | 20 → 1 | 5 → 1 | 20 → 1 |
| **Engrave speed** | 2400 mm/s | 1500 mm/s | 2400 mm/s |
| **Engrave frequency** | 96 kHz | 67 kHz | 96 kHz |
| **Engrave power** | 45% | 30% | 45% |
| **Engrave pulse width** | 100 ns | 500 ns | 200 ns |
| **Engrave line space** | 0.04 mm (635 LPI) | 0.04 mm (635 LPI) | 0.04 mm (635 LPI) |
| **Clean line space** | 0.025 mm (1016 LPI) | 0.05 mm (508 LPI) | 0.05 mm (508 LPI) |
| **Finish pass** | Black (×1) | Black (×1) | Polish (32 count) |
| **Finish speed** | 250 mm/s | 80 mm/s | 3500 mm/s |
| **Finish frequency** | 75 kHz | 50 kHz | 3500 kHz |
| **Finish power** | 40% | 27% | 70% |
| **Finish pulse width** | 200 ns | 200 ns | 2 ns |
| **Finish line space** | 0.005 mm (5080 LPI) | 0.01 mm (2540 LPI) | 0.025 mm (1016 LPI) |

LPI (lines per inch) is calculated as `25.4 ÷ line spacing (mm)`.

---

## Workflow

Each material uses three pen setting groups. Copper and brass use **Engrave**, **Clean**, and **Black** (blackening/oxidation). High carbon steel uses **Engrave**, **Clean**, and **Polish**. Pen parameters are listed from saved EZCAD3 pen settings.

1. **Depth:** Repeat the **Engrave + Clean** hatch set (see each material section). Each repetition runs the engrave hatch first, then the clean hatch. Copper and brass use **16** repetitions; high carbon steel repetition counts are listed in [Material Removal](#material-removal).
2. **Finish:** Run the black pen + hatch once after depth passes are complete (copper & brass), or run the polish pen + hatch once with a fixed **32** hatch count (high carbon steel).

**Engrave** and **Clean** hatches are always paired as a two-layer set. The engrave and clean **Count** values define how many hatch lines run per layer within each repetition (for example, copper runs 20 engrave lines, then 1 clean line, before the next repetition).

Common hatch defaults used across these layers unless noted otherwise:

* **Enable** and **All calc:** checked
* **Mark Contour**, **Contour prior**, **Follow edge once**, **Cross hatch**, **Average distribute line:** unchecked

**Auto rotate hatch angle (68.75°):** Both engrave hatches use this rotation step. For bidirectional hatching, **0° and 180° produce the same fill**, so only half of a full rotation (0° to 180°) counts as a unique angle. Stepping by 68.75° gives **144 passes** before the angle repeats (`144 × 68.75° = 9900°`, which is **180° mod 360°**, equivalent to 0°). That avoids repeating hatch angles too soon during long engrave runs.

---

## Shared Pen Settings

**Copper Clean**, **Brass Clean**, and **High Carbon Steel Clean** use the same pen values:

| Parameter | Value |
| :--- | :--- |
| **Mark speed** | 4000 mm/s |
| **Frequency** | 125 kHz |
| **Power** | 15% |
| **Pulse width** | 80 ns |

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

Uses the [shared clean pen settings](#shared-pen-settings).

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

Uses the [shared clean pen settings](#shared-pen-settings).

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

## High Carbon Steel

These settings are typically used on **4 mm+** thick **1095** and **80CrV2** stock. The notes below reflect this machine and material only.

### Phase 1: Depth (Engrave + Clean Hatch Set)

| Parameter | Value |
| :--- | :--- |
| **Engrave hatch** | High Carbon Steel Engrave, count 20 per repetition |
| **Clean hatch** | High Carbon Steel Clean, count 1 per repetition |

Repeat the engrave + clean hatch set for the desired depth (see [Material Removal](#material-removal)), then run [Phase 2: Polish](#phase-2-polish) once.

#### High Carbon Steel Engrave

**Pen**

| Parameter | Value |
| :--- | :--- |
| **Mark speed** | 2400 mm/s |
| **Frequency** | 96 kHz |
| **Power** | 45% |
| **Pulse width** | 200 ns |

**Hatch**

| Parameter | Value |
| :--- | :--- |
| **Pattern** | Bidirectional |
| **Count** | 20 |
| **Line space** | 0.04 mm (635 LPI) |
| **Auto rotate hatch angle** | 68.75° |

#### High Carbon Steel Clean

Uses the [shared clean pen settings](#shared-pen-settings).

**Hatch**

| Parameter | Value |
| :--- | :--- |
| **Pattern** | Bidirectional |
| **Count** | 1 |
| **Line space** | 0.05 mm (508 LPI) |
| **Angle** | 0° |

### Material Removal

All values are **total material removed** relative to untreated stock (no laser passes). Each test ran the full workflow: repeat the **Engrave + Clean** hatch set (engrave and clean passes together) for the count shown, then run **32** polish passes once. Polish settings were fixed; polish hatch count was always **32** and was not repeated as a layer.

| Engrave + Clean repetitions | Material removed (mm) |
| :--- | :--- |
| 8 | 0.22 |
| 12 | 0.31 |
| 16 | 0.37 |
| 20 | 0.39 |
| 24 | 0.47 |

### Phase 2: Polish

The polish pass smooths pitting in the bottom of the engrave and leaves a bluish annealing color on the marked surface.

Defocus the polish layer by **2 mm**.

On thinner stock (**1.8 mm** or **1/16"**), annealing color can appear on the **opposite** side of the piece at **32** polish passes, but not at **16**. That behavior has not been observed on the thicker 4 mm+ stock these settings were developed on.

#### High Carbon Steel Polish

**Pen**

| Parameter | Value |
| :--- | :--- |
| **Mark speed** | 3500 mm/s |
| **Frequency** | 3500 kHz |
| **Power** | 70% |
| **Pulse width** | 2 ns |

**Hatch**

| Parameter | Value |
| :--- | :--- |
| **Pattern** | Bidirectional |
| **Count** | 32 |
| **Line space** | 0.025 mm (1016 LPI) |
| **Angle** | 30° |
| **Auto rotate hatch angle** | 68.75° |
