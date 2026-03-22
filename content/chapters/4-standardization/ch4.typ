#import "@preview/unify:0.7.1": num, numrange, qty, qtyrange
#import "/helpers.typ": *
#import "/glossary.typ": *

= Data Standardization and Analysis Tools for Functional Ultrasound Imaging <ch:tools>

#objective[
  This chapter addresses the critical need for data standardization and analysis
  infrastructure in #gls("fusi", first: true) as it transitions to widespread adoption.
  Without standardized practices, the field risks reproducibility challenges that have
  historically affected other neuroimaging modalities. This chapter aims to:

  - Develop a community-driven data standardization framework (@fusi\-@bids) extending
    established neuroimaging standards to @fusi\-specific requirements.
  - Create a comprehensive research analysis framework (PyfUS) that complements
    the Iconeus software suite while serving specialized academic needs.
  - Establish relationships between research innovation and commercial software
    development.

    By addressing these objectives, this chapter positions the @fusi field to benefit
    from lessons learned in established neuroimaging modalities while avoiding
    historical fragmentation challenges, establishing sustainable infrastructure for
    @fusi's continued evolution as a valuable neuroscience research tool.
]

== The Need for Data Standardization in Neuroimaging

=== Data Handling Challenges in Modern Neuroimaging <sec:data-handling-challenges>

The reproducibility crisis in neuroscience has brought into sharp focus the critical
importance of open science and standardized data management practices#footnote[In
  neuroscience, “standardization” refers to the process of establishing and implementing
  uniform workflows, methodologies, and criteria across diverse research domains to reduce
  variability, promote reproducibility, and enable rigorous comparisons among studies
  @Grillner2016.] @WhoseScansAre2000 @Ioannidis2005 @Button2013 @Allison2016 @Stark2018
@Chen2018. As highlighted by Niso and colleagues @Niso2022, computational and
informatics advances are essential for reproducible data analysis in neuroimaging. Yet,
the field continues to grapple with challenges that impede scientific progress and limit
reproducibility of research findings#footnote[Here, _reproducibility_ is used as an
  umbrella term to describe the following principles: when trying to reproduce a study to
  obtain the same results, _reproducibility_ describes the reuse of the same data and
  methods; _replicability_ describes the use of new data with the same methods;
  _robustness_ describes the reuse of the same data with new methods; and
  _generalizability_ describes the use of new data with new methods. These terms are often
  used interchangeably in the literature @TuringWay2025 @Poldrack2020 @Niso2022.
].

Data heterogeneity represents one of the most significant barriers to reproducibility
@Gorgolewski2016 @Niso2022 @Martone2024. Across different research groups, institutions,
and scanner manufacturers, neuroimaging datasets are organized using diverse and often
incompatible formats, naming conventions, and metadata schemas. This heterogeneity
creates technical obstacles when researchers attempt to combine datasets, validate
findings across studies, or apply analysis methods developed in one laboratory to data
collected elsewhere. The resulting fragmentation not only reduces the statistical power
achievable through data aggregation but also limits the generalizability of research
findings.

The technical limitations that arise from inconsistent data organization practices
further compound reproducibility challenges @Niso2022. When datasets lack standardized
structure and metadata documentation, researchers face barriers to understanding the
experimental conditions, acquisition parameters, and processing steps that generated the
data. This opacity makes it difficult to replicate analyses, verify results, or adapt
methods to new datasets. Furthermore, the manual effort required to restructure and
curate heterogeneous datasets consumes valuable research time and introduces
opportunities for errors @Abrams2021 @Gorgolewski2016.

The absence of standardized practices also creates barriers to the development and
validation of automated analysis pipelines @Gorgolewski2016. When datasets are organized
using idiosyncratic schemes, analysis tools must be manually adapted for each new
dataset, limiting the development of robust and generalizable processing methods. Given
the increasing complexity and scale of modern neuroimaging datasets, lack of
standardized structures would impede the development of neuroimaging methodology and
reduce the efficiency of research workflows.

These challenges are intensified by the rapid pace of technological advancement in
neuroimaging, which continuously introduces new acquisition methods, data formats, and
analysis approaches. Without standardization efforts, the accumulation of heterogeneous
practices threaten to create a fragmented research landscape where datasets become
isolated and technological advances remain confined to individual research groups.

=== The Success Story of the Brain Imaging Data Structure

The neuroimaging community's response to widespread data management challenges
culminated in the development of the #gls("bids", first: true), a landmark standardization initiative
that has progressively transformed neuroimaging research practices @Gorgolewski2016.
@Bids emerged from a coordinated effort beginning in 2015, when a working group
convened under the @incf to establish a new data organization standard @Poldrack2024.
Following extensive community consultation at numerous conferences and workshops, @bids
1.0.0 was officially published in 2016 as a new standard for organizing and sharing @mri
and @fmri data @Gorgolewski2016.

Initially developed specifically for #gls("mri", first: true) data, @bids was designed to unify
practices in the field while maintaining compatibility with existing software
ecosystems. Rather than reinventing the wheel, @bids' developers chose to align with
existing software file formats and include standardized, machine-readable metadata
necessary for common data analysis operations @Poldrack2024. This pragmatic approach
allowed @bids to be rapidly adopted by the neuroimaging community.

The impact of @bids has been profound, addressing some of the reproducibility challenges
identified earlier. Its standardized structure reduces data curation efforts, minimizes
errors from data misinterpretation, and enables automated analysis workflows through
"@bids Apps"---containerized software applications that can process @bids datasets with
minimal manual intervention @Gorgolewski2017. This automation has improved both research
efficiency and reproducibility by reducing user-introduced errors in data processing.

To accommodate the broader neuroimaging community, @bids rapidly expanded beyond its
@mri roots through #glspl("bep", first: true). This community-driven process has enabled
extensions to many modalities, including #gls("eeg", first: true) @Pernet2019,
#gls("meg", first: true) @Niso2018, #gls("pet", first: true) @Norgaard2022, and
microscopy @Bourget2022, while maintaining the core principles of
@bids.

@bids has achieved widespread adoption, creating a unified environment where tools can
seamlessly interoperate across diverse neuroimaging modalities. Major analysis
packages---including Nilearn @Nilearn, FSL @FSL, SPM @SPM, AFNI @AFNI, FreeSurfer
@Freesurfer, and MNE #cite(<MNE>)---now provide native @bids support, while public
repositories like OpenNeuro @Markiewicz2021b embraced @bids as their organizing
principle. This combination of technical standardization and community adoption has
established @bids as the de facto standard for neuroimaging data organization,
demonstrating the power of community-driven standardization efforts in transforming
scientific practices.

=== The Emerging Need for @fusi:short Data Standardization

Like all emerging neuroimaging modalities, #gls("fusi", first: true) has followed a
predictable trajectory in data standardization practices. The field's rapid evolution
since the first @fusi publication in 2011 @Mac2011 reflects the typical pattern observed
across neuroimaging: initial focus on technique development, followed by growing
awareness of standardization needs as the community expands. The technical landscape has
been complicated by the origins of @fusi development, where research-grade ultrasound
scanners lacked standardized data formats or comprehensive metadata schemes.

Simultaneously, the field has undergone rapid evolution from collaborative development
to independent implementation. While @fusi research initially involved a few research
groups that maintained close collaborative ties with the original development laboratory
at Physics for Medicine, this began to change as the technique matured. The first
publication without direct participation from the original laboratory appeared in 2015
@Brunner2016, though this work still involved authors who had previously trained at
Physics for Medicine. Fully independent research groups began publishing @fusi studies
by 2018 @Rau2018, marking the transition toward broader, autonomous adoption of the
technique @Pereira2025 @Agyeman2024 @Lim2025 @Yang2025.

This evolution toward independent implementation represents the natural progression of a
successful neuroimaging technique. However, the @fusi field finds itself in a unique
position to learn from the experiences of established modalities and implement
standardized practices early in its development trajectory. By proactively addressing
data organization challenges that historically affected other neuroimaging disciplines,
@fusi can establish efficient collaborative practices from the outset. This
forward-thinking approach, combined with industry recognition of standardization
needs#footnote[Iconeus has recently introduced a conversion tool to export @fusi data
  from its proprietary data format to the NIfTI format, a widely used format in
  neuroimaging.], positions the @fusi field to maximize both scientific reproducibility
and collaborative potential.

== The Brain Imaging Data Structure: Foundation and Principles

=== Core @bids:short Concepts

@Bids proposes a comprehensive framework for organizing and sharing neuroimaging
data that follows several core design principles @Gorgolewski2016. Above all,
@bids follows the "80/20 rule"; as Poldrack and colleagues put it,

#quote(block: true, attribution: [@Poldrack2024.])[
  this requires admitting that there will always be edge cases that can’t be well
  accommodated by the standard, but that this is fine as long as the standard works well
  for most people in most circumstances most of the time.
]

The specification defines a structured and predictable folder hierarchy, standardized
file naming conventions, and systematic metadata organization that ensures both raw
images and associated experimental details are stored in both machine- and
human-readable formats @Gorgolewski2016.

==== Hierarchical Directory Organization

The hierarchical structure of @bids follows a "subject-session-datatype-acquisition"
organization: datasets are organized into subjects, each subject can have multiple
sessions, and each session can contain multiple data types
(@fig:bids-illustration)---for example, anatomical scans and functional scans. This
logical progression reflects common experimental designs while ensuring consistency
across research environments.

#figure(
  placement: auto,
  image("figures/bids_principle.png"),
  caption: figure-caption(
    [Illustration of the @bids:long.],
    [The idiosyncratic organization of a neuroimaging
      experiment (*left*) is converted to @bids (*right*) by following an intuitive
      "subject-session-datatype-acquisition" organization. Adapted from
      @Gorgolewski2016.],
  ),
) <fig:bids-illustration>

==== File Naming Conventions and Entities

@Bids filenames use predefined key-value pairs---called _entities_---along with specific
suffixes to encode supported modalities---for example, `bold` for @bold\-@fmri, `eeg`
for @eeg, or `2PE` for two-photon microscopy. Entities encode essential information
directly in filenames, such as subject identifiers (`sub-01`), session labels
(`ses-treatment`), task names (`task-VisualStim`), and acquisition parameters
(`acq-angio70planes`). This approach ensures that critical metadata are directly
readable from filenames and remain accessible even when files are separated from their
original directory (@fig:bids-filenames).

