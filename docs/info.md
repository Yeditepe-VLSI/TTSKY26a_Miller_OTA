<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This project implements a fully integrated Miller Operational Transimpedance Amplifier (OTA) and a Beta-Multiplier Reference (BMR) circuit using the Skywater 130nm (sky130) PDK. The system is designed to be self-biased and stable across process and supply variations.1. Miller OTA ArchitectureThe design follows a classical two-stage topology:Differential Input Stage: A differential pair converts the input voltage difference into a current.Gain Stage: A common-source second stage provides high voltage gain.Miller Compensation: A compensation capacitor is placed across the second stage. This performs pole-splitting, pushing the non-dominant pole to higher frequencies and ensuring a high phase margin for stability.2. Beta-Multiplier Reference (BMR)To provide a stable $I_{ref}$ for the OTA, a Beta-Multiplier circuit is utilized.Unlike simple resistor-based biasing, the BMR generates a reference current that is relatively independent of the supply voltage ($V_{DD}$).The current is defined by the geometric ratios of the transistors and a precision resistor, ensuring the OTA maintains consistent transconductance ($g_m$).3. Startup CircuitSince Beta-Multiplier circuits have two possible operating points (the desired state and a "zero-current" state), a Startup Circuit is integrated.It ensures that when the power is first applied, the circuit is kicked out of the zero-current state and forced into the correct operating region.Once the BMR is active, the startup circuit automatically disconnects itself to prevent interference and minimize power consumption.The entire system is optimized for the TinyTapeout platform, maintaining high layout efficiency and stability under a 1.8V power rail.

##How to test

To verify the performance of the OTA, follow these steps using a transient simulation or physical bench testing:Pulse Response Test:Apply a pulse signal at the input with an amplitude ranging from 0.5V to 1.0V.Run a transient simulation for 1 $\mu$s (with 500ns rise/fall transitions if applicable) to observe the slewing and settling behavior.DC Verification: Sweep the input voltage to determine the input common-mode range (ICMR) and the output swing.AC Analysis: (In simulation) Verify the open-loop gain and phase margin to ensure the Miller compensation is correctly tuned.


##External hardware
To fully test this project on a PCB, the following external equipment is required:

Signal Generator / Oscillator: To provide the AC input source and pulse signals for transient testing.

DC Power Supply: To provide a stable 1.8V VDD and necessary bias voltages.

Multimeter: For checking DC operating points and bias currents.

Oscilloscope: To observe the input/output waveforms and measure settling time during the pulse test.
