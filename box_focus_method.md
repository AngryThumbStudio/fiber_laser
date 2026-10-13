# EZCAD3 Five-Box Focus Calibration Procedure

This procedure describes how I fine-tune the focal position of a fiber laser lens after completing the [Ramp Card Focus Calibration Procedure](ramp_card_method.md). It uses EZCAD3's ability to assign a different Z-index offset to each marking layer, so five focal positions can be compared in a single test.

Unlike the ramp card method, which establishes an approximate focal height, the five-box test is intended to refine that position by looking for a **symmetrical change in marking appearance** on either side of the nominal focus.

## Critical Prerequisite: Precision Galvo Leveling

**Complete [Section 1.4: Precision Galvo Leveling](setup_calibration.md#14-precision-galvo-leveling) before running this procedure.** The lens and galvo assembly must be mechanically squared to the laser bed, and the steel test piece must sit flat and parallel to that bed.

This requirement is particularly important for the five-box method. The squares are distributed horizontally across the marking field, and the test assumes they are all being marked on the **same physical surface plane**. If the lens is tilted relative to the bed, the effective working distance can vary from left to right even though the steel is flat. That positional difference can distort the appearance of the five marks, making a mechanically misaligned system look like a focus-offset problem.

**Do not try to compensate for poor galvo leveling with the material offset.** Correct mechanical alignment first, then use the five-box test to refine the focal height.

## Required Materials

- Fiber laser with the lens being calibrated installed
- EZCAD3 with per-layer Z-index offset control
- A flat piece of scrap steel that sits level on the laser bed
- Five-box marking artwork created in EZCAD3
- A reliable way to measure the thickness of the steel test piece
- A way to record the material offset and final base focus setting

## Purpose

The goal is to identify the position where equal positive and negative Z-index offsets produce approximately matching marks.

When the test is correctly centered:

- **Squares 1 and 5** have approximately the same appearance.
- **Squares 2 and 4** have approximately the same appearance.
- **Square 3** is the center of the visual progression.

The squares should show a reasonably symmetrical change in appearance from the center toward the outer ends of the row. The exact appearance of a mark can vary with the steel and marking parameters, so this method relies on **symmetry**, not on assuming that the darkest square must be the best-focused square.

This test should be performed separately for each lens, after mechanical leveling and the ramp card calibration.

## Understanding the Five-Box Layout

Create five equal-sized squares in a horizontal row, with a small gap between neighboring squares. Assign **each square to its own EZCAD3 marking layer** so that each layer can receive an independent Z-index offset.

Number the squares from left to right:

```text
  Square 1     Square 2     Square 3     Square 4     Square 5
  +-------+    +-------+    +-------+    +-------+    +-------+
  |       |    |       |    |       |    |       |    |       |
  |       |    |       |    |       |    |       |    |       |
  +-------+    +-------+    +-------+    +-------+    +-------+
     -2N          -N            0           +N          +2N
```

**N is the Z-index increment, in millimeters.** Square 3 always has a Z-index offset of zero; the remaining squares sample equally spaced positions on either side.

| Square | Z-index offset | When N = 1.0 mm | When N = 0.5 mm | When N = 0.25 mm |
| :--- | ---: | ---: | ---: | ---: |
| **1 (left)** | -2N | -2.00 mm | -1.00 mm | -0.50 mm |
| **2** | -N | -1.00 mm | -0.50 mm | -0.25 mm |
| **3 (center)** | 0 | 0 mm | 0 mm | 0 mm |
| **4** | +N | +1.00 mm | +0.50 mm | +0.25 mm |
| **5 (right)** | +2N | +2.00 mm | +1.00 mm | +0.50 mm |

I typically begin with **N = 1.0 mm**, then reduce it to **0.5 mm** and, when useful, **0.25 mm** as the focus becomes more closely centered.

These offsets describe the values assigned in EZCAD3. The physical direction associated with a positive or negative Z value depends on the machine's configuration, so verify that behavior on your own setup rather than assuming a universal up/down direction.

## Important Concept: Layer Z-Index vs. Material Offset

The procedure uses two different kinds of offsets, and they have different jobs:

- **Per-layer Z-index offsets** define the relative positions sampled by the five squares. Their values are symmetrical around the center square and remain fixed during a test at a given value of N.
- **Material offset** is initially set to account for the measured thickness of the steel test piece. I then adjust it *between tests* to shift the effective focal position for the entire five-box pattern while leaving the stored base focus position unchanged.

**Do not change the stored base focus position after every test.** Start with the measured test-piece thickness as the material offset, use subsequent material-offset adjustments to refine focus, and update the base position only after calibration is complete.

## Preparing the Test

1. Verify mechanical alignment as described in **[Section 1.4: Precision Galvo Leveling](setup_calibration.md#14-precision-galvo-leveling)**. The galvo/lens assembly must be squared to the laser bed before continuing.
2. Install the lens being calibrated and complete the ramp card focus procedure first. Place a flat piece of scrap steel on the laser bed, keeping it stable and level.
3. Measure the thickness of the test piece, record it, and adjust the EZCAD3 material offset to the material thickness. The final focus reference will need to account for the height of the steel surface above the bed.
4. Create the five squares in EZCAD3, arranged horizontally and separated slightly from one another.
5. Assign each square to a different marking layer.
6. Apply identical marking parameters to all five layers, except for their Z-index offsets.
7. Start with N = 1.0 mm and enter the five offsets shown in the table above.

The squares should be close enough that all five can be compared under similar field conditions, while remaining far enough apart that their marks do not overlap.

## Marking Settings

I run this test on steel using **low laser power, typically below 10%** on my 100 W MOPA fiber laser.

The goal is to produce marks whose appearance changes visibly with small differences in focus. Depending on the steel and the settings, those changes may appear as differences in brightness, darkness, texture, or marking intensity.

Keep speed, frequency, pulse duration, hatch settings, and other marking parameters **the same across all five squares**. Only the Z-index offset should vary from square to square.

If all five marks look nearly identical, the test may not provide enough visual contrast to identify the center. If the marks are too faint to compare, adjust the common marking settings until the variation is readable. Do not tune individual squares separately.

## Running the Test

1. With N set to 1.0 mm, mark all five squares on the steel.
2. Compare the appearance of Square 1 with Square 5 and Square 2 with Square 4.
3. Determine whether the progression is approximately symmetrical around Square 3.
4. If it is not symmetrical, adjust the **material offset**, not the stored focus position.
5. Move to a clean area of the same level steel surface, repeat the five-box test, and compare the results.
6. Continue adjusting the material offset until the pattern is as symmetrical as practical.
7. Reduce N to 0.5 mm, update the five layer offsets, and repeat the process.
8. If useful, reduce N again to 0.25 mm for a final refinement.

At each stage, the center square remains at **Z-index = 0**. It is the material offset that moves the entire range being tested.

## Reading the Result

### What to look for

An ideal result resembles a balanced visual progression, centered on Square 3:

```text
  Square:         1          2          3          4          5
  Z-index:       -2N        -N          0         +N         +2N

  Appearance:     A          B          C          B          A
                  |__________|__________|__________|__________|
                       symmetrical about Square 3
```

Here, **A, B, and C** represent distinguishable marking appearances, not prescribed colors or darkness values.

- **1 matches 5, and 2 matches 4:** The sampled response is approximately centered on Square 3.
- **One side is consistently stronger or cleaner:** The nominal focal position may be off-center. Change the material offset and retest.
- **All five appear the same:** The marking conditions may be too insensitive to changes in focus, or the test range may be too small to show a useful difference.

For a meaningful result, look for both **matching pairs** and an observable progression across the five boxes. Five indistinguishable marks are not, by themselves, evidence of accurate focus.

### Reference Photo: Balanced vs. Unbalanced Focus

<img src="./images/setup-calibration/box_focus_test_comparison.png" width="700" alt="Photograph of five-box focus tests on steel, with the top row labeled Good Focus and two lower rows labeled Too High">

The photograph shows several five-box tests performed on steel. The **top row, labeled Good Focus**, illustrates the more balanced left-to-right marking response being sought. The two rows labeled **Too High** show noticeably unbalanced results, indicating that the nominal focus position was not centered for those trials.

Use this photograph as a **visual comparison**, not as a prescribed darkness pattern. The exact shade of each box depends on the steel, laser settings, and lighting. What matters is whether **Squares 1 and 5** and **Squares 2 and 4** respond similarly, with a discernible progression about Square 3. An uneven pattern can also result from poor galvo alignment or an uneven workpiece, so verify those conditions before treating asymmetry as a focus-height issue.

**If the test remains consistently unbalanced from left to right, recheck the mechanical leveling before making further focus adjustments.** A lens that is not square to the workpiece can create an apparent focus gradient across the row that a material-offset adjustment cannot reliably correct.

### Refining the increment

The initial N = 1.0 mm test compares positions spanning 4 mm from the leftmost to the rightmost square. Each reduction in N narrows the range:

- **N = 1.0 mm:** 4.0 mm total span
- **N = 0.5 mm:** 2.0 mm total span
- **N = 0.25 mm:** 1.0 mm total span

As the increment becomes smaller, the differences between neighboring squares may become subtler. The objective is to find the smallest increment at which I can still make a useful and repeatable comparison.

## Recording the Final Focus Position

Once the five-box pattern is satisfactorily centered at the smallest useful increment, record the **final material offset**.

Because the material offset was **initially set to the steel thickness**, the final value includes that starting workpiece-height allowance as well as any fine-tuning adjustments made during the box tests. It is not necessarily a pure focus correction that can be copied directly into the stored base focus setting.

Before updating the base focus:

1. Record the final material offset.
2. Record the measured thickness of the steel test piece.
3. Separate the initial material-thickness allowance from the fine-tuning adjustment, then translate the result to the reference plane used by the base focus setting. Confirm the machine's Z-axis sign convention before applying the correction.
4. Apply the corrected value to the stored base focus position in EZCAD3.
5. Return the temporary material offset to its normal value, then verify the result if needed.

**Do not apply the entire final material offset as a new base-focus correction.** It already includes the measured steel thickness used at the start of the test. Avoid counting that thickness twice, and check whether the stored focus reference is defined relative to the bed or the workpiece surface.

The goal is to establish a repeatable **base focus** for this lens. Future material-thickness corrections and intentional defocus settings can then be applied relative to that calibrated position.

## Repeat for Each Lens

Repeat the ramp card and five-box procedures separately for every lens.

Each lens has its own working distance and optical behavior. A material offset or base focus correction established for one lens should not be assumed to work with another.

When recording the results, keep the lens identification, steel thickness, final material offset, final base focus value, and smallest useful N increment together so the calibration can be reproduced later.