#let colors = (
  rgb("e60049"),
  rgb("0bb4ff"),
  rgb("50e991"),
  rgb("e6d800"),
  rgb("9b19f5"),
  rgb("ffa300"),
  rgb("dc0ab4"),
  rgb("b3d4ff"),
)

// @typstyle off
#figure(
  placement: auto,
  box(inset: 1em)[
    #align(left,
      text(font: "Fira Code")[
        #text(colors.at(0))[sub-01]\_#text(colors.at(1))[ses-psilo]\_#text(colors.at(2))[task-awake]\_#text(colors.at( 3,))[run-01]\_#text(colors.at(5))[pwd]#text(colors.at(6))[.nii] \
        #text(colors.at(0))[sub-01]\_#text(colors.at(1))[ses-psilo]\_#text(colors.at(2))[task-awake]\_#text(colors.at( 3,))[run-01]\_#text(colors.at(5))[pwd]#text(colors.at(6))[\.json] \
        #text(colors.at(0))[sub-01]\_#text(colors.at(1))[ses-psilo]\_#text(colors.at(2))[task-awake]\_#text(colors.at( 3,))[run-01]\_#text(colors.at(5))[eeg]#text(colors.at(6))[\.edf] \
        #text(colors.at(0))[sub-01]\_#text(colors.at(1))[ses-psilo]\_#text(colors.at(2))[task-awake]\_#text(colors.at( 3,))[run-01]\_#text(colors.at(5))[beh]#text(colors.at(6))[\.tsv] \
        #text(colors.at(0))[sub-01]\_#text(colors.at(1))[ses-psilo]\_#text(colors.at(2))[task-awake]\_#text(colors.at( 3,))[run-01]\_#text(colors.at(4))[tracksys-neurotar]\_#text(colors.at(5))[motion]#text(colors.at(6))[\.tsv] \
        #text(colors.at(0))[sub-01]\_#text(colors.at(1))[ses-psilo]\_#text(colors.at(2))[task-awake]\_#text(colors.at( 3,))[run-01]\_#text(colors.at(4))[recording-pupil]\_#text(colors.at(5))[physio]#text(colors.at(6))[\.tsv] \
      ]
    )
  ],
  caption: figure-caption(
    [Example of @bids:short filenames.],
    [The filenames follow a standardized format consisting of key-value pairs
      (#text(colors.at(0))[en]#text(colors.at(1))[ti]#text(colors.at(2))[ti]#text(colors.at(3))[e]#text(colors.at(4))[s])
      separated by underscores (`_`) and ending with a #text(colors.at(5))[suffix] that
      indicates the modality. #text(colors.at(6))[Extensions] correspond to supported
      file formats defined for each modality.],
  ),
) <fig:bids-filenames>

==== Metadata Documentation and File Formats

@Bids leverages existing standards and formats, such as the NIfTI format for storing
@mri data, the JSON format for metadata, and the TSV format for tabular data
@Gorgolewski2016. Each neuroimaging data file is accompanied by JSON sidecar files that
store comprehensive metadata including scanning parameters, experimental design details,
and acquisition-specific information not captured in standard imaging formats. This
approach extends imaging data formats while maintaining compatibility with widely-used
neuroimaging analysis software, ensuring that essential details such as volume timings
and scanner parameters are preserved and easily accessible.

==== The Inheritance Principle

A sophisticated feature of @bids is the _inheritance principle_, where metadata can be
efficiently organized across dataset, subject, session, and acquisition levels
@Gorgolewski2016. Any metadata file (JSON or TSV) may be defined at different
hierarchical levels, with values from higher levels inherited by lower levels unless
explicitly overridden. For example, a scanner sequence parameter specified at the
dataset level applies to all subjects and sessions unless a more specific value is
provided at a lower level. This hierarchical approach minimizes redundancy and curation
effort while ensuring comprehensive documentation and preserving the flexibility to
specify exceptions when needed.

=== @bids:short Extensions Proposals

The adaptability and continued relevance of @bids stems from its extension mechanism,
which enables accommodation of new neuroimaging modalities and data types while
preserving core principles. This extension process operates through @bep:pl, a
community-driven framework inspired by the @pep process @Poldrack2024.

==== @bep:short Development Process

As stated by Poldrack and colleagues, @bep:pl were designed to be straightforward and
open to everyone, enabling relatively quick development of new extensions while keeping
quality standards high @Poldrack2024. Researchers can submit @bep:pl through the @bids
mailing list or by creating an issue on the
#link("https://github.com/bids-standard/bids-specification")[GitHub repository of the
  BIDS specification]. After review and approval, each proposal is assigned a unique
number and officially posted on
#link("https://bids.neuroimaging.io/extensions/beps.html")[@bids' website]. @Bep:pl
are built using shared online documents, such as Google Docs, which lets anyone join the
conversation and help with development. A small team of "leads" manages each proposal,
ensuring that it is technically sound and meets the needs of the community. The leads
typically organize online meetings to discuss the proposal and gather feedback from the
community. This open approach has proven effective at engaging domain experts while
maintaining community cohesion.

==== Challenges and Ongoing Development

Managing the @bep process comes with several difficulties, such as making sure all
proposals get enough community involvement and avoiding stagnation @Poldrack2024. Some
@bep:pl can get stuck when original developers become unavailable or when requirements
change over time. Finding the right balance between expert knowledge and input from the
wider community needs constant attention. Even with these obstacles, the extension
system has been very successful at growing @bids' capabilities while staying true to its
core values, creating a lasting framework for community-led standard development.

== The @fusi:short\-@bids:short Specification <sec:fusi-bids>

=== Scope and Goals of @fusi:short\-@bids:short

Building on the success of @bids in unifying neuroimaging data practices, we developed a
@bep specifically tailored to @fusi. The @fusi\-@bids specification, @bep\040, extends
the @bids specification to standardize datasets acquired using any @fusi system
@fusibids.

The scope of @fusi\-@bids centers on accommodating the characteristics of @fusi data
while maintaining compatibility with the broader @bids ecosystem. For now, the
specification targets ultrafast power Doppler signals measured using @fusi. Although
they share some technical similarities with signals measured with
@bold\-#ref(<fmri>)---such as being stored as temporal stacks of 3D volumes---power
Doppler signals present some unique challenges that required specific adaptations to
@bids. The focus on power Doppler imaging reflects the current maturity of the @fusi
fields; however, the specification maintains modularity to accommodate potential
additional modalities in future iterations, such as B-mode or velocity signals.

The idea of extending @bids to @fusi was first proposed by Jean-Charles Mariani in June
2019 during his PhD work at the @ipnp @MarianiPhD. This proposal was motivated by the
recent success of @bids in other neuroimaging modalities and the need for a
standardized approach to organizing @fusi datasets. The first @fusi datasets
following a "@bids\-like" format were created in 2019 to test the feasibility of
this standardization effort. In January 2020, work began at the @ipnp on automating
the conversion of @fusi datasets to a "@bids\-like" format; we defined the contours
of what would become the @fusi\-@bids specification and developed tools to
facilitate the conversion and analysis of these @bids\-like datasets. This work led
to the first draft of the @fusi\-@bids specification, presented as a poster at the
fUSbrain 2022 conference. In August 2022, a small group of interested researchers
was gathered to discuss the project, and the first version of the @fusi\-@bids
specification was officially shared publicly through a
#link("https://docs.google.com/document/d/1W3z01mf1E8cfg_OY7ZGqeUeOKv659jCHQBXavtmT-T8/edit?usp=sharing")[Google
  Document]. After a few revisions and discussions with contributors, the
@fusi\-@bids @bep project was proposed to @bids maintainers in March 2023. This led
to the formalization of the @fusi\-@bids specification as @bep\040. Since then, the
@fusi\-@bids specification has been actively developed and refined through
community contributions from several research groups and companies, including the
@ipnp, Physics for Medicine, Iconeus, Forest Neurotech, Neurospin, and the
BrainEcho Lab.

As previously mentioned, @fusi is at a critical juncture, where researchers are
increasingly sharing datasets using idiosyncratic formats without standardized practices
@Landemard2021 @NunezElizalde2022 @Brunner2023 @Lambert2025a. @fusi\-@bids responds
directly to these challenges by proposing a unified framework designed to extend the
advantages that @bids has brought to other areas of neuroimaging research.

The primary goals of @fusi\-@bids mirror those achieved by the original @bids
specification while addressing @fusi specificities. The extension aims to enhance
collaborative research while keeping the data curation overhead low. Moreover,
@fusi\-@bids aims to improve the development of standardized analysis workflows
for @fusi by plugging into the existing @bids ecosystem, which has already
established a wide range of analysis tools and pipelines, some of which are
already compatible with @fusi data---for example, Nilearn @Nilearn.

The development of @fusi\-@bids is driven by the recognition that the youth of the @fusi
domain presents unique opportunities. Among these is the chance to adopt standardized
practices early in the field's development, potentially avoiding the organizational
challenges that have historically affected other neuroimaging disciplines. Additionally,
the specification is designed to be flexible enough to accommodate the evolving nature
of @fusi research, allowing for future extensions to the specification as the field
matures.

=== Unique Challenges in @fusi:short Data Organization

The development of @fusi\-@bids required addressing several technical challenges that
distinguish @fusi from other neuroimaging modalities covered by existing @bids
extensions. The two most significant challenges stemmed from the need for standard data
and metadata schemes, and a way to handle the often sparse spatial sampling of
volumetric @fusi acquisitions.

==== Standardized Data Format and Metadata Requirements

The primary challenge arose from the absence of standardized data formats and metadata
schemas in the @fusi field. Early published @fusi datasets were organized using
idiosyncratic structures that stored power Doppler signals in
MAT-files#footnote[MAT-files are binary MATLAB that can store any MATLAB variable. Thus,
  power Doppler data stored in MAT-files can take any form or shape, making reuse
  cumbersome.] with minimal to no metadata documentation.

Additionally, the technical complexity of ultrafast ultrasound imaging systems meant
that a vast array of acquisition parameters needed to be captured, many of which had no
equivalent in other neuroimaging modalities. Parameters such as ultrasound transmit
frequencies, pulse repetition frequencies, clutter filter parameters, and power Doppler
integration durations are crucial for understanding data quality and enabling
reproducible analyses. However, these parameters were often inadequately documented,
making it difficult to preserve this information during data conversion and sharing.

