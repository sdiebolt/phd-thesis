#import "@preview/glossarium:0.5.10": *

#let entry-list = (
  // Atlases and templates
  (
    key: "ccf",
    short: "CCFv3",
    long: "Common Coordinate Framework",
    group: "Atlases and templates",
  ),
  (
    key: "roi",
    short: "ROI",
    long: "region of interest",
    longplural: "regions of interest",
    group: "Atlases and templates",
  ),
  // Connectivity
  (
    key: "dcm",
    short: "DCM",
    long: "dynamic causal modeling",
    group: "Connectivity",
  ),
  (
    key: "cap",
    short: "CAP",
    long: "co-activation pattern",
    group: "Connectivity",
  ),
  (
    key: "fc",
    short: "FC",
    long: "functional connectivity",
    group: "Connectivity",
  ),
  (
    key: "rgc",
    short: "rGC",
    long: "regional global connectivity",
    group: "Connectivity",
  ),
  (
    key: "rsn",
    short: "RSN",
    long: "resting-state network",
    group: "Connectivity",
  ),
  (
    key: "dmn",
    short: "DMN",
    long: "default mode network",
    group: "Connectivity",
  ),
  // Data structures
  (
    key: "bids",
    short: "BIDS",
    long: "Brain Imaging Data Structure",
    group: "Data structures",
  ),
  (
    key: "bep",
    short: "BEP",
    long: "BIDS Extension Proposal",
    group: "Data structures",
  ),
  // Mathematics
  (
    key: "evd",
    short: "EVD",
    long: "eigenvalue decomposition",
    group: "Mathematics",
  ),
  (
    key: "ica",
    short: "ICA",
    long: "independent component analysis",
    group: "Mathematics",
  ),
  (
    key: "rms",
    short: "RMS",
    long: "root mean square",
    group: "Mathematics",
  ),
  (
    key: "svd",
    short: "SVD",
    long: "singular value decomposition",
    group: "Mathematics",
  ),
  // Neuroimaging approaches
  (
    key: "ct",
    short: "CT",
    long: "computed tomography",
    group: "Neuroimaging approaches",
  ),
  (
    key: "dti",
    short: "DTI",
    long: "diffusion tensor imaging",
    group: "Neuroimaging approaches",
  ),
  (
    key: "dwi",
    short: "DWI",
    long: "diffusion-weighted imaging",
    group: "Neuroimaging approaches",
  ),
  (
    key: "eeg",
    short: "EEG",
    long: "electroencephalography",
    group: "Neuroimaging approaches",
  ),
  (
    key: "erp",
    short: "ERP",
    long: "event-related potentials",
    group: "Neuroimaging approaches",
  ),
  (
    key: "ecog",
    short: "ECoG",
    long: "electrocorticography",
    group: "Neuroimaging approaches",
  ),
  (
    key: "sua",
    short: "SUA",
    long: "single-unit activity",
    group: "Neuroimaging approaches",
  ),
  (
    key: "mua",
    short: "MUA",
    long: "multi-unit activity",
    group: "Neuroimaging approaches",
  ),
  (
    key: "lfp",
    short: "LFP",
    long: "local field potential",
    group: "Neuroimaging approaches",
  ),
  (
    key: "fdg",
    short: "FDG",
    long: "[¹⁸F]fluorodeoxyglucose",
    group: "Neuroimaging approaches",
  ),
  (
    key: "fmri",
    short: "fMRI",
    long: "functional magnetic resonance imaging",
    group: "Neuroimaging approaches",
  ),
  (
    key: "rsfmri",
    short: "rs-fMRI",
    long: "resting-state functional magnetic resonance imaging",
    group: "Neuroimaging approaches",
  ),
  (
    key: "phfmri",
    short: "phfMRI",
    long: "pharmaco-fMRI",
    group: "Neuroimaging approaches",
  ),
  (
    key: "bold",
    short: "BOLD",
    long: "blood-oxygen-level-dependent",
    group: "Neuroimaging approaches",
  ),
  (
    key: "epi",
    short: "EPI",
    long: "echo-planar imaging",
    group: "Neuroimaging approaches",
  ),
  (
    key: "tr",
    short: "TR",
    long: "repetition time",
    group: "Neuroimaging approaches",
  ),
  (
    key: "sms",
    short: "SMS",
    long: "simultaneous multi-slice",
    group: "Neuroimaging approaches",
  ),
  (
    key: "fusi",
    short: "fUSI",
    long: "functional ultrasound imaging",
    group: "Neuroimaging approaches",
  ),
  (
    key: "phfusi",
    short: "phfUSI",
    long: "pharmaco-fUSI",
    group: "Neuroimaging approaches",
  ),
  (
    key: "ulm",
    short: "ULM",
    long: "ultrasound localization microscopy",
    group: "Neuroimaging approaches",
  ),
  (
    key: "tcd",
    short: "TCD",
    long: "transcranial Doppler",
    group: "Neuroimaging approaches",
  ),
  (
    key: "ftcd",
    short: "fTCD",
    long: "functional transcranial Doppler",
    group: "Neuroimaging approaches",
  ),
  (
    key: "cw",
    short: "CW",
    long: "continuous wave",
    group: "Neuroimaging approaches",
  ),
  (
    key: "pw",
    short: "PW",
    long: "pulsed wave",
    group: "Neuroimaging approaches",
  ),
  (
    key: "pd",
    short: "PD",
    long: "power Doppler",
    group: "Neuroimaging approaches",
  ),
  (
    key: "das",
    short: "DAS",
    long: "delay-and-sum",
    group: "Neuroimaging approaches",
  ),
  (
    key: "iosi",
    short: "IOSI",
    long: "intrinsic optical signal imaging",
    group: "Neuroimaging approaches",
  ),
  (
    key: "lsi",
    short: "LSI",
    long: "laser speckle imaging",
    group: "Neuroimaging approaches",
  ),
  (
    key: "sfdi",
    short: "SFDI",
    long: "spatial frequency domain imaging",
    group: "Neuroimaging approaches",
  ),
  (
    key: "ldf",
    short: "LDF",
    long: "laser Doppler flowmetry",
    group: "Neuroimaging approaches",
  ),
  (
    key: "meg",
    short: "MEG",
    long: "magnetoencephalography",
    group: "Neuroimaging approaches",
  ),
  (
    key: "mri",
    short: "MRI",
    long: "magnetic resonance imaging",
    group: "Neuroimaging approaches",
  ),
  (
    key: "mrs",
    short: "MRS",
    long: "magnetic resonance spectroscopy",
    group: "Neuroimaging approaches",
  ),
  (
    key: "twop",
    short: "2P",
    long: "two-photon",
    group: "Neuroimaging approaches",
  ),
  (
    key: "threep",
    short: "3P",
    long: "three-photon",
    group: "Neuroimaging approaches",
  ),
  (
    key: "msot",
    short: "MSOT",
    long: "multispectral optoacoustic tomography",
    group: "Neuroimaging approaches",
  ),
  (
    key: "nirs",
    short: "NIRS",
    long: "near-infrared spectroscopy",
    group: "Neuroimaging approaches",
  ),
  (
    key: "fnirs",
    short: "fNIRS",
    long: "functional near-infrared spectroscopy",
    group: "Neuroimaging approaches",
  ),
  (
    key: "dot",
    short: "DOT",
    long: "diffuse optical tomography",
    group: "Neuroimaging approaches",
  ),
  (
    key: "led",
    short: "LED",
    long: "light-emitting diode",
    group: "Neuroimaging approaches",
  ),
  (
    key: "dhbo2",
    short: "ΔHbO₂",
    plural: "ΔHbO₂",
    long: "change in oxygenated hemoglobin",
    longplural: "changes in oxygenated hemoglobin",
    group: "Neuroimaging approaches",
  ),
  (
    key: "dhbr",
    short: "ΔHbR",
    plural: "ΔHbR",
    long: "change in deoxygenated hemoglobin",
    longplural: "changes in deoxygenated hemoglobin",
    group: "Neuroimaging approaches",
  ),
  (
    key: "dhbt",
    short: "ΔHbT",
    plural: "ΔHbT",
    long: "change in total hemoglobin",
    longplural: "changes in total hemoglobin",
    group: "Neuroimaging approaches",
  ),
  (
    key: "opm",
    short: "OPM",
    long: "optically pumped magnetometer",
    group: "Neuroimaging approaches",
  ),
  (
    key: "pet",
    short: "PET",
    long: "positron emission tomography",
    group: "Neuroimaging approaches",
  ),
  (
    key: "spect",
    short: "SPECT",
    long: "single-photon emission computed tomography",
    group: "Neuroimaging approaches",
  ),
  (
    key: "squid",
    short: "SQUID",
    long: "superconducting quantum interference device",
    group: "Neuroimaging approaches",
  ),
  (
    key: "mhc",
    short: "MHC",
    long: "Mobile HomeCage",
    group: "Neuroimaging approaches",
  ),
  // Physiology
  (
    key: "thc",
    short: "THC",
    long: "Δ9-tetrahydrocannabinol",
    group: "Physiology",
  ),
  (
    key: "cbd",
    short: "CBD",
    long: "cannabidiol",
    group: "Physiology",
  ),
  (
    key: "cp",
    short: "CP 55,940",
    long: "CP 55,940",
    group: "Physiology",
  ),
  (
    key: "am",
    short: "AM-251",
    long: "AM-251",
    group: "Physiology",
  ),
  (
    key: "aea",
    short: "AEA",
    long: "N-arachidonoylethanolamine",
    group: "Physiology",
  ),
  (
    key: "twoag",
    short: "2-AG",
    long: "2-arachidonoylglycerol",
    group: "Physiology",
  ),
  (
    key: "mdl",
    short: "MDL 100,907",
    long: "MDL 100,907",
    group: "Physiology",
  ),
  (
    key: "fiveht",
    short: "5-HT",
    long: "5-hydroxytryptamine",
    group: "Physiology",
  ),
  (
    key: "dmt",
    short: "DMT",
    long: "dimethyltryptamine",
    group: "Physiology",
  ),
  (
    key: "lsd",
    short: "LSD",
    long: "lysergic acid diethylamide",
    group: "Physiology",
  ),
  (
    key: "htr",
    short: "HTR",
    long: "head-twitch response",
    group: "Physiology",
  ),
  (
    key: "hppd",
    short: "HPPD",
    long: "hallucinogen persisting perception disorder",
    group: "Physiology",
  ),
  (
    key: "gpcr",
    short: "GPCR",
    long: "G protein-coupled receptor",
    group: "Physiology",
  ),
  (
    key: "atp",
    short: "ATP",
    long: "adenosine triphosphate",
    group: "Physiology",
  ),
  (
    key: "bbb",
    short: "BBB",
    long: "blood-brain barrier",
    group: "Physiology",
  ),
  (
    key: "smc",
    short: "SMC",
    long: "smooth muscle cell",
    group: "Physiology",
  ),
  (
    key: "cb1",
    short: "CB1",
    long: "cannabinoid receptor 1",
    group: "Physiology",
  ),
  (
    key: "cb2",
    short: "CB2",
    long: "cannabinoid receptor 2",
    group: "Physiology",
  ),
  (
    key: "cbf",
    short: "CBF",
    long: "cerebral blood flow",
    group: "Physiology",
  ),
  (
    key: "cbv",
    short: "CBV",
    long: "cerebral blood volume",
    group: "Physiology",
  ),
  (
    key: "rcbv",
    short: "rCBV",
    long: "relative cerebral blood volume",
    group: "Physiology",
  ),
  (
    key: "csf",
    short: "CSF",
    long: "cerebrospinal fluid",
    group: "Physiology",
  ),
  (
    key: "hrf",
    short: "HRF",
    long: "hemodynamic response function",
    group: "Physiology",
  ),
  (
    key: "nvc",
    short: "NVC",
    long: "neurovascular coupling",
    group: "Physiology",
  ),
  (
    key: "nvu",
    short: "NVU",
    long: "neurovascular unit",
    group: "Physiology",
  ),
  (
    key: "no",
    short: "NO",
    long: "nitric oxide",
    group: "Physiology",
  ),
  (
    key: "rem",
    short: "REM",
    long: "rapid eye movement",
    group: "Physiology",
  ),
  (
    key: "mor",
    short: "MOR",
    long: "μ-opioid receptor",
    group: "Physiology",
  ),
  (
    key: "mca",
    short: "MCA",
    long: "middle cerebral artery",
    longplural: "middle cerebral arteries",
    group: "Physiology",
  ),
  // Quality control metrics
  (
    key: "cnr",
    short: "CNR",
    long: "contrast-to-noise ratio",
    group: "Quality control metrics",
  ),
  (
    key: "fd",
    short: "FD",
    long: "framewise displacement",
    group: "Quality control metrics",
  ),
  (
    key: "gs",
    short: "GS",
    long: "global power Doppler signal",
    group: "Quality control metrics",
  ),
  (
    key: "gv",
    short: "GV",
    long: "global axial velocity",
    group: "Quality control metrics",
  ),
  (
    key: "qc",
    short: "QC",
    long: "quality control",
    group: "Quality control metrics",
  ),
  (
    key: "rdvars",
    short: "rDVARS",
    long: "relative DVARS",
    group: "Quality control metrics",
  ),
  (
    key: "rgs",
    short: "rGS",
    long: "relative global power Doppler signal",
    group: "Quality control metrics",
  ),
  // Signal Processing
  (
    key: "fft",
    short: "FFT",
    long: "fast Fourier transform",
    group: "Signal Processing",
  ),
  (
    key: "fir",
    short: "FIR",
    long: "finite impulse response",
    group: "Signal Processing",
  ),
  (
    key: "fwhm",
    short: "FWHM",
    long: "full width at half maximum",
    group: "Signal Processing",
  ),
  (
    key: "gsr",
    short: "GSR",
    long: "global signal regression",
    group: "Signal Processing",
  ),
  (
    key: "iq",
    short: "I/Q",
    long: "in-phase/quadrature",
    group: "Signal Processing",
  ),
  (
    key: "snr",
    short: "SNR",
    long: "signal-to-noise ratio",
    group: "Signal Processing",
  ),
  (
    key: "tsnr",
    short: "tSNR",
    long: "temporal signal-to-noise ratio",
    group: "Signal Processing",
  ),
  // Statistics
  (
    key: "ci",
    short: "CI",
    long: "confidence interval",
    group: "Statistics",
  ),
  (
    key: "ar1",
    short: "AR(1)",
    long: "autoregressive order 1",
    group: "Statistics",
  ),
  (
    key: "pca",
    short: "PCA",
    long: "principal component analysis",
    group: "Statistics",
  ),
  (
    key: "pc",
    short: "PC",
    long: "principal component",
    group: "Statistics",
  ),
  (
    key: "cv",
    short: "CV",
    long: "coefficient of variation",
    group: "Statistics",
  ),
  (
    key: "fwer",
    short: "FWER",
    long: "family-wise error rate",
    group: "Statistics",
  ),
  (
    key: "glm",
    short: "GLM",
    long: "general linear model",
    group: "Statistics",
  ),
  (
    key: "iqr",
    short: "IQR",
    long: "interquartile range",
    group: "Statistics",
  ),
  (
    key: "lowess",
    short: "LOWESS",
    long: "locally weighted scatterplot smoothing",
    group: "Statistics",
  ),
  (
    key: "mse",
    short: "MSE",
    long: "mean squared error",
    group: "Statistics",
  ),
  (
    key: "ols",
    short: "OLS",
    long: "ordinary least squares",
    group: "Statistics",
  ),
  (
    key: "tdof",
    short: "tDOF",
    long: "temporal degrees of freedom",
    group: "Statistics",
  ),
  // Ultrasound physics
  (
    key: "fov",
    short: "FOV",
    long: "field of view",
    plural: "fields of view",
    group: "Ultrasound physics",
  ),
  (
    key: "prf",
    short: "PRF",
    long: "pulse repetition frequency",
    group: "Ultrasound physics",
  ),
  (
    key: "rf",
    short: "RF",
    long: "radio frequency",
    group: "Ultrasound physics",
  ),
  // Units
  (
    key: "db",
    short: "dB",
    long: "decibel",
    group: "Units",
  ),
  // Institutes
  (
    key: "ipnp",
    short: "IPNP",
    long: "Institute of Psychiatry and Neuroscience of Paris",
    group: "Institutes",
  ),
  (
    key: "ucl",
    short: "UCL",
    long: "University College London",
    group: "Institutes",
  ),
  (
    key: "incf",
    short: "INCF",
    long: "International Neuroinformatics Coordinating Facility",
    group: "Institutes",
  ),
  // Software
  (
    key: "gui",
    short: "GUI",
    long: "graphical user interface",
    group: "Software",
  ),
  (
    key: "fsl",
    short: "FSL",
    long: "FMRIB Software Library",
    group: "Software",
  ),
  (
    key: "spm",
    short: "SPM",
    long: "Statistical Parametric Mapping",
    group: "Software",
  ),
  (
    key: "afni",
    short: "AFNI",
    long: "Analysis of Functional NeuroImages",
    group: "Software",
  ),
  (
    key: "pypl",
    short: "PYPL",
    long: "PopularitY of Programming Languages",
    group: "Software",
  ),
  (
    key: "io",
    short: "I/O",
    long: "input/output",
    group: "Software",
  ),
  (
    key: "bps",
    short: "BPS",
    long: "brain positioning system",
    group: "Software",
  ),
  (
    key: "itk",
    short: "ITK",
    long: "Insight Toolkit",
    group: "Software",
  ),
  // Miscellaneous
  (
    key: "phd",
    short: "PhD",
    long: "Doctor of Philosophy",
    group: "Miscellaneous",
  ),
  (
    key: "pep",
    short: "PEP",
    long: "Python Enhancement Proposal",
    group: "Miscellaneous",
  ),
  (
    key: "diy",
    short: "DIY",
    long: "do it yourself",
    group: "Miscellaneous",
  ),
  (
    key: "lto",
    short: "LTO",
    long: "linear tape-open",
    group: "Miscellaneous",
  ),
)

