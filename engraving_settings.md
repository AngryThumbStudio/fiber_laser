# Known Engraving Settings (Copper & Brass)

> **Important:** These settings were developed on a **JPT M7 MOPA 100W (YDFLP-100-M7-M-R)** laser source with an **F160Q / 110 mm** fused quartz lens, using **BJJCZ EZCAD3**. They are shared as a reference for what works on this specific machine, not as universal recommendations.
>
> There is **no guarantee** these values will produce the same results on other hardware, optics, or controllers. More efficient combinations may exist for engraving depth, surface finish, or laser blackening/oxidation. These are the settings that work here and, when the engrave + clean hatch set is repeated as noted below, achieve **upward of 0.7 mm** of depth.
>
> To adapt pulse-related parameters for a different MOPA source, see the [fiber laser pulse parameter converter](https://acedapig.github.io/fiber-laser-pulse-calc/).

Settings captured: **2026-06-07**

## Contents

* [At a Glance](#at-a-glance)
* [Workflow](#workflow)
* [Shared Pen Settings](#shared-pen-settings)
* [Copper](#copper)
* [Brass](#brass)

---

## At a Glance

| | Copper | Brass |
| :--- | :--- | :--- |
| **Hatch set repetitions** | 16 | 16 |
| **Engrave → Clean count** | 20 → 1 | 5 → 1 |
| **Engrave speed** | 2400 mm/s | 1500 mm/s |
| **Engrave frequency** | 96 kHz | 67 kHz |
| **Engrave power** | 45% | 30% |
| **Engrave pulse width** | 100 ns | 500 ns |
| **Engrave line space** | 0.04 mm (635 LPI) | 0.04 mm (635 LPI) |
| **Clean line space** | 0.025 mm (1016 LPI) | 0.05 mm (508 LPI) |
| **Black speed** | 250 mm/s | 80 mm/s |
| **Black frequency** | 75 kHz | 50 kHz |
| **Black power** | 40% | 27% |
| **Black pulse width** | 200 ns | 200 ns |
| **Black line space** | 0.005 mm (5080 LPI) | 0.01 mm (2540 LPI) |

LPI (lines per inch) is calculated as `25.4 ÷ line spacing (mm)`.

---

## Workflow

Each material uses three pen setting groups: **Engrave**, **Clean**, and **Black** (blackening/oxidation). Pen parameters are listed from saved EZCAD3 pen settings.

1. **Depth:** Repeat the **Engrave + Clean** hatch set (see each material section) **16 times**. Each repetition runs the engrave hatch first, then the clean hatch.
2. **Blackening:** Run the black pen + hatch once after depth passes are complete.

**Engrave** and **Clean** hatches are always paired as a two-layer set. The engrave and clean **Count** values define how many hatch lines run per layer within each repetition (for example, copper runs 20 engrave lines, then 1 clean line, before the next repetition).

Common hatch defaults used across these layers unless noted otherwise:

* **Enable** and **All calc:** checked
* **Mark Contour**, **Contour prior**, **Follow edge once**, **Cross hatch**, **Average distribute line:** unchecked

**Auto rotate hatch angle (68.75°):** Both engrave hatches use this rotation step. For bidirectional hatching, **0° and 180° produce the same fill**, so only half of a full rotation (0° to 180°) counts as a unique angle. Stepping by 68.75° gives **144 passes** before the angle repeats (`144 × 68.75° = 9900°`, which is **180° mod 360°**, equivalent to 0°). That avoids repeating hatch angles too soon during long engrave runs.

---

## Shared Pen Settings

**Copper Clean** and **Brass Clean** use the same pen values:

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