Developing a comprehensive metadata framework required extensive consultation with the
@fusi community to identify which parameters were essential for different research
applications. The challenge was to create a schema flexible enough to accommodate most
acquisition protocols while maintaining sufficient specificity to preserve critical
technical details. This process involved balancing comprehensiveness with usability,
ensuring that the metadata requirements would not become a burden for researchers while
capturing the information necessary for reproducible science.

==== Sparse Spatial Sampling and the `pose` Entity

The second major challenge emerged from the complex spatial sampling patterns of @fusi,
which frequently involve moving probes during acquisitions---either using motorized
setups or by hand---to achieve wide #glspl("fov", first: true). This acquisition strategy can result
in sparse spatial sampling that cannot be adequately described using the standard
spatial organization schemes employed by other neuroimaging modalities
(@fig:spatial-sampling).

Traditional neuroimaging modalities---such as #ref(<fmri>)---typically maintain a fixed
spatial relationship between the imaging device and the subject, allowing for
straightforward volumetric representation of the acquired data. In contrast, the
dominance of linear ultrasound probes in @fusi systems means that volumetric
acquisitions are often achieved by sequentially positioning the probe at different
locations. Given the duration required for moving the probe and acquiring one plane,
many experimental paradigms involve _sparse sampling_---that is, sampling brain regions
distributed across the entire brain, but not necessarily covering a continuous volume.
Sparse volumes cannot be easily stored using standard formats like NIfTI, which
assume that a single coordinate system is sufficient to describe the entire volume.

The solution involved introducing a new `pose` entity, separating each probe
pose#footnote[A pose represents the spatial position and orientation of an object.] into
its own file. Thus, each file contains data acquired at a specific brain
plane---potentially at several time points if multiple frames were acquired at that
position. The introduction of the `pose` entity required defining a new coordinate
system that could relate the different probe poses over the course of an acquisition.
The challenge was to create a system that could handle both simple two-dimensional
acquisitions and complex three-dimensional sparse sampling schemes while remaining
intuitive for researchers to implement.

#figure(
  placement: auto,
  image("figures/spatial-sampling.png"),
  caption: figure-caption(
    [Illustration of the three main sampling schemes in @fusi:short.],
    [(*Left*) Single slice sampling is the most straightforward sampling scheme, where
      the probe is positioned at a single location and does not move during the
      acquisition. (*Middle*) Sparse sampling is used to acquire multiple non-adjacent
      slices, usually by moving the probe periodically to different locations. In this
      case, the `pose` entity is required to separate the different probe poses into
      different files, each containing a single slice. (*Right*) Dense sampling is used
      to acquire a full continuous volume, where the probe is moved periodically between
      adjacent slices. In this case, adjacent slices can be assembled into a single
      volume, and the `pose` entity is not needed.],
  ),
) <fig:spatial-sampling>


=== Technical Specifications

The @fusi\-@bids specification describes only the @fusi\-specific additions to the main
@bids specification. It is designed to be used in conjunction with the core @bids
specification, which provides the main structure and principles for organizing
neuroimaging data. The technical details described here correspond to version 0.11.0 of
the @fusi\-@bids specification, available in @ap:fusi-bids.

==== Data Types and File Organization

The specification defines two primary data types that reflect the functional and
anatomical components of @fusi experiments. The `fusi` data type handles task-based
and resting-state functional ultrasound imaging, while the `angio` data type handles
angiographic scans recorded for visualization, neuronavigation, and registration
purposes @fusibids. This distinction enables clear separation of functional and
anatomical information while maintaining logical relationships within experimental
sessions. Additionally, through the distinction between `fusi` and `angio` data types,
we meant to emphasize the importance of angiographic scans in @fusi paradigms, as they
are often necessary for accurate post-hoc registration.

File naming follows the established @bids entity system while introducing the new `pose`
entity. The main entity order follows the pattern:

```
sub-<label>[_ses-<label>][_task-<label>][_acq-<label>][_proc-<label>][_run-<label>][_pose-<label>]_pwd.<extension>
```

where
- `sub` identifies the subject,
- `ses` identifies the session (if applicable),
- `task` identifies the task (required for `fusi` data type, optional for `angio`),
- `acq` identifies the acquisition protocol (if applicable),
- `proc` identifies the processing step, such as clutter filter used (if applicable),
- `run` identifies the run number (if applicable),
- `pose` identifies the probe pose (if applicable),
- `pwd` corresponds to the power Doppler modality, and
- `<extension>` corresponds to the file format, such as `.nii` for NIfTI or `.json` for
  metadata.

An example @fusi\-@bids dataset#footnote[Example @fusi\-@bids datasets for each version
  are available on the
  #link("https://github.com/sdiebolt/fusi-bids-examples")[`fusi-bids-examples`] GitHub
  repository.] could be organized as follows:

#text(size: 10pt)[
  ```
  v0.0.11/
  ├── CHANGES.md
  ├── README.md
  ├── dataset_description.json
  ├── participants.tsv
  ├── participants.json
  ├── pwd.json
  ├── sub-01/
  │   ├── ses-baseline/
  │   │   ├── angio/
  │   │   │   └── sub-01_ses-baseline_pwd.nii
  │   │   ├── fusi/
  │   │   │   ├── sub-01_ses-baseline_task-awake_pose-01_pwd.nii
  │   │   │   ├── sub-01_ses-baseline_task-awake_pose-01_pwd.json
  │   │   │   ├── sub-01_ses-baseline_task-awake_pose-02_pwd.nii
  │   │   │   ├── sub-01_ses-baseline_task-awake_pose-02_pwd.json
  │   │   │   ├── sub-01_ses-baseline_task-stim_acq-bregmaMinus1_pwd.nii
  │   │   │   ├── sub-01_ses-baseline_task-stim_acq-bregmaMinus1_pwd.json
  │   │   └──  sub-01_ses-baseline_scans.tsv
  │   ├── ses-treatment/
  │   │   ├── angio/
  │   │   │   └── sub-01_ses-treatment_pwd.nii
  │   │   ├── fusi/
  │   │   │   ├── sub-01_ses-treatment_task-awake_pose-01_pwd.nii
  │   │   │   ├── sub-01_ses-treatment_task-awake_pose-01_pwd.json
  │   │   │   ├── sub-01_ses-treatment_task-awake_pose-02_pwd.nii
  │   │   │   ├── sub-01_ses-treatment_task-awake_pose-02_pwd.json
  │   │   │   ├── sub-01_ses-treatment_task-stim_acq-bregmaMinus1_pwd.nii
  │   │   │   ├── sub-01_ses-treatment_task-stim_acq-bregmaMinus1_pwd.json
  │   │   └──  sub-01_ses-treatment_scans.tsv
  │   └──  sub-01_sessions.tsv
  ├── sub-02/
  ...
  ```
]

==== File Format Selection: NIfTI for @fusi:short Data

A fundamental technical decision for the @fusi\-@bids specification was the selection of
an appropriate file format for storing @fusi data within a @bids dataset. In the spirit
of @bids, we chose not to create yet a new neuroimaging file format for @fusi. Instead,
we mandated the use of the established NIfTI (Neuroimaging Informatics Technology
Initiative) format for all @fusi\-@bids datasets.

This choice was driven by the interoperability NIfTI provides with existing neuroimaging
software tool, particularly those built for @fmri. This compatibility dramatically
reduces the barrier to entry for researchers interested in analyzing @fusi data, in
particular given the lack of versatile software tools tailored to @fusi.

While the NIfTI format accommodates most of @fusi's data characteristics, it does
present certain limitations, particularly regarding the storage of spatial
transformations. Indeed, NIfTI stores only two homogeneous affine transformations: one
from voxel space to _scanner space_ and one from voxel space to _standard space_.
Unfortunately, this cannot account for the sparse volumes that are often acquired in
volumetric @fusi acquisitions, where one each probe pose may require its own spatial
transformation to relate the voxel space to the scanner space. To address this
limitation, we had to introduce a new `pose` entity, to represent files containing a
single probe pose.

==== The `pose` Entity

The goal of the `pose` entity is to address sparse sampling schemes. Its label consists
in a positive integer---for example, `pose-01`---that corresponds to the ordering of
probe poses during an acquisition. The `pose` entity is required for any acquisition
that uses sparse spatial sampling schemes, such as those that acquire three non-adjacent
brain slices#footnote[Two brain slices are considered adjacent if they are parallel,
  have the same spatial extent, and their centers are separated by a distance
  approximately equal to the width of one slice]. However, it is optional for
acquisitions that use dense spatial sampling schemes, such as those that acquire a
full volume using adjacent slices.

The main philosophy behind the `pose` entity is that the spatial position of a NIfTI
file inside the scanner should be entirely described by a single affine transformation.
This is particularly important for ultrasound probes that acquire multiple non-adjacent
slices at once---for example, the IcoPrime-4D MultiArray probe consists of four stacked
linear probes with a gap of #qty(2.1, "mm") between two probe centers. In such cases, we
consider each sub-array of the probe as a separate pose, and thus each pose of these
multi-array probes will be stored in as many files as there are sub-arrays.

While using `pose` entity may seem cumbersome, we expect it to be used rarely. In
practice, most experimental paradigms will use dense spatial sampling schemes, where
multiple adjacent slices are acquired at once, and thus can be combined into a volume
that can be stored in a single NIfTI file. In such cases, the `pose` entity should not
be used, and the NIfTI file will contain a single affine transformation describing the
whole volume.

==== Scanner Coordinate System <sec:fusi-bids-coordinate-system>

A critical challenge in developing @fusi\-@bids involved defining a standardized
coordinate system that could accommodate the different spatial sampling schemes defined
previously. @fmri typically defines a scanner coordinate system with its origin at the
magnet isocenter#footnote[See for example
  #link("https://nipy.org/nibabel/coordinate_systems.html")[Nibabel's excellent
    documentation] on the subject.]---a fixed reference point relative to the experimental
setup. Unfortunately, such a simple definition cannot be applied to @fusi systems as the
probe is not fixed relative to the experimental setup. The movement of ultrasound
probes, whether through manual positioning or motorized systems, required defining a
coordinate system that allows relative positioning of the different probe poses during
an acquisition.