// Custom print function to match the previous phd-theme style
// This removes page references and uses custom group/entry formatting
// NOTE: register-glossary() must be called BEFORE this function, before any @references are used
#let user-print-gloss(entry-list, title: "Glossary") = {
  // Title
  heading(level: 1, title, numbering: none)
  v(1em)

  // Group entries by group
  let groups = (:)
  for entry in entry-list {
    let group-name = entry.at("group", default: "")
    if group-name not in groups {
      groups.insert(group-name, ())
    }
    groups.at(group-name).push(entry)
  }

  // Print each group
  let group-names = groups.keys().sorted()
  let total-groups = group-names.len()

  for (index, group-name) in group-names.enumerate() {
    // Print group heading (except for empty group name or single group)
    if group-name != "" and total-groups > 1 {
      v(1.5em)
      align(left, text(weight: "bold", size: 1.2em, group-name))
      v(0.75em)
      line(length: 100%, stroke: 0.5pt)
      v(0.75em)
    }

    // Print entries in this group
    for entry in groups.at(group-name) {
      let short-display = text(weight: "bold", entry.short)
      let long-display = if "long" in entry and entry.long != none {
        [. #entry.long]
      } else {
        []
      }

      let description = if "description" in entry and entry.description != none {
        [. #entry.description]
      } else {
        []
      }

      // Create a block that shows both short and long form
      // Note: we don't create manual labels here - glossarium's make-glossary handles references
      block(
        below: 1em,
        text(size: 0.95em)[#short-display#long-display#description],
      )
    }
  }
}

// Re-export for backward compatibility
#let main_glossary = entry-list
