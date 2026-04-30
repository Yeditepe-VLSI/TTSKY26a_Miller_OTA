<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This project features a Unity-Gain Buffer based on a Two-Stage Miller OTA, integrated with a Beta-Multiplier Reference (BMR) and a Startup Circuit, all implemented in the Skywater 130nm (sky130) PDK.
1. Unity-Gain Configuration & Open-Loop GainAt its core, the Two-Stage Miller OTA provides a high open-loop gain of over 60 dB. To create the buffer configuration, the inverting input is directly hardwired to the output ($V_{out}$) in a strict negative feedback loop. This transforms the internal differential amplifier into a single-input, single-output voltage follower.Precision Tracking: The >60 dB open-loop gain minimizes the steady-state error, ensuring the closed-loop voltage gain is extremely close to unity ($A_v \approx 1$). The output accurately tracks the non-inverting input.Load Drive Capability: The transconductance ($g_m$) of the second stage and the compensation network are carefully sized to stably drive a 3 pF capacitive load without degrading performance.

2. Miller Compensation & StabilityDriving a capacitive load in a unity-gain configuration is the most demanding condition for stability. To address this:Pole-Splitting: A Miller compensation capacitor is placed between the differential input stage and the common-source gain stage. This pushes the non-dominant pole to higher frequencies, securing an adequate phase margin to prevent oscillation or excessive ringing at the output.

3. Self-Biasing (BMR & Startup)The circuit is entirely self-contained and does not require an external bias current source:Beta-Multiplier Reference (BMR): Internally generates a stable reference current ($I_{ref}$), rendering the OTA's biasing largely independent of supply voltage ($V_{DD}$) variations.Startup Circuit: Guarantees that upon power-up, the BMR is forced out of its degenerate zero-current state and reliably reaches its target operating point immediately as the 1.8V power rail stabilizes.

The entire system is optimized for the TinyTapeout platform, focusing on robust analog performance and layout efficiency within the 1.8V domain.

## How to test

To verify the buffer's performance and stability:
Load Setup: Ensure a 3 pF capacitive load is connected to the output pin (accounting for any parasitic capacitance from probes or traces).
Pulse & Transient Test:Apply a pulse signal at the single input pin with an amplitude ranging from 0.5V to 1.0V.Run a 1 $\nu$s transient test to observe the slewing and settling behavior.
Verify that the output accurately follows the input without sustained ringing, confirming the 60+ dB precision and the stability of the compensation network under load.Power-Up Test: Ramp the $V_{DD}$ from 0V to 1.8V to confirm the Startup Circuit successfully initializes the BMR.


## External hardware

Signal Generator / Oscillator: To provide the 0.5V - 1.0V pulse and AC input signals.

DC Power Supply: Stable 1.8V source for the VDD rail.

Oscilloscope: To simultaneously monitor the input and output waveforms, confirming tracking accuracy and settling time.

Capacitor: A discrete 3 pF capacitor acting as the load.

Multimeter: For observing DC bias levels and verifying total current consumption.