To address this challenge, we defined a coordinate system that is linked to the probe
itself (@fig:bids-coordinate-system). In this probe-relative coordinate system, the
origin is positioned at the center of the probe surface, providing a consistent
reference point that moves with the probe. The coordinate axes are aligned with the
probe's geometry: the $x$ axis aligns with the azimuth axis, the $y$ axis aligns with
the elevation axis, and the $z$ axis aligns with the lateral axis (depth axis) toward
the imaged medium. This definition ensures that the spatial relationships within each
acquisition remain consistent regardless of the probe's position relative to the
experimental setup.

To enable comparison and integration of data acquired at different probe poses, we
established a _scanner_ coordinate system that serves as a common reference frame for
all acquisitions within a session (@fig:bids-coordinate-system). This scanner coordinate
system corresponds to the probe coordinate system when the probe is positioned at its
first pose of a session---for example, when motors are centered before starting an
acquisition sequence, or at the initial probe pose during the first acquisition. This
approach provides a stable reference frame that remains consistent throughout an
experimental session.

#figure(
  placement: auto,
  image("figures/bids-coordinate-system.png"),
  caption: figure-caption(
    [Illustration of the scanner and standard coordinate systems.],
    [The probe coordinate system is defined with the origin at the probe surface
      center, and axes corresponding to azimuth, elevation, and axial directions in a
      right-handed coordinate system. This standardization allows relating the voxel
      space of each probe pose to a common probe referential. Then, the scanner
      coordinate system is defined as the probe coordinate system when the probe is
      positioned at its first pose of a session. Thus, different probe poses can be
      related to the scanner coordinate system by simple translations and rotations. The
      transformation from each pose's voxel space to the scanner coordinate system is
      stored in the NIfTI header's `qform` field. Finally, the NIfTI header's `sform`
      field can store the transformation from voxel space to any standard space, such as
      the Allen Mouse Brain @ccf Atlas @Wang2020. Adapted from @fusibids, courtesy of
      Jean-Charles Mariani.],
  ),
) <fig:bids-coordinate-system>

All subsequent probe poses can be located relative to this scanner coordinate system by
computing the affine transformations (translations and rotations) that map from the
scanner coordinate system to each probe pose's coordinate system. These transformations
are stored in the NIfTI header `qform` field, ensuring that spatial relationships are
preserved and can be accurately reconstructed during data analysis. This coordinate
system framework enables automated spatial registration and facilitates the development
of analysis pipelines that can handle complex, multi-poses @fusi acquisitions while
maintaining compatibility with existing neuroimaging analysis software.

==== @fusi:short\-Specific Metadata

The specification extends @bids metadata handling to accommodate the technical
complexity of ultrasound imaging systems. Essential @fusi\-specific metadata fields
include probe characteristics (`ProbeModel`, `ProbeCentralFrequency`), acquisition
parameters (`UltrasoundTransmitFrequency`, `UltrasoundPulseRepetitionFrequency`), and
processing details (`ClutterFilters`, `PowerDopplerIntegrationDuration`,
`PowerDopplerIntegrationStride`). The current list of metadata fields is available in
@ap:fusi-bids>.

Timing parameters receive particular attention due to the diversity of @fusi sampling
schemes. The specification provides flexible timing description through either the
`RepetitionTime` field for regular sampling or the `VolumeTiming` field for more complex
scheme, ensuring compatibility with both single-pose or sequential acquisition
protocols.

=== Practical Applications and Testing

==== Real-World Implementation

The practical utility of @fusi\-@bids was demonstrated through its application in the
research presented in the previous chapters of this manuscript. @fusi\-@bids provided an
essential framework for managing the large datasets generated in both the denoising
benchmark (@ch:denoising) and pharmacological investigations (@ch:pharmacofusi),
highlighting its impact on research efficiency and reproducibility.

The implementation of @fusi\-@bids proved particularly valuable during the denoising
benchmark presented in @ch:denoising, which generated very large volumes of processed
data. The systematic evaluation of clutter filtering methods produced several thousand
power Doppler scans computed from different benchmarked clutter filters, along with
several hundred thousand seed-based connectivity maps derived from these processed
datasets. Here, @fusi\-@bids offered an efficient and straightforward way to handle
these derivative datasets through its systematic naming conventions and hierarchical
structure.

PyBIDS, a Python package designed for parsing @bids datasets @pybids, was instrumental
throughout both chapters for dataset curation, conversion, parsing, and creation of
derivative datasets. The ability to systematically query datasets based on acquisition
parameters, processing methods, and experimental conditions dramatically reduced the
time required for data management and analysis preparation.

Similarly, the statistical comparisons across pharmacological treatments in
@ch:pharmacofusi were made straightforward through the hierarchical organization
principles of @bids. The standardized structure enabled efficient organization of data
across different treatment cohorts, experimental sessions, and individual subjects.
PyBIDS allowed easy comparison between cohorts, with all files from a given treatment
condition recoverable using a single line of code. This capability was particularly
valuable when conducting group-level statistical analyses, as it eliminated the manual
file parsing that typically consumes substantial time during data preparation
@Abrams2021.

==== Community Validation and Applicability Testing

The validation of @fusi\-@bids for broad applicability has been an ongoing community
effort since the first release of the specification draft in 2022. This validation
process has involved engagement with several research groups and companies to ensure
that the specification meets the varied needs of the global @fusi community across
different experimental paradigms.

To foster collaborative development and ensure broad input from the community, regular
community meetings have been organized with contributors and interested researchers
since the initial draft release. These meetings were used to introduce the specification
to new users and contributors, discuss ongoing technical challenges, propose
specification improvements, and share implementation experiences across different
research environments. Since 2024, bimonthly meetings have been established to
accelerate progress toward a final draft suitable for submission to the @bids
maintainers.

The community engagement process has included both academic research groups and industry
companies to ensure that the specification accommodates diverse @fusi paradigms and
technical implementations. This inclusive approach has been particularly important for
ensuring compatibility across preclinical and clinical applications, which often employ
different acquisition systems and protocols, spatial sampling paradigms, and analysis
requirements. The feedback from this diverse community has led to numerous specification
improvements and has validated the broad applicability of the proposed framework.
Notably, the first @fusi\-@bids formatted dataset has recently been published on Zenodo
@Pereira2025.

Current development efforts focus on addressing the remaining comments and suggestions
documented in the shared Google document of the @fusi\-@bids specification. The next
major milestone involves submitting the refined draft to the @bids maintainers for
formal review and integration into the main @bids specification.

==== Integration with Neuroimaging Ecosystem and Iconeus Software

The development of @fusi\-@bids already provides access to the broader neuroimaging
analysis ecosystem, demonstrating the strategic benefits of both standardized data
organization and compatible file format selection. While the BIDS framework proved
invaluable for dataset management through tools like PyBIDS, it was specifically the
adoption of the NIfTI file format that opened doors to analysis frameworks originally
developed for other neuroimaging modalities. Indeed, software tools such as Nilearn
@Nilearn have proven directly usable for @fusi analysis once data are converted to NIfTI
format, providing immediate access to versatile analysis tools.

Additionally, Iconeus is currently implementing tools to output @fusi\-@bids formatted
datasets directly from its software suite, enabling researchers to generate
standardized, shareable datasets without requiring manual conversion processes. This
direct integration represents a significant step toward widespread adoption of
@fusi\-@bids and demonstrates the specification's practical utility for both
research and potential future clinical applications.

== Current Landscape of Analysis Pipelines and Software Tools

=== Neuroimaging Software Ecosystem

The neuroimaging field has evolved a rich and diverse software ecosystem that reflects
decades of methodological development and community collaboration. This ecosystem
encompasses a wide range of tools, from comprehensive analysis packages that handle
complete processing workflows to specialized libraries designed for specific analytical
tasks or data modalities @Poldrack2019.

The current neuroimaging software landscape is dominated by several major analysis
packages that have shaped the field's computational practices @Man2015 @Poldrack2019
@Niso2022 @ViarHernndez2024. Established tools such as @fsl @FSL, @spm @SPM, @afni
@AFNI, and FreeSurfer @Freesurfer represent mature platforms that provide comprehensive
features for both structural and functional brain imaging analysis @Niso2022. These
packages, primarily implemented in C++ and MATLAB, have
accumulated extensive user bases and have been continuously refined over decades of
development and application @Man2015.

More recent developments have seen the emergence of Python-based neuroimaging tools that
leverage the language's extensive scientific computing ecosystem @Poldrack2019.
Libraries such as Nilearn @Nilearn, MNE @MNE, fMRIprep @Esteban2018, and NiPype @Nipype
represent a new generation of neuroimaging software that emphasizes modularity,
interoperability, and integration with modern data science workflows. These tools
benefit from Python's rich ecosystem of scientific libraries including NumPy
@Harris2020, SciPy @scipy, and scikit-learn @scikit-learn, enabling sophisticated
analyses while maintaining accessibility for researchers without extensive programming
backgrounds.

The evolution toward more open, modular, and interoperable software architectures has
been driven by several factors, including the increasing complexity of neuroimaging
datasets, the need for reproducible analysis workflows, and the desire to integrate
multiple analysis approaches within single studies @Poldrack2019 @Niso2022. Modern
neuroimaging research increasingly requires the ability to combine tools from different
software packages, leading to the development of workflow management systems and
interoperability frameworks that can orchestrate complex multi-step analyses @Nipype.

Platform diversity represents another significant characteristic of the contemporary
neuroimaging software landscape. While some tools remain platform-specific due to
historical development choices or technical constraints, there has been a general trend
toward cross-platform compatibility to accommodate the diverse computing environments
used in neuroimaging research. This diversity is reflected in the range of
implementation languages used, from low-level languages like C++ for computationally
intensive operations to high-level languages like Python and MATLAB for algorithm
development and prototyping.

The neuroimaging community has also embraced open-source development models that
facilitate collaborative development, peer review, and rapid dissemination of
methodological advances. This shift toward open science practices has accelerated
innovation while improving the transparency and reproducibility of neuroimaging research
methods @Poldrack2019. The success of open-source neuroimaging tools has demonstrated
the value of community-driven development in advancing scientific computing
capabilities.

=== @fusi:short Software Landscape

