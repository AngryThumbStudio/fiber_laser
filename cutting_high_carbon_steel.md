# Cutting 3.0–4.5 mm High Carbon Steel

> **Important:** These settings were developed on a **JPT M7 MOPA 100W (YDFLP-100-M7-M-R)** laser source with a **110 mm** fused quartz lens, using **BJJCZ EZCAD3**. They are shared as a validated baseline for this machine, not as universal recommendations.
>
> There is **no guarantee** these values will produce the same results on other hardware, optics, or controllers.

**Validated:** 2026-07-26 on **4.2 mm** high carbon steel. Full penetration in a single session; part released with a light tap. Treat as a baseline for roughly **3.0–4.5 mm** stock.

For surface engraving and polish parameters on the same material family, see [Known Engraving Settings](./engraving_settings.md#high-carbon-steel).

## Contents

* [Validated Parameters](#validated-parameters)
* [Hatch Setup](#hatch-setup)
* [Kerf Geometry](#kerf-geometry)
* [4.2 mm Focus Schedule](#42-mm-focus-schedule)
* [Process Philosophy](#process-philosophy)
* [Bottom Sparking](#bottom-sparking)
* [Thermal Management](#thermal-management)
* [Applying to Other Thicknesses](#applying-to-other-thicknesses)
* [Practical Recommendations](#practical-recommendations)
* [Future Improvements](#future-improvements)

---

## Validated Parameters

| Parameter | Value |
| :--- | :--- |
| **Power** | 100% |
| **Speed** | 100 mm/s |
| **Frequency** | 67 kHz |
| **Pulse width** | 500 ns |
| **Lens** | 110 mm |
| **Air assist** | ~90 CFM |
| **Exhaust** | ~400 CFM |

---

## Hatch Setup

All focus steps used the same hatch configuration. No separate cleaning passes were applied.

| Parameter | Value |
| :--- | :--- |
| **Pattern** | Ring-Like Hatch |
| **Line space** | 0.04 mm |
| **Hatch Count** | 20 |
| **Follow edge once** | Enabled |

**Follow edge once** runs one outline after each block of **20** hatch lines (the hatch Count). That was intended to periodically clear the kerf edges; whether it helped is unknown.

### Repeating hatch sets with Object Property A

EZCAD3 Object Properties show position values for **X**, **Y**, **Z**, and **A**. With Axis Solution set to **Z only** (rotary / ZA disabled), the **A** object is unused for motion. Its **Count** parameter can then repeat the hatch set without changing the hatch Count itself.

Pass totals in the focus schedule are **Hatch Count × Object A Count**. Hatch Count stayed at **20**; Object A Count set how many times that hatch block (plus its follow-edge outline) repeated:

| Schedule “Hatch Passes” | Hatch Count | Object A Count |
| ---: | ---: | ---: |
| 40 | 20 | 2 |
| 80 | 20 | 4 |
| 120 | 20 | 6 |
| 160 | 20 | 8 |
| 320 | 20 | 16 |

---

## Kerf Geometry

The programmed inside/outside contour spacing is **not** the same as the radial kerf.

| Programmed Diameter Difference | Actual Radial Kerf |
| ---: | ---: |
| 0.250 mm | 0.125 mm |
| 0.375 mm | 0.1875 mm |
| 0.400 mm | 0.200 mm |

The successful complex-profile test used a **0.400 mm programmed offset**, producing a **0.200 mm radial kerf**. Prefer a wider programmed offset over an extremely narrow kerf.

---

## 4.2 mm Focus Schedule

Run focus steps in order. Most productive cutting occurred between **-3.0 mm** and **-3.5 mm**. Hatch Passes = Hatch Count × Object A Count (Hatch Count fixed at 20; see [Hatch Setup](#hatch-setup)).

| Focus (mm) | Hatch Passes | Object A Count | Notes |
| ---: | ---: | ---: | :--- |
| 0.0 | 40 | 2 | Establish kerf |
| -1.0 | 40 | 2 | |
| -2.0 | 80 | 4 | |
| -2.5 | 80 | 4 | |
| -3.0 | 120 | 6 | Prepare lower kerf |
| -3.5 | 120 | 6 | |
| -4.0 | 160 | 8 | |
| -4.5 | 80 | 4 | |
| -3.0 | 120 | 6 | Return for breakthrough |
| -3.0 | 80 | 4 | Continue |
| -3.5 | 160–320 | 8–16 | Finish (geometry dependent) |

---

## Process Philosophy

1. **Establish the kerf** — 0 to -2.5 mm.
2. **Prepare the lower kerf** — -3.0 to -4.5 mm.
3. **Breakthrough and finish** — return to -3.0 and -3.5 mm.

Concentrate cutting energy at **-3.0 mm** and **-3.5 mm**. Preserve registration until cutting is complete.

---

## Bottom Sparking

Underside sparking is the primary process feedback. Observed progression:

1. No sparking
2. Localized sparking
3. Partial outline sparking
4. Intermittent sparking around the full outline
5. Consistent sparking around the full outline
6. Part releases with a light tap

**Stopping criterion:** consistent underside sparking around the complete outline. Expect full penetration before the part necessarily falls free — a light tap after consistent sparking is a successful result.

---

## Thermal Management

- Long continuous cutting is limited by **source temperature**, not enclosure temperature.
- Source thermal history matters more than ambient shop temperature.
- Under hot summer shop conditions, roughly **7-minute cutting blocks** were repeatable.
- Longer blocks are practical from a cool source, but should not be stacked without recovery time.

---

## Applying to Other Thicknesses

| Thickness | Guidance |
| :--- | :--- |
| **3.0 mm** | Reduce total passes. Emphasize -2.5 to -3.5 mm. |
| **3.5 mm** | Similar approach with moderately reduced finishing. |
| **4.0 mm** | Very similar to the validated process. |
| **4.5 mm** | Start with the validated schedule; increase finishing passes before going significantly deeper. |

---

## Practical Recommendations

- Use a wider programmed offset instead of an extremely narrow kerf.
- Concentrate cutting energy at -3.0 mm and -3.5 mm.
- Preserve registration until cutting is complete.
- Use underside sparking as the primary process feedback.
- Expect complete penetration before the part necessarily falls free.
- A light tap after consistent sparking is a successful result.

---

## Future Improvements

Focus future optimization on:

- Reducing cycle time
- Reducing dross
- Improving source cooling
- Refining pass schedules by material thickness
- Scaling pass counts based on total cut length rather than thickness alone
