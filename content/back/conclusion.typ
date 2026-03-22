#import "/helpers.typ": *
#import "/glossary.typ": *

#set heading(numbering: none)
= Conclusion <ch:conclusion>

== Summary of Contributions and Scientific Impact

This @phd project addresses methodological and practical challenges in @fusi:long
through three interconnected research areas: motion artifact characterization and
removal (@ch:denoising), neuropharmacological applications across three major drug
classes (@ch:pharmacofusi), and development of standardization frameworks and analysis
tools (@ch:tools).

=== Methodological Innovations in @fusi:short Preprocessing

The comprehensive denoising benchmark presented in @ch:denoising represents the first
systematic characterization of motion artifacts in awake @fusi and their optimal removal
strategies. Through evaluation of nearly 800 preprocessing configurations, this work
identified methodological principles that improve data quality and reliability. The
findings that adaptive clutter filtering outperforms traditional static methods,
combined with the superior performance of high-pass over band-pass filtering, challenges
current standard practices and provides evidence-based guidelines for the field.

These advances might enable more reliable group-level comparisons that were previously
compromised by motion-related confounds, particularly important for pharmacological
studies where drug effects on locomotion can introduce systematic biases. The denoising
optimization approach provides a methodological framework that could be reproduced with
future @fusi datasets, allowing validation of new methods and refinement the proposed
denoising strategies.

=== Advancing Pharmacological @fusi:short

The neuropharmacological investigations in @ch:pharmacofusi illustrate @fusi's potential
capabilities for characterizing drug effects on brain networks in awake, behaving
animals. The systematic studies of three major drug classes---opioids, cannabinoids, and
serotonergic psychedelics---suggest drug-specific #gls("fc", first: true) signatures that could serve
as pharmacological "fingerprints" for compounds acting on distinct receptor systems.

The Opioid project revealed a robust connectivity signature characterized by
cortico-subcortical dysconnectivity that correlates strongly with analgesic efficacy
while showing minimal association with adverse effects like respiratory depression. The
demonstration of dose-dependence, temporal dynamics, receptor specificity, and tolerance
development supports the pharmacological relevance of these connectivity changes.

The Cannabinoid project revealed biphasic connectivity alterations featuring rapid
cortical-thalamic effects followed by slower hippocampal alterations, aligning well with
known @cb1 receptor distribution patterns. The stark contrast between @thc/@cp\-induced
connectivity changes and @cbd's lack of effect demonstrates @fusi's ability to
discriminate between psychoactive and non-psychoactive compounds within the same
chemical family.

The Psilocybin project extended #gls("phfusi", first: true) to psychedelic compounds, revealing
dose-dependent alterations in hippocampo-thalamic networks that were partially sensitive
to @fiveht#sub[2A] receptor blockade. While preliminary, these results contribute to
understanding how different classes of psychoactive compounds produce distinct network
signatures.

These findings suggest that @fusi\-based connectivity analysis could serve as a tool for
drug development and neuropharmacological screening. The drug-specific nature of
connectivity patterns suggests that @fusi may enable rapid classification of novel
compounds based on their network effects, which could prove valuable for early-stage
drug discovery.

=== Research Infrastructure Development

@ch:tools addresses what appears to be a key challenge for emerging neuroimaging
modalities. The development of @fusi\-@bids provides a community-driven data
standardization framework that extends established neuroimaging standards to accommodate
@fusi\-specific requirements while maintaining interoperability with the broader
neuroimaging ecosystem.

The PyfUS package represents a comprehensive analysis framework that bridges academic
research with commercial software development. PyfUS served as the primary testing
platform for developing and validating the methodological innovations presented
throughout this thesis. The denoising strategies benchmarked in @ch:denoising, the
preprocessing pipelines optimized for pharmacological studies, and the analytical
frameworks for #gls("fc", first: true) analysis were all initially implemented and refined within PyfUS
before their subsequent integration into the Iconeus software suite. This approach aimed
to ensure that only rigorously tested and validated methods were transferred to
commercial software, maintaining reliability and quality standards while enabling rapid
prototyping and methodological innovation.

