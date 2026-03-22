#import "/helpers.typ": *
#import "/glossary.typ": *

= Python vs. MATLAB: Rationale for Platform Choice <ap:python-vs-matlab>

== Brief Overview of the MATLAB Landscape in Neuroimaging

MATLAB has historically dominated computational neuroimaging, establishing itself as the
standard for many analysis workflows through influential packages such as SPM @SPM ,
EEGLAB @eeglab, and FieldTrip @fieldtrip. This dominance reflects both MATLAB's early
alignment with the field's mathematical foundations and institutional dependencies that
favored continued adoption despite emerging alternatives.

In @fusi research, MATLAB owes its dominance to its early use in acoustics physics and
signal processing, where it provided a powerful platform with an extensive ecosystem of
toolboxes for signal processing, data analysis, and visualization. The availability of
toolboxes such as Field II @field2 asserted MATLAB as the de facto standard for
ultrasound research. Additionally, the Verasonics ultrasound systems that are at the
heart of most current @fusi research are tightly integrated with MATLAB.

However, several limitations have become increasingly apparent. MATLAB's proprietary
licensing creates substantial costs that can be prohibitive for smaller institutions,
while its closed-source framework limits code sharing and collaborative development.
Additionally, MATLAB's monolithic architecture constrains integration with modern data
science workflows that are becoming essential for large-scale analyses.

== Python's Advantages for Scientific Computing

As detailed previously, Python offers significant advantages for scientific computing,
particularly in neuroimaging research. As an open-source language, it eliminates
licensing costs and promotes collaborative development, supporting open science
practices @Poldrack2019.

The language provides a comprehensive scientific ecosystem through libraries like NumPy
@Harris2020, SciPy @scipy, and scikit-learn @scikit-learn for numerical computation and
machine learning, with specialized neuroimaging tools like Nilearn @Nilearn building
upon this foundation. Python excels at integration, allowing researchers to combine
diverse tools through frameworks like Nipype @Nipype, which unifies major neuroimaging
packages and manages complex workflows @Poldrack2019.

For @fusi analysis specifically, Python offers several key capabilities:
memory-efficient processing of large datasets through libraries like Dask @Dask,
distributed computing support for intensive operations, modern packaging and quality
assurance practices, and a large number of community resources that enable rapid
development and troubleshooting. In short, Python serves as a versatile platform---a
sort of "glue code"---that can bring together high-performance libraries and specialized
tools in a simple and accessible way.

== Platform Trends and Community Adoption

The shift toward Python in scientific computing reflects broader trends across multiple
domains. Indeed, Python has now become the dominant programming language in many areas,
from scientific computing to data science and machine learning
(@fig:python-matlab-trends).

In terms of general usage, Python has consistently ranked higher than MATLAB since 2005
according to the @pypl index, now being the most popular programming language in the
world. Meanwhile, MATLAB has been slowly loosing in popularity since 2013, and is now
ranked 14#super[th] in the @pypl index at the time of writing. This trend reflects the
significant shift toward Python as the primary programming language for scientific
computing, driven by its versatility, ease of use, and extensive ecosystem of libraries
and frameworks.

In the biomedical research domain, the trend is similar. While MATLAB has historically
been a popular choice for biomedical data analysis, Python has seen an exponential
growth in usage over the past two decades. A PubMed search for "MATLAB" and "Python" in
biomedical publications reveals that the yearly number of publications mentioning Python
has surpassed that of MATLAB since 2018, with Python now being mentioned in almost 75%
more publications than MATLAB in 2024.

A similar phenomenon can be observed in the neuroimaging research community, although
adoption began later. A PubMed search for major neuroimaging software packages reveals
that MATLAB seems to be reaching a plateau, while Python use has seen a strong increase
since 2015. Python has now reached the same level of usage as MATLAB in 2024, and the
trend suggests that Python will continue to grow in popularity within the neuroimaging
community. Moreover, Python has surpassed the well-established @spm package in 2022, and
is on track to surpass @fsl in the coming years. Recognizing this trend, the @spm
developers have now made @spm entirely accessible from Python through the SPM25 release
@spm25.

The community-driven development model of Python creates resilient and innovative
software ecosystems while ensuring that tools remain available and modifiable as
research fields evolve @Poldrack2019. For an emerging field like @fusi, building
analysis capabilities on this foundation provides the flexibility and sustainability
necessary for long-term methodological development.

#figure(
  placement: auto,
  image("figures/python_vs_matlab.png"),
  caption: figure-caption(
    [Python vs. MATLAB for neuroimaging data analysis.],
    [The usage of Python vs. MATLAB is compared in three different contexts: (*left*)
      general programming language popularity, (*middle*) biomedical publications, and
      (*right*) neuroimaging publications. General language popularity is measured by the
      #link("https://pypl.github.io/PYPL.html")[#gls("pypl", first: true) Index], tracking Google
      searches for programming-language tutorials. The number of biomedical publications
      per year were assessed by querying PubMed with either "MATLAB" or
      "Python"#footnote[Note that very early publications mentioning "Python" in the
        biomedical context were mainly concerned with the Python genus of snakes, not the
        programming language.]. Lastly, the number of neuroimaging publications mentioning
      major software packages was assessed by querying PubMed with the package names and
      the "Neuroimaging" keyword. Inspired from @Poldrack2019.
    ],
  ),
) <fig:python-matlab-trends>