The @fusi software landscape encompasses both commercial and open-source solutions, each
serving distinct user communities and analytical needs. While some academic research
projects often require flexible, programmable analysis frameworks, commercial software
solutions like those developed by Iconeus provide standardized, user-friendly interfaces
for routine @fusi analyses.

==== Early Academic Efforts

The academic @fusi community faces challenges similar to those encountered by other
neuroimaging modalities before the development of flexible research frameworks. Most
research groups continue to rely on custom, laboratory-specific implementations that are
rarely shared, leading to duplicated effort and reduced reproducibility. The academic
literature reveals a pattern of limited code availability, with many @fusi articles
providing either no analysis code or only upon request---which rarely translates into
meaningful code sharing or reproducible research practices @Grayling2020 @Janssen2020
@Page2022.

A few notable exceptions have begun to appear in the @fusi literature, representing
early efforts to address the research community's need for open-source, versatile
analysis tools. Two packages for @fusi analysis have been recently published: `fusilib`
@NunezElizalde2022 and PyfUS #ref(<Lambert2025b>). While these represent valuable
contributions, they generally lack the comprehensive documentation, maintenance, and
community support that characterize mature neuroimaging packages.

==== Iconeus Software Ecosystem

The Iconeus software suite provides a comprehensive workflow for @fusi data management
and analysis (@fig:icosofts). IcoScan handles data acquisition and system control, while
IcoStudio offers sophisticated tools for single-scan visualization, anatomical
co-registration, and exploratory analysis through an intuitive graphical interface. In
December 2024, the beta version of IcoLab has been introduced to address batch
processing needs, enabling automated analysis of multiple acquisitions with built-in
preprocessing pipelines, connectivity analysis, and automated report generation. This
commercial ecosystem effectively serves researchers who require standardized workflows
and user-friendly interfaces for routine @fusi analyses.

#figure(
  placement: auto,
  image("figures/icosofts.png"),
  caption: figure-caption(
    [The Iconeus software ecosystem for @fusi:short data analysis.],
    [The Iconeus software ecosystem for data analysis consists of two main components:
      IcoStudio (*left*) for single-scan analysis and IcoLab (*right*) for batch
      processing and automated analysis pipelines. This ecosystem provides a
      comprehensive solution for managing and analyzing @fusi data, with a focus on
      user-friendly interfaces and standardized workflows.],
  ),
) <fig:icosofts>

Underlying these commercial applications is fUSlab, a comprehensive MATLAB research
toolbox originally initiated by Thomas Deffieux at Physics for Medicine in October 2020
as an academic Inserm project to consolidate various scripts and analysis methods.
fUSlab was subsequently licensed and co-developed with Iconeus, and is specifically
designed to interface with the Iconeus software ecosystem by offering features such as
handling of beamformed @iq data and sparse spatial sampling paradigms, image
registration, and some single-subject connectivity analysis methods (correlation
matrices, seed-based maps, first-level @glm). Development of fUSlab continued throughout
the period of this PhD work, with significant contributions during two dedicated
development phases. From September to December 2021, as an Iconeus employee prior to
beginning this PhD, I improved and documented the fUSlab codebase. Following the
implementation of novel preprocessing methods and the completion of initial
pharmacological connectivity studies using PyfUS (a Python package for @fusi presented
in #ref(<sec:pyfus>)), a second major development and refactoring phase was undertaken
from September 2022 to February 2023 to transfer the validated implementations from
PyfUS into the fUSlab toolbox. This development approach ensured that methods proven
effective in research contexts could be integrated into the Iconeus software ecosystem.
fUSlab is now primarily maintained by Luc Eglin, Signal Processing Engineer at Iconeus,
with the `fuslab2iconeus` toolbox building upon this foundation to implement the
complete processing pipelines used in IcoLab.

=== Motivation for PyfUS

The development of PyfUS was originally motivated by the specific analytical needs of
this @phd project and the concurrent @phd work of Felipe Cybis Pereira. The research
presented in this manuscript along with Felipe's investigations required flexible,
programmable analysis workflows that could allow the implementation of experimental
preprocessing approaches and novel analytical methods.

An additional motivation for developing PyfUS was the need for a versatile testing
platform that would enable development and validation of new analysis methods before
their integration into Iconeus' commercial software suite. PyfUS served as a research
and development environment where methods could be rapidly prototyped, evaluated, and
refined before being transferred to fUSlab and eventually integrated into IcoStudio and
IcoLab. This approach ensured that only validated methods would be incorporated into the
commercial workflow, maintaining the reliability and quality standards expected from
production software.

The choice to develop PyfUS in Python was driven by several practical considerations.
First, Python's extensive scientific computing ecosystem provides access to proven
algorithms through libraries like NumPy @Harris2020, SciPy @scipy, and scikit-learn
@scikit-learn, enabling rapid prototyping of new methods. Second, the compatibility with
established neuroimaging packages like Nilearn @Nilearn offered the opportunity to
leverage existing, well-tested functionality for signal processing, connectivity
analysis, and statistical modeling of neuroimaging data while focusing development
efforts on @fusi\-specific challenges. Finally, Python's growing adoption in
neuroimaging research (@ap:python-vs-matlab) suggested better long-term sustainability
and interoperability compared to MATLAB.

The package architecture was designed around the specific requirements encountered
during this research: handling diverse @fusi data formats, accommodating sparse spatial
sampling schemes, integrating with @fusi\-@bids datasets, and providing flexible
preprocessing pipelines for method development and validation. Rather than attempting to
create an end-to-end analysis platform, PyfUS focused on providing essential building
blocks that could be combined to address the analytical challenges specific to this @phd
work while maintaining compatibility with the broader Python scientific ecosystem.

These requirements define the foundation for PyfUS, a comprehensive Python package for
@fusi data handling, analysis, and visualization that represents a major contribution of
this thesis work. By addressing these needs through a well-designed software package,
PyfUS serves as a bridge between academic methodological development and practical
application, supporting both fundamental research advances and their eventual
integration into Iconeus' software ecosystem.

== PyfUS: A Comprehensive Python Package for @fusi:short Data Analysis <sec:pyfus>

PyfUS is a Python package developed to support the analytical requirements of this @phd
project and the concurrent @phd work of Felipe Cybis Pereira, providing flexible tools
for @fusi data handling, analysis, and visualization. Developed in parallel with and as
a complement to Iconeus' software ecosystem, PyfUS enabled the implementation of
experimental preprocessing approaches and novel analytical methods required for the
research presented in this manuscript.

It should be noted that the PyfUS package recently published by Lambert and colleagues
@Lambert2025b represents an independent development effort that shares its name with the
package developed during this PhD work---an unfortunate naming coincidence. However,
this clash is not problematic in practice, as the package developed in this thesis is an
Iconeus proprietary product not yet intended for public release, and will likely be
renamed in future iterations.

PyfUS originated at the #gls("ipnp", first: true), where it was initially conceived as the backend
solution of the PlatyfUS web application. PlatyfUS was tailored to
high-level#footnote[By high-level, we mean that the application was designed to be
  accessible to users without deep programming knowledge, and tailored to specific
  end-to-end analyses such as @fc:long analysis. In contrast, a low-level package provides
  the fundamental building blocks for @fusi analysis, and is designed to be used by
  programmers to build custom analysis pipelines.
] @fusi:short users and provided a @gui for image registration, @roi\-based analysis,
and scan visualization. This setup enabled researchers to explore and analyze @fusi
datasets without deep knowledge of the underlying codebase.

At the outset of the present @phd project, a new PyfUS package was started from scratch,
with the intent of providing a standalone and robust Python package for @fusi analysis.
This rewrite marked a conceptual shift from a @gui\-centered application to a versatile
analysis package. The new version of PyfUS was designed as a low-level, flexible
framework that could serve as the computational backbone for a wide variety of @fusi
analysis pipelines.

The development of the standalone PyfUS package was conducted in close collaboration
with Felipe Cybis Pereira, with the explicit aim of avoiding duplication of effort
between our respective @phd projects. This collaborative development led to the creation
of a general-purpose library containing essential building blocks required in most @fusi
analyses: @io operations, processing of beamformed @iq data, spatial registration,
interactive, and static visualization, and basic statistical modeling.

=== Design Philosophy

The development of PyfUS was guided by specific technical requirements identified during
this research, focusing on capabilities needed to support the analytical workflows
presented in this manuscript. The package architecture addresses several key challenges
that distinguish @fusi data from other neuroimaging modalities while maintaining
compatibility with established frameworks.

The primary design goal centered on accommodating the unique characteristics of @fusi
data: managing sparse spatial sampling patterns, handling proprietary Iconeus data
formats, processing beamformed @iq data, and providing visualization functions adapted
to preclinical @fusi acquisitions.

The secondary goal involved integration with the existing Python neuroimaging ecosystem
to avoid reinventing the wheel. Packages like Nilearn @Nilearn provide robust
implementations of @glm models, connectivity measures, and group-level analysis methods
while requiring minimal adaptation to @fusi data. PyfUS was designed to bridge the gap
between @fusi and the broader neuroimaging ecosystem by handling @fusi\-specific
preprocessing and data management challenges, then seamlessly interfacing with
established neuroimaging analysis tools.

The package emphasized modularity and extensibility, enabling rapid prototyping of new
analysis approaches while maintaining backward compatibility with existing workflows.
This flexibility proved essential for the experimental preprocessing approaches required
in @ch:denoising and @ch:pharmacofusi, where experimental preprocessing approaches
required iterative development and validation.

Finally, reproducibility and robustness were prioritized through comprehensive
documentation, standardized interfaces, and extensive testing frameworks. These
practices ensured that methods developed during this research could be reliably
reproduced and transferred to the Iconeus software suite through fUSlab.

=== Core Data Structures

The foundation of PyfUS rests on two primary data structures representing different
stages of @fusi data processing: the `Scan` class for processed volumetric @fusi
data---for example, power Doppler and velocity signals---and the `IQ` class for
beamformed @iq signals.

===== The `Scan` Class: The Heart of PyfUS

The `Scan` class serves as the central data structure in PyfUS, encapsulating @fusi data
along with spatial and temporal metadata.

- Data are organized as 6-dimensional arrays with shape `(x, y, z, t, p, e)`, where
  `(x, y, z)` represent spatial dimensions, `t` encodes time, `p` accommodates multiple
  probe poses for sparse sampling, and `e` provides an extra dimension for derivative
  information like statistics or masks.
