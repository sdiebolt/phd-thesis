# /// script
# requires-python = ">=3.12"
# dependencies = [
#     "numpy",
#     "pandas",
#     "seaborn",
# ]
# ///

# This script generates a figure comparing the popularity of Python and MATLAB
# based on their usage in PubMed publications and the PYPL popularity index.
# The main neuroimaging software packages are also compared in terms of their
# usage in PubMed publications.

from functools import reduce
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns

plt.rcParams["font.family"] = "Fira Sans"

# Data extracted from Pubmed and PYPL.
python_pubmed_data = np.array(
    [
        10,
        21,
        28,
        27,
        25,
        37,
        37,
        48,
        68,
        90,
        105,
        124,
        140,
        192,
        265,
        296,
        324,
        389,
        577,
        711,
        923,
        1287,
        1508,
        1701,
        2082,
    ]
)
python_pypl_data = np.array(
    [
        2.9,
        2.9,
        4,
        3.7,
        4.1,
        4.5,
        4.8,
        5,
        6.2,
        6.4,
        6.5,
        6.2,
        6.7,
        6.9,
        7.8,
        8,
        8.5,
        9.5,
        9.9,
        10.2,
        10.6,
        11.1,
        11.9,
        13.2,
        15.2,
        17.1,
        20.1,
        22.4,
        25,
        27.3,
        28.7,
        30.8,
        30.2,
        30,
        28.4,
        27.4,
        27.6,
        27.8,
        29.1,
        29.1,
        30,
        30.6,
    ]
)
matlab_pubmed_data = np.array(
    [
        39,
        38,
        61,
        75,
        110,
        131,
        191,
        222,
        262,
        302,
        337,
        421,
        467,
        476,
        610,
        604,
        600,
        692,
        782,
        750,
        903,
        1072,
        1221,
        1150,
        1210,
    ]
)
matlab_pypl_data = np.array(
    [
        2.2,
        2.3,
        2.3,
        2.2,
        2.3,
        2.4,
        2.4,
        2.5,
        2.7,
        2.9,
        3,
        3.3,
        3.2,
        3.1,
        3,
        3.2,
        3.1,
        3.1,
        3,
        3,
        3,
        3.2,
        2.9,
        2.9,
        2.7,
        2.6,
        2.2,
        2.2,
        2,
        1.9,
        1.8,
        1.9,
        1.7,
        1.4,
        1.8,
        1.7,
        1.6,
        1.6,
        1.6,
        1.5,
        1.7,
        1.6,
    ]
)

# Load the PubMed data from CSV files. Each CSV file contains the number of publications
# per year from the query '"Software" "Neuroimaging"'.
csv_paths = list(Path("pubmed-csvs").glob("*.csv"))
dfs = [pd.read_csv(path).drop(index=["Year"]) for path in csv_paths]
pubmed_neuroimaging_df = reduce(lambda x, y: x.join(y), dfs).dropna()
pubmed_neuroimaging_df.columns = pubmed_neuroimaging_df.columns.str.extract(
    r'Search query: "([^"]+)"'
)[0]
# Set all columns to numeric
pubmed_neuroimaging_df = pubmed_neuroimaging_df.apply(pd.to_numeric)
# Drop the year 2025 as it is incomplete.
pubmed_neuroimaging_df.drop(index="2025", inplace=True)
# Set index from string to integer
pubmed_neuroimaging_df.index = pubmed_neuroimaging_df.index.astype(int)
pubmed_neuroimaging_df = pubmed_neuroimaging_df.melt(
    ignore_index=False, var_name="Software", value_name="Count"
).reset_index(names="Year")

########################################################################################
# Plot the figure
fig, (ax1, ax2, ax3) = plt.subplots(1, 3, figsize=(10, 3), tight_layout=True)

sns.lineplot(
    data=python_pypl_data,
    color="#4483b5",
    linewidth=2,
    dashes=False,
    label="Python",
    ax=ax1,
)
sns.lineplot(
    data=matlab_pypl_data,
    color="#c04c0b",
    linewidth=2,
    dashes=False,
    label="MATLAB",
    ax=ax1,
)
ax1.set(
    xlabel="Year",
    ylabel="PYPL popularity index",
    xlim=(0, 41),
    ylim=(0, 35),
    xticks=np.arange(0, 41, 8),
    xticklabels=np.arange(2005, 2026, 4),
)
ax1.xaxis.label.set_fontproperties({"weight": "bold"})
ax1.yaxis.label.set_fontproperties({"weight": "bold"})
ax1.set_yticklabels([f"{int(y)}%" for y in ax1.get_yticks()])
ax1.set_title("General usage")

sns.lineplot(
    data=python_pubmed_data,
    color="#4483b5",
    linewidth=2,
    dashes=False,
    label="Python",
    ax=ax2,
)
sns.lineplot(
    data=matlab_pubmed_data,
    color="#c04c0b",
    linewidth=2,
    dashes=False,
    label="MATLAB",
    ax=ax2,
)
ax2.set(
    xlabel="Publication year",
    ylabel="PubMed publications\nmentioning Python or MATLAB",
    xlim=(0, 24),
    ylim=(0, 2100),
    xticks=np.arange(0, 25, 4),
    xticklabels=np.arange(2000, 2025, 4),
)
ax2.xaxis.label.set_fontproperties({"weight": "bold"})
ax2.yaxis.label.set_fontproperties({"weight": "bold"})
ax2.set_title("Biomedical publications")

sns.lineplot(
    data=pubmed_neuroimaging_df,
    x="Year",
    y="Count",
    hue="Software",
    linewidth=2,
    dashes=False,
    ax=ax3,
)
ax3.legend_.set_title(None)
ax3.set(
    xlabel="Publication year",
    ylabel="PubMed publications\nmentioning neuroimaging",
    xlim=(2009, 2024),
    ylim=(0, 50),
    xticks=np.arange(2009, 2025, 3),
    xticklabels=np.arange(2009, 2025, 3),
)
ax3.xaxis.label.set_fontproperties({"weight": "bold"})
ax3.yaxis.label.set_fontproperties({"weight": "bold"})
ax3.set_title("Neuroimaging research usage")

fig.savefig("python_vs_matlab.png", dpi=300, bbox_inches="tight")