These standardization efforts represent a proactive approach to preventing the
fragmentation challenges that have affected other neuroimaging modalities. This approach
could position the field to benefit from coordinated data sharing and collaborative
research while demonstrating a sustainable model for translating academic innovations
into practical applications.

== Current Limitations and Challenges

=== Technical Limitations

Despite significant advances, fundamental technical limitations appear to persist in
current @fusi implementations. The reliance on single-slice imaging reduces spatial
coverage of key brain regions, particularly striatal and reward circuits central to many
drug effects. Current systems cannot achieve true whole-brain imaging while maintaining
necessary temporal resolution, limiting the comprehensiveness of network analyses.

Another fundamental challenge for @fusi lies in accurate image registration, where the
mismatch between vasculature and anatomical structures creates inherent limitations on
registration accuracy. Unlike anatomical imaging modalities where tissue boundaries
provide consistent landmarks, @fusi relies on blood vessels that can vary considerably
between animals and may not correspond directly to anatomical boundaries. This
vascular-anatomical mismatch remains a significant challenge that affects the
precision of cross-subject analyses and limits the ability to precisely localize
functional signals to specific anatomical regions. Current approaches using iterative
registration frameworks combined with spatial smoothing provide partial solutions, but
the development of more accurate registration methods specifically tailored to @fusi
data remains a critical area for future research.

=== Analytical Challenges

The persistent challenge of disentangling direct pharmacological effects from secondary
behavioral changes highlights the need for more sophisticated analytical approaches.
While this work has made progress in controlling for motion artifacts, the complex
relationships between drug action, behavior, and network function require continued
methodological development.

Moreover, the lack of ground truth for brain activity limits definitive assessment of
different denoising strategies' biological validity. Future studies incorporating
simultaneous electrophysiological recordings or optogenetic manipulations could provide
independent validation of hemodynamic signals and their relationship to underlying
neural activity.

=== Translational Considerations

The absence of lasting connectivity changes in the psilocybin studies, contrary to human
neuroimaging findings, raises important questions about translational relevance and
highlights species differences that must be considered when extrapolating findings to
clinical contexts. These limitations emphasize the need for continued development of
animal models that better recapitulate human pharmacological responses.

=== Community Development

The continued growth of the @fusi community may require sustained investment in
education, training, and standardization efforts. While the frameworks established
through @fusi\-@bids and complementary analysis tools could provide a foundation for
community coordination, their success may depend on widespread adoption and continued
development.

The organization of training workshops, standardized educational materials, and
collaborative research initiatives could be essential for maintaining the momentum
established by early standardization efforts. Thus, the integration with established
neuroimaging communities might facilitate knowledge transfer and potentially accelerate
methodological development.

== Long-term Vision

The vision emerging from this work encompasses @fusi as a routine tool for preclinical
neuroscience research, providing researchers with cost-effective, high-resolution
capabilities for investigating brain function in awake, behaving animals. The
pharmacological applications demonstrated here suggest promise for drug development and
neuropharmacological research, where @fusi's unique capabilities could accelerate the
translation of laboratory discoveries into clinical applications.

The infrastructure developed through this work---including standardized data formats,
validated analysis pipelines, and comprehensive software tools---may position the @fusi
community to capitalize on future technological advances while maintaining
reproducibility and facilitating collaboration. As the field continues to mature, these
foundations might enable increasingly sophisticated investigations of brain function and
its modulation by pharmacological interventions.

This work represents a contribution to the ongoing development of @fusi as a reliable
and accessible neuroimaging tool. While the methodological advances and standardization
efforts presented here may prove useful for the field, their long-term value will depend
on adoption by the broader research community and continued refinement through future
investigations. The combination of technical improvements and practical applications
explored in this thesis may offer some guidance for researchers seeking to apply @fusi
to neuroscience investigations, though significant challenges remain in establishing the
technique's reliability and clinical relevance.