- Timing information is stored as a `(t, p)` array, ensuring that probe poses can be
  associated with specific time points in the acquisition sequence.
- Spatial location in the physical space---for example, the scanner space defined in
  #ref(<sec:fusi-bids-coordinate-system>)---is represented as voxel dimensions, origin,
  and orientation attributes. These are stored as a single affine transformation per
  probe pose, derived from NIfTI's `qform` field.
- Spatial location in a standard space---for example, the Allen Mouse Brain @ccf
  coordinate system #cite(<Wang2020>)---is represented as a single affine transformation
  per probe pose, derived from NIfTI's `sform` field.

This structure enables the representation of diverse @fusi acquisition schemes, from
simple 2D+t recordings to complex 3D+t sparse sampling protocols. A `Scan` can thus be
seen as a "stack" of NIfTI files---one per probe pose---, maintaining compatibility
with the broader neuroimaging ecosystem while providing the flexibility required for
@fusi data.

The `pyfus.scan` module extends the core `Scan` class with essential utility functions
for common data manipulation tasks. These include `crop_scan()` for automatically
removing empty space around brain volumes, `concatenate_scans()` for combining multiple
acquisitions along any dimension, and `mean_scan()` for computing temporal averages
across multiple scans. Advanced functions such as `consolidate_scan()` handle the
reconstruction of full volumes from sparse sampling schemes, while
`apply_slice_timing_correction()` provides temporal interpolation for 3D+t acquisitions
where different slices were acquired at different time points. The `eval_scan()`
function enables flexible mathematical operations using NumPy-style string formulas,
facilitating complex data transformations directly on `Scan` objects.

==== The `IQ` Class: Beamformed @iq:short signals

The `IQ` class encapsulates beamformed @iq data, representing the complex ultrasound
signals obtained after beamforming and @iq demodulation#footnote[See
  @sec:iq-demodulation for a reminder on @iq demodulation.]. This data structure handles
the earliest stage of @fusi processing, before computation of B-mode, power Doppler, or
velocity signals.

`IQ` data are organized as 6-dimensional arrays with shape
`(x, y, z, angles, volumes, blocks)`, where spatial dimensions `(x, y, z)` correspond to
azimuth, elevation, and axial axes respectively. The `angles` dimension accommodates
different ultrasound wave angles for non-compounded volumes, while `volumes` and
`blocks` represent temporal organization of the acquisition sequence. The arrays are
stored as complex data types, typically using single-precision floating-point
representation to reduce memory requirements.

The `IQ` class provides methods for transforming beamformed @iq:pl into common @fusi
modalities. This is achieved through the flexible `compute_scan()` method, which accepts
user-defined processing functions to compute volumes from beamformed @iq data and
returns processed data as `Scan` instances. This modular design enables experimentation
with custom processing functions to test novel clutter filtering approaches or
alternative signal processing methods while maintaining compatibility with other PyfUS
modules. Meanwhile, specialized methods such as `compute_power_doppler()` and
`compute_axial_velocity()` wrap `compute_scan()` with predefined processing functions to
allow straightforward computation of power Doppler and axial velocity signals.

Additionally, the `pyfus.iq` module implements various clutter filtering
approaches---including @svd\-based methods (`clutter_filter_svd_from_energy()`,
`clutter_filter_svd_from_indices()`) and frequency filtering techniques
(`clutter_filter_butterworth()`)---that remove clutter artifacts for vascular imaging.

=== Data @io:short

The `pyfus.io` module provides comprehensive #gls("io", first: true) capabilities that bridge the gap
between Iconeus proprietary @fusi data formats and standardized neuroimaging file
formats.

==== Multi-Format Support and Conversion

For regular @fusi data, the `load_scan()` function allows loading from multiple formats,
including NIfTI files and proprietary SCAN files outputted by Iconeus systems.
Meanwhile, the `load_iq()` function handles beamformed @iq data in both BIQ and RAW
formats, accommodating the different formats used by Iconeus systems.

When loading NIfTI scans, PyfUS automatically extracts metadata from accompanying JSON
sidecar files, maintaining compatibility with @fusi\-@bids datasets. For sparse sampling
schemes common in @fusi, the system elegantly handles multiple NIfTI files by using a
specific filename placeholder (`{pose}`), seamlessly concatenating files along the pose
dimension during loading.

==== Registration Metadata

Contrary to the NIfTI format, the proprietary SCAN format does not store spatial
registration information directly, preferring to rely on accompanying @bps files. @bps
files can be loaded directly using the `load_bps()` function; however, the `load_scan()`
function can also load these files and automatically apply the transformations
when loading scans.

==== Data Export

The `save_scan()` function enables saving `Scan` instances to both SCAN and NIfTI
formats. This facilitates interoperability with the Iconeus software suite while
ensuring compatibility with the broader neuroimaging ecosystem. When exporting to NIfTI
format, PyfUS automatically generates one NIfTI file per probe pose, along with
appropriate JSON sidecar files containing @fusi\-specific metadata, maintaining
compatibility with the @fusi\-@bids specifications.

=== Image Registration and Atlases

The spatial alignment and anatomical standardization of @fusi data is a requirement for
group-level analyses and cross-subject comparisons. PyfUS addresses these needs through
two complementary modules: `pyfus.registration` for spatial transformations and
`pyfus.atlas` for querying standard brain atlases and extracting #glspl("roi", first: true).

==== `pyfus.registration`: A Posteriori Registration

The registration module provides comprehensive tools for spatial alignment of @fusi
data, implementing both linear and non-linear transformation methods. Built upon the
SimpleITK package #cite(<Yaniv2017>)---a convenient wrapper around the widely-adopted
@itk image analysis library---the registration module once again highlights the
advantages of the Python ecosystem by providing access to proven, battle-tested
algorithms through an intuitive interface#footnote[Most of MATLAB registration functions
  are based on @itk, but provide a much higher-level interface that does not allow for the
  same level of control over the registration process.]. The module addresses two primary
use cases: inter-subject registration for group-level studies and intra-subject motion
correction for single-subject preprocessing.

===== Core Registration Framework

`register_scan()` serves as the main registration function, enabling alignment between
any two `Scan` instances using multiple transformation models. The function implements
three transformation types to accommodate different registration scenarios:

- _Rigid transformations_: rotations and translations only, suitable for motion
  correction and initial alignment
- _Affine transformations_: rotations, translations, zooms, and shears, appropriate for
  inter-subject registration accounting for brain size differences
- _B-spline transformations_: non-linear deformations enabling precise anatomical
  alignment for complex morphological variations

The registration process operates directly in the scans' physical coordinate spaces
using a gradient descent optimizer with configurable similarity metrics. Two metrics
address different registration scenarios: normalized cross-correlation for standard
intra-modal registration, and mutual information for more robust multi-modal alignments
or cases with significant intensity differences.

===== Motion Correction

`realign_scan()` allows motion correction of single @fusi acquisitions in case of large
brain movements. Motion correction is based on the `register_scan()` function and
supports all three transformation types, though rigid transformations are typically
sufficient for most @fusi applications. The function leverages parallel processing to
handle long acquisitions efficiently.

===== Spatial Transformation and Resampling

The registration pipeline is completed by `resample_scan()` and `resample_to_scan()`,
which handle the application of computed transformations to align data to target
coordinate spaces.

`resample_scan()` provides flexibility by accepting arbitrary target spaces, while
`resample_to_scan()` offers a convenient interface for aligning one scan to match
another's coordinate system exactly. Both functions implement multiple interpolation
methods.

Moreover, the resampling functions properly handle `Scan` metadata and coordinate
systems, ensuring that affine transformations are correctly propagated through the
registration pipeline and that the resulting aligned data maintains spatial consistency.

===== Registration Quality Assessment

PyfUS integrates registration monitoring and quality assessment directly into the
registration workflow. The `RegistrationProgressPlotter` class provides real-time
visualization of metric convergence and composite overlays during registration, enabling
users to monitor registration progress and identify potential convergence issues
(@fig:pyfus-registration). The module's integration with
`pyfus.plotting.plot_composite_scan()` facilitates visual assessment of registration
accuracy through color-coded overlay visualizations.

#figure(
  placement: auto,
  image("figures/pyfus-registration.png"),
  caption: figure-caption(
    [PyfUS' registration assessment.],
    [PyfUS' `register_scan()` function provides real-time visual assessment of the
      registration process, allowing users to monitor metric convergence (*left*) and
      visualize a composite overlay of the registered scans (*right*) during the
      registration process.
    ],
  ),
) <fig:pyfus-registration>

==== `pyfus.atlas`: Manipulation of Atlases

The atlas module provides features for working with hierarchical brain atlases and
extract @roi:pl. Built upon the BrainGlobe Atlas API Python package @bg-atlasapi, the
module addresses the need to relate @fusi measurements to anatomical structures,
enabling group analyses and cross-study comparisons. Thanks to BrainGlobe Atlas API,
PyfUS can leverage more than 20 standard atlases from the broader neuroimaging
community, including the Allen Mouse Brain Atlas @Wang2020 and the Waxholm Space atlas
of the rat brain @Kleven2023. Extension to new atlases is straightforward, with
tutorials available on the
#link("https://brainglobe.info/documentation/brainglobe-atlasapi/index.html")[BrainGlobe
  Atlas API website].

===== Hierarchical Atlas Architecture

The `Atlas` class serves as the central data structure for atlas manipulation,
implementing a framework that combines spatial annotation data with hierarchical
structural information.

The architecture integrates three essential components:

- _Structural hierarchy_: A hierarchical tree defines parent-child relationships between
  brain regions, enabling navigation from fine-grained anatomical structures to broader
  anatomical divisions.
- _Spatial annotations_: A `Scan` object containing integer-labeled volumes where each
  voxel is assigned to the most specific (leaf-level) region in the hierarchy. These
  annotations provide the spatial mapping between coordinate locations and anatomical
  structures.
- _Hemisphere information_: Optional hemisphere data enabling lateralized analyses

Each `Atlas` instance stores affine transformation matrices that relate the atlas
data to the corresponding standard atlas space. This allows relating `Scan` instances to
atlas coordinates after registration.

===== Flexible @roi:short Selection

