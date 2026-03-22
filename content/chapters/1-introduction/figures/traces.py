# /// script
# requires-python = ">=3.13"
# dependencies = [
#     "matplotlib",
#     "numpy",
#     "pandas",
#     "pyqt5>=5.15.11",
# ]
# ///

# This script is designed to generate synthetic neural recording traces for the
# MEG/EEG/ECoG/LFP/spike illustration figures of the Introduction chapter.
import matplotlib
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

matplotlib.use("qt5agg")  # Use Qt5Agg backend for interactive plotting

# Set random seed for reproducible results
np.random.seed(42)

# Time parameters
duration = 2.0  # seconds
sampling_rate = 1000  # Hz
t = np.linspace(0, duration, int(duration * sampling_rate))


# Generate MEG data (femtotesla, fT)
def generate_meg(t):
    """Generate MEG trace with slow, clean frequency content"""
    delta_rhythm = 40 * np.sin(2 * np.pi * 2 * t)  # 2 Hz delta
    theta_rhythm = 30 * np.sin(2 * np.pi * 5 * t)  # 5 Hz theta
    alpha_rhythm = 25 * np.sin(2 * np.pi * 8 * t)  # 8 Hz alpha
    noise = np.random.normal(0, 5, len(t))  # Reduced noise
    return delta_rhythm + theta_rhythm + alpha_rhythm + noise


# Generate EEG data (microvolts, μV)
def generate_eeg(t):
    """Generate EEG trace with slow, clean scalp characteristics"""
    delta_rhythm = 25 * np.sin(2 * np.pi * 1.5 * t)  # 1.5 Hz delta
    theta_rhythm = 20 * np.sin(2 * np.pi * 4 * t)  # 4 Hz theta
    alpha_rhythm = 15 * np.sin(2 * np.pi * 8 * t)  # 8 Hz alpha
    noise = np.random.normal(0, 3, len(t))  # Reduced noise
    return delta_rhythm + theta_rhythm + alpha_rhythm + noise


# Generate ECoG data (microvolts, μV)
def generate_ecog(t):
    """Generate ECoG trace with intermediate frequency content"""
    theta_rhythm = 120 * np.sin(2 * np.pi * 6 * t)  # 6 Hz theta
    alpha_rhythm = 80 * np.sin(2 * np.pi * 12 * t)  # 12 Hz alpha
    beta_rhythm = 60 * np.sin(2 * np.pi * 20 * t)  # 20 Hz beta
    noise = np.random.normal(0, 25, len(t))  # Gaussian noise
    return theta_rhythm + alpha_rhythm + beta_rhythm + noise


# Generate LFP data (microvolts, μV)
def generate_lfp(t):
    """Generate LFP trace with local population activity"""
    slow_wave = 200 * np.sin(2 * np.pi * 3 * t)  # 3 Hz slow wave
    rhythm = 100 * np.sin(2 * np.pi * 12 * t)  # 12 Hz rhythm
    gamma = 80 * np.sin(2 * np.pi * 40 * t)  # 40 Hz gamma
    drift = 50 * t * 0.5  # Slow DC drift
    noise = np.random.normal(0, 30, len(t))  # Gaussian noise
    return slow_wave + rhythm + gamma + drift + noise


