"""Voxel-wise clusters of cannabinoids and psilocybin."""

from pathlib import Path

import matplotlib
import matplotlib.pyplot as plt
import numpy as np
import pyfus as pf
from matplotlib.colors import Normalize
from rich.console import Console

plt.rcParams["font.family"] = "Fira Sans"

console = Console()

allen_reference, _ = pf.datasets.fetch_atlas_allen()

########################################################################################
# Parameters
########################################################################################

cannabinoids_root = Path("/mnt/data/cannabinoids")
psilocybin_root = Path("/mnt/data/psilocybin")

figure_path = Path("../content/chapters/3-pharmaco/figures/methods/voxel_clusters.png")

########################################################################################
# Load templates and clusters
########################################################################################

with console.status("[bold cyan]Loading templates, seed masks, and clusters..."):
    cannabinoids_reference = pf.load_scan(
        cannabinoids_root / "derivatives/templates/reference_func2d.nii"
    )[..., 10:-3]

    cannabinoids_clusters = pf.load_scan(
        cannabinoids_root / "derivatives/masks/voxel_clusters_func2d.nii"
    )[:, :, 10:-3]
    cannabinoids_retained_cluster_indices = (4, 11, 10, 7, 8, 13)
    cannabinoids_retained_clusters = cannabinoids_clusters[
        ..., cannabinoids_retained_cluster_indices
    ]
    cannabinoids_discarded_clusters = cannabinoids_clusters[
        ...,
        tuple(
            set(range(cannabinoids_clusters.shape[-1]))
            - set(cannabinoids_retained_cluster_indices)
        ),
    ]

    cannabinoids_seed_masks = pf.load_scan(
        cannabinoids_root / "derivatives/masks/seed_masks_func2d.nii"
    )[:, :, 10:-3]
    cannabinoids_seed_indices = [
        np.mean(np.argwhere(x), axis=0)
        for x in cannabinoids_seed_masks.iter_axis(5, as_array=True)
    ]

    allen_reference_cannabinoids = pf.registration.resample_to_scan(
        allen_reference, cannabinoids_reference, interpolation="nearest"
    )

    psilocybin_reference = pf.load_scan(
        psilocybin_root / "derivatives/templates/reference_func2d.nii"
    )[..., 13:]

    psilocybin_clusters = pf.load_scan(
        psilocybin_root / "derivatives/masks/voxel_clusters_func2d.nii"
    )[:, :, 13:]
    psilocybin_retained_clusters_indices = (13, 4, 10, 12, 0)
    psilocybin_retained_clusters = psilocybin_clusters[
        ..., psilocybin_retained_clusters_indices
    ]
    psilocybin_discarded_clusters = psilocybin_clusters[
        ...,
        tuple(
            set(range(psilocybin_clusters.shape[-1]))
            - set(psilocybin_retained_clusters_indices)
        ),
    ]

    psilocybin_seed_masks = pf.load_scan(
        psilocybin_root / "derivatives/masks/seed_masks_func2d.nii"
    )[:, :, 13:]
    psilocybin_seed_indices = [
        np.mean(np.argwhere(x), axis=0)
        for x in psilocybin_seed_masks.iter_axis(5, as_array=True)
    ]

    allen_reference_psilocybin = pf.registration.resample_to_scan(
        allen_reference, psilocybin_reference, interpolation="nearest"
    )

########################################################################################
# Plot clusters
########################################################################################

retained_cmap = matplotlib.colors.ListedColormap(["tab:green"])
discarded_cmap = matplotlib.colors.ListedColormap(["tab:red"])

fig, axes = plt.subplots(2, 2, figsize=(12, 12), tight_layout=True, facecolor="black")

pf.plotting.plot_scan(cannabinoids_reference, vmax=0, vmin=-12, axes=axes[0, 0])
pf.plotting.plot_roi(
    cannabinoids_discarded_clusters,
    view_type="contours",
    cmap=discarded_cmap,
    norm=Normalize(vmin=1.0, vmax=1.0),
    alpha=1,
    lw=3,
    axes=axes[0, 0],
)
pf.plotting.plot_roi(
    cannabinoids_retained_clusters,
    view_type="contours",
    cmap=retained_cmap,
    norm=Normalize(vmin=1.0, vmax=1.0),
    alpha=1,
    lw=3,
    axes=axes[0, 0],
)
axes[0, 0].set_title("Cannabinoids", color="white", fontsize=24)

pf.plotting.plot_scan(allen_reference_cannabinoids, axes=axes[1, 0])
pf.plotting.plot_scan(
    cannabinoids_reference,
    cmap=pf.plotting.add_alpha_to_cmap("magma", transfer_function="sigmoid"),
    vmax=0,
    vmin=-20,
    axes=axes[1, 0],
)
pf.plotting.plot_roi(
    cannabinoids_seed_masks,
    view_type="contours",
    lw=3,
    alpha=1,
    cmap="binary",
    axes=axes[1, 0],
)
for i, seed_indices in enumerate(cannabinoids_seed_indices):
    axes[1, 0].text(
        seed_indices[0],
        cannabinoids_reference.shape[2] - seed_indices[2] - 1,
        i + 1,
        color="k",
        fontsize=18,
        fontweight="bold",
        ha="center",
        va="center",
    )

pf.plotting.plot_scan(psilocybin_reference, vmax=0, vmin=-12, axes=axes[0, 1])
pf.plotting.plot_roi(
    psilocybin_discarded_clusters,
    view_type="contours",
    cmap=discarded_cmap,
    norm=Normalize(vmin=1.0, vmax=1.0),
    alpha=1,
    lw=3,
    axes=axes[0, 1],
)
pf.plotting.plot_roi(
    psilocybin_retained_clusters,
    view_type="contours",
    cmap=retained_cmap,
    norm=Normalize(vmin=1.0, vmax=1.0),
    alpha=1,
    lw=3,
    axes=axes[0, 1],
)
axes[0, 1].set_title("Psilocybin", color="white", fontsize=24)

pf.plotting.plot_scan(allen_reference_psilocybin, axes=axes[1, 1])
pf.plotting.plot_scan(
    psilocybin_reference,
    cmap=pf.plotting.add_alpha_to_cmap("magma", transfer_function="sigmoid"),
    vmax=0,
    vmin=-20,
    axes=axes[1, 1],
)
pf.plotting.plot_roi(
    psilocybin_seed_masks,
    view_type="contours",
    alpha=1,
    lw=3,
    cmap="binary",
    axes=axes[1, 1],
)
for i, seed_indices in enumerate(psilocybin_seed_indices):
    axes[1, 1].text(
        seed_indices[0],
        psilocybin_reference.shape[2] - seed_indices[2] - 1,
        i + 1,
        color="k",
        fontsize=18,
        fontweight="bold",
        ha="center",
        va="center",
    )

fig.savefig(figure_path, dpi=300, bbox_inches="tight")