The atlas framework provides multiple approaches for selecting and manipulating regions
of interest to accommodate diverse analysis requirements:

- Structure querying capabilities enable locating brain regions using multiple
  identification methods: numerical indices corresponding to annotation labels,
  text-based searches using structure names or acronyms, and pattern-based queries for
  finding related structures within the hierarchy.
- Hierarchical navigation functions allow traversal of the structural tree to extract
  anatomically meaningful groupings.
- Dynamic atlas creation enables the creation of specialized atlas instances rooted at
  specific structures, facilitating focused analyses on particular anatomical regions.

===== Region Extraction and Resampling

The `Atlas` class allows extracting @roi:pl from the atlas annotations, and supports
bidirectional transformations between atlas and scan spaces:

- `get_structure_mask()` extracts binary masks for specific brain regions, with optional
  hemisphere selection for lateralized analyses. These masks can then be used for
  @roi\-based analyses and connectivity studies.
- `resample_atlas_to_scan()` and `resample_scan_to_atlas()` provide bidirectional
  coordinate transformation capabilities from atlas to scan spaces and vice versa.

These operations properly handle the complexities of sparse sampling schemes common in
@fusi, ensuring that probe pose information is correctly preserved during coordinate
transformations.

===== Integration with Analysis Workflows

The `Atlas` class integrates seamlessly with other PyfUS modules to enable comprehensive
anatomical analyses:

- Visualization integration through `pyfus.plotting.plot_atlas()` provides anatomical
  visualization capabilities. The visualization system supports both 2D slice-based and
  3D volumetric rendering of @roi boundaries and labels.
- Masks extracted from an `Atlas` instance can be used directly in all statistical
  analysis modules, including both @glm and connectivity classes.

=== Visualisation

The `pyfus.plotting` module provides visualization features adapted to the
characteristics of @fusi data, including support for sparse sampling schemes and the
spatial scales typical of preclinical @fusi research.

==== Core Visualization Framework

The module centers around flexible scan visualization through `plot_scan()` for general
@fusi data rendering and `plot_stat_map()` for statistical results, both supporting
automatic handling of multidimensional datasets with proper anatomical scaling. @Roi
and atlas visualization through `plot_roi()` and `plot_atlas()` provide tools for
anatomical visualization.

Advanced capabilities include composite visualization (`plot_composite_scan()`) for
registration quality assessment through color-coded overlays, temporal analysis tools
ranging from carpet plots (`plot_carpet()`) to animations (`animate_scan()`), and
three-dimensional volumetric rendering (`plot_scan_3d()`) leveraging PyVista @pyvista.

==== Backend Flexibility

PyfUS implements dual backend support for both Matplotlib @Hunter:2007 and Plotly
@plotly rendering engines, allowing to choose between publication-quality static figures
and interactive visualizations.

The plotting module integrates throughout the PyfUS analysis pipeline, providing
real-time registration monitoring, statistical result visualization, and atlas-based
interpretations, supporting both exploratory analysis and publication preparation with
minimal manual formatting effort. Almost all figures in this thesis displaying @fusi
data and derived statistical results were generated using PyfUS.

=== @fusi:short Preprocessing

The preprocessing capabilities of PyfUS address the need for denoising of @fusi data.
PyfUS combines signal preprocessing through `pyfus.preprocessing` with flexible signal
extraction through `pyfus.masking`, providing a pipeline for data preparation before
statistical analyses.

==== `pyfus.preprocessing`: Time-series preprocessing

The preprocessing module implements essential signal processing operations designed for
@fusi data. Built as an extension of Nilearn's `nilearn.signal` module, the
preprocessing module leverages tried and tested algorithms to avoid reinventing the
wheel while addressing some peculiarities of @fusi data.

The `clean()` function serves as the central preprocessing function. The function
implements a six-step pipeline:
- _pre-scrubbing_ interpolation for avoiding ringing artefacts caused by motion while
  retaining stable sampling rates,
- _detrending_ to remove slow drifts,
- _temporal filtering_ using either Butterworth or cosine methods,
- _scrubbing_ to remove motion-corrupted volumes,
- _confound removal_ through orthogonal regression, and
- _standardization_ for statistical analyses.

Following established principles from Lindquist and colleagues @Lindquist2019, the
approach ensures that temporal filters and confound removal are applied orthogonally to
prevent artifact reintroduction.

The `pyfus.preprocessing` module also provides individual functions for each of these
steps, allowing for flexible preprocessing pipelines. Moreover, functions like
`compute_dvars()` and `compute_compcor_confounds()` allow extracting the confound
signals that were found to be most effective in the denoising benchmark presented in
@ch:denoising.

==== `pyfus.masking`: Extract Voxel Signals from Scans

The masking module provides tools for signal extraction, transforming 6-dimensional
`Scan` instances into 2D `(time, voxels)` matrices that serve as the common input format
for most data analysis packages, including scikit-learn @scikit-learn.

`apply_mask()` serves as the main function for signal extraction from @fusi data with
optional spatial smoothing. Both `get_voxels_signals()` and `get_rois_signals()` build
upon `apply_mask()`, allowing voxel- and @roi\-based signal extraction respectively
while integrating preprocessing features provided by the `pyfus.preprocessing.clean()`
function.

Meanwhile, `unmask()` enables "unmasking" a 2D `(time, voxels`) matrix back into a
`Scan` instance to facilitate visualization and analysis workflows requiring
volumetric representations.

=== Statistical Analysis

The statistical analysis capabilities of PyfUS demonstrate the package's core
philosophy: handling @fusi\-specific processing, @io, and visualization challenges that
are difficult to achieve with existing pipelines, then seamlessly integrating back into
the established Python neuroimaging ecosystem. The framework heavily re-exports classes
and functions from Nilearn, enabling access to proven statistical methods.

==== `pyfus.glm`: Generalized Linear Models

The @glm module provides statistical modeling by integrating Nilearn's @glm models.
`FirstLevelModel` and `SecondLevelModel` extend Nilearn's implementations with few
@fusi\-specific adaptations. This module supports full compatibility with the design
matrix and contrast specification, and statistical inference features offered by
Nilearn. Group-level analysis through the `SecondLevelModel` class integrates seamlessly
with PyfUS' registration and atlas frameworks, enabling population-level inference in
atlas coordinate spaces.

==== `pyfus.correlation`: Functional Connectivity Analysis

The correlation module similarly leverages Nilearn's connectivity infrastructure.
`ConnectivityMeasure` directly extends Nilearn's connectivity estimation class,
providing access to methods including correlation, partial correlation, and tangent
space measures. `SeedBasedMap` allows computing seed-based connectivity maps, including
using cross-correlation for temporal lag analysis.

This approach illustrates PyfUS' interoperability: rather than reimplementing
statistical methods, the package focuses on solving the @fusi\-specific technical
challenges---data formats, preprocessing requirements, visualization needs---then
seamlessly connects processed @fusi data to the mature analytical capabilities of the
broader scientific Python ecosystem.

=== Software Engineering Practices

Beyond its analytical capabilities, PyfUS follows modern software development practices
for sustainable scientific software. The package provides a comprehensive documentation
and follows rigorous quality assurance procedures that ensure both immediate usability
and long-term maintainability.

==== Documentation

PyfUS features a web-based documentation automatically generated using Sphinx @Sphinx,
providing both high-level examples for new users and detailed API references for regular
use (@fig:pyfus-documentation). The documentation is automatically generated from
docstrings within the source code, ensuring that documentation remains synchronized with
implementation as the package evolves. Integrating the documentation generation with the
development workflow ensures that all new features include appropriate documentation.

#figure(
  placement: auto,
  image("figures/pyfus-docs.png"),
  caption: figure-caption(
    [PyfUS' web-based documentation.],
    [(*Top*) PyfUS' documentation is automatically generated from the source code using
      Sphinx @Sphinx and is hosted on a local server at Physics for Medicine. The
      documentation provides high-level examples for new users (*bottom left*) and a
      detailed API reference for regular use (*bottom right*).],
  ),
) <fig:pyfus-documentation>

==== Development Practices

PyfUS is version-controlled using Git and hosted on a private GitHub repository,
enabling collaborative development between Iconeus and Physics for Medicine. The package
follows semantic versioning principles and maintains a clear changelog to document
changes between releases. Version 0.18.2 was released in June 2025, marking the final
release before the submission of this manuscript.

Additionally, PyfUS implements unit testing procedures covering more than 90% of the
source code, enabling rapid development without fear of inadvertently breaking existing
functionality. The test suite validates not only individual function behavior but also
integration between modules, data format compatibility, and numerical accuracy of
analytical results.

The development workflow incorporates automated testing and code formatting through
GitHub Actions, implementing continuous integration practices that maintain code quality
standards throughout the development process. Automatic code formatting ensures
consistent style across the 32,000 lines of source code developed over almost four years
of work, while automated testing provides immediate feedback on potential issues
introduced by new developments.

== Discussion

=== Future @fusi:short\-@bids:short Developments

The development of @fusi\-@bids represents a significant step toward data
standardization in the @fusi field, addressing organizational challenges before they
become entrenched obstacles to collaboration and reproducibility. The specification
accommodates the unique characteristics of @fusi data, particularly sparse spatial
sampling schemes and ultrasound-specific metadata, while maintaining compatibility with
the established neuroimaging ecosystem through adoption of the NIfTI format and
integration with existing analysis tools.

However, several areas require continued development. First, the current specification
focuses on power Doppler imaging. Future iterations could accommodate additional
modalities such as B-mode and axial velocity measures through the addition of new
suffixes and metadata fields. Additionally, the decision to use NIfTI format
necessitates storing probe poses as separate files. While this approach ensures
interoperability with existing neuroimaging tools, further real-world testing will be
needed to determine whether it remains adequate as acquisition protocols evolve.
Alternatively, a dedicated @fusi file format based on modern data storage solutions like
Zarr @Zarr might prove more suitable, allowing for more efficient storage and retrieval
of complex @fusi datasets.

Community feedback and real-world testing will be crucial for refining the specification
before final submission to @bids maintainers. The development of automated validation
tools to ensure dataset compliance now represents a priority, with discussions already
underway among contributors to implement such capabilities.

=== Lessons from Established Neuroimaging Modalities