# Generate spike data (microvolts, μV)
def generate_spikes(t):
    """Generate individual action potentials"""
    signal = np.random.normal(0, 5, len(t))  # Baseline noise

    # Spike times (in seconds)
    spike_times = [0.3, 0.7, 1.1, 1.4, 1.8]

    for spike_time in spike_times:
        # Find indices around spike time
        spike_idx = int(spike_time * sampling_rate)

        # Generate realistic action potential shape
        # Spike duration: ~3ms
        spike_duration_samples = int(0.003 * sampling_rate)

        for i in range(-spike_duration_samples // 2, spike_duration_samples // 2):
            idx = spike_idx + i
            if 0 <= idx < len(signal):
                dt = i / sampling_rate  # Time relative to spike peak

                if dt >= 0 and dt < 0.001:  # Rising phase (1ms)
                    signal[idx] += 80 * np.exp(-dt / 0.0003)
                elif dt >= 0.001 and dt < 0.003:  # Falling phase (2ms)
                    signal[idx] += -40 * np.exp(-(dt - 0.001) / 0.0005)

    return signal


# Generate all traces
meg_trace = generate_meg(t)
eeg_trace = generate_eeg(t)
ecog_trace = generate_ecog(t)
lfp_trace = generate_lfp(t)
spike_trace = generate_spikes(t)

# Create the plot
fig, axes = plt.subplots(5, 1, figsize=(12, 10))
fig.suptitle("Neural Recording Traces", fontsize=16, fontweight="bold")

# Plot parameters
traces = [
    (meg_trace, "MEG", "fT", "#4c1a57"),
    (eeg_trace, "EEG", "μV", "#ff3cc7"),
    (ecog_trace, "ECoG", "μV", "#f0f600"),
    (lfp_trace, "LFP", "μV", "#00e5e8"),
    (spike_trace, "Spikes", "μV", "#00e5e8"),
]

descriptions = [
    "Magnetoencephalography - magnetic fields from neuronal currents",
    "Electroencephalography - scalp electrical activity, filtered by skull",
    "Electrocorticography - direct cortical surface recordings",
    "Local Field Potential - local population activity from microelectrode",
    "Single Unit Spikes - individual action potentials",
]

# Plot each trace
for i, ((trace, title, unit, color), description) in enumerate(
    zip(traces, descriptions)
):
    axes[i].plot(t, trace, color=color, linewidth=1.5)
    axes[i].set_ylabel(f"{title}\n({unit})", fontweight="bold")
    axes[i].grid(True, alpha=0.3)
    axes[i].text(
        0.02,
        0.95,
        description,
        transform=axes[i].transAxes,
        fontsize=9,
        verticalalignment="top",
        style="italic",
    )

    # Set appropriate y-limits for each trace type
    if title == "MEG":
        axes[i].set_ylim(-100, 100)
    elif title == "EEG":
        axes[i].set_ylim(-60, 60)
    elif title == "ECoG":
        axes[i].set_ylim(-300, 300)
    elif title == "LFP":
        axes[i].set_ylim(-400, 400)
    elif title == "Spikes":
        axes[i].set_ylim(-20, 100)

# Set x-label only for bottom plot
axes[-1].set_xlabel("Time (s)", fontweight="bold")

plt.tight_layout()

# Add summary information
summary_text = """
Key Characteristics:
• Temporal Resolution: Spikes > LFP > ECoG > EEG ≈ MEG
• Spatial Resolution: Spikes > LFP > ECoG > MEG > EEG  
• Invasiveness: EEG = MEG (non-invasive) < ECoG < LFP = Spikes (invasive)
"""

plt.figtext(
    0.02,
    0.02,
    summary_text,
    fontsize=10,
    bbox=dict(boxstyle="round,pad=0.5", facecolor="lightgray", alpha=0.8),
)

plt.show()


# Save individual traces without axes
def save_individual_traces():
    """Save each trace as individual plot with no axes or labels"""

    for trace, title, _, color in traces:
        # Create figure with no margins
        _, ax = plt.subplots(figsize=(10, 2))

        # Plot the trace
        ax.plot(t, trace, color=color, linewidth=2)

        # Remove all axes, labels, ticks, spines
        ax.set_xticks([])
        ax.set_yticks([])
        ax.spines["top"].set_visible(False)
        ax.spines["right"].set_visible(False)
        ax.spines["bottom"].set_visible(False)
        ax.spines["left"].set_visible(False)

        # Set appropriate y-limits for each trace type
        if title == "MEG":
            ax.set_ylim(-100, 100)
        elif title == "EEG":
            ax.set_ylim(-60, 60)
        elif title == "ECoG":
            ax.set_ylim(-300, 300)
        elif title == "LFP":
            ax.set_ylim(-400, 400)
        elif title == "Spikes":
            ax.set_ylim(-20, 100)

        # Save with no padding or borders
        plt.subplots_adjust(left=0, bottom=0, right=1, top=1, wspace=0, hspace=0)
        plt.savefig(
            f"{title.lower()}_trace.svg",
            dpi=300,
            bbox_inches="tight",
            pad_inches=0,
            facecolor="white",
            edgecolor="none",
        )
        plt.close()

    print("\nIndividual traces saved as SVG files:")
    for trace, title, _, color in traces:
        print(f"  {title.lower()}_trace.svg")


# Save individual traces
save_individual_traces()

# Print some basic statistics
print("Neural Recording Traces - Summary Statistics")
print("=" * 50)
for trace, title, unit, _ in traces:
    print(
        f"{title:8s}: Mean = {np.mean(trace):6.1f} {unit}, "
        f"Std = {np.std(trace):6.1f} {unit}, "
        f"Range = [{np.min(trace):6.1f}, {np.max(trace):6.1f}] {unit}"
    )


# Optional: Save individual traces as data
def save_traces_to_file():
    """Save traces to CSV file for further analysis"""

    data = {
        "time": t,
        "MEG_fT": meg_trace,
        "EEG_uV": eeg_trace,
        "ECoG_uV": ecog_trace,
        "LFP_uV": lfp_trace,
        "Spikes_uV": spike_trace,
    }

    df = pd.DataFrame(data)
    df.to_csv("neural_traces.csv", index=False)
    print("\nTraces saved to 'neural_traces.csv'")


# Uncomment to save data
# save_traces_to_file()
