#import "/glossary.typ": *

#heading([Abstract], numbering: none)

#Gls("fusi", first: true) is a promising neuroimaging technique for studying brain
function in preclinical models. @Fusi offers advantages in cost, spatiotemporal
resolution, and the ability to image awake, behaving animals. However, critical
methodological challenges have limited its widespread adoption for awake paradigms,
particularly the presence of motion artifacts that systematically vary between
experimental conditions. This thesis addresses this limitation through comprehensive
methodological innovations and validates @fusi for neuropharmacological research.
Through systematic evaluation of nearly 800 preprocessing configurations across multiple
datasets, we characterized the spatial and temporal properties of motion artifacts in
awake @fusi and developed optimized denoising paradigms. Our findings demonstrate
that adaptive clutter filtering outperforms traditional static methods, high-pass
filtering exceeds conventional band-pass approaches, and anatomical CompCor confounds
improve upon global signal regression for functional connectivity analysis. These
advances improve the robustness of group-level comparisons previously compromised by
motion-related confounds. We then validated @fusi as a tool for
neuropharmacological investigations through systematic studies of three major drug
classes---opioids, cannabinoids, and serotonergic psychedelics---in awake mice. Each
drug class produced distinct functional connectivity signatures that could serve as
pharmacological "fingerprints". The opioid study revealed cortico-subcortical
dysconnectivity correlating with analgesic efficacy while showing minimal association
with adverse effects. The cannabinoid study demonstrated biphasic connectivity
alterations featuring rapid cortical-thalamic effects followed by slower hippocampal
alterations. Finally, the psilocybin study showed dose-dependent alterations in
hippocampo-thalamic networks partially sensitive to @fiveht:short#sub[2A] receptor
blockade. Pharmacological relevance was validated through evaluation of dose-dependence,
temporal dynamics, receptor specificity, and tolerance development. To conduct these
studies, we developed research infrastructure including #gls("fusi")-@bids:short, a
community-driven data standardization framework extending established neuroimaging
standards to accommodate @fusi\-specific requirements, and PyfUS, a comprehensive
Python analysis package that bridges academic research needs with commercial software
development. PyfUS served as a testing platform for the methodological innovations
developed in this work, before implementation in the Iconeus software suite. These
contributions demonstrate @fusi's potential as a cost-effective neuroimaging tool
for discriminating between compounds with distinct mechanisms of action, suggesting
applications in pharmacological screening and drug development.
