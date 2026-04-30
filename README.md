![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg)

#  Sky130 Self-Biased Miller OTA Unity-Gain Buffer

- [Read the documentation for project](docs/info.md)

## What is Tiny Tapeout?

Tiny Tapeout is an educational project that aims to make it easier and cheaper than ever to get your digital designs manufactured on a real chip.

To learn more and get started, visit https://tinytapeout.com.

## Analog projects

For specifications and instructions, see the [analog specs page](https://tinytapeout.com/specs/analog/).

---

## Project Overview

This project features a **Unity-Gain Buffer** based on a **Two-Stage Miller OTA**, integrated with a **Beta-Multiplier Reference (BMR)** and a **Startup Circuit**, all implemented in the **Skywater 130nm (sky130)** PDK. 

### Performance Metrics (Simulated)
*   **Open-Loop Gain:** > 60 dB
*   **Phase Margin:** > 65 degrees
*   **Power Consumption:** [X uW]
*   **Slew Rate:** [X V/µs]
*   **Target Load:** 3 pF

### Pinout Configuration
Please refer to the following analog pin assignments for testing:
*   **Analog Input ($V_{in}$):** `[ua[0]]`
*   **Analog Output ($V_{out}$):** `[ua[1]]`

---

## How it works

### 1. Unity-Gain Configuration & Open-Loop Gain
At its core, the Two-Stage Miller OTA provides a high **open-loop gain of over 60 dB**. To create the buffer configuration, the inverting input is directly hardwired to the output ($V_{out}$) in a strict negative feedback loop. This transforms the internal differential amplifier into a **single-input, single-output** voltage follower.
*   **Precision Tracking:** The >60 dB open-loop gain minimizes the steady-state error, ensuring the closed-loop voltage gain is extremely close to unity ($A_v \approx 1$). The output accurately tracks the non-inverting input.
*   **Load Drive Capability:** The transconductance ($g_m$) of the second stage and the compensation network are carefully sized to **stably drive a 3 pF capacitive load** without degrading performance.

### 2. Miller Compensation & Stability
Driving a capacitive load in a unity-gain configuration is the most demanding condition for stability. To address this:
*   **Lead Compensation** A Miller compensation capacitor and a resistor is placed between the differential input stage and the common-source gain stage. This pushes the non-dominant pole to higher frequencies, securing an adequate phase margin to prevent oscillation or excessive ringing at the output.

### 3. Self-Biasing (BMR & Startup)
The circuit is entirely self-contained and does not require an external bias current source:
*   **Beta-Multiplier Reference (BMR):** Internally generates a stable reference current ($I_{ref}$), rendering the OTA's biasing largely independent of supply voltage ($V_{DD}$) variations.
*   **Startup Circuit:** Guarantees that upon power-up, the BMR is forced out of its degenerate zero-current state and reliably reaches its target operating point immediately as the 1.8V power rail stabilizes.

The entire system is optimized for the **TinyTapeout** platform, focusing on stable analog performance and layout efficiency within the 1.8V domain.

## How to test

To verify the buffer's performance and stability:

*   **Load Setup:** Ensure a **3 pF capacitive load** is connected to the output pin (accounting for any parasitic capacitance from probes or traces).
*   **Pulse & Transient Test:** 
    *   Apply a pulse signal at the input pin (`?`) with an amplitude ranging from **0.4V to 1.0V**.
    *   Run a **1 $\mu$s transient test** to observe the slewing and settling behavior. 
    *   Verify that the output accurately follows the input without sustained ringing, confirming the 60+ dB precision and the stability of the compensation network under load.
*   **Power-Up Test:** Ramp the $V_{DD}$ from 0V to 1.8V to confirm the **Startup Circuit** successfully initializes the BMR.

## External hardware

To fully test this project on a physical bench, the following equipment is required:

*   **Signal Generator / Oscillator:** To provide the 0.4V - 1.0V pulse and AC input signals.
*   **DC Power Supply:** Stable 1.8V source for the VDD rail.
*   **Oscilloscope:** To simultaneously monitor the input and output waveforms, confirming tracking accuracy and settling time.
*   **Capacitor:** A discrete **3 pF capacitor** acting as the load.
*   **Multimeter:** For observing DC bias levels and verifying total current consumption.

---

## Enable GitHub actions to build the results page

- [Enabling GitHub Pages](https://tinytapeout.com/faq/#my-github-action-is-failing-on-the-pages-part)

## Resources

**Project References:**
- [Analog Integrated Circuit Design by Simulation: Techniques, Tools, and Methods](https://www.mheducation.com/highered/mhp/product/analog-integrated-circuit-design-simulation-techniques-tools-methods?pd=search&viewOption=student) - Uğur Çilingiroğlu
- [Design of Analog CMOS Integrated Circuits](https://www.mheducation.com/highered/product/design-analog-cmos-integrated-circuits-razavi/M9780072524932.html) - Behzad Razavi

**Tiny Tapeout Resources:**
- [FAQ](https://tinytapeout.com/faq/)
- [Digital design lessons](https://tinytapeout.com/digital_design/)
- [Learn how semiconductors work](https://tinytapeout.com/siliwiz/)
- [Join the community](https://tinytapeout.com/discord)

## What next?

- [Submit your design to the next shuttle](https://app.tinytapeout.com/).
- Share your project on your social network of choice:
  - LinkedIn [#tinytapeout](https://www.linkedin.com/search/results/content/?keywords=%23tinytapeout) [@TinyTapeout](https://www.linkedin.com/company/100708654/)
  - Mastodon [#tinytapeout](https://chaos.social/tags/tinytapeout) [@matthewvenn](https://chaos.social/@matthewvenn)
  - X (formerly Twitter) [#tinytapeout](https://twitter.com/hashtag/tinytapeout) [@tinytapeout](https://twitter.com/tinytapeout)
  - Bluesky [@tinytapeout.com](https://bsky.app/profile/tinytapeout.com)