The timeline for @fusi standardization can be informed by experiences in other
neuroimaging fields. @fmri research operated without standardized data organization for
approximately 20 years before BIDS was released in 2016 @Gorgolewski2016. Given that
@fusi has been in development for over a decade since its first publication in 2011
@Mac2011, we have reached an opportune time for implementing standardization efforts
while the field remains manageable in scope.

However, the relative youth and size of the @fusi field presents both challenges and
opportunities for standardization. The limited number of publications and independent
laboratories compared to established modalities means fewer use cases to accommodate,
simplifying the development of the @fusi\-@bids specification. However, this limited
diversity also makes it difficult to anticipate all future requirements that may emerge
as the field matures and new research groups adopt the technique.

Ultimately, the success of @bids in transforming @fmri research practices demonstrates
the value of early standardization in preventing fragmentation and facilitating
collaborative research @Poldrack2024. @fusi has the opportunity to avoid the
organizational challenges that affected other neuroimaging disciplines by implementing
standardized practices during its early development phase.

=== Current Analysis Challenges in the @fusi:short Community

The need for improved analysis tools may represent a pressing challenge facing the @fusi
community today. Evidence for this comes from community feedback collected during
fUSbrain \#DAYS 2025, held in July 2025 during the writing of this manuscript. A poll
conducted at the conference's conclusion asked 47 participants about the strengths and
limitations of @fusi (@fig:fusbrain-poll). Remarkably, more than half of the challenges
identified by participants were related to the lack of standardization and analysis
tools for @fusi data, highlighting the urgency of addressing this gap#footnote[Notably,
  three out of the seven challenges not related to @fusi analysis concerned motion
  artifacts, an issue that this @phd project also sought to address through the systematic
  evaluation of denoising strategies presented in @ch:denoising.].

#figure(
  placement: auto,
  image("figures/fusi-poll-tools.png"),
  caption: figure-caption(
    [The need for standardized tools in @fusi:short.],
    [This poll was conducted at the end of the fUSbrain\#DAYS 2025 conference, where 47
      participants were asked about the strengths and limitations of @fusi. More than half
      of the challenges listed by participants were related to the lack of standardization
      and analysis tools for @fusi data (red vs. yellow).],
  ),
) <fig:fusbrain-poll>

This community feedback aligns with patterns observed in the current @fusi literature,
where most articles rely on custom scripts or adaptations of existing neuroimaging
pipelines @Vidal2020a @Agyeman2024. Such approaches, while enabling individual research
projects, create barriers to reproducibility and collaboration across laboratories.
Addressing this challenge will likely require coordinated community efforts, and
specialized conferences such as fUSbrain \#DAYS could provide excellent venues for
organizing workshops and training sessions, following successful examples from other
neuroimaging fields---for example, the @incf meetings where @bids was developed
@Poldrack2024. Hopefully, the methods developed in this thesis and integrated into the
Iconeus software suite will contribute to solutions for this challenge.

=== Personal Reflections on Future Perspectives

During my work on this thesis, I observed that the @fusi software landscape is currently
in a transition period, where commercial solutions coexist with emerging
research-oriented tools. This observation led me to reflect on potential parallels with
established neuroimaging modalities and consider how the @fusi field might evolve.

==== Open-Source Solutions in Academic Research

The current dominance of open-source neuroimaging tools in established fields like @fmri
and @eeg leads me to consider whether similar approaches might be valuable for academic
@fusi research. Indeed, even pioneering clinical @fmri projects rely on open-source
neuroimaging software @Gordon2017 @Kang2024. Open source appears to respond to specific
research needs: notably, methodological flexibility for implementing novel approaches
and reproducibility requirements. As Poldrack and colleagues argue,

#quote(block: true, attribution: [@Poldrack2019])[
  the use of closed software or data that are not available to other researchers leads
  to irreproducible research by definition.
]

Given the reproducibility crisis faced by the neuroscience community
(@sec:data-handling-challenges), I believe the adoption of open-source solutions in
@fusi research could follow a similar pattern. This is consistent with the recent
conclusions of a working group composed of leading scientists in the field of rodent
functional neuroimaging:

#quote(block: true, attribution: [@Gozzi2025])[
  There is wide consensus among investigators of this working group on the importance of
  developing end-to-end, user-friendly, and open-source preprocessing pipelines tailored
  for rodent functional neuroimaging analysis.
]

Analysis of publication patterns in @fmri illustrates open-source adoption. Comparing
BrainVoyager---the most widely used commercial @fmri software #cite(<Goebel2006>)---and
#ref(<spm>)---a widely adopted open-source @fmri software #cite(<SPM>)---PubMed searches
reveal that approximately 1,074 articles mention "fMRI" and "SPM" while only 46 articles
mention "fMRI" and "BrainVoyager". Similarly, the recent fMRIprep article from
2019---introducing an open-source preprocessing pipeline for @fmri data---has
accumulated 1,656 citations on PubMed at the time of writing @Esteban2018, while the
much older BrainVoyager article from 2006 has only 477 citations @Goebel2006. While this
disparity could reflect cost considerations as much as methodological preferences, it
suggests to me a predominance of open-source solutions in academic research

==== The Complementary Role of Commercial Solutions

Despite the large adoption of open-source tools in academic research, I recognize that
commercial software solutions remain useful for some research scenarios. While
programming skills are increasingly prevalent in neuroscience research @Juavinett2022
@Juavinett2024 @Shah2022, commercial @gui\-based software continues to serve important
functions for researchers without programming backgrounds. This is particularly true for
tasks such as quality control during acquisition, anatomical localization for
experimental planning, interactive data exploration, and routine analyses.

Commercial solutions like IcoStudio and IcoLab excel in providing standardized,
validated workflows as user-friendly @gui:pl. These tools ensure reproducible results
through guided interfaces and automated processing pipelines, reducing the barrier to
entry for laboratories beginning @fusi research. Furthermore, commercial software
typically offers comprehensive technical support and quality assurance that may be
difficult to maintain in smaller open-source projects.

From my perspective, the relationship between open-source and commercial software is
complementary rather than competitive. Open-source platforms serve as testbeds for
pioneering new methods and standardizing existing processing and analysis approaches
through community validation and peer review. Once methods become well-established and
standardized, commercial software can implement these approaches through user-friendly
interfaces that make sophisticated analyses accessible to researchers without
programming expertise. This division of roles accelerates both methodological innovation
and practical adoption, benefiting the entire research community.

==== Potential Opportunities and Challenges for Industrial Actors

In the context of companies like Iconeus, I see a potential strategic opportunity to
contribute to open-source initiatives while maintaining their commercial offerings. The
current @fusi landscape presents a unique situation where no widely-adopted,
comprehensive analysis package exists---unlike established modalities that already have
mature open-source ecosystems. This could represent a window of opportunity for the
@fusi community as a whole, where both academic groups and companies could consider
contributing to establishing field standards.

From my observations of other neuroimaging fields, supporting open-source initiatives
could help industrial actors build trust and reputation within the research community.
If the @fusi field eventually adopts open-source solutions---as has happened in other
neuroimaging fields---companies that spearhead such projects early might be better
positioned to develop commercial offerings around the resulting ecosystem. For instance,
IcoLab could potentially be building upon open-source, peer-reviewed @fusi software for
its backend processing, while offering commercial value through its frontend
interface---including automated batch analyses, interactive @gui:pl, advanced
visualization tools, quality control reports, and technical support.

However, significant challenges exist for industrial actors considering open-source
contributions. Many industrial actors depend on software licenses or exclusive
functionalities for revenue generation, so open-sourcing core components might conflict
with established business models, especially when clients expect exclusive features in
commercial solutions. Companies must also consider how to differentiate their offerings
when the underlying analytical methods become freely available.

Open-source tools also create substantial expectations for ongoing maintenance,
bug fixes, and user support that may exceed available resources for smaller companies
like Iconeus. The responsibility of maintaining code quality and addressing community
feedback can become substantial, requiring dedicated development resources and long-term
commitment to the project's sustainability.

Finally, once software is open-sourced, companies lose some control over the development
roadmap, as community priorities may diverge from commercial objectives, potentially
requiring careful balance between community needs and business requirements.

== Chapter Conclusion

This chapter proposes some solutions to the need for both standardization and
comprehensive analysis tools in the emerging field of @fusi:long, while recognizing the
complementary roles that commercial and research-oriented solutions play in supporting
the growing @fusi community. Drawing from the lessons learned in other neuroimaging
modalities, particularly the success of the @bids:long, we have identified and tried to
address challenges through a collaborative approach that bridges academic research and
commercial application.

The development of the @fusi\-@bids specification represents a proactive approach to
data standardization, tackling @fusi\-specific challenges such as sparse spatial
sampling and coordinate system definitions before they become entrenched obstacles to
collaboration and reproducibility. By extending the @bids framework through a
community-driven process, @fusi\-@bids provides a standardized structure that
facilitates data sharing, reduces curation overhead, and enables automated analysis
workflows. The adoption of the NIfTI format and integration with existing software
ensures compatibility with the broader neuroimaging ecosystem, while its implementation
in commercial software demonstrates real-world adoption and practical utility.

Complementing this standardization effort, the development of PyfUS addresses the
specific need for a flexible, programmable analysis framework. By leveraging the Python
neuroimaging ecosystem and following modern software development practices, PyfUS
provides a versatile @fusi research infrastructure while maintaining productive
connections to Iconeus' software ecosystem. This relationship demonstrates how academic
innovation can inform commercial tool development.

Perhaps most importantly, I believe this work illustrates the potential value of
learning from the experiences of established neuroimaging modalities. By implementing
standardization practices early in @fusi's development, the field may have the
opportunity to avoid some of the fragmentation and inefficiencies that have historically
challenged other fields. The combination of standardization, analysis tools, and
community-driven development practices could position the @fusi field to maximize its
scientific potential while maintaining the reproducibility and transparency that are
essential for robust neuroscience research.

As @fusi continues to mature and expand, the frameworks established in this chapter
could provide a solid foundation for future developments. The extensible nature of both
@fusi\-@bids and PyfUS should allow new methodological advances to be readily
incorporated while maintaining backward compatibility. This work thus represents not
just a technical contribution, but a strategic investment in the long-term success and
sustainability of @fusi:long as a valuable tool for neuroscientists, supported by both
robust academic research infrastructure and practical commercial applications.
