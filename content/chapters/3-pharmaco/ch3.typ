#import "@preview/cetz:0.4.1"
#import "@preview/unify:0.7.1": num, numrange, qty, qtyrange, unit
#import "/helpers.typ": *
#import "/glossary.typ": *

= Neuropharmacological Insights From @fusi:short Studies <ch:pharmacofusi>

#objective[
  This chapter presents the results from three different pharmacological @fusi projects
  investigating the effects of major classes of psychoactive compounds on brain function
  in awake mice. Through systematic pharmacological investigations using opioids,
  cannabinoids, and psilocybin, this chapter aims to:

  - Establish @fusi as a viable tool for neuropharmacological investigations by
    demonstrating its sensitivity to detect drug-induced alterations in brain activation
    and functional connectivity patterns.
  - Characterize drug-specific functional connectivity signatures that can serve as
    pharmacological "fingerprints" for different classes of compounds acting on distinct
    receptor systems.
  - Validate the pharmacological relevance of observed connectivity changes through
    systematic evaluation of dose-dependence, temporal dynamics, receptor specificity,
    and tolerance development.
  - Develop and refine methodological approaches for pharmacological @fusi studies,
    including experimental protocols, preprocessing pipelines, and analytical frameworks
    optimized for detecting drug-induced network reorganization.
  - Assess the specificity of connectivity signatures across different drug classes to
    establish whether @fusi can discriminate between compounds with distinct mechanisms
    of action.
]

== Introduction

This chapter presents the results from three different #gls("phfusi", first: true) projects
investigating the effects of opioids, cannabinoids, and psilocybin on brain function.
The data from these projects were collected using two prototype @fusi systems at the
#gls("ipnp", first: true) to assess the viability of @fusi as a tool for pharmacological
investigations in awake mice.

The timeline of these projects spans several years, with Jean-Charles Mariani and Andrea
Kliewer acquiring the data for the Opioids and Cannabinoids projects between 2019 and
2021, while Miguel Farinha Ferreira and Jean-Charles Mariani acquired the data for the
Psilocybin project in 2022. This timeline allowed for iterative improvements in
methodology and analysis techniques, with lessons learned from each project informing
subsequent investigations.

The denoising benchmark presented in @ch:denoising has its origins in the practical
challenges encountered when analyzing the Opioids project data. Initially, we faced
significant difficulties with motion artifacts that complicated the interpretation of
#gls("fc", first: true) changes. Indeed, while opioids are known to induce stereotypical locomotion in
mice, we observed that locomotion intensity---that is, the maximum velocity reached
during locomotion---was significantly reduced in opioid-treated animals compared to
controls. This reduction in motion intensity led to group-level differences between
control and opioid-treated groups that were primarily related to the reduction of motion
artifacts in the opioid group, rather than true pharmacological effects. What began as a
simple comparison of scrubbing metrics and confound regression methods evolved into a
comprehensive benchmark. The preliminary results from this benchmark work were presented
at the fUSbrain 2022 conference and FENS Forum 2022, and subsequently applied to improve
the analysis of the Opioids project data presented in the first section of this chapter.

The success of this initial benchmark work motivated a more systematic approach to
evaluating the entire @fusi preprocessing pipeline. This led to the development of the
comprehensive @fusi denoising benchmark presented in @ch:denoising, which systematically
evaluated the performance of all denoising steps in the @fusi pipeline. The insights
gained from this benchmark were instrumental in improving the preprocessing pipelines
for both the Cannabinoids and Psilocybin projects, resulting in more robust and reliable
@fc analyses.

An important note is that datasets 1, 2, and 3 from the denoising benchmark consist of
the baseline acquisitions from the Cannabinoids, Psilocybin, and Opioids projects,
respectively. These baseline acquisitions represent all sessions where no treatment was
administered, providing a controlled dataset for evaluating denoising performance across
different experimental conditions and time periods.

The structure of this chapter reflects both the chronological development of our
research program and the evolution of our analysis capabilities. The first section
consists of a complete preprint manuscript titled "Opioid-Induced Inter-Regional
Dysconnectivity Correlates with Analgesia in Awake Mouse Brains," which is currently
under review at PNAS (August 2025). This represents our most mature and comprehensive
@phfusi investigation.

The second section presents the methodological advances in preprocessing and analysis of
@fusi data that were developed following the Opioids project. These advances were
subsequently applied to both the Cannabinoids and Psilocybin projects, representing the
state-of-the-art in @phfusi methodology.

The third and fourth sections present the results of the Cannabinoids and Psilocybin
projects, respectively, demonstrating the application of our refined methodological
approaches to different classes of psychoactive compounds. Together, these projects
provide an overview of how @fusi can be used to investigate the effects of different
neuropharmacological agents on brain function in awake mice.

== Opioids <sec:opioids>

=== Introduction

The Opioids project represents the first large-scale @phfusi investigation conducted at
the @ipnp. Data acquisition for this project began in 2019 and was completed in 2021,
spanning a critical period during which we developed many of the methodologies that
would inform subsequent studies.

The experimental work was carried out by Jean-Charles Mariani and Andrea Kliewer, with
supervision provided by Zsolt Lenkei and Andrea Kliewer. The project's primary objective
was to investigate how clinically relevant opioids affect brain activation and @fc in
awake mice.

However, the project quickly faced a significant technical challenge that would shape
our future methodological developments: @fusi's high sensitivity to motion artifacts.
This sensitivity made analysis particularly challenging, as opioid treatment generally
reduces motion intensity in mice. Consequently, the most prominent differences observed
between control and opioid-treated groups were often related to the reduction of motion
artifacts in the opioid group rather than true pharmacological effects. Similar
artifacts were observed when comparing baseline and post-treatment phases within the
same animals.

To help with the development of robust analysis tools, I was invited to join the Lenkei
team as an undergraduate student in January 2020---two years prior to the official start
of my @phd in December 2021---to develop solutions for processing, visualization, and
analysis of @fusi data. Our efforts resulted in two key software packages: PlatyfUS
(Platform for Analysis of Typical @fusi Data), a web application designed to
standardize, visualize, register, and perform @fc analysis of @fusi data, and
PyfUS#footnote[The PyfUS package has been re-developed from scratch at the beginning of
  my @phd in close collaboration with Felipe Cybis Pereira to become a standalone analysis
  package for @fusi. See @sec:pyfus for more details.], a Python package providing the
backend functionality for PlatyfUS. Most of the exploratory processing and analysis
performed for the following preprint was conducted using PlatyfUS and PyfUS, while the
final analysis and visualizations were created using only open-source software for
reproducibility.

=== Opioid-Specific Brain Connectivity Dynamics Distinguish Analgesia from Secondary Effects

#let authors = [
  Jean-Charles Mariani#super[1], Samuel Le Meur-Diebolt#super[1,2,5], Laurianne
  Beynac#super[1], Renata Santos#super[1,3], Stefan Schulz#super[4], Thomas
  Deffieux#super[2], Mickael Tanter#super[2], Zsolt Lenkei#super[1,\*,#sym.dagger],
  Andrea Kliewer#super[1,4,\*,#sym.dagger]

]
#let affiliations = [
  #super[1]Université Paris Cité, Institute of Psychiatry and Neuroscience of Paris
  (IPNP), INSERM U1266, Laboratory of Dynamics of Neuronal Structure in Health and
  Disease, 75014 Paris, France,\
  #super[2]Physics for Medicine Paris, Inserm, ESPCI Paris, CNRS, PSL Research
  University, 10 rue Oradour sur Glane, 75015 Paris, France,\
  #super[3]Institut des Sciences Biologiques, CNRS, 16 rue Pierre et Marie Curie, 75005
  Paris, France,\
  #super[4]Institute of Pharmacology and Toxicology, Jena University Hospital,
  Friedrich Schiller University Jena, Jena, Germany\
  #super[5]Iconeus, Paris, France,\
]

#align(center)[
  #v(1em)
  #authors
  #v(0.1em)
  #block(text(size: 0.9em, affiliations))
  #v(0.1em)
  #block(text(size: 0.9em, [#sym.dagger These authors contributed equally.]))
  #block(
    text(
      size: 0.9em,
      "*Correspondence: andrea.kliewer@med.uni-jena.de and zsolt.lenkei@inserm.fr",
    ),
  )
  #v(2em)
]

*Keywords:* Opioids, Pain, Brain Imaging, Functional connectivity
#v(1em)

#block(
  inset: (left: 2em, right: 2em),
  [*Abstract:* The @mor is a critical pharmaceutical target that mediates both the
    therapeutic benefits and adverse effects of opioid drugs. However, the large-scale
    neural circuit dynamics underlying key opioid effects, such as analgesia and
    respiratory depression, remain poorly understood, hindering the development of safer
    analgesics. Here, we present a multimodal experimental framework that integrates
    #gls("fusi", first: true) through the intact skull with behavioral and molecular analyses to
    investigate opioid-induced large-scale functional responses and their physiological
    relevance in awake, behaving mice. Administration of major opioids---morphine,
    fentanyl, methadone, and buprenorphine---elicited robust, dose- and time-dependent
    reorganization of #gls("fc", first: true) patterns, with magnitude scaling according to @mor
    agonist efficacy. This opioid-specific functional fingerprint is marked by decreased
    @fc between the somatosensory cortex and hippocampal/thalamic regions and increased
    bilateral subcortical @fc within the somatosensory cortex. Notably, this fingerprint
    was attenuated following tolerance induction and abolished by pharmacological or
    genetic @mor inactivation. Through power Doppler spectral analysis and lagged
    correlation measurements, we show that morphine perturbs temporal @fc dynamics and
    the propagation of brain-wide oscillatory activity, disrupting critical-state
    dynamics. Importantly, we identify a dissociation between fast, transient
    processes---such as #gls("cbv", first: true) changes, locomotion, and respiratory depression---and
    slower processes driving @fc reorganization, analgesia, and sustained @mor
    activation. This study provides mechanistic insights into opioid-induced network
    reorganization, establishes @fc alterations as a reliable biomarker of opioid
    efficacy, and offers a framework for advancing the development of analgesic
    compounds with improved therapeutic windows and reduced side effects.
  ],
)

==== Introduction

The lack of a precise understanding of drug effects on brain function poses a
significant challenge in the development of new drugs that act on the central nervous
system. This has hindered the development of improved antipsychotics and highly
effective analgesics without detrimental secondary effects @Yekkirala2017, particularly
in light of the opioid crisis.

Extensive research has shown that cognition and behavior rely on the integration,
synchronization, and coordination of large-scale sensory and motor networks. The
large-scale organization of neural networks and drug-induced changes in connectivity
patterns and activation maps may provide valuable testable hypotheses regarding the
neural underpinnings and pharmacological accessibility of brain function and behavior.
Brain imaging approaches, particularly #gls("fmri", first: true), can bridge the knowledge gap between
cellular and behavioral levels by providing a readout of brain activation and #gls("fc", first: true)
through the @nvc:long. In functional brain imaging, @fc is defined by the spatiotemporal
correlation of spontaneous fluctuations in perfusion. As such, @phfmri, by measuring
drug-induced local changes in the #gls("bold", first: true) signal, an indirect measure of brain
perfusion, has been proposed as an interesting tool for both preclinical and clinical
drug development @Carmichael2018 @Wandschneider2016. However, the preclinical use of
@phfmri is significantly constrained due to the need for immobilization, often
accompanied by some degree of anesthesia, and its relatively low sensitivity,
particularly in mice, a prominent preclinical rodent model. Anesthesia use poses
specific challenges in analgesia research as it hinders the capture of cortico-thalamic
connectivity, a critical component of sensory-motor integration, even with advanced
@fmri technology @Grandjean2017. Medetomidine, an anesthetic agent commonly used in
preclinical fMRI studies, has been observed to interfere with cortico-thalamic
connectivity even at low doses, affecting brain regions expressing high levels of beta-2
adrenergic receptors @Nasrallah2014 @Fukuda2013 @Grandjean2014. Notably, a recent
pioneering @phfmri investigation of opioid (oxycodone) action on mouse brain @fc, also
utilizing medetomidine anesthesia @Nasseef2019, did not report noteworthy changes in the
cortico-thalamic network, which is intriguing for an analgesic agent. Consequently,
there is a pressing need for innovative technologies that permit large-scale and
highly-resolved network and perfusion imaging in awake mice to fully leverage the
potential of brain imaging in neuro-pharmacological research.

Here, we have used #gls("fusi", first: true) @Deffieux2018 @Osmanski2014, a modality which measures
task-induced or spontaneous (resting-state) changes in #gls("cbv", first: true) in individual voxels to
establish functional brain activation and @fc patterns, respectively, through the
neurovascular coupling. @fusi offers high sensitivity and spatiotemporal resolution
(sub-second time resolution and #qty(100, "um") in-plane spatial resolution), with
elevated operating simplicity @Bergel2018 @Dizeux2019 @Renaudin2022. Previously,

Previously, we have specifically adapted @fusi for imaging task-related responses and
@fc in awake mice @Rabut2020 and our recent proof-of-concept study has demonstrated that
@fusi can effectively visualize pharmacologically-induced alterations in @fc in the
awake mouse brain, indicating its promise as an emerging valuable tool for
neuropharmacological research @Rabut2020.

By using @fusi, we aimed to investigate whether clinically relevant opioids, acting on
the #gls("mor", first: true), elicit consistent and reproducible alterations in functional brain
activation and connectivity. Specifically, we sought to determine if we could establish
a robust, dynamic and pharmacologically relevant fingerprint of opioid action in awake
and behaving mice, through the intact skull. To assess the pharmacological relevance of
opioid-induced @fc alterations, we studied dose- and time-dependence, drug-specific
pharmacodynamics, sensitivity to pharmacological and genetic @mor inactivation, and
manifestation of habituation/tolerance following chronic treatment. As a pioneering
endeavor, our hypothesis centered on the significant changes in @fc between neocortical,
hippocampal, and thalamic regions, achieved through recording on a single, easily
localized coronal brain slice encompassing these specific regions. We enhanced the
sensitivity of our functional fingerprinting by employing a data-driven approach to
define individual functional @roi:pl within these brain areas. By using
cross-correlation analysis, we investigated the relation of opioid-induced changes in
oscillatory activity with the dysconnectivity pattern induced by morphine. Finally,
after establishing the pharmacological relevance of the observed @fc alterations, we
have correlated changes in @fc with specific @cbv time series, behavioral (locomotion,
analgesia, respiration) and molecular (@mor phosphorylation as a proxy measure of @mor
activation) readouts. Together, our results validate a specific fingerprint for a drug
family with high medical and societal impact. These results also lay the foundation for
a new approach in the development of highly-effective pain relievers and other
neuropsychiatric drugs. This new method has the potential to identify compounds with
improved pharmacological profiles, through systematic and quantitative screening of
drugs effect on the @fc network.

==== Material and Methods <sec:opioids-methods>

===== Animals

Experiments were performed on JAX#sym.trademark C57BL/6J mice obtained from Charles River
Laboratories (DE) or from Janvier Labs (FRA). BALB/cJ mice were obtained from Janvier
Labs (FRA). @mor knockout (@mor#super[-/-]) mice were originally provided by Dr. H. Loh
(University of Minnesota, Minneapolis, MN), bred and backcrossed to WT control
JAX#sym.trademark C57BL/6J mice obtained from Charles River Laboratories (DE) for more than
12 years in the Institute of Pharmacology and Toxicology at the University Hospital in
Jena (DE). Knock-in mice expressing an HA-epitope tag @mor (HA-@mor,
Oprm1#super[em1Shlz], MGI:6117675) were provided by Stefan Schulz (University Hospital
Jena, Institute of Pharmacology and Toxicology, Jena, DE) and described in detail
@Fritzwanker2021. Animals were housed #numrange(2, 5) per cage under a 12-hour
light-dark cycle with ad libitum access to food and water. In all experiments, we used
cohorts of #numrange(10, 12) male mice aged #numrange(7, 14) weeks and weighing
#qtyrange(18, 24, "gram") at the beginning of the experiments. Experimental procedures
were performed in accordance with the Council of European Union directive of September
22, 2010 (2010/63/UE) and with the French decree of February 1, 2013 (n° 2013-118) and
were approved by Thuringian state authorities and by the French _Comité d'éthique en
matière d'expérimentation animale_ (APAFIS#25912-2019072317104707 v2). Our study is
reported in accordance with the ARRIVE (Animal Research: Reporting In Vivo Experiments)
guidelines @Drummond2010.

===== Drugs and Routes of Administration

All drugs were freshly prepared prior to use and were injected subcutaneously at a
volume of #qty(10, "mL/g") body weight. Drugs were diluted in #qty(0.9, "%") (W/V)
saline for injections. Drugs were obtained and used as follows: morphine sulfate
(#qtyrange(10, 70, "mg/kg"); Hameln Inc., Hameln, Germany), fentanyl citrate
(#qtyrange(0.1, 0.3, "mg/kg"); Rotexmedica, Trittau, Germany), levomethadone
hydrochloride (#qty(10, "mg/kg"); Sanofi-Aventis, Frankfurt, Germany), buprenorphine
hydrochloride ( #qty(3, "mg/kg"); Indivior, Mannheim, Germany) and naloxone
hydrochloride (#qty(2, "mg/kg"); Ratiopharm, Ulm, Germany). For chronic infusion with
Alzet osmotic minipumps (1007D), fentanyl citrate salt (#qty(2, "mg/kg/d") and morphine
sulfate salt pentahydrate (#qty(17, "mg/kg/d")) were obtained from Sigma-Aldrich (St.
Louis, MO). Drugs were diluted in phosphate-buffered saline for acute injections or
dissolved in sterile water and then diluted in phosphate-buffered saline for osmotic
pump delivery.

===== Behavior Studies

For consistency, one experimenter and a dedicated assistant performed all in vivo drug
administrations and behavioral testing. All testing was conducted between 7 a.m. and 4
p.m. in an isolated, temperature- and light-controlled room. Mice were acclimated for at
least 2 weeks before testing. Only the experimenter and assistant had free access to the
room and entered the room 30 minutes before commencement of testing to eliminate potential
olfactory-induced changes in nociception. Animals were assigned to groups randomly
before testing. Mice were excluded from the study if they displayed any bodily injuries
from aggressions with cage mates. The experimenter was blinded to treatment and/or
genotype throughout the course of behavioral testing. All drugs were given to the
experimenter in coded vials and decoded after completion of the experiment.

===== Tolerance Paradigms

Acute effects of #qty(70, "mg/kg") morphine or #qty(0.3, "mg/kg") fentanyl were
recorded. To induce opioid tolerance, mice were implanted with Alzet osmotic minipumps
containing the same drug that was used in the acute dose. Osmotic minipumps delivered
total daily doses #qty(17, "mg/kg") morphine or of #qty("2", "mg/kg") fentanyl at a rate
of #qty(0.5, "ul/h"). On day 7, mice were again treated using a repeated acute dose with
morphine or fentanyl.

====== Osmotic pump implantation

A single 1007D Alzet osmotic minipump (Charles River Laboratories, DE) was
subcutaneously implanted on the left limb of each mouse under light isoflurane
anesthesia and meloxicam analgesia. A small incision was made in the skin on the mouse's
left flank with a scalpel, a small pocket was formed just beneath the skin, and the
minipump was inserted. The incision was closed using #qty(7, "mm") wound clips (Charles
River Laboratories).

====== Hot-Plate Test

Opiate effects on paw withdrawal latencies were assessed as the time to response
(licking or flicking forepaw or hind paws) after placement on a hot-plate maintained at
#qty(56, "degree") (Ugo Basile SRL, IT) @Kliewer2019. To avoid tissue damage, we used a
#qty(30, "s") cut-off. The hot-plate test was carried out #qty(15, "min") (fentanyl) or
#qty(30, "min") (morphine, methadone and buprenorphine) after drug administration and
expressed as percent maximum possible effect (% MPE), calculated as follows:

$ 100 times ("drug response latency" − "basal response latency") / ("30 s" − "basal response latency"). $

For time courses, antinociception was determined at various time points after treatment.
All calculations were performed using GraphPad Prism 6 software (GraphPad Software,
Inc., San Diego, CA).

====== Acute Paradigms for Hot-Plate Test

For acute analgesia testing in the hot plate test, dose-response curves were generated
after repeated subcutaneous administration of cumulative doses of fentanyl, morphine,
methadone or buprenorphine. Mice were injected at #qty(15, "min") intervals with
#num(0.02), #num(0.05), and #qty(0.1, "mg/kg") fentanyl to yield final cumulative doses
of #num(0.02), #num(0.5), #num(0.1), #num(0.2), and #qty(0.3, "mg/kg") fentanyl, and
latencies were measured #qty(15, "min") after drug administration, immediately followed
by additional drug except for the last dose. For morphine dose-responses, mice were
injected at #qty(30, "min") intervals with #num(3.75), #num(3.75), #num(15) and
#qty(30, "mg/kg") morphine resulting in final cumulative doses of #num(3.75),
#num(7.5), #num(22.5) and #qty(52.5, "mg/kg") morphine. Hot plate latencies were always
measured #qty(30, "min") after morphine administration, immediately followed by the next
dose. For methadone dose-responses, mice were injected at #qty(30, "min") intervals with
#num(2.5), #num(2.5), #num(2.5), #num(2.5) and #qty(5, "mg/kg") methadone resulting in
final cumulative doses of #num(2.5), #num(5), #num(7.5), #num(10) and #qty(15, "mg/kg")
methadone. For buprenorphine dose-responses, mice were injected at #qty(30, "min")
intervals with #num(0.1), #num(0.2), #num(0.7), and #qty(2, "mg/kg") buprenorphine
resulting in final cumulative doses of #num(0.1), #num(0.3), #num(1) and
#qty(3, "mg/kg") buprenorphine. For morphine dose-responses for BALB/cJ mice, mice
were injected at #qty(30, "min") intervals with #num(10), #num(20) and #qty(40, "mg/kg")
morphine resulting in final cumulative doses of #num(10), #num(30), and
#qty(70, "mg/kg") morphine. All dose-response curves generated using repeated
cumulative dosing regimen are shown in @supfig:opioids6. Cumulative doses-response
curves on wildtype (JAX#sym.trademark C57BL/6J) mice after morphine and fentanyl
treatment were already previously published by Kliewer and colleagues
(#ref-sub-fig(<fig:opioids5>, "C-D")) @Kliewer2019.

====== Tolerance Paradigms for Hot-Plate Test

To induce opioid tolerance for morphine and fentanyl, mice were implanted one day later
(after the acute analgesia testing) with Alzet osmotic minipumps containing the same
drug that was used in the acute cumulative dosing. Osmotic minipumps delivered total
daily doses of #qty(2, "mg/kg") fentanyl or #qty(17, "mg/kg") morphine at a rate of
#qty(0.5, "uL/h"). Thus, in the tolerance paradigm dose-response curves from acute
analgesia testing are depicted as day -1 and served as reference for the development of
tolerance. On day 7, mice were again treated using a repeated cumulative dosing regimen
with fentanyl (#num(0.5), #num(0.5), #num(1), #qty(2, "mg/kg") for WT) or morphine
(#num(22.5), #num(37.5), #qty(60, "mg/kg") for WT), and hot plate response latencies
were assessed at the same time points as on day −1. Cumulative doses-response curves on
wildtype (JAX#sym.trademark C57BL/6J) mice after chronic treatment of morphine and fentanyl
were already previously published by Kliewer and colleagues
(#ref-sub-fig(<fig:opioids5>, "C-D")) @Kliewer2019.

===== Surgical Procedure and Preparation for Imaging

The mice were prepared following a previously published protocol @Bertolo2021. The
procedure consists in the surgery for the implantation of a metallic headplate
(Neurotar, Finland) and the habituation protocol to head fixed condition before imaging
sessions.

====== Headplate Surgery

The mouse was pre-treated with Meloxicam (#qty(4, "mg/kg")) before surgical
ketamine/xylazine (#qty(100, "mg")/ #qty(10, "mg/kg")) anesthesia. After the depth of
anesthesia was verified the mouse was positioned onto the stereotaxic frame. The body
temperature at #qty(37, "celsius") was maintained by a heat blanket during the complete
duration of the procedure. Lidocaine (#qty(2, "%"), #qty(0.2, "mL") was administered
subcutaneously under the scalp skin before incising the skin. After removing the skin
from behind the occipital bone to the beginning of the nasal bone, to obtain an imaging
window of #qty(13, "mm") $times$ #qty(21, "mm"), the skull was carefully cleaned with
iodine solution to remove the remaining periosteum. The temporalis muscles were detached
to obtain the widest imaging window possible. By using the headplate as a template, two
superficial holes (#qty(1, "mm") diameter) were drilled in the front and the back of the
skull to position the anchoring screws. A specific care is given to avoid drilling
through the skull. Afterwards the headplate was screwed to the skull and the screws
fixed with fast solidifying surgical cement (Superbond C&B) to firmly attach the
implant. Finally, the skull was protected by a thin layer of surgical glue (Vetbond, 3M,
USA) to protect the bone and to close the wounds surrounding the imaging window. The
animal was removed from the stereotaxic frame after the cement dried and left to recover
in an individual heated chamber. For a trained surgeon, the procedure takes less than
30min, allowing implantation of 10-15 mice a day.

======= Handling and Habituation

After surgery the animal was left for 4 to 6 days to recover and then was daily handled
and trained to get used to head fixed condition in the @mhc as described as follows.
During the first 2 days the animal is handled in the experimental room for habituation
to the environment and the experimenter. On the 3#super[rd] day the animal is left
#qtyrange(5, 10, "min") to freely explore the @mhc. After the fourth day the animal is
clamped daily increasing the duration of head fixed condition of #qty(5, "min") per day
until reaching #qty(30, "min"). On the 7#super[th] day some gel is poured on the imaging
window without imaging. On the 8#super[th] day the probe is lowered down. On the last
day the animal is imaged to obtain an anatomical reference of its brain vascular tree.

====== Pharmaco-@fusi:short Protocol

The mouse was weighted and clamped to the @mhc apparatus. The imaging window was
humidified with saline and ultrasound gel was applied on top of the skull. After the
probe was lowered down until it contacted the ultrasound gel, the machine was turned on
in live view for positioning the probe above the reference plane based on the anatomical
vascular landmarks (#ref-sub-fig(<fig:opioids1>, "A-F"),
#ref-sub-fig(<supfig:opioids1>, "A-B")). In general, recordings lasted #qty(20, "min")
for baselines followed by multiple #qty(30, "min") recordings (typically 2 for
#qty(1, "h") follow-up) (#ref-sub-fig(<fig:opioids1>, "E")). After each acquisition
period, data was transferred to avoid saturating memory, leaving #qty(5, "min") of dead
time between two recordings. Injections were performed between two consecutive
recordings to avoid injection-induced movement artifacts during the recording. The
animal was injected subcutaneously while being head-fixed. Tracking was recorded using
@mhc Tracker software (Neurotar, Finland).

===== Functional Ultrasound Imaging <sec:opioids-fusi-methods>

A #qty(15, "MHz") ultrasound probe (#qty(15, "MHz"), 128 elements, #qty(110, "um")
pitch) connected to a prototype functional ultrasound scanner (Iconeus, Paris, France
and Inserm ART Biomedical ultrasound) was used. The positioning of the probe above the
head of the animal was performed using a motorized probe holder allowing translations
along three axes (#qty(1, "um") precision) and rotation around the vertical axis
(#qty(0.1, "degree") precision). A previously described acquisition sequence was used;
11 tilted plane waves ranging from #qtyrange(-10, 10, "degree") by increments of
#qty(2, "degree") were fired at a @prf of #qty(5000, "Hz"), leading to a
#qty(500, "Hz") sampling rate after beamforming and compounding @Ferrier2020. Power
Doppler images were then computed offline using ensembles of 200 compound frames,
following manual skull-stripping and SVD-based clutter filtering (reconstruction of the
ensembles frames by zeroing out the first 60 singular values) @Demene2015. A delay of
#qty(0.1, "s") is added between each ensemble to reduce the risk of memory saturation
during long recordings. The resulting power Doppler acquisitions are sampled at
#qty(2, "Hz").

===== Power Doppler Template <sec:opioids-power-doppler-template>

After data format standardization (see Supplementary Methods), we computed a template
for each imaging plane following the Allen Brain Institute methodology @Wang2020. All
images were first rigidly registered (translation+rotation) using Elastix @Klein2010 to
a single reference image of the dataset. Images were split in left and right hemispheres
and each hemisphere was independently mirrored to obtain two datasets of left-left and
right-right hemisphere slices respectively. Right hemisphere images were then affine registered
(translation + rotation + scaling + shearing) on left hemisphere images and an average
of all images was computed to obtain the first iteration of a template. All images
(right-right, left-left) were non-linearly (symmetrical diffeomorphism) registered to
the first template iteration and averaged, leading to the second and final template
image. This final template was used for co-registering all power Doppler acquisitions.
Rigid and non-rigid transform parameters were systematically investigated in a grid
search to find optimal values.

===== Power Doppler Preprocessing <sec:power_doppler_preprocessing>

Power Doppler acquisitions were preprocessed in Python using Nilearn 0.10.1 @Nilearn to
mitigate motion artifacts. A scrubbing strategy was first applied to reject frames
displaying strong motion artifacts @Power2012. Frame rejection was based on the DVARS
metric @Power2012, computed on the first five temporal singular vectors obtained via
@svd of the centered (time, voxels) power Doppler matrix. DVARS was computed on these
singular vectors and not on the whole data matrix as they better represent sources of
global variations likely due to motion artifacts. The resulting metric was used to
generate a sample mask by thresholding it at 0.5 standard deviation. The sample mask was
then convolved with a kernel of size 2 to remove samples directly following each
rejection period. Samples outside of the sample mask were then replaced by the
temporal-average computed from the data inside of the sample mask. This "pre-scrubbing"
step is performed to remove motion artifacts likely to produce ringing artifacts in the
subsequent temporal filtering step, while keeping a stable sampling frequency. Notably,
higher-order interpolation methods routinely used in @fmri "pre-scrubbing" can be
detrimental considering the high proportion of motion artifacts in awake mice data. The
data was then standardized to $z$-scores and the first temporal singular vector was
computed and included as a confound signal. The first temporal singular vector was used
instead of the global signal as it better represents sources of global variations.
Confound regression and temporal filtering (#qtyrange(0.01, 0.1, "Hz")) was then
performed. Finally, the sample mask was used to reject frames that were previously
replaced by the mean.

====== Automatic Parcellation <sec:opioids-automatic-parcellation>

In order to focus on @fc changes in regions that show the highest level of @fc at the
baseline, an automatic parcellation approach has been used. Only scans at baseline were
used to compute the parcellation. A voxel-wise correlation matrix was computed, which
rows were then clustered using the K-means algorithm from scikit-learn @scikit-learn
with 18 clusters. Clusters intersecting with the midline or the border of the image were
considered artifacts and rejected. As we imaged in coronal slices, the parcellation was
symmetrized along the midline in order to match our symmetrical template and the Allen
Brain Institute methodology @Wang2020. Each @roi was deflated by 1 voxel to reduce the
influence of potential voxel mis-registration from one @roi to another. Details on the
procedure and its validation are given in the @supfig:opioids2.

====== Correlation Matrices and Seed-Based Maps

Cleaned time series from each @roi were averaged and correlated (Pearson correlation)
over 10-minute windows to produce correlation matrices @Ferrier2020. Seed-based maps
were also computed by voxel-wise correlation with each @roi average time series. Both
correlation matrices and seed-based maps follow a mass univariate approach. Correlation
matrices and seed-based maps from each experimental cohort were compared to a reference
cohort ($n = 47$) of animals injected with saline and imaged in the same conditions.
Comparisons were made for each 10-minute window. Samples of correlation coefficients
were compared using the Mann-Whitney $U$-test @Mann1947 following Fisher
$z$-transformation. The resulting $p$-values were corrected for multiple comparison
using the Benjamini-Hochberg step-up procedure @Benjamini1995 with an FDR threshold set
at 0.05.

====== Circular Graphs

Circular graphs are alternative representations of correlation matrices and are intended
for better visualization of @fc changes. Networks were plotted using the NetworkX library
@Hagberg2008.

In average graphs, each node represents an @roi and each edge represents the averaged
Pearson correlation coefficient between two nodes. The value for both nodes and edges is
represented as increased opacity in red for positive correlations and blue for
anti-correlations. For better readability, weak edges for correlation whose absolute
value is below 0.3 are not displayed. The node color encodes for the @rgc
@Franzmeier2017, i.e. the sum of the correlation between one node and all other nodes.
The @rgc is normalized relatively to the @roi\-wise maximum average @rgc during the
reference condition after saline injection. This normalization highlights differences in
@rgc.

In significance graphs, edges represent the difference of correlation between the
experimental condition and the reference cohort. Significance graphs only display edges
whose differences are significant (see previous paragraph). Nodes represent the sum of
the connectivity difference independently of the effect significance. The node values
are normalized to highlight the difference of the effect by half of the maximum
(@roi\-wise) average global connectivity during the reference condition after saline
injection.

====== @Fc Index

The rationale behind the definition of the @fc index is detailed in the Supplementary
Methods. Briefly, we aimed to derive a single metric that qualitatively captures the
strength of the opioid-induced @fc fingerprint at any given time point. To this end, we
performed #gls("pca", first: true) on the @fc matrices computed across the different subphases. As
illustrated in (Supplementary Methods, @supfig:opioids9, @supfig:opioids10), the second
principal component can be used to define a relevant and interpretable @fc index.

The @fc index can be trained on any treatment (at the exception of
(#ref-sub-fig(<fig:opioids5>, "F")) trained for the fentanyl fingerprint, morphine
#qty(70, "mg/kg") was used for training). Correlation matrices were computed for eight
subphases spanning two baseline and six post-treatment 10-minute windows. Given the
symmetric nature of the correlation matrices, we used only the lower triangle elements
($n = (18 times 17) / 2 = 153$), which were concatenated across subphases ($153 times 8
= 1224$ elements per subject) and averaged across subjects. Without additional data
standardization, @pca revealed two dominant sources of variance explaining together more
than 97% of the variance. The first principal component (87%) corresponds to the average
connectome across all subphases (strong bilateral connectivity and mild anticorrelation
between cortical and subcortical regions). In contrast, the second component (10%)
reflects features associated with the morphine fingerprint (strong hippocampo-thalamic
connectivity and marked anticorrelation with cortical activity). This later component
seems to give the best descriptor of the morphine induced fingerprint
(#ref-sub-fig(<supfig:opioids9>, "C-D")).

The @fc index is then normalized such that 0% corresponds to the average baseline value,
and 100% corresponds to the maximum cohort-averaged correlation observed under the
#qty(70, "mg/kg") morphine condition ($r = 0.61$). Notably, the @fc index exhibits clear
time- and dose-dependence (#ref-sub-fig(<supfig:opioids9>, "B")), closely mirroring the
morphine-induced @fc fingerprint shown in @fig:opioids2. Additionally, @supfig:opioids10
demonstrates that using the #qty(70, "mg/kg") dataset to train the @fc index yields a
robust representation. With the exception of the lowest dose, this training choice only
has a minor effect on the index's dynamics and amplitude.

===== Tracking

During awake @fusi acquisitions, animal movements are tracked using the Neurotar @mhc
tracking system @Juczewski2020. The system estimates the animal position through the
movements of the cage at a sampling rate of #qty(100, "Hz") and a precision under
#qty(1, "mm"). Mobility measures are resampled to the power Doppler sampling rate and
the instant speed is computed as the absolute value of first order derivative of the
resampled position. Based on a meta-analysis of 186 recordings at baseline, we defined
the threshold of movement at the elbow of the distribution of speed (@supfig:opioids12).
Thus, the animal is considered as moving when its speed exceeds #qty(5, "mm/s").

===== Cerebral Blood Volume

The @pd signal is proportional to @cbv. To represent the evolution of perfusion at the
cohort level, relative @cbv signals are computed for each acquisition, then averaged
across subjects in each cohort. Relative @cbv signals were computed by first censoring
high-motion volumes (using the same sample masks previously used in
@sec:power_doppler_preprocessing), then standardizing power Doppler signals to percent
signal change relative to the 20-minute baseline:

$ Delta"CBV" = ("PD" - min_("baseline")("PD")) / (min_("baseline")("PD")), $

where $min_("baseline")("PD")$ is the baseline minimum. The $Delta"CBV"$ signals are
then either averaged inside each @roi (for regional @cbv analyses, see
#ref-sub-fig(<supfig:opioids8>, "A"), or inside the whole brain (for brain-wide @cbv
analysis, see #ref-sub-fig(<fig:opioids6>, "A").

===== Lag Analysis

Lag analysis consists in computing seed-based maps using time-delayed versions of a
given seed. When the delay is positive, the seed time series is shifted forward in time
(#ref-sub-fig(<fig:opioids3>, "A")). In this case, a high correlation coefficient
between a voxel and the positively delayed seed could indicate that events in the seed
time series precede those in the voxel time series. When the delay is negative, the seed
time series is shifted backward in time (#ref-sub-fig(<fig:opioids3>, "A")). In this
case, a high correlation coefficient between a voxel and the negatively delayed seed
could indicate that events in the voxel time series precede those in the seed time
series. Because coherence of the correlation structure decays with increasing lag, the
maps at each lag are scaled (divided by the standard deviation) in order to be
comparable in terms of distribution. Second order statistics are computed similarly as
described above for seed-based maps on the cross-correlation value before normalization.

===== Spectrum Analysis

For the analysis of @cbv fluctuation frequency spectra, signals are minimally processed:
the raw Power Doppler is expressed as percent signal change ($Delta"CBV"$), relative to
the mean value. Then, regional average haemodynamic is extracted for each animal and the
power spectral density is computed via Welch's method, using the `scipy.signal.welch`
from the SciPy Python package @scipy. The average normalized spectrum is displayed with
#qty(95, "%") confidence intervals in log-log diagram. The slope of the $1 / f$ signal
is computed using the `numpy.polyfit` from the Numpy Python package @Harris2020 on the
@fc frequency band #qtyrange(0.01, 0.1, "Hz").

===== Data Selection

Our experiments were performed on cohorts of $n = 10$ mice for C57BL/6J, $n = 11$ mice
for @mor#super[-/-] and $n = 12$ mice for BALB/cJ. Recordings were discarded from
further analysis because of corrupted files ($n = 3 / 296$), animal death
($n = 1 / 296$) and mis-registration ($n = 8 / 296$). In addition, aberrant @fc values
inducing significant differences from our saline cohort at baseline resulted in the
rejection of two recordings in the naloxone experiment. This baseline effect could be
associated with extreme mobility values (>= #qty(50, "%") against #qty(20, "%") on
average). A summary table in the supplementary methods recapitulates the analyzed data
for @fusi experiments (@suptab:opioids1).

==== Results

===== Pharmacological @fusi:short Fingerprint of Morphine in Awake Mice

To investigate pharmacologically-induced changes in brain activation and @fc in awake
and behaving mice, we adapted the imaging protocol from our previous work @Ferrier2020.
Following implantation of a small metal headplate on the mouse skull and several days of
habituation, the mouse is head-fixed within the Mobile
HomeCage#sym.trademark.registered, an air-lifted lightweight carbon cage facilitating
continuous tracking of the animal behavior @Bertolo2021, during imaging experiments
(#ref-sub-fig(<fig:opioids1>, "A-C"). Our standard coronal imaging plane was selected at
Bregma #qty(-1.8, "mm"), encompassing key regions of interest, such as the somatosensory
cortex, the retrosplenial area, the dorsal hippocampus and the thalamus
(#ref-sub-fig(<fig:opioids1>, "D-H") and @supfig:opioids1). The choice of this specific
coronal slice was based on its inclusion of major #glspl("roi", first: true) and its distinct display
of a readily identifiable branching configuration between the anterior choroidal and the
internal carotid arteries (#ref-sub-fig(<fig:opioids1>, "E")), facilitating reproducible
localization within and between mouse cohorts (#ref-sub-fig(<supfig:opioids1>, "A-B")).
The imaging plane (#ref-sub-fig(<fig:opioids1>, "D")) was perpendicular to the metal
headplate, exhibiting an #qty(8, "deg") angle in the coronal plane with respect to the
Paxinos mouse brain atlas @Paxinos_Franklin_2019 and an #qty(18, "deg") angle with
respect to the Allen Mouse Brain Atlas @Wang2020 (#ref-sub-fig(<supfig:opioids1>, "A")).
All images were registered to a custom vascular template of the coronal slice of
interest. Our treatment protocol (#ref-sub-fig(<fig:opioids1>, "G")) involved a
20-minute baseline period divided into two 10-minute sub-phases (BP1 and BP2), followed
by a 60-minute post-injection "drug phase" period, further divided into 10-minute
sub-phases (SP1 and SP6). To enhance the sensitivity of our functional fingerprinting,
we defined 18 unilateral and symmetrical functional @roi:pl by clustering a voxel-wise
correlation matrix (#ref-sub-fig(<fig:opioids1>, "H") and @supfig:opioids2).

#figure(
  placement: auto,
  image("figures/opioids/1_Figure_20250721.png"),
  caption: figure-caption(
    [#Gls("phfusi", first: true) in awake mice],
    [(*A*) Schematic representation of the @fusi setup with the Mobile
      HomeCage#sym.trademark.registered setup. (*B* and *C*) Transcranial acquisition of a
      head-fixed and freely moving mouse through a chronically implanted metal frame with
      an ultrasonic probe. (*D*) Localization of the imaged plane. The solid red line
      represents the plane of the metal plate, while dashed orange and red lines represent
      the coronal plane in the Paxinos Mouse Brain Atlas (#qty(6, "deg") difference) and
      #gls("ccf", first: true) reference space (#qty(18, "deg") difference), respectively. (*E*) Super
      resolution image of the imaged plane with #qty(25, "um") resolution of the vascular
      tree. The anterior choroidal artery (Ach, red arrow) was used for reproducible
      localization of our reference imaging plane. (*F*) Overlay of the imaging plane from
      a single animal with the Allen brain template. (G) @phfusi imaging during the acute
      treatment protocol. Three recording periods (one baseline, and two drug phases) are
      split in 10-minute windows (baseline-phase: BP1-2 and sup-phase: SP1-6,
      respectively). (H) Selected #glspl("roi", first: true) in the coronal plane. Data-driven
      parcellation in the imaged plane overlaid with the Allen brain parcellation. 18
      @roi:pl identified by the algorithm and having a good match with major anatomical
      regions were used. (*I* and *K*) Averaged analysis of the @fc pattern after
      injection of #qty(30, "mg/kg") morphine in wildtype (C57BL/6J) mice ($n =
      numrange("8", "10")$) compared to control (saline injection), at
      #qtyrange(40, 50, "min") post-injection (SP5). (*I*) @Roi:pl\-based @fc
      correlation/significance matrix. Numbered rows and columns represent @roi:pl from
      *H*. Squares delineate four meta-regions (cortex, hippocampus, thalamus and
      hypothalamus). Bottom left triangle shows the average post-injection correlation
      matrix in blue-red ($[−1, 1]$), top right triangle displays the effect size
      (difference of correlation) in green-violet ($[−0.5, 0.5]$) of @roi pairs where
      difference with the saline state is significant. (*J*) Significance correlation
      graphs representing the significance part of the correlation matrix where the
      nodes encode the global connectivity of each @roi in the network, and edges the
      significant changes in their correlation in green-violet (edges $[−0.5, 0.5]$;
      nodes $[−0.2, 0.2]$). (*K*) Seed-based maps of the @roi:pl 1, 8, 11 and 13. Top
      row represent the difference average correlation map in blue-red ($[−1, 1]$) and
      bottom row the voxels, whose difference with saline injected animals is
      significant, are overlaid on the power Doppler template, the size effect is
      displayed in green-violet ($[−0.5, 0.5]$). Scale bar = #qty(1, "mm").],
  ),
) <fig:opioids1>

Following the subcutaneous administration of #qty(30, "mg/kg") morphine, a strong and
statistically significant alteration in averaged brain @fc patterns
($n = numrange("8", "10")$) was observed when compared with the saline-treated control
cohort ($n = numrange("8", "10")$). At 40-minute post-injection, a reduction in
cortical-subcortical @fc ($Delta r = -0.31, p = num("2.88e-2")$) coincided with increased
@fc ($Delta r = 0.38, p = num("7.45e-4")$) within cortical regions and increased
hippocampo-thalamic @fc ($Delta r = 2.96, p = num("1e-2")$), as depicted in the
connectivity/significance matrix (#ref-sub-fig(<fig:opioids1>, "I")), the significance
correlation network (#ref-sub-fig(<fig:opioids1>, "J")), the seed-based maps
(#ref-sub-fig(<fig:opioids1>, "K")), and quantified in key @roi pairs
(@supfig:opioids3). This result indicates that morphine induces a significant
redistribution of both intra- and inter-regional @fc patterns in the awake mouse brain,
with a prominent effect characterized by the emergence of an anti-correlation between
cortical and subcortical regions.

Next, we tested the pharmacological relevance of our findings. As expected, injection of
saline did not yield any noticeable changes in @fc during the entire acquisition period
(#ref-sub-fig(<fig:opioids2>, "A-B")). In contrast, increasing doses of morphine
resulted in a progressively earlier onset of the morphine-induced reorganization of the
functional connectome, likely indicating an earlier attainment of the critical level of
@mor occupation, with higher morphine doses leading to stronger @fc changes
(#ref-sub-fig(<fig:opioids2>, "A-B") and @supfig:opioids3). Strikingly, even the highest
administered dose of morphine (#qty(70, "mg/kg") failed to induce similar connectivity
changes in @mor#super[-/-] knockout mice (#ref-sub-fig(<fig:opioids2>, "C-D"))).
Similarly, pre-treatment with naloxone, a fast-acting @mor\-specific antagonist,
significantly attenuated the effects of #qty(30, "mg/kg") morphine at #numrange(20, 30)
minutes (SP3) after injection (#ref-sub-fig(<fig:opioids2>, "A-B").

#figure(
  placement: auto,
  image("figures/opioids/2_Figure_20250721.png"),
  caption: figure-caption(
    [Dose- and time-dependence of @fc:short signatures of morphine.],
    [(*A–D*) Pharmacodynamics and dose dependence of the morphine @fc pattern in (*A and
      B*) wildtype (C57BL/6J) or (*C and D*) @mor knockout mice (@mor#super[-/-]) ($n =
      numrange("8", "10")$). Naloxone pre-treatment was at $t_(-5)$ minutes, followed by
      morphine at $t_0$. @Fc correlation/significance matrices and significance
      correlation graphs are shown as on #ref-sub-fig(<fig:opioids1>, "I-J"). Statistical
      significance of the morphine @fc pattern by comparing drug phase to saline
      injection. Correlation matrix in blue-red ($[−1, 1]$); significance matrix in
      green-violet ($[−0.5, 0.5]$); significance correlation graph in green-violet
      (edges $[−0.5, 0.5]$; nodes $[−0.2, 0.2]$).],
  ),
) <fig:opioids2>

===== Temporal Dynamics of the Morphine Fingerprint

In order to gain mechanistic insight into morphine-induced changes in @fc, we analyzed
the spatio-temporal reorganization of the power Doppler signal patterns. In control
animals, the power density of the power Doppler signal in the frequency domain displayed
an inverse correlation ($r = -0.78, p < num("1e-10")$) with frequency in distinct
@roi:pl, consistent with a power law distribution (#ref-sub-fig(<fig:opioids3>, "A")).
Similar $1 / f$ statistical patterns are expected to arise from the integration of a
large family of neuronal oscillations in the spatial and temporal domains @Buzsaki2004.
According to the prevailing consensus, larger neuronal assemblies are associated with
slower oscillations characterized by higher amplitudes, while smaller, localized
clusters of neurons contribute to higher frequency signals characterized by lower
amplitudes @Buzsaki2004. Intriguingly, a disruption in this power-law relationship in
the power Doppler spectrum can be observed starting from 20 minutes after morphine
administration: the power of low frequency components between #num(0.01) and
#qty(0.1, "Hz") is notably redistributed (#ref-sub-fig(<fig:opioids3>, "A")) (Low @fc
band: morphine #qty(10, "mg/kg"): $Delta = -0.11, p = num("2.03e-2")$, morphine
#qty(70, "mg/kg"): $Delta = -0.28, p = num("1.08e-4")$; High @fc band: morphine
#qty(10, "mg/kg"): $Delta = 0.49, p = num("1.49e-4")$, morphine #qty(70, "mg/kg"):
$Delta = 0.58, p = num("2.36e-5")$). This shift suggests that morphine treatment
induces alterations in large-scale @fc patterns through perturbation of specific
oscillatory components from large neuronal assemblies that contribute to the critical
state at rest @Bullmore2012. This perturbation of hemodynamic spectral content can be
further investigated by seed-based cross-correlation analysis
(#ref-sub-fig(<fig:opioids3>, "B"), @supfig:opioids4, and Video S1) which confirmed
notable changes in large-scale oscillation patterns at the plateau of morphine-induced
@fc effects (Drug Phase SP5), as compared to the saline control
(#ref-sub-fig(<fig:opioids3>, "C-D")). Interestingly, contralateral (i. e.
intra-regional) @roi:pl displayed mostly temporally symmetrical cross-correlations in
the cortex, hippocampus and thalamus, which were mostly preserved despite increased
oscillation frequencies. In contrast, several @roi pairs spanning different regions
showed asymmetrical lagged correlation structures in controls, which were significantly
perturbed after morphine treatment, putatively related to altered signal propagation
characteristics. Notably, several such inter-regional @roi pairs that did not show
significant @fc changes at the classical zero lag correlation, such as the lateral
cortex-dorsal thalamus connection (@roi:pl #numrange(1, 11)), displayed significant @fc
changes at a lags of #numrange(8, 10) seconds, suggesting that morphine perturbs signal
propagation characteristics also in these inter-regional connections (@supfig:opioids4).

#block(sticky: true, image("figures/opioids/3_Figure_20250721.png"))
#figure(
  kind: image,
  supplement: "Figure",
  caption: figure-caption(
    [Dynamic effects of morphine on @fc:short.],
    [(*A*) Power spectrum analysis (Welch method, normalized integral per animal, 95% @ci)
      in the lateral cortex (@roi 1) following injection of saline ($n = 47$) or morphine
      (10 and #qty(70, "mg/kg"), $n = numrange("8", "10")$), presented in a log-log diagram.
      For saline, a characteristic $1 / f$ (power law) relationship is observed in the @fc
      band (blue line, linear fit dotted black, $"slope" = −1.59$). Injections of 10 or
      #qty(70, "mg/kg") morphine disrupt the power law relationship and a peak emerges
      around #qty(0.05, "Hz") (red line), revealing a significant reorganization between low
      and high @fc bands of cortical activity associated with an oscillatory pattern. (*B*
      and *C*) Spatial analysis of @fc dynamics. (*B*) The seed signal is represented in
      red, while signals from all other voxels are shown in black. Left: Negative lag
      represents a time shift wherein positive correlation indicates that the seed signal
      correlates with the past history of the voxel. Middle: Zero lag, which corresponds to
      classical static @fc as shown systemically in our study. Positive correlation
      indicates that both signals are in phase, Right: Positive lag corresponds to a time
      shift where positive correlation indicates that future history of the signal
      correlates with the seed. (*C*) The effects of #qty(70, "mg/kg") morphine ($n = 10$)
      at the plateau of morphine-induced @fc effects (Drug Phase SP5) is examined over
      time, with each window separated by 4 seconds and with seeds in the lateral cortex
      (@roi 1), hippocampal CA3 (@roi 8), dorsal thalamus (@roi 11) and ventral thalamus
      (@roi 13). Upper rows: Lag analysis after saline injection, connectivity in each
      @roi is predominantly bilateral and modulated by a slow oscillation at
      #qtyrange(30, 40, "s") periods. Middle rows: After morphine injection the cortical
      oscillation frequency increases ($approx qty("20", "s")$) period) and the @fc
      pattern becomes more complex with the emergence of two anticorrelated networks.
      Lower rows: Seed based maps of the significant difference between both conditions.
      Notably, most @roi:pl show significant effect at all phases of the fast
      oscillation induced by morphine, but the dorsal thalamus shows no significant
      difference at zero lag but a spatial reorganization at the negative lag of
      #qtyrange(-8, -10, "s") (see also #ref-sub-fig(<fig:opioids1>, "D")). See
      Supplementary Videos for dynamic illustration of these data. Seed-based maps in
      blue-red ($[−5, 5]$); seed based maps significance in green-violet ($[−0.5,
        0.5]$). Scale bar = #qty(1, "mm"). (*D*) Inter-regional correlation across lags,
      each figure represents a pair of @roi:pl (average of the lagged map in the @roi as
      $z$-score). The cortical oscillation at a fast frequency is the main driver of
      temporal reorganization. If some @roi pairs show temporal symmetry (top line),
      hippocampal and thalamic asymmetry, suggesting propagatory phenomena are perturbed
      by the fast oscillation.],
  ),
  none,
) <fig:opioids3>

These findings collectively indicate that morphine elicits a @mor\-specific, dose- and
time-dependent impact on region-wide @fc patterns, through the modification of intra-
and inter-regional oscillatory behavior, generating altered standing and propagating @fc
waves. Our results also show that while comprehensive pharmacological @fc fingerprinting
should extend to the temporal dynamics domain, the classical zero-lag Pearson's
correlation measurements sample already well large-scale changes in @fc patterns,
allowing us to focus on this approach in the following analyses.

===== Acute and Chronic @fc Fingerprints of Major Opioid Ligands

To further explore whether the @mor\-specific effects observed with morphine extend to
other @mor\-acting ligands, we investigated the brain effects of injecting fentanyl,
methadone or buprenorphine, three therapeutically important drugs (@fig:opioids4). The
dose-dependent effects of fentanyl, a rapidly-acting @mor agonist---with faster
absorption and distribution due to higher lipid solubility---, were measured
(@supfig:opioids5), along with single doses of #qty(10, "mg/kg") for methadone and
#qty(3, "mg/kg") for buprenorphine (@supfig:opioids6). Similar to morphine, increasing
doses of fentanyl elicited increasingly earlier and more pronounced changes in @fc,
displaying a comparable interregional dysconnectivity pattern (@fig:opioids4,
@supfig:opioids5, and @supfig:opioids6). Similar pattern emerged after administration of
methadone, a full @mor agonist and, with a decreased intensity, after administration of
buprenorphine, a partial @mor agonist and antagonist at the $delta$- and $kappa$-opioid
receptors. Differences in @fc changes were well correlated with analgesic efficacy of
these compounds (#ref-sub-fig(<supfig:opioids7>, "D")). These results collectively
showing that intensity differences in the change of @fc patterns are correlated with
differences in @mor agonist efficacy (@fig:opioids4, @supfig:opioids6,
@supfig:opioids7).

#figure(
  placement: auto,
  image("figures/opioids/4_Figure_20250721.png"),
  caption: figure-caption(
    [@Fc signatures of different opioids.],
    [(*A*) Functional connectivity correlation/significance matrices and significance
      correlation graphs at their maximal post-injection effect time points for saline
      (SP5), morphine (SP5), fentanyl (SP3), methadone (SP5), and buprenorphine (SP6) in
      wildtype (C57BL/6J) mice ($n = numrange("8", "10")$). (*B*) Seed based maps of
      @roi:pl 1, 8, 11 and 13. Statistical significance of the @fc pattern by comparing
      drug phase to saline injection. Correlation matrix in blue-red ($[−1, 1]$);
      significance matrix in green-violet ($[−0.5, 0.5]$); significance correlation graph
      in green-violet (edges $[−0.5, 0.5]$; nodes $[−0.2, 0.2]$); seed based maps in
      blue-red ($[−1, 1]$). Scale bar = #qty(1, "mm").],
  ),
) <fig:opioids4>

The behavioral effects of opioids, including analgesia, euphoria, and sedation show
tolerance with repeated administration. As a result, patients or drug consumers require
higher doses over time to achieve the same level of response, leading to increased risk
of secondary effects like respiratory depression, constipation, addiction and overdose.
We aimed to investigate whether morphine and fentanyl induced changes in @fc patterns
also display a tolerance effect. We chronically treated mice using an implanted osmotic
pump with morphine and fentanyl for one week, which results in significant habituation
for analgesia (SP3: morphine: $Delta = -72.54%, p = num("5.54e-4")$, fentanyl:
$Delta = -67.86%, p = num("1.55e-4")$), as assessed by the hot plate test
(@supfig:opioids7)) @Kliewer2019. Notably, this protocol led to a reduction in
significant changes in @fc patterns (SP6: morphine: $Delta "FC"_"index" = -0.19, p =
num("2.00e-2")$, fentanyl: $Delta "FC"_"index" = -0.25%, p = num("1.40e-2")$) following
a single injection, compared to the injection of the same dose in non-chronically
treated animals (@fig:opioids5). In order to quantitatively illustrate this effect, a
@fc index was derived based on a @pca of the fingerprints presented in (@fig:opioids2)
for morphine and (@supfig:opioids5) for fentanyl. The @fc index represents the typical
dynamics of @fc shift associated with a typical fingerprint it is trained with
(respectively on morphine #qty(70, "mg/kg") and fentanyl #qty(0.3, "mg/kg")).
(#ref-sub-fig(<fig:opioids5>, "E-F")) illustrates how tolerance accelerates the
apparition of drug specific patterns while reducing their intensity. These changes were
also well-correlated with chronic-treatment induced changes in the activation level of
@mor at the whole brain scale, (#ref-sub-fig(<supfig:opioids7>, "F")), measured in
another parallel awake mice cohort. Together, these results provide compelling evidence
for the functional relevance of the opioid-induced and @mor\-specific @fc fingerprint,
further highlighting its significance in response to different @mor\-acting ligands.

#figure(
  placement: auto,
  image("figures/opioids/5_Figure_20240723.png"),
  caption: figure-caption(
    [@Fc patterns of opioid tolerance.],
    [(*A*-*D*) Significance correlation graphs and seed based maps of the lateral cortex
      (@roi 1 with SP5 for morphine and SP3 for fentanyl) after acute saline, morphine or
      fentanyl injection in wildtype (C57BL/6J) mice ($n = numrange("8", "10")$). Chronic
      treatment was carried out with osmotic pumps delivering (*A*) morphine
      (#qty(17, "mg/kg/day")) or (*B*) fentanyl (#qty(2, "mg/kg/day")) for one week.
      Statistical significance of the morphine @fc pattern by comparing drug phase to
      saline injection. Significance correlation graph in green-violet (edges
      $[−0.5, 0.5]$; nodes $[−0.2, 0.2]$); seed based maps significance in green-violet
      ($[−0.5, 0.5]$). Scale bar = #qty(1, "mm"). (*C-D upper graph*) Acute
      antinociceptive response measured in the mouse hot-plate test after fentanyl
      (#qty(15, "min")) or morphine (#qty(30, "min")) using a cumulative dosing regimen
      ($n = numrange("6", "12")$). Cumulative analgesic dose-response curves before (day
      -1) and after (day 7) chronic treatment with osmotic pumps delivering morphine
      (#qty(17, "mg/kg") day-1) or fentanyl (#qty(2, "mg/kg") day -1) ($n =
      numrange("9", "12")$). (*C-D lower graph*) Analgesic time course of acutely
      administered morphine or fentanyl measured in the mouse hot-plate test was
      repeated after drug administration, respectively, for the indicated times ($n =
      8$). (*E*-*F*) @fc index timeseries for acute injection of Morphine
      (#qty(70, "mg/kg")) (*E*) and Fentanyl (#qty(0.3, "mg/kg")) (F) before (blue)
      and after (red) chronic induction of tolerance. The curves illustrate faster and
      less intense establishment of the fingerprint for both compounds after induction
      of tolerance. ($star p < 0.05$ non parametric Mann-Whitney $U$).
    ],
  ),
) <fig:opioids5>

===== Correlation of the @fc Fingerprint with @Cbv, Behavior, and @mor Activation

Next, we aimed to understand the relation of the above reported @mor\-specific changes
in @fc to local changes in brain perfusion, the parameter typically measured in @phfmri
studies, and to opioid-induced behavior. We investigated the correlation of
opioid-induced @fc changes with alterations in brain perfusion and behavioral read-outs,
such as mobility, analgesia and respiratory depression, the latter two measured in
parallel awake mouse cohorts (#ref-sub-fig(<fig:opioids6>, "A-B") and
#ref-sub-fig(<supfig:opioids8>, "B")). For this purpose, the @fc index introduced
earlier has been used to model for @fc global dynamics. Analysis of @cbv changes
following injection of morphine or fentanyl, but not of saline, indicated a
characteristic change in perfusion (@fig:opioids6 and @supfig:opioids8). This consisted
in early and regionally heterogeneous hyperperfusion followed by prolonged
hypoperfusion, with amplitude and dynamics well correlated with the dose and the @mor
agonist efficacy of these two ligands. As (#ref-sub-fig(<fig:opioids6>, "A"),
#ref-sub-fig(<supfig:opioids8>, "B")) show a similar peak in the first 10min after the
pharmacological challenge, we had to address the specificity of this hyperemic event. We
compared C57BL/6J mice, in which opioid injection induces a stereotyped locomotion
behavior in C57BL/6J but not in BALB/cJ mice (@supfig:opioids11) @Oliverio1974.
Morphine-induced hyperperfusion patterns, though of reduced intensity, were also
observed in BALB/cJ mice in the absence of movement. This suggests that regional changes
in @cbv are not exclusively attributable to increased locomotion (@supfig:opioids11),
although they might be amplified by elevated motion @Zhang2019. Finally, morphine
induced respiratory depression, a clinically important side-effect of opioids. In
(#ref-sub-fig(<fig:opioids6>, "A")) respiratory depression time series also display a
similar profile as @cbv and locomotion (#ref-sub-fig(<fig:opioids6>, "B"),
@supfig:opioids8) with a rapid decrease of breathing rate after the challenge that
slowly reverts to the baseline.

#figure(
  placement: auto,
  image("figures/opioids/6_Figure_20250725.png"),
  caption: figure-caption(
    [Correlation of morphine-induced @fc:short changes with perfusion, @mor:short activation and
      behavior.],
    [(*A*) Overlay of functional connectivity changes (@fc index in blue), averaged
      mobility (orange), relative @cbv (green), analgesic response measured in the hot
      plate test (red), pS375-@mor phosphorylation pattern detected with Western Blot
      (purple), after injection of saline and different doses of morphine in wildtype
      (C57BL/6J) mice ($n = numrange("8", "10")$). (*B*) Pair plots of correlations
      between @fc, brain-wide @rcbv, mobility, analgesia, @mor phosphorylation. Graphs in
      the lower left triangle show correlation between values, each dot is the cohort
      average value (grey for saline, blue for morphine #qty(10, "mg/kg"), green for
      #qty(20, "mg/kg"), orange for #qty(30, "mg/kg"), red for #qty(70, "mg/kg")) for one
      dose over a 10-minute window; black bar is the linear fit and gray area represents
      the 95% confidence interval. Diagonal graphs show the kernel density estimate of
      each parameter, to illustrate skewness and multimodality in the data. Dots in the
      top right triangle represent the correlation between two parameters (blue for
      negative correlations, red for positive correlations) displaying the Pearson
      correlation coefficients. As analgesia and phosphorylation were measured in
      independent cohorts, the correlation is computed at the cohort level. There are two
      anticorrelated clusters of quantities (mobility, @cbv vs. @fc index,
      phosphorylation, analgesia). (*C*) @pca analysis of the various observables. Data
      are projected on the two principal components illustrating the two types of effects
      (PC1: @fc/Analgesia/phosphorylation, PC2: @cbv/Mobility). Colours represent the
      different cohorts, with transparency decreasing as time progresses.
    ],
  ),
) <fig:opioids6>

Importantly, mobility showed poor temporal correlation with the changes in @fc
(#ref-sub-fig(<fig:opioids6>, "B")) (mobility-FC#sub[index]: $r = 0.10, p =
num("0.46e0")$), which was delayed by about 20 minutes at the #qty(30, "mg/kg") dose
(@fig:opioids6). In addition, similar connectivity changes were observed in BALB/cJ mice
further demonstrating that changes in locomotion, perfusion and @fc are predominantly
independent effects of opioids (@supfig:opioids11). Thus, while the kinetics of
locomotion, respiration and regional @cbv changes are fast and synchronous,
morphine-induced reorganization of @fc is relatively slow, as compared to these three
parameters. Morphine-induced analgesia, a therapeutically important parameter measured
in the hot plate test in a parallel awake mice cohort, displayed kinetics similar to the
relatively slow @fc changes (#ref-sub-fig(<fig:opioids6>, "A-B"),
#ref-sub-fig(<supfig:opioids7>, "D")). Additionally, these relatively slow changes in
@fc patterns and analgesia were also well-correlated with changes in the activation
level of @mor at the whole brain scale (#ref-sub-fig(<fig:opioids6>, "A-B"),
#ref-sub-fig(<supfig:opioids7>, "E")) (FC#sub[index]-phosphorylation: $r = 0.91, p =
num("3.92e-24")$; analgesia-phosphorylation: $r = 0.81, p = num("6.18e-15")$), measured
in another parallel awake mice cohort. These data suggest the existence of two latent
processes driving independently the @rcbv, respiration, and locomotion in a fast burst
followed by a slow decay towards the baseline, while @fc changes, analgesia and @mor
activation appear later in time. To confirm these observations, we performed a principal
component analysis of all physiological readouts but respiratory depression from session
morphine #qty(70, "mg/kg") (#ref-sub-fig(<fig:opioids6>, "C")). We found that two
principal components are sufficient to explain most of the readouts variance
(PC1: 74.2%, PC2: 25.1%). The first component is most correlated with the @fc index,
analgesia and phosphorylation, while the second is most correlated with motion and
brain-wide @cbv (#ref-sub-fig(<fig:opioids6>, "C"). Finally, we projected the
physiological readouts from the saline and morphine sessions onto the two previously
computed principal components. As expected, the first principal component (PC1) sorts
sub-phases by increasing time, with sub-phases 4 to 6 having higher loading along PC1
than earlier sub-phases, and sessions by increasing dose. Notably, all baseline
sub-phases from morphine sessions and all saline sub-phases are tightly grouped with
highly negative loadings along PC1. Conversely, sub-phases directly following morphine
injections have highly positive loadings along the second principal component (PC2).

Taken together, our results show that major opioid drugs lead to significant changes in
region-wide @fc patterns, through the modification of correlative behavior in large
neuronal assemblies (@fig:opioids6). These @fc alterations are pharmacologically
relevant since they are @mor\-specific and encompass timing, dose-dependence, and the
development of tolerance due to prolonged drug exposure. Importantly, these @fc
alterations, but not local changes in perfusion, are well-correlated with the
development of analgesia, a therapeutically important behavioral read-out, but not with
respiratory depression, a serious side-effect of opioids.

==== Discussion

In this study, we have developed a multimodal and minimally-invasive approach to assess
drug- induced functional alterations in the awake rodent brain with high sensitivity,
through the intact skull. Our findings reveal that major opioids lead to a remarkably
consistent dysconnectivity pattern, referred to as the "opioid fingerprint". This
pattern predominantly involves the emergence of anticorrelations between cortical and
subcortical regions, resulting from altered oscillatory patterns, gradually occurring
following opioid administration. Importantly, these dysconnectivity patterns are
strongly correlated with and may potentially underlie the development of analgesia,
which represents the primary therapeutic effect of opioids

===== Methodology <sec:opioids-methodology-discussion>

In this pioneering study our primary focus was to ensure robustness and reproducibility,
prompting specific technological trade-offs that can be readily addressed in future
investigations. One key trade-off encountered in awake animal @fusi pertains to the
balance between invasiveness and sensitivity. Employing intact skull imaging results in
a modest overall loss of the power Doppler signal, which becomes more pronounced in
regions located under skull sutures. An alternative approach involves craniotomy,
potentially accompanied by a plastic prosthesis @Bergel2018 @Tournissac2022 to
counteract the loss of sensitivity. However, this entails more invasive surgical
procedures, modifies cortical blood flow patterns, and introduces increased variability
due to post-operative complications. An intermediate solution is skull thinning
@Osmanski2014 @Bertolo2021 @Urban2015 @Bourgeais-Rambur2022 which is less invasive but
may still induce post-surgical variability at the cohort level. Our comparison with the
literature suggested that transcranial @fusi, in our experimental setup, remains at
least as sensitive as state of the art preclinical @fmri, making it well-suited for an
initial assessment of drug-induced effects in the awake mouse brain with low
variability.

The second trade-off, partly interconnected with the first, involves the compromise
between spatial coverage, temporal resolution and experimental throughput. To validate
pharmacological effects across various mouse strains and several drugs, including two of
them at different doses, we opted to image a single representative brain slice, easily
identified at the beginning of the imaging sessions based on its specific vascular
landmarks. Remarkably, this single slice, sampled at up to #qty(2, "Hz"), yielded
already highly significant and reproducible outcomes. Our imaging protocol can be
readily extended further for 3D coverage employing 2D matrix or RCA probes @Mace2018
@Rabut2019 @Brunner2021. However, our unpublished results indicate that matrix probes
still require development to obtain the requisite sensitivity for minimally-invasive
transcranial imaging of pharmacological responses in mice. Currently, single slice 2D
imaging with a linear array probe provides the highest temporal resolution for @fusi,
motivating our experimental choice. Importantly, recent results indicate that 2D
sections of 3D @rsn:pl coincide well with @rsn:pl obtained from 2D power Doppler images
@Hikishima2023, suggesting that spurious latent network correlation structures reported
in under sampling methods, such as ours, represent a powerful and economical approach to
detect dysconnections at the whole-brain level.

===== Opioid-Induced Dysconnectivity

The @fc changes detected in our sample coronal slice report changes in correlations of
the spontaneous fluctuation of blood flow. On their own, these results do not allow us
to draw conclusions about the precise mechanism causing this loss of synchronicity.
Changes in neural dynamics (local shift of excitation/inhibition or changes in synaptic
weights), out of plane connectivity changes, as well as non-neuronal sources, like
neuro-vascular decoupling, could separately or together explain the change in the
reported @fc patterns. Independently from their exact origin, our results suggest
large-scale reorganization of @fc patterns, which are relatively slow following the
administration of opioids (at around 20 minutes for morphine). While the predominant
effect is a decrease in the zero-lag Pearson's correlation of the Power Doppler signal
between the thalamus and cortical regions, accompanied by an important change in
hippocampal @fc patterns, dynamical analysis suggests that this dysconnectivity is not a
simple loss of information exchange between cortical and subcortical regions, but rather
a reconfiguration of coupled oscillatory patterns. Indeed, morphine-induced
dysconnectivity displays a rich spatiotemporal pattern, but notably, highly-significant
and reproducible responses can already be detected by focusing solely on the classical
zero-lag correlation analysis.

At steady-state, integration of a large spectrum of oscillatory patterns leads to the
characteristic power-law spectrum or $1 / f$ statistics in various experimental
read-outs (obtained for example by electrophysiology or @eeg), suggesting self-organized
criticality of brain dynamics @Bullmore2012. This may enable rapid and robust
large-scale reconfiguration of functional networks in response to exogenous stimuli.
Notably, the power-law can be observed in the spectrum of the power Doppler signal of
our control cohorts (saline treatment). Perturbations, such as sensory stimuli or motor
output, were proposed to reduce the critical state in the cortex and provide transient
stability through oscillations @Buzsaki2004. The resulting rhythmic cortical feedback to
the thalamus is a major factor in the amplification of thalamocortical oscillations and
with increasing commitment to an oscillatory network, the responsiveness of neurons to
external inputs progressively decreases @Buzsaki2004. Our results indicate that
pharmacological treatment may induce similar critical-state-reducing perturbations,
since morphine treatment results in important changes both in the frequency repertoire
and in the temporal organization (that is, lag structure) of thalamo-cortical networks.
Thus, by perturbing cortical critical-state dynamics through modification of the
excitation/inhibition balance @Poil2012, @mor acting on inhibitory interneurons
@Reeves2022 may induce specific oscillations to reduce the neuronal responses to
prominent environmental influences, such as pain. As slow, large-scale oscillations are
considered as modulators of faster local events, the emergence of the slow
morphine-induced oscillatory activity at #qty(0.05, "Hz") may also alter the power of
faster gamma oscillations, which are reportedly modulated by morphine in hippocampal
slices @Whittington1998 or in the awake mouse striatum @Reakkamnuan2015. Future research
combining electrophysiology and @fusi in awake mice @NunezElizalde2022 may disentangle
the intricate relationship between opioid-modulated local and large-scale events and
their implication in pain perception and analgesia.

To the best of our knowledge, only a single study has thus far investigated the acute
effect of @mor agonist on #gls("fc", first: true) in mouse models @Nasseef2019 by measuring the
influence of oxycodone (#qty(2, "mg/kg")) on @bold activation and zero-lag @fc patterns
in mice under dexmedetomidine anesthesia. Through @ica, they identified 71 components
constituting a connectivity network encompassing the entire brain. Notably, their
findings primarily revealed an overall reduction in @fc. Furthermore, they show
region-specific increased perfusion, which correlates with @mor\-enriched clusters
(periaqueductal gray, substantia nigra, caudate putamen and nucleus accumbens). Both
effects are absent in @mor knockout mice. Notably, in contrast to our results, this
study does not report opioid-induced changes in cortical-subcortical @fc, which is known
to be affected by anesthesia @Alkire2000. The validity of our findings is reinforced by
similar observations in an awake human @fmri study, where morphine- and alcohol-induced
connectome changes were compared to placebo controls @Khalili-Mahani2012. Utilizing an
advanced model based on 8 canonical resting-state networks, the most notable finding in
their investigation is a dysconnectivity or induced anticorrelation between the
somatosensory cortex and the hippocampus, which is consistent with our own findings.
Additionally, @fmri imaging of heroin-maintained outpatients demonstrated that acute
injection of heroin, a pro-drug of morphine, induces cortico-thalamic disconnection
@Denier2015, and multiple studies reported opioid-induced dysconnectivity between the
cortical and subcortical regions @Ma2010 @Jiang2011. In conclusion, our @fusi\-based
reporting of cortico-subcortical dysconnection as the primary effect of morphine likely
represents a significant and clinically relevant outcome.

Moving forward, as we extend mouse opioid fingerprinting to the whole mouse brain, we
anticipate the potential for new findings that could be translated from mouse models to
humans @Pagani2023, owing to the functional similarities between @bold and @fusi. Such
cross-species insights hold promise for advancing our understanding of opioid-related
effects and their implications for human neuroscience and clinical applications.

===== Opioid-Induced @cbv Changes

Our results also demonstrate @mor\-induced local @cbv changes in several regions
following opioid injection. This effect exhibits a bi-phasic pattern, characterized by
an initial hyperperfusion followed by hypoperfusion, with kinetics showing significant
dependence on the type and dose of the agonist. Previous pharmaco-@fmri studies have
reported changes in the @bold signal following acute injections of oxycodone in awake
restrained mice @Moore2016 and in awake rats @Iriah2019 as well as buprenorphine in
awake rats @Becerra2013. The activation and deactivation patterns reported in these
studies exhibit considerable variability, with a focus on the hyperacute effects of the
compounds occurring within a few minutes after injection. Given the dose-dependence and
bi-phasic nature of the response reported in our present study, we emphasize the
importance of having not only precise time resolution but also a prolonged longitudinal
follow-up of hemodynamic changes. Indeed, a clinical study that longitudinally tracked
@bold intensity changes following injection of a fentanyl analog revealed
region-specific local activations with rapid kinetics lasting only a few minutes
@Leppa2006, which aligns with our own results. However, our technical advancement,
employing @fusi and awake preparation, allowed us to demonstrate that the fast hyperemic
event following the opioid challenge matches the dynamics of two behavioral read-outs,
hypermobility and respiratory depression, but not with the clinically critical read-out
of analgesia, which spans longer time scales. This difference in dynamics and the
relatively late changes in functional @mor effects are particularly intriguing in the
light of the functional selectivity hypothesis @Urban2007. Overall, these results
suggest that opioids can selectively activate specific effector cell populations and/or
signaling pathways through the @mor, leading to distinct downstream effects, which
allows to clearly distinguish analgesia and respiratory depression through their
differential correlation with @cbv and @fc changes. Future research utilizing @fusi in
mouse strains with targeted inactivation of individual components of the @mor signaling
pathway will enable functional dissection of these effects, providing deeper insights
into the mechanisms underlying opioid-induced alterations in brain hemodynamics and
behavior and a putative future path to develop efficient analgesics with reduced
secondary effects.

==== Conclusion

In conclusion, we present a multimodal experimental approach that allows the
quantitative tracking of drug-induced functional "fingerprints" of brain activation and
@fc:long, in correlation with behavior, in the awake and behaving mouse. Our findings
highlight the dysconnectivity between cortical and subcortical regions, temporally
correlated with @mor activation and the development of analgesia, as the prominent
feature of the @mor\-specific fingerprint.

Our approach has the potential to contribute to bridging the explanatory gap between
cellular/microscale neuronal mechanisms and large-scale neural dynamics that underlie
behavior. By understanding the correlations between molecular mechanisms, behavior and
functional signatures controlling opioid-related primary and secondary effects, we can
gain valuable insights into alternative treatments for pain management, tolerance,
addiction/dependence, withdrawal and respiratory depression. In the future, this
approach holds promise---while not directly adaptable to high through-put screening---in
facilitating better prediction of the effects and therapeutic windows of newly developed
drugs, while aiding in the selection of appropriate application areas based on the
balance between analgesia and acceptable secondary effects. Ultimately, our research may
contribute to the advancement of opioid-related therapeutic strategies to improve
patient outcomes.

===== Acknowledgments

We thank Monique Brendel, Madlen Hüttl, Barbara Herböck, Hippolyte de Valmont and Adam
Cellier for excellent technical assistance. We acknowledge the ElfUS platform of @ipnp
directed by Luis Villanueva and Laurence Bourgeais Rambur during this project as well as
the work of the animal facility staff of @ipnp under the supervision of Tifanny Leclerc
for the care of the animals. We thank Gyorgy Buzsaki for discussion of the dynamical
@fusi data and Diana Zala for discussion of the manuscript. We thank Bruno Osmanski and
Luc Eglin from Iconeus for support and discussion on analysis.

===== Funding

- Else Kröner Fresenius Stiftung (2019_A68) to A.K.
- Interdisciplinary Center for Clinical Research Jena (AMSP 03) to A.K.
- EMBO Short-Term Fellowship (n° 8439) to A.K.
- PhD scholarship from Boehringer Ingelheim to J.C.M.
- DAAD short-term research grant (57507442) to J.C.M.
- Inserm Biomedical Ultrasound ART project to Z.L.

===== Author contributions

A.K., J.C.M. and L.B. contributed to the surgery, habituation and @fusi. A.K.
performed and analyzed all in vivo behavioral pharmacology studies. J.C.M. and S.L.D.
created and implemented a custom @fc:long analysis pipeline. J.C.M. and
S.L.D. analyzed all imaged data. R.S. contributed to implementation of the study and
discussed the results. S.S. provided the animals and contributed to the scientific
discussion. M.T. and T.D developed and provided the imaging setup and acquisition
software, provided technical and scientific assistance on acquisition and analysis and
contributed to the discussion. The manuscript was written and revised by Z.L., A.K.,
J.C.M., and S.L.D., with editing and suggestions from the other authors.

===== Competing interests

T.D., M. T and Z. L. are founders and stakeholders of Iconeus. S.L.D. is an employee of
Iconeus. S.S. is the founder and scientific advisor of 7TM Antibodies GmbH, Jena,
Germany. All other authors declare no competing interests.

===== Authors Information

Readers are welcome to comment on the online version of the paper. Correspondence should
be addressed to A.K. (#link("andrea.kliewer@med.uni-jena.de") and Z.L.
(#link("zsolt.lenkei@inserm.fr")).

===== Data and Code Availability

The pre-processed power Doppler data that support the findings of this study are
available in Zenodo with the identifier #link("10.5281/zenodo.10286698").

The source codes used for the generation of our figures and statistical analysis are
available in Zenodo with the identifier #link("10.5281/zenodo.10401165").

===== Supplementary Information

#figure(
  table(
    columns: (4fr, 1fr, 2fr, 3fr),
    inset: 10pt,
    align: horizon,
    table.header([*Experiment/Treatment*], [*Aim*], [*Selection*], [*Reason*]),
    [Saline reference], [50], [47], [mis-registration],
    [Saline control], [10], [10], [],
    [Morphine #qty(10, "mg/kg")], [10], [9], [misregistration],
    [Morphine #qty(20, "mg/kg")], [10], [10], [],
    [Morphine #qty(30, "mg/kg")], [10], [8], [misregistration],
    [Morphine #qty(70, "mg/kg")], [10], [10], [],
    [Naloxone #qty(2, "mg/kg") and morphine 70mg/kg], [10], [8], [aberrant baseline],
    [Fentanyl #qty(0.1, "mg/kg")], [10], [10], [],
    [Fentanyl #qty(0.2, "mg/kg")], [10], [9], [misregistration],
    [Fentanyl #qty(0.25, "mg/kg")], [10], [10], [],
    [Fentanyl #qty(0.3, "mg/kg")], [10], [10], [],
    [Buprenorphine #qty(3, "mg/kg")], [10], [9], [misregistration],
    [Methadone #qty(10, "mg/kg")], [10], [10], [],
    [Morphine chronic #qty(70, "mg/kg")], [40], [40], [],
    [Fentanyl chronic #qty(0.3, "mg/kg")], [40], [40], [],
    [Saline BALB/cJ], [12], [12], [],
    [Morphine #qty(70, "mg/kg") BALB/cJ], [12], [12], [],
    [Saline @mor#super[-/-]], [11], [10], [death],
    [Morphine #qty(70, "mg/kg") @mor#super[-/-]], [11], [10], [death],
  ),
  kind: "supplementary",
  supplement: "Supplementary Table",
  caption: figure-caption([Data section for @fusi:short experiments.], []),
) <suptab:opioids1>

#figure(
  image("figures/opioids/1_SPFigure_20250721.png"),
  kind: "supplementary",
  supplement: "Supplementary Figure",
  caption: figure-caption(
    [Probe positioning and slice registration.],
    [(*A*) Illustration of the imaged field of view in the implanted mouse (red line
      represents the coronal plane in the @ccf). (*B*) The plane of interest can be
      identified with a #qty(100, "um") uncertainty by identifying the branching point
      between internal carotid and anterior choroidal artery. (*C*) Template generation
      process (details in supplementary methods), one average slice is computed per
      session, a reference image is selected as initialisation of the template (T0), each
      slice is duplicated and symmetrised (left-left, right-right), template is
      iteratively approximated, first with affine transform (T1), then with nonlinear
      transform (T2).
    ],
  ),
) <supfig:opioids1>

#figure(
  image("figures/opioids/2_SPFigure_20250721.png"),
  kind: "supplementary",
  supplement: "Supplementary Figure",
  caption: figure-caption(
    [Automatic parcellation.],
    [
      (*A*) Illustration of the different steps for automatic parcellation evaluation.
      1. A voxel-wise matrix is computed representing per row the SBM of each voxel.
      2. The matrix is clustered row wise.
      3. Clusters in contact with shadow areas (artefactual zones) are discarded.
      4. Clusters are symmetrized.
      5. @roi:pl are deflated to reduce the influence of potential misregistration.
      (*B*) From top to bottom: global connectivity map, Laplacian of the global
      connectivity map, overlay of the parcellation with the border of functional
      territories.
    ],
  ),
) <supfig:opioids2>

#figure(
  image("figures/opioids/3_SPFigure_20241118.png"),
  kind: "supplementary",
  supplement: "Supplementary Figure",
  caption: figure-caption(
    [Quantitative measure of morphine induced dysconnectivity in key @roi pairs.],
    [Dose- and time- dependent @fc changes following morphine treatment. (*a*)
      Distribution and median of the Pearson’s correlation coefficients between key @roi
      pairs of our network before (BP2: #qtyrange(-10, 0, "min") and after (SP5:
      #qtyrange(40, 50, "min"))) injection of saline or different doses (10, 20, 30,
      #qty(70, "mg/kg")) of morphine. (*b*) Temporal dynamics of @fc in key @roi pairs of
      our network before and after injections of respectively #qty(10, "mg/kg") and
      #qty(70, "mg/kg") of morphine. Statistics are computed after Fisher transform
      (Mann-Whitney $U$ test, corrected for multiple comparison with Bonferroni) and
      display is transformed back to correlation coefficients for better readability.],
  ),
) <supfig:opioids3>

#figure(
  image("figures/opioids/4_SPFigure_20241118.png"),
  kind: "supplementary",
  supplement: "Supplementary Figure",
  caption: figure-caption(
    [Example of lag analysis.],
    [(*a*) Illustration of lagged correlation time series generation, Top:
      cross-correlation correlation maps (blue-red, $[-1, 1]$). Middle: each map is
      normalized to extract the $z$-score ($[-5, 5]$. Bottom: the lagged correlation is
      computed as the average value of the lagged $z$-scored seed-based map from a source
      seed (ventral thalamus in this case) to a target seed (orange: VThal, purple:
      Hip-CA3). The higher frequency ($approx qty("20", "s")$ period) oscillation induced
      by the morphine in the correlation pattern can be seen both for bilateral
      connectivity, but also inter regional one. (*b*), Frame-wise transformation of
      $r$-scores to $z$-scores corrects for temporal decoherence.],
  ),
) <supfig:opioids4>

#figure(
  image("figures/opioids/5_SPFigure_20250721.png"),
  kind: "supplementary",
  supplement: "Supplementary Figure",
  caption: figure-caption(
    [Fentanyl Dose response.],
    [(*a-c*), Pharmacodynamics and dose-dependence of
      the fentanyl @fc pattern in wildtype (C57BL/6J) (*a-b*) @mor knockout mice
      (@mor#super[-/-]) (n = 9 – 10) (*c-d*). Statistical significance of the fentanyl
      @fc pattern by comparing drug phase to saline injection. Correlation matrix in blue-red
      ($[−1, 1]$); significance matrix in green-violet ($[−0.5, 0.5]$); significance correlation
      graph in green-violet (edges $[−0.5, 0.5]$; nodes $[−0.2, 0.2]$). As compared to morphine
      (@fig:opioids2), the fentanyl @fc fingerprint shows accelerated dynamics and effect size,
      matching the pharmacodynamics of fentanyl-induced analgesia (@supfig:opioids6).],
  ),
) <supfig:opioids5>

#figure(
  image("figures/opioids/6_SPFigure_20250721.png"),
  kind: "supplementary",
  supplement: "Supplementary Figure",
  caption: figure-caption(
    [Pharmacokinetics of Buprenorphine and Methadone.],
    [(*a-b*) Pharmacodynamics and dose-dependence of the buprenorphine and methadone @fc
      pattern in wildtype (C57BL/6J) ($n = numrange("9", "10")$). Statistical significance of
      the drug @fc pattern by comparing drug phase to saline injection. Correlation matrix
      in blue-red ($[−1, 1]$); significance matrix in green-violet ($[−0.5, 0.5]$);
      significance correlation graph in green-violet (edges $[−0.5, 0.5]$; nodes $[−0.2,
        0.2]$). As compared to morphine (@fig:opioids2), this @fc fingerprint shows altered
      dynamics and effect size, matching the pharmacodynamics of buprenorphine- and
      methadone-induced analgesia (@supfig:opioids6).],
  ),
) <supfig:opioids6>

#figure(
  image("figures/opioids/7_SPFigure_20250725.png"),
  kind: "supplementary",
  supplement: "Supplementary Figure",
  caption: figure-caption(
    [@mor:short effects on analgesia and phosphorylation.],
    [(*A*-*B*) Acute antinociceptive response measured in the mouse hot-plate test after
      methadone, buprenorphine or morphine (#qty(30, "min")) using a cumulative dosing
      regimen ($n = numrange("6", "12")$). (*C*) Representative corticothalamic (Ctx-L,
      VThal-L) @fc edge strength as a function of analgesia of the different compounds at
      SP5. (*D*) Analgesic time course of acutely administered morphine, fentanyl,
      methadone or buprenorphine measured in the mouse hot-plate test was repeated after
      drug administration, respectively, for the indicated times
      ($n = numrange("6", "17")$). (*A*, *B*, *D*) Nociceptive latencies were defined
      by paw withdrawal and are reported as percent maximum possible effect (% MPE) with
      a #qty(30, "s") cut-off. Data are the means #sym.plus.minus s.e.m. (*E*, *F*)
      Schematic representation of the N-terminally tagged HA-@mor and the C-terminal tail
      with potential phosphorylation sites (black: antibody detectable phosphorylation
      sites; light grey: possible phosphorylation sites). (*E*) HA-@mor knock-in mice
      were acute treated with different doses of morphine, fentanyl or methadone. (*F*)
      Chronic treatment of HA-@mor knock-in mice was performed using osmotic pumps
      delivering morphine (#qty(17, "mg/kg/d")) or fentanyl (#qty(2, "mg/kg/d")) over
      the course of one week. Subsequently, the mice were challenged with high doses of
      morphine or fentanyl. Western blots of brain lysates from different treatment time
      points were immunoblotted with rabbit polyclonal phosphosite-specific @mor
      antibodies against pT370-@mor (7TM0319B), pS375-@mor (7TM0319C), pT376-@mor
      (7TM0319D), and pT379-@mor (7TM0319E). Blots were stripped and reprobed with rabbit
      monoclonal anti-HA antibody and/or anti-@mor antibody {UMB-3} to control for equal
      loading. Positions of molecular mass markers are indicated on the left (in kDa).
      Blots are representative of one to two independent experiments.],
  ),
) <supfig:opioids7>

#figure(
  image("figures/opioids/8_SFigure_20250725.png"),
  kind: "supplementary",
  supplement: "Supplementary Figure",
  caption: figure-caption(
    [],
    [(*A*) Regional @rcbv rasterplot, individual rows show the time series of a single
      @roi (standardized perfusion time series saturated at [-50, 50]). (*B*) Illustration
      of dynamical profile for (from left to right) Analgesia, @fc index, respiratory
      depression and @rcbv. Distributions at the population level are displayed for BP1,
      SP1, SP2, SP3. This dynamical profile early before and after opioid challenge
      illustrates the difference of timescale of our 2 clusters.
    ],
  ),
) <supfig:opioids8>

#figure(
  image("figures/opioids/9_SPFigure_20250723.png"),
  kind: "supplementary",
  supplement: "Supplementary Figure",
  caption: figure-caption(
    [Illustration of the functional connectivity index.],
    [(*A*) The average @fc matrices across all 8 phases of the morphine
      #qty(70, "mg/kg") injection are computed. (*B*) Using @pca, two main axes of
      variance are identified: the first component represents an average connectome with
      the main features of basal state (strong meta region bilateral connectivity, mild
      anticorrelation between cortex and subcortical regions), the second mode shows
      morphine fingerprint specific features (increased connectivity between subcortical
      regions, loss of correlation between the cortex and hippocampus). (*C*) The second
      mode gives a better representation of the opioid effect on @fc (dose and time
      dependence) as its correlation with @fc matrices at various phases presents less
      specificity (closer to basal connectome). (*D*) Then the @fc index is computed with
      either first or second components of the @pca after saline injection (blue), or
      different doses of morphine (red scale) or fentanyl high dose (purple). The second
      component based @fc index gives qualitatively a similar trajectory of @fc but with a
      significantly increased dynamic range.
    ],
  ),
) <supfig:opioids9>

#figure(
  image("figures/opioids/10_SPFigure_new_20241118.png"),
  kind: "supplementary",
  supplement: "Supplementary Figure",
  caption: figure-caption(
    [@Fc index stability],
    [@Fc index trained for different doses of morphine. (*A*) Spatial vector of the
      second component of the uncentred @svd which defines the @fc index. With the
      exception of the #qty(10, "mg/kg") dose, main features of the "canonical
      fingerprint" topography are preserved. (*B*) Scree plot of variance explained by the
      different components. (*C*) Temporal dynamics of the @fc index for the different
      morphine doses follows the expected time- and dose-dependence with a slight
      overfitting towards the dataset used for training.],
  ),
) <supfig:opioids10>

#figure(
  image("figures/opioids/11_SPFigure_20241118.png"),
  kind: "supplementary",
  supplement: "Supplementary Figure",
  caption: figure-caption(
    [Impact of animal mobility on @fc:short and @cbv:short.],
    [(*Top*) Overlay of @fc changes (violet) and averaged mobility (green) on top of
      regional @cbv change in blue-red ($[−50, 50]$) after injection of saline and morphine
      injection in wildtype (C57BL/6J) mice ($n = 10$) or BALB/cJ mice ($n = 12$),
      respectively. (*Bottom*) Average and significance connectivity matrices following
      injection of morphine (#qty(30, "mg/kg")) in BALBc mice showing the presence of the
      opioid fingerprint despite the absence of hyper locomotion.],
  ),
) <supfig:opioids11>

#figure(
  image("figures/opioids/12_SPFigure_20241118.png"),
  kind: "supplementary",
  supplement: "Supplementary Figure",
  caption: figure-caption(
    [Mouse tracking during acquisitions.],
    [(*a*) The head-fixed animal (top) is tracked inside the Mobile
      HomeCage#sym.trademark.registered by directly measuring cage deplacement speed
      (middle) and translated cage position (bottom) with high precision. (*b*) We
      identified two regimes (separated by the red dotted line) of movement depending on
      the estimated instant speed of the animal, corresponding to resting and movement
      periods. For the selection of genuine resting periods, we used a conservative
      criterion (black dotted line) in the linear domain to ensure robustness. (*c*) We
      added supplementary robustness to the motion detection by re-estimating the instant
      speed on resampled position (purple) instead of directly using the resampled instant
      speed (green).],
  ),
) <supfig:opioids12>

=== Conclusion

The Opioids project successfully demonstrates the potential of @fusi to study the
neuropharmacology of opioids in mice, establishing a foundation for @fc\-based drug
screening approaches. The dose-dependence and strong correlation between @fc changes and
physiological readouts such as @mor phosphorylation and analgesia provide reassuring
indications that the observed @fc alterations have a genuine neuronal basis.

An important consideration arising from this work concerns the use of the term
"fingerprint" in neuroscience literature. While this terminology has become increasingly
common, its application has evolved considerably from its original context. The term was
initially used to describe a debated lie detection technique based on @eeg recordings,
but has recently emerged in the @fc field to describe techniques that aim to identify
individuals based on their connectivity patterns
@FinnFunctionalConnectomeFingerprinting2015 @VanDeVille2021 @Cai2021. However, the
contemporary use of "fingerprinting" in neuroscience is not always well-defined and
often differs from its original meaning in biometrics, where it refers to the process of
uniquely identifying individuals based on physiological or behavioral traits such as
fingerprints, iris patterns, or facial features @Fraschini2025. Similar applications
exist in genetics, chemistry, and proteomics, where fingerprinting consistently refers
to unique identification of individuals or samples.

In neuroscience, however, the term "fingerprint" has been applied more broadly to refer
to "patterns" or "signatures" of activity related to specific conditions or pathologies
that are not necessarily used for unique identification of individuals
@daSilvaCastanheira2024 @Stampacchia2024 @Fraschini2025. Despite this conceptual
ambiguity, the term remains a useful metaphor in the context of @fc analysis. Just as a
human fingerprint can be used to identify individuals based on a physiological trait, a
@fc fingerprint could potentially be used to identify a given phenotype or condition
based on its associated brain activity pattern. However, like a human fingerprint, the
@fc fingerprint provides no mechanistic insight into the underlying processes that lead
to the observed pattern.

In the context of the Opioids project, we use the term "fingerprint" to refer to a
specific @fc pattern that we observed in response to treatment with opioids. It is
important to note that we did not prove that this pattern is unique to opioids, nor that
it can be used to uniquely identify individual opioid drugs or doses. While the
dose-dependence and sensitivity to chemical and genetic controls of the observed @fc
alterations are promising indicators of pharmacological specificity, they do not
definitively prove that these patterns are unique to opioids. Indeed, it remains
possible that other drugs or conditions could lead to similar @fc alterations.

This limitation in specificity motivated our decision to extend the protocols of the
Opioids project to different drug classes to validate the specificity of the observed
@fc alterations. The following sections describe the methodological advances we made to
perform these experiments, as well as the results we obtained with cannabinoids and
psilocybin, which together provide a more comprehensive understanding of drug-specific
@fc signatures.

== Methodological Advances for Pharmaco-@fusi:short <sec:phfusi-methods>

=== Functional Ultrasound Imaging

For both the Cannabinoids and Psilocybin projects, we used the same @fusi setup as
described in @sec:opioids-fusi-methods. The @fusi sequence differed only by the absence
of the #qty(100, "ms") delay between two consecutive blocks of @iq frames. This delay
was originally introduced as a precaution to avoid memory saturation and temperature
increase, but was found to be unnecessary in the end.

=== Source Data Storage and Handling

The management of large @fusi datasets required careful consideration of storage
strategies and data handling protocols. Our source datasets were organized using a
custom data structure developed at @ipnp, prior to the development of @fusi\-@bids
(@sec:fusi-bids). The source datasets consisted primarily of #gls("iq", first: true) acquisitions
stored in the proprietary BIQ format, developed specifically for prototype @fusi scanners
at Physics for Medicine.

For long-term archival storage, we implemented a magnetic tape-based solution using @lto
cartridges, which provide a reliable and cost-effective approach for storing large
datasets over extended periods. This storage strategy was essential given the
substantial size of our datasets---representing more than #qty(200, "TB") in total.

A significant challenge arose from the BIQ format's use of column-major data ordering,
which, while efficient for mathematics-oriented programming languages like Fortran,
MATLAB, and Julia, proved inefficient for processing in Python and other row-major
languages#footnote[Among others, C and C++ use row-major ordering, otherwise known as
  _C-ordering_. Row-major ordering is also known as _F-ordering_, in reference to
  Fortran.]. Additionally, BIQ files contained substantial amounts of unused data from
inactive probe elements, accounting for approximately 50% of the total file size across
our three @phfusi datasets.

To address these limitations, we developed a conversion pipeline that transformed BIQ
files into a more efficient row-major format while discarding empty columns. This
conversion used the proprietary RAW format from Iconeus to maintain compatibility with
existing software infrastructure. Although the initial conversion process was
time-intensive, it provided substantial long-term benefits for data processing and
exploratory analyses.

Performance benchmarking revealed that processing RAW files was approximately 66% faster
than processing equivalent BIQ files, with processing of RAW files containing only
active columns achieving 4.5-fold speed improvements over original BIQ files. This
dramatic improvement likely resulted from leveraging the operating system's readahead
prefetching mechanisms when accessing contiguous data on disk. Given that power Doppler
and axial velocity computation for all three @phfusi datasets required more than a week
of continuous processing time using the RAW-formatted data, these efficiency gains were
substantial.

During the conversion process, we also restructured the data according to the
@fusi\-@bids specification (@sec:fusi-bids), enabling easier data handling through
packages like PyBIDS @pybids. This reorganization, combined with the format
optimization, significantly streamlined subsequent analysis workflows while maintaining
compatibility with existing processing pipelines.

=== Visual Quality Control

Transcranial @fusi in mice faces inherent challenges due to strong ultrasound signal
attenuation by the skull, resulting in signal loss in deeper brain regions, lateral
areas, and regions beneath skull sutures. When this attenuation severely compromises
image quality---such as when parts of the vascular tree become heavily obscured compared
to other acquisitions---the acquisition must be excluded from analysis.

We implemented a visual quality control protocol based on systematic inspection of
average power Doppler images. Additionally, we examined #gls("cv", first: true) images, as detailed in
@ch:denoising, to identify acquisitions with abnormally high motion artifacts across the
entire brain. Such acquisitions, characterized by elevated @cv values throughout the
imaging field, were discarded as they indicate the presence of systematic motion
artifacts that would compromise @fc analyses.

Quality control assessment was performed prior to any processing steps to ensure that
compromised acquisitions did not bias subsequent group-level analyses or affect the
iterative registration process (described in @sec:template-generation). This
preprocessing approach was also important for reducing group-level variability in @fc
measurements.

To facilitate quality control assessment, we developed a custom web application using
#link("https://streamlit.io/")[Streamlit] that enables rapid navigation through datasets
and simultaneous visualization of both power Doppler and @cv images (@fig:visual-qc).
Quality control results were systematically documented and stored in a derivatives
folder within the @fusi\-@bids structure, ensuring seamless integration with downstream
preprocessing and analysis pipelines.

#figure(
  placement: auto,
  image("figures/methods/visual-qc.png"),
  caption: figure-caption(
    [Visual @qc:long of power Doppler acquisitions.],
    [Visual @qc was performed using a custom web application that allows for easy
      navigation through a @fusi\-@bids dataset and visualization of both power Doppler
      and @cv images. Here, an example acquisition is shown with large differences in
      intensity between the left and right hemispheres. This difference is likely due to
      growth of scar tissue over the right hemisphere's skull, leading to strong
      attenuation of the ultrasound signal. This acquisition was therefore discarded
      from the analysis.],
  ),
) <fig:visual-qc>

=== Template Generation and Registration <sec:template-generation>

Our template generation and registration procedures were simplified compared to the
original methods described in @sec:opioids-power-doppler-template. The initial step
involves generating a custom angiography template for each dataset using two iterations
of affine registration. This angiography template serves as an anatomical reference and
is subsequently registered to a proprietary power Doppler template from Iconeus, which
itself has been registered to the Allen Mouse Brain Atlas @Wang2020. The registration
between our custom template and the reference template is performed using automatic
affine registration followed by manual adjustment in 3D Slicer to ensure optimal
alignment @Fedorov2012.

Custom functional templates are generated using a similar two-iteration affine
registration approach. For the Cannabinoids project, which employed sparse 3D+t
acquisitions, functional templates were generated separately for each probe pose to
account for the sparse sampling paradigm. These functional templates
are then automatically registered to their corresponding angiography template using
affine transforms, with manual refinement performed in 3D Slicer when necessary.

This hierarchical registration approach ultimately produces functional templates that
are properly aligned with the Allen Mouse Brain #gls("ccf", first: true). This alignment enables the
extraction of precise anatomical masks for different brain regions, including brain
tissue, white matter, and @csf voxels, which are essential for subsequent analysis
steps.

The final registration step involves aligning all functional scans to their respective
custom functional templates using affine transforms. This approach ensures
spatial normalization across all acquisitions within each dataset, allowing for
group-level analyses.

=== Clutter Filtering and Power Doppler Computation

Based on findings from the denoising benchmark presented in @ch:denoising, we used the
constant-energy @svd$40$ clutter filter for computing power Doppler acquisitions in both
the Cannabinoids and Psilocybin datasets. This filter configuration provided optimal
performance for @fc analyses while effectively removing tissue motion artifacts.

The clutter filtering process used brain masks obtained during template generation to
ensure that clutter vectors were computed exclusively from brain tissue voxels. This
approach prevents contamination of the clutter subspace by non-brain signals, improving
the specificity of artifact removal.

However, we recognized that the constant-energy @svd$40$ filter performs a form of
global signal regression that alters the power Doppler signals such that they no longer
accurately represent absolute @cbv changes. To address this limitation, we also computed
@svd$60$-filtered power Doppler acquisitions using brain masks specifically for @cbv
analysis. The need for two different clutter filters once again highlights the need for
further research into optimal clutter filtering strategies for @fusi.

=== Estimation of animal motion <sec:pharmacofusi-motion-estimation>

Our approach to motion estimation evolved from the relying on external tracking systems
to a more robust data-driven methodology. In the Opioids project, we used the Neurotar
#gls("mhc", first: true) tracking system to estimate animal velocity during @fusi acquisitions.
However, this system proved difficult to properly synchronize with the Iconeus One @fusi
system and required tedious post-processing to extract meaningful velocity time series
@MarianiPhD[p.~360]. Moreover, tracking recordings were not consistently available or
properly synchronized with @fusi acquisitions in the Cannabinoids and Psilocybin
projects.

To address these limitations, we developed a motion estimation approach based on axial
velocity acquisitions computed directly from the ultrasound data---see
@sec:axial-velocity-estimation for more details. Animal motion was estimated using the
global axial velocity time series---referred to as "brain velocity"---which represents
the average axial velocity across all brain voxels for each time point.

The brain velocity time series was thresholded to identify periods of high velocity
corresponding to animal movement---for example, running, grooming, etc. As described in
@sec:core-denoising-pipeline, we used a threshold set at #qty(10, "um/s") above the
velocity baseline, which was estimated as the tenth percentile of the average axial
velocity time series. This percentile-based baseline estimation was necessary due to
slight variability in baseline velocity across acquisitions, likely resulting from
differences in @snr and electrical noise levels.

Finally, time series of fraction of time spent in motion were computed by smoothing
the binary time series of detected motion periods with a #qty(3, "min") moving average.
The smoothing width was arbitrarily selected to balance the need for temporal resolution
with the desire to avoid large fluctuations across acquisitions due to the sporadic
nature of animal movements.

Validation of this approach demonstrated that brain velocity showed superior correlation
with the global power Doppler signal compared to mouse velocity measurements from the
@mhc tracking system in approximately 93% of cases
(@fig:mouse_vs_brain_velocity_correlation). Additionally, The brain velocity approach
effectively detected movement periods that were missed by @mhc tracking, including
subtle movements during grooming and instances where animals slipped on the smooth @mhc
surface (@fig:mouse_vs_brain_velocity_good_example). While the latter could be mitigated
by using surfaces with more friction, the former is an inherent limitation of the
current setup and cannot be avoided.

#figure(
  placement: auto,
  image("figures/methods/mouse_vs_brain_velocity_correlation.png"),
  caption: figure-caption(
    [Brain axial velocity shows better correlation with global power Doppler signal than
      mouse velocity],
    [The Pearson correlation coefficient between the global power Doppler signal and
      both the mouse and brain velocity was computed for each acquisition of the
      Psilocybin project where reliable @mhc tracking data was available. The slopegraph
      shows paired correlation coefficients for each acquisition, with pairs where the
      brain velocity shows higher correlation than the mouse velocity highlighted in
      orange, and pairs where the mouse velocity shows higher correlation than the brain
      velocity highlighted in blue. The vast majority of acquisitions (93%) show higher
      correlation for the brain velocity, indicating that it is a more reliable measure
      to detect power Doppler surges corresponding to animal movement.
    ],
  ),
) <fig:mouse_vs_brain_velocity_correlation>

#figure(
  placement: auto,
  image("figures/methods/tracking_vs_tissuevel_discrepancy_example.png"),
  caption: figure-caption(
    [Brain velocity detects brain movements that are missed by the mouse velocity],
    [
      This example from the Psilocybin project illustrates the most common case where
      both the mouse and brain velocity time series accurately reflect animal movement.
      The top panel shows the mouse and brain velocity time series, while the bottom
      panel shows the corresponding global power Doppler signal. However, gray shaded
      regions show periods of discrepancy where the brain velocity time series shows
      increases in velocity that correspond to surges of global power Doppler signal,
      while the mouse velocity stays low.
    ],
  ),
) <fig:mouse_vs_brain_velocity_good_example>


However, approximately 7% of acquisitions in the Psilocybin project showed suboptimal
performance with brain velocity estimation, typically corresponding to recordings with
very poor @snr:pl where electrical noise contaminated the beamformed @iq signals
(@fig:mouse_vs_brain_velocity_bad_example). The Kasai autocorrelation estimator used for
velocity computation is particularly susceptible to such noise artifacts @Chan2013,
although low-pass filtering of @iq signals provided some improvement in these cases.

#figure(
  placement: auto,
  image("figures/methods/bad_tissuevel_example.png"),
  caption: figure-caption(
    [Brain velocity estimation is highly susceptible to #gls("snr", first: true)],
    [This example from the Psilocybin project illustrates a case where the brain
      velocity estimation fails to accurately reflect animal movement. The top panel shows
      the mouse and brain velocity time series, while the bottom panel shows the
      corresponding global power Doppler signal. Gray shaded regions show periods of
      discrepancy between the two velocity time series: while the mouse velocity shows
      very distinguishable motion periods that correspond to surges of global power
      Doppler signal, the corresponding brain velocity surges are very weak relative to
      the noise level. This discrepancy is likely due to electrical noise contamination
      of the beamformed @iq signals.
    ],
  ),
) <fig:mouse_vs_brain_velocity_bad_example>

=== Extraction of Cerebral Blood Volume Signals

Cerebral blood volume time series were extracted by averaging static @svd$60$-filtered
power Doppler signals within anatomically defined regions of interest from the Allen
Mouse Brain Atlas. The selected regions included Isocortex, Hippocampus, Thalamus, and
whole brain, chosen to provide coverage of the imaged brain slice. To minimize the
impact of registration errors, @roi masks were eroded by 2 voxels before signal
extraction.

Then, to mitigate motion-induced hyperperfusion, we interpolated motion time periods
(@sec:pharmacofusi-motion-estimation) using linear interpolation.

Finally, the averaged and motion-scrubbed signals were standardized relative to the
minimum value recorded during the pre-injection period to obtain #gls("rcbv", first: true) signals:

$ "rCBV "= ("CBV "- min_("Baseline")("CBV")) / (min_("Baseline")("CBV")) $

where @cbv represents the averaged power Doppler signal within a region of interest, and
$min_("Baseline")("CBV")$ is the minimum value recorded during the baseline period. This
normalization approach provides a measure of @cbv changes relative to the pre-treatment
baseline, facilitating comparison of drug effects across different brain regions and
experimental sessions.

=== Functional Connectivity Denoising

The @fc denoising pipeline was implemented based on the optimal parameters identified in
the denoising benchmark detailed in @ch:denoising. The core pipeline consisted of four
sequential processing steps designed to minimize motion artifacts while preserving
genuine @fc signals.

1. *Spatial smoothing* was applied using a Gaussian kernel with a #qty(0.2, "milli meter")
  #gls("fwhm", first: true) to reduce white noise and reduce biases from misregistration, while
  maintaining sufficient spatial resolution.
2. *Scrubbing* used the @rdvars metric thresholded at 2.0 to identify and remove time
  points affected by large motion artifacts.
3. *High-pass filtering* was implemented using a Butterworth forward-backward filter of
  order 6 with a cutoff frequency of #qty(0.01, "Hz"). This filtering approach
  effectively removed low-frequency drift and scanner-related artifacts while preserving
  the frequency range of interest for @fc analysis.
4. *Confound regression* used five aCompCor regressors computed from white matter and @csf
  voxels.

=== Computation of Functional Regions of Interest

Functional @roi:pl were computed using a data-driven approach similar to the automatic
parcellation method described in @sec:opioids-automatic-parcellation. This approach was
motivated by empirical observations that the correspondence between anatomical regions
and functional responses is not always perfect, potentially due to registration errors
between acquisitions and templates, or genuine physiological differences between
anatomical and functional boundaries.

To ensure that anatomical-functional mismatches did not introduce systematic bias in @fc
analyses, we extracted functional @roi:pl rather than relying solely on anatomically
defined regions from the Allen Mouse Brain Atlas. The extraction process employed
semi-automated clustering of voxels based on their @fc profiles.

Voxel-wise correlation matrices were computed using brain voxels from all baseline power
Doppler acquisitions within each dataset. K-means clustering was then applied to the
average voxel-wise correlation matrix, using 10 clusters for the Cannabinoids project
and 15 clusters for the Psilocybin project---the number of clusters being selected
arbitrarily following visual inspection. From the resulting clusters, we visually
selected 8 clusters that demonstrated good correspondence with known anatomical regions
and maintained adequate @snr across all acquisitions.

The selection criteria excluded clusters that appeared artifactual, were located beneath
the sagittal suture, or were positioned too laterally where @snr was low. The retained
clusters were bilaterally distributed across medial cortex, hippocampus, dorsal
thalamus, and ventral thalamus, with remarkably similar patterns identified
independently in both the Cannabinoids and Psilocybin datasets (@fig:voxel-clusters).

To mitigate the effects of residual misregistration across acquisitions, functional
@roi:pl were defined as spheres with #qty(0.3, "milli meter") radius centered on each
voxel cluster. This approach provides robust @fc measurements while accounting for small
variations in registration accuracy across different experimental sessions. The final
list of functional @roi:pl is displayed in @fig:voxel-clusters, with acronyms provided
in @tab:roi-acronyms.

#figure(
  placement: auto,
  image("figures/methods/voxel_clusters.png"),
  caption: figure-caption(
    [Voxel clusters and functional @roi:pl computed from voxel-wise correlation matrices.],
    [(*Top*) Voxel clusters computed from voxel-wise correlation matrices using K-means
      clustering. Retained clusters are in #text(green)[green] and discarded clusters
      are in #text(red)[red]. (*Bottom*) Functional @roi:pl computed as spheres with
      #qty(0.3, "milli meter") radius centered in each voxel cluster. The clusters are
      bilaterally distributed in the lateral and medial cortex, hippocampus, dorsal
      thalamus, and ventral thalamus. Very similar clusters were found independently in
      both the Cannabinoids and Psilocybin datasets. @Roi acronyms are provided in
      @tab:roi-acronyms.],
  ),
) <fig:voxel-clusters>

#figure(
  placement: auto,
  booktabs-table(
    columns: 4,
    header: (
      [Index],
      [@roi name],
      [Hemisphere],
      [@roi acronym],
    ),

    [1],
    [Lateral part of the cortex],
    [left],
    [CtxLat-L],

    [2],
    [Medial part of the cortex],
    [left],
    [CtxMed-L],

    [3],
    [Medial part of the cortex],
    [right],
    [CtxMed-R],

    [4],
    [Lateral part of the cortex],
    [right],
    [CtxLat-R],

    [5],
    [Hippocampus],
    [left],
    [HIP-L],

    [6],
    [Hippocampus],
    [right],
    [HIP-R],

    [7],
    [Dorsal part of the thalamus],
    [left],
    [THDors-L],

    [8],
    [Dorsal part of the thalamus],
    [right],
    [THDors-R],

    [9],
    [Ventral part of the thalamus],
    [left],
    [THVent-L],

    [10],
    [Ventral part of the thalamus],
    [right],
    [THVent-R],
  ),
  kind: table,
  caption: figure-caption(
    [List of @roi:short acronyms.],
    [Note that the _medial_ and _lateral_ qualifiers refer to the anatomical location of
      the @roi:short relative to the @fov, not to the whole brain.],
  ),
) <tab:roi-acronyms>

=== Software Implementation

The Opioids project was originally analyzed using the PlatyfUS web-application and
original PyfUS package. For reproducibility and publication purposes, the entire
analysis was re-implemented in Python using to Nilearn @Nilearn (@sec:opioids-methods).
Meanwhile, the Cannabinoids and Psilocybin projects were analyzed using a dedicated
Python package, `pharmacofusi`, developed specifically for general analysis of @phfusi
datasets. `pharmacofusi` builds upon the PyfUS package (@sec:pyfus) and provides
additional functionality for handling, registration, visualization, and statistical
analysis of @phfusi data. All figures in this chapter were generated using
`pharmacofusi`.

== Cannabinoids: Preliminary Results

=== Introduction

The therapeutic landscape for cannabinoid-based medicines has expanded dramatically over
the past decade, driven by growing recognition of the endocannabinoid system's role in
modulating pain, inflammation, mood, and neuroplasticity @Cristino2020. Cannabis-derived
compounds, particularly #gls("thc", first: true) and #gls("cbd", first: true), have demonstrated some clinical
efficacy in treating symptoms of conditions ranging from epilepsy and multiple sclerosis
to Tourette syndrome, Parkinson's disease, and Alzheimer's disease @Cristino2020.
However, the main neuropsychiatric symptoms associated with these conditions remain
largely unaddressed. Indeed, the complex pharmacology of cannabinoids, involving
interactions with @cb1 and @cb2 receptors, as well as numerous other molecular targets,
has made it challenging to predict and optimize their therapeutic effects @Cristino2020.

Human functional neuroimaging studies have provided insights into the effects of @thc
and @cbd, revealing opposing patterns of brain activation and @fc changes
@Gunasekera2021 @Batalla2021. Some studies report that @thc increases activation in
limbic, striatal, and frontal regions rich in @cb1 receptors---including the amygdala,
anterior cingulate cortex, hippocampus, and striatum---often correlating with anxiety,
impaired memory, and psychotomimetic effects @Gunasekera2021 @Batalla2021. Conversely,
@cbd tends to attenuate activation in these same regions, potentially counteracting
@thc's effects---although some studies report inverse effects, with @cbd increasing
fronto-striatal connectivity @Gunasekera2021 @Grimm2018.

@Pet studies using @cb1 receptor-selective radioligands have further characterized
cannabinoid receptor availability and binding dynamics across various populations,
including individuals with cannabis use disorders and psychiatric conditions @Dsouza2012
@Cupo2021. These investigations have revealed altered receptor availability associated
with chronic cannabis exposure and provided molecular-level insights into the
neurobiological substrates of cannabinoid effects.

Despite these advances in human neuroimaging, significant gaps remain in our mechanistic
understanding of cannabinoid effects on brain network organization @Gunasekera2021.
Notably, a majority of preclinical investigations of @fc alterations induced by
cannabinoids have relied on anesthetized preprations @Alkislar2021 @Li2024 @Sadaka2023
@AbbasFarishta2015 @Shah2004, which may fundamentally alter cannabinoid receptor
signaling and network-level responses @Chin2008 @Sadaka2021.

The endocannabinoid system represents one of the most widespread neuromodulatory
networks in the brain, with @cb1 receptors densely distributed throughout cortical and
subcortical regions involved in sensory processing, motor control, and emotional
regulation. This anatomical distribution suggests that cannabinoids may produce
widespread alterations in brain network organization, yet few studies have
systematically characterized these effects using high-resolution @fc approaches in awake
animals that preserve the intact neurovascular coupling essential for accurate @fc
@Chin2008 @Sadaka2021.

The Cannabinoids project was designed to address these limitations by employing awake
@fusi to characterize the acute effects of @thc and @cbd on brain @fc patterns. By
comparing the effects of these two major cannabinoid compounds in the same experimental
paradigm, we aimed to dissociate the signatures associated with psychoactive versus
non-psychoactive cannabinoid effects. This work builds upon the methodological framework
established in the Opioids project while extending our understanding of how @fusi can be
used to study the neuropharmacology of cannabinoids in vivo.

In the following sections, we present the preliminary results of the Cannabinoids
project, which include the characterization of #gls("cbv", first: true) changes in response to
@thc, @cbd, and the synthetic cannabinoid @cp, as well as the corresponding
motion time series and #gls("fc", first: true) alterations.

=== Methods <sec:cannabinoids-methods>

The Cannabinoids project was conducted following the same methodological framework as
the Opioids project (@sec:opioids-methods), with improvements described in
@sec:phfusi-methods.

==== Experimental Protocol

@fusi acquisitions were performed on a total of 38 mice, with 26 mice retained for
analysis after quality control (@tab:cannabinoids-dataset).

#figure(
  placement: auto,
  booktabs-table(
    columns: 5,
    header: (
      [Treatment],
      [$N_"mice"$],
      [$N_"mice post-QC"$],
      [Duration (min)],
      [Sampling frequency (Hz)],
    ),

    [Vehicle],
    [10],
    [5],
    [80],
    [2.5],

    [@thc #qty(1, "mg/kg")],
    [10],
    [7],
    [80],
    [2.5],

    [@thc #qty(3, "mg/kg")],
    [10],
    [7],
    [80],
    [2.5],

    [@thc #qty(10, "mg/kg")],
    [10],
    [6],
    [80],
    [2.5],

    [@cp #qty(0.1, "mg/kg")],
    [10],
    [8],
    [80],
    [2.0],

    [CBD #qty(2, "mg/kg")],
    [10],
    [5],
    [80],
    [2.5],

    [CBD #qty(6, "mg/kg")],
    [10],
    [5],
    [80],
    [2.5],

    [CBD #qty(20, "mg/kg")],
    [10],
    [5],
    [80],
    [2.5],

    [@am #qty(3, "mg/kg")],
    [10],
    [2],
    [50],
    [2.5],

    [@am #qty(3, "mg/kg") + @thc #qty(10, "mg/kg")],
    [10],
    [7],
    [80],
    [2.5],

    table.hline(stroke: 0.05em),

    [Total (independent)],
    [38],
    [26],
    [],
  ),
  kind: table,
  caption: figure-caption(
    [Characteristics of the Cannabinoids dataset.],
    [Characteristics include the number of mice before and after #gls("qc", first: true), the duration
      of each session, and the corresponding sampling frequency. Each session consisted of
      a 20-minute baseline acquisition, followed by either one or two 30-minute
      acquisitions.
    ],
  ),
) <tab:cannabinoids-dataset>

Dose-response sessions consisted of a 20-minute baseline acquisition, followed by
injection of a vehicle or cannabinoid compound at different doses, and two consecutive
30-minute acquisitions. Cannabinoid compounds included @thc at doses of
#qty(1, "mg/kg"), #qty(3, "mg/kg"), and #qty(10, "mg/kg"), #ref(<cp>)---a synthetic
cannabinoid that is a full agonist at @cb1 and @cb2, therefore much more potent than
#ref(<thc>)---at #qty(0.1, "mg/kg"), and @cbd at doses of #qty(2, "mg/kg"),
#qty(6, "mg/kg"), and #qty(20, "mg/kg"). The @cp sessions were acquired during the
Opioids project and therefore have a sampling frequency of #qty(2.0, "Hz") instead of
#qty(2.5, "Hz").

Additionally, two chemical-control sessions were performed. The first chemical-control
session consisted of a 20-minute baseline acquisition, followed by injection of @am at
#qty(3, "mg/kg")---an antagonist/inverse agonist of #ref(<cb1>)---and a 30-minute
acquisition. The second chemical-control session followed the same protocol, but
included an additional injection of @thc at #qty(10, "mg/kg") 30 minutes after the @am
injection, followed by another 30-minute acquisition.

For @fc analysis, all sessions were divided into phases of #qty(10, "min") each, with
the baseline periods denoted as BP1 and BP2, and the subsequent periods denoted as SP1
to SP6 (@fig:cannabinoids-experimental-protocol).

#figure(
  placement: auto,
  cetz.canvas(
    length: 1cm,
    {
      import cetz.draw: *

      // Set up styling
      set-style(
        stroke: (thickness: 2pt, paint: black),
        fill: none,
      )

      let scale-factor = 0.49

      // BP 1 segment
      line((0, 0), (3.9 * scale-factor, 0), stroke: (thickness: 2pt, paint: black))
      content((1.95 * scale-factor, 0.3), text(size: 1em, weight: "bold")[BP1])
      content((1.95 * scale-factor, -0.3), text(size: 1em)[10 min])

      // BP 2 segment
      line(
        (4.1 * scale-factor, 0),
        (8.0 * scale-factor, 0),
        stroke: (
          thickness: 2pt,
          paint: black,
        ),
      )
      content((6.05 * scale-factor, 0.3), text(size: 1em, weight: "bold")[BP2])
      content((6.05 * scale-factor, -0.3), text(size: 1em)[10 min])

      // SP segments (6 segments with gray color)
      for i in range(1, 7) {
        let x-start = (4.1 + 4.1 * i) * scale-factor
        let x-end = x-start + 3.9 * scale-factor
        let x-mid = x-start + 1.95 * scale-factor

        line((x-start, 0), (x-end, 0), stroke: (thickness: 2pt, paint: gray))
        content((x-mid, 0.3), text(size: 1em, weight: "bold")[SP#i])
        content((x-mid, -0.3), text(size: 1em)[10 min])
      }

      // First arrow (black) - treatment
      line(
        (8.1 * scale-factor, -1.8 * scale-factor),
        (8.1 * scale-factor, -0.1 * scale-factor),
        stroke: (thickness: 1.5pt, paint: black),
        mark: (end: ">", fill: black),
      )
      content((8.1 * scale-factor, -2.4 * scale-factor), text(size: 1em)[Injection])

      // Second arrow (gray) - treatment with AM251 + THC
      line(
        (20.4 * scale-factor, -1.8 * scale-factor),
        (20.4 * scale-factor, -0.1 * scale-factor),
        stroke: (thickness: 1.5pt, paint: gray),
        mark: (end: ">", fill: gray),
      )
      content(
        (20.4 * scale-factor, -3.1 * scale-factor),
        align(center)[#text(size: 1em)[Injection\ (@am + @thc session only)]],
      )
    },
  ),
  caption: figure-caption(
    [Experimental protocol for the Cannabinoids project.],
    [The experimental protocol consisted of two baseline periods (BP1 and BP2) of
      #qty(10, "min") each, followed by six consecutive periods (SP1 to SP6) of
      #qty(10, "min") each. The first arrow (black) indicates the injection of a
      vehicle, cannabinoid compound, or @am at the end of BP2, while the second arrow
      (gray) indicates the injection of @thc at the end of SP3, only performed in the
      @am + @thc session.
    ],
  ),
) <fig:cannabinoids-experimental-protocol>

=== Results

==== Mouse Mobility

Mouse mobility during baseline periods showed consistent variability across all
sessions, ranging from 40% to 60% of time spent in motion, with similar patterns
observed across different treatment groups (@fig:cannabinoids-mobility). As previously
observed in the Opioids project, the vehicle control session exhibited characteristic
temporal dynamics, with high mobility levels during the baseline period followed by a
progressive decrease to approximately 20% by the end of the session. This reduction in
mobility likely reflects habituation and fatigue effects.

@thc and @cp produced significant and sustained reductions in mouse mobility that
occurred immediately following injection and persisted throughout the 1-hour follow-up
period. The mobility reduction showed dose-dependence on average, with higher @thc doses
producing more pronounced effects. Notably, @cp induced the most significant reduction
in mobility among all tested compounds, consistent with its higher potency as a full
@cb1 and @cb2 receptor agonist. In contrast, @cbd administration at doses up to
#qty(20, "mg/kg") produced no detectable changes in mouse mobility compared to the
vehicle control session, indicating that @cbd's effects on the central nervous system do
not manifest as alterations in spontaneous locomotor activity.

The @cb1 receptor inverse agonist @am did not significantly affect mouse mobility when
administered alone compared to the vehicle control session. When used as a pretreatment
before @thc #qty(10, "mg/kg") administration, @am provided only partial protection
against @thc\-induced mobility reduction. While mouse mobility remained significantly
reduced compared to the vehicle control session, the reduction appeared visually less
pronounced than in the @thc #qty(10, "mg/kg") session, although this difference did not
reach statistical significance.

#figure(
  placement: auto,
  image("figures/cannabinoids/motion.png"),
  caption: figure-caption(
    [Mouse mobility in the Cannabinoids project.],
    [Average time series of fraction of time spent in motion are displayed for each
      treatment group. The time series are averaged across all acquisitions of the
      sessions, with the shaded area representing the 95% confidence interval.],
  ),
) <fig:cannabinoids-mobility>

==== Cerebral Blood Volume

Regional #gls("rcbv", first: true) measurements revealed dose-dependent vascular responses to
cannabinoid administration (@fig:cannabinoids-cbv-dose-response). As expected from the
elevated locomotion during early baseline periods, @rcbv signals were strongly increased
during the first 10 minutes of each acquisition. However, unlike the progressive decline
observed in mouse mobility, @rcbv signals in the vehicle control session showed less
pronounced decreases over the course of the session. Notably, hippocampal @rcbv
increased slightly over the course of the session.

@thc administration at lower doses (#qty(1, "mg/kg") and #qty(3, "mg/kg")) produced a
characteristic vascular response consisting of a vasoconstriction relative to vehicle
across all regions but the hippocampus, the latter showing a sustained increase in @rcbv
relative to baseline levels that persisted throughout the 1-hour post-injection period.
The highest @thc dose (#qty(10, "mg/kg")) lead to an even stronger vasoconstriction
across all regions, although hippocampus @rcbv remained elevated relative to other
regions.

@cp produced the most dramatic vascular response, characterized by a biphasic effect.
First, a strong vasodilation occured 3 minutes post-injection and lasted approximately
20 minutes, with the hippocampus showing the highest amplitude of vasodilation. Then, a
sustained vasoconstriction phase emerged, similar in amplitude to that observed with
@thc #qty(10, "mg/kg") administration. This vasoconstriction persisted for the
remainder of the session, with the hippocampus again showing elevated @rcbv levels
relative to other brain regions.

Meanwhile, @cbd administration produced no significant @rcbv changes compared to the
vehicle control session, even at the highest dose of #qty(20, "mg/kg"), consistent with
its lack of effect on mouse mobility.

#figure(
  placement: auto,
  image("figures/cannabinoids/cbv_dose_response.png", width: 80%),
  caption: figure-caption(
    [@Cbv changes in response to injections of @thc:short, @cp:short, or
      @cbd:short.],
    [Average raster plots of @rcbv time series are displayed for each dose-response
      treatment group. @rcbv is expressed as a percentage relative to the minimum value
      recorded during the 20-minute baseline.
    ],
  ),
) <fig:cannabinoids-cbv-dose-response>

While @am alone produced no significant @rcbv changes compared to vehicle control, @am
pretreatment provided partial protection against @thc\-induced vascular effects
(@fig:cannabinoids-cbv-chemical-control). While vasoconstriction was still observed in
all brain regions following @thc injection, the temporal dynamics were altered, with
vasoconstriction occurring immediately after @thc injection rather than with the
15-minute delay observed in the @thc #qty(10, "mg/kg") session. Hippocampal @rcbv
remained significantly elevated relative to other brain regions and higher than in the
@thc #qty(10, "mg/kg") session, suggesting that @am may partially counteract @thc's
vasoconstrictor effects.

#figure(
  placement: auto,
  image("figures/cannabinoids/cbv_chemical_control.png"),
  caption: figure-caption(
    [@Cbv changes in response to pre-treatment with @am:short.],
    [Average raster plots of @rcbv time series are displayed for each dose-response
      treatment group. @rcbv is expressed as a percentage relative to the minimum value
      recorded during the 20-minute baseline.
    ],
  ),
) <fig:cannabinoids-cbv-chemical-control>

==== Functional Connectivity

Group-level correlation matrices revealed dose-dependent alterations in #gls("fc", first: true)
following @thc and @cp administration
(@fig:cannabinoids-group-level-correlation-matrices). While statistical thresholding was
not performed due to the limited sample size in the vehicle control session, clear
dose-dependent effects were evident, with the most pronounced alterations corresponding
to @cp treatment.

#figure(
  placement: auto,
  image("figures/cannabinoids/group-level_correlation-matrices.png"),
  caption: figure-caption(
    [Group-level @fc:short correlation matrices for all treatments of the Cannabinoids
      project.],
    [An example correlation matrix is displayed at the top left of the figure, showing
      @roi acronyms (@tab:roi-acronyms) on the axes. All correlation matrices display
      three black squares, corresponding from top to bottom to cortical, hippocampal,
      and thalamic @roi:pl. The bottom triangle of each matrix shows the group-level
      average correlation coefficients, while the top triangle shows the corresponding
      difference relative to the vehicle control session. All differences are shown
      without statistical thresholding, as the low number of mice in the vehicle control
      session does not allow for reliable statistical inference. Group-level correlation
      matrices were computed for each treatment and each temporal phase
      (@fig:cannabinoids-experimental-protocol), resulting in a total of
      2 baseline correlation matrices (BP1 and BP2) and 6 post-injection correlation
      matrices (SP1 to SP6)---except for the @am session, which only has three
      post-injection correlation matrices (SP1 to SP3).
    ],
  ),
) <fig:cannabinoids-group-level-correlation-matrices>

@thc and @cp induced a biphasic, dose-dependent pattern of @fc alterations across the
majority of our @roi:pl (@fig:cannabinoids-connectivity-timeseries). Rapid effects were
observed in cortical and thalamic regions, peaking approximately 20 to 30 minutes
post-injection. These alterations were characterized by dose-dependent increases in
connectivity between bilateral hemispheres of the lateral cortex and dorsal thalamus,
accompanied by dose-dependent decreases in connectivity between the lateral cortex and
dorsal thalamus. @cp demonstrated even more rapid effects, with increases in bilateral
medial cortical connectivity peaking around 10 minutes post-injection, while @thc
produced no significant changes in this region.

Concurrent with these rapid cortical-thalamic effects, slower alterations emerged in
hippocampal networks. Connectivity between bilateral hippocampal hemispheres, between
the lateral cortex and hippocampus, and between the hippocampus and dorsal thalamus
showed progressive changes over the session duration. Hippocampal interhemispheric
connectivity demonstrated dose-dependent decreases relative to vehicle control, while
cortico-hippocampal connectivity showed decreases that were not clearly dose-dependent.
Interestingly, @cp did not produce stronger decreases in bilateral hippocampal
connectivity compared to the highest @thc dose, suggesting this effect may not be
entirely mediated by @cb1 or @cb2 activation.

The hippocampal connectivity alterations were emphasized by the progressive increase in
hippocampal @fc observed over the course of vehicle control sessions---a phenomenon that
was already observed in the Opioids project (@fig:opioids2) although not remarked upon
in the original publication. A similar progressive increase was observed between the
lateral cortex and hippocampus in vehicle controls, while @thc and @cp sessions
maintained stable connectivity throughout the session. The alterations in
hippocampo-thalamic connectivity were characterized by increases relative to vehicle
control, further emphasized by the fact that hippocampo-thalamic connectivity became
negative over the session course in vehicle controls while remaining approximately
neutral in @thc and @cp sessions.

@cbd administration produced no significant @fc changes compared to vehicle control,
even at the highest dose of #qty(20, "mg/kg"), consistent with its lack of effects on
mobility and @cbv. Similarly, @am alone produced no significant @fc alterations,
although the very limited sample size (2 mice) complicates interpretation of these
results. However, @am pretreatment appeared to show an antagonist effect, by partially
blocking the rapid cortical and thalamic effects of @thc #qty(10, "mg/kg"). However, the
slower hippocampal effects of @thc were not entirely blocked by @am, as connectivity
between bilateral hippocampal hemispheres and between lateral cortex and hippocampus
remained lower than in vehicle controls. Interestingly, @am pretreatment appeared to
accelerate the onset of hippocampal effects, suggesting complex interactions between
@cb1 antagonism and @thc's actions on hippocampal networks.

#figure(
  placement: auto,
  image("figures/cannabinoids/connectivity_timeseries.png"),
  caption: figure-caption(
    [Group-level @fc:short time series for all treatments of the Cannabinoids project
      and relevant @roi:short pairs.],
    [Time series of @fc changes are displayed for each treatment group and relevant
      @roi pairs selected by visual inspection of the group-level correlation
      matrices (@fig:cannabinoids-group-level-correlation-matrices). Time series show
      the average correlation coefficients between the selected @roi pairs for each
      treatment group and each temporal phase, with shaded areas representing
      95% confidence intervals.
    ],
  ),
) <fig:cannabinoids-connectivity-timeseries>

Together, these results demonstrate that @thc and @cp induce two distinct temporal
patterns of @fc reorganization in the awake mouse brain (@fig:cannabinoids-summary). The
first pattern consists of rapid cortical-thalamic effects that emerge within 10 to 30
minutes post-injection, characterized by increased bilateral connectivity within both
cortical and thalamic regions, accompanied by decreased connectivity between these
structures. The second pattern involves slower hippocampal network alterations that
develop gradually over one hour, featuring decreased interhemispheric hippocampal
connectivity and altered cortico-hippocampal interactions. These biphasic @fc changes
suggest that cannabinoids act through distinct temporal mechanisms to reorganize brain
network architecture, with rapid effects potentially reflecting direct receptor-mediated
responses and slower changes indicating more complex network-level adaptations to @cb1
receptor activation.

#figure(
  placement: auto,
  image("figures/cannabinoids/summary.png"),
  caption: figure-caption(
    [Summary of the Cannabinoids @fc alterations.],
    [The figure summarizes the main @fc alterations observed in the Cannabinoids
      project, using the @cp session as the representative example showing the highest
      effect. The top two rows show the average correlation matrices and seed-based maps
      for the vehicle control and the @cp treatments, respectively, during the
      post-injection phase (SP1). The bottom two rows show the same treatments during
      the last post-injection phase (SP6). These two phases were selected to show the
      rapid (SP1) and slow (SP6) alterations in @fc, respectively.
    ],
  ),
) <fig:cannabinoids-summary>

=== Discussion

==== Pharmacological Insights and Regional Specificity

These preliminary results further demonstrate the utility of awake @fusi for in vivo
neuropharmacology studies, building upon the methodological framework established in the
Opioids project. The biphasic @fc alterations observed in response to @thc and @cp
administration suggest that these compounds induce distinct temporal patterns of network
reorganization, with rapid cortical-thalamic effects followed by slower hippocampal
changes.

Notably, the observed regional alterations in @fc (hippocampal sensitivity,
cortical-thalamic dysconnectivity) align well with known @cb1 receptor density patterns
@RiquelmeSandoval2020. The hippocampus has among the highest @cb1 expression in the
brain, which may explain its particular sensitivity to @thc/@cp effects. This
correspondence between receptor distribution and functional alterations provides strong
evidence for the pharmacological relevance of the observed @fc changes.

An important pharmacological observation concerns the pattern of @am effects, which
provides insights into @cb1 receptor function in our experimental paradigm. While @am is
classified as a @cb1 inverse agonist---theoretically expected to produce effects
opposite to @thc and #ref(<cp>)---our results demonstrate a pattern more consistent with
neutral antagonism. Specifically, @am administration alone produced no significant
changes in mobility, @rcbv, or @fc compared to vehicle controls. When used as
pretreatment, @am provided only partial protection against @thc\-induced effects across
all measured parameters. This apparent discrepancy between @am's pharmacological
classification and its observed behavioral profile suggests that @cb1 receptors may
exhibit minimal constitutive activity in our experimental conditions, or that the
constitutive activity is insufficient to produce detectable changes in the measurements
captured by @fusi. This finding highlights the complexity of cannabinoid pharmacology
and emphasizes the importance of empirical validation of receptor function in specific
experimental contexts.

==== Vascular Effects

By providing simultaneous readouts of both @fc:long and @rcbv:long in awake animals,
@fusi has the potential to shed more light on the complex interplay between cannabinoids
and cerebrovascular dynamics. Indeed, contrasting evidence has been reported in the
literature regarding the effects of cannabinoids on #gls("cbv", first: true), with both vasodilatory
and vasoconstrictive effects described depending on the specific cannabinoid, dose, and
species @Benyo2016 @Richter2018.

In conscious rats, @thc and @aea have been reported to induce vasoconstriction in areas
such as the hippocampus, striatum, frontal cortex, and medial prefrontal cortex
@Bloom1997 @Stein1998. This is consistent with our observations, in particular with @cp
and the highest @thc dose (#qty(10, "mg/kg")), which produced pronounced
vasoconstriction in all brain regions. However, we also report that hippocampal @cbv
remains elevated relative to other regions, suggesting that the hippocampus may exhibit
a unique vascular response to cannabinoids.

Additionally, the transient vasodilatory effect of @cp has been previously reported in
the literature @Morse2023. Similar vasodilatory effects have also been observed with
HU-210 @Wagner2001, another synthetic cannabinoid that is an even more potent agonist at
@cb1 than @cp. Interestingly, no vasodilatory effect was observed with @thc, suggesting
that the vasodilatory effect observed with @cp may not be uniquely mediated by @cb1 and
@cb2. This finding highlights the complex pharmacology of different cannabinoid
compounds and suggests that synthetic cannabinoids may engage additional molecular
targets beyond the classical endocannabinoid receptors.

Our findings also highlight important regional differences in cannabinoid sensitivity,
particularly the enhanced hippocampal responsiveness to both @thc and @cp. This regional
specificity aligns with the known distribution of @cb1 receptors, which are among the
most highly expressed in hippocampal regions @RiquelmeSandoval2020. The hippocampus's
particular sensitivity to cannabinoid-induced vascular changes may contribute to the
cognitive and memory-related effects associated with cannabinoid use, as @cbv
alterations directly impact local oxygen and nutrient delivery essential for optimal
neuronal function.

==== Interpretational Challenges and Behavioral Confounds

However, the strong effect of @thc and @cp on mouse mobility complicates the
interpretation of these results and raises questions about potential secondary effects.
Indeed, the observed hippocampal alterations may reflect changes in spatial navigation
rather than direct effects on hippocampal network organization induced by cannabinoid
administration. Increased hippocampal activity during spatial navigation was previously
reported in rats using @fusi @Bergel2020 @CybisPereira2025, and we may be observing a
similar phenomenon here that is attenuated by @thc and @cp.

Similarly, the heavily reduced mouse mobility may pose questions about the arousal state
of the animals during the @fusi acquisition. While we did not observe sleep periods
during the @fusi acquisitions, a quantitative evaluation of the arousal state---for
example, by measuring pupil diameter on simultaneous video recordings---could help
clarify the relationship between mouse mobility and arousal state.

==== Methodological Limitations and Technical Considerations <sec:cannabinoids-methodological-limitations>

The Cannabinoids project suffers from the same limitations as the Opioids project in
terms of methodology, particularly concerning the use of single slice @fusi and the loss
of sensitivity due to transcranial imaging. While this paradigm offers much simpler
surgical and experimental procedures, future studies should consider using volumetric
#ref(<fusi>)---for example, using the multi-array probe developed by Iconeus
#cite(<Bertolo2023>)---combined with craniotomy preparations to improve sensitivity and
spatial coverage.

Notably, although we do have access to the hippocampus, a region rich in @cb1 and @cb2
@RiquelmeSandoval2020, we are missing the striatum, a key region for the motor and
reward systems that is often reported to be altered by cannabinoids @Gunasekera2021
@Batalla2021. This spatial limitation may prevent the detection of important cannabinoid
effects on reward and motor circuits that are central to the compound's behavioral and
potentially therapeutic effects.

Additionally, the large variability in animal mobility during control sessions---ranging
from 60% at the beginning of the session to 20% at the end---highlights the importance
of accounting for this factor in @fc analyses. Moreover, it suggests long habituation
periods are not sufficient to eliminate this variability. Instead, experimental
protocols could be optimized to reduce motion artifacts by letting the animals explore
the environment for around one hour before starting the @fusi acquisition. Since this
would greatly increase the experimental duration, this pre-acquisition period could be
performed in a separate @mhc that isn't part of a @fusi system, while other recordings
are being performed.

Finally, interpretation of @rcbv from @fusi data in awake and behaving animals is still
difficult given than arousal and locomotion can significantly affect @cbv. Indeed,
locomotion is known to induce strong @cbv changes across many brain regions @Zhang2019
@Zhang2022. Although we are interpolating power Doppler signals during periods of high
tissue velocity---assumed to be caused by locomotion---to reduce the impact of
motion-induced changes, this approach is still limited by the fact that behavior-induced
@cbv changes may last for several seconds after the locomotion event. Therefore, our
approach may not be fully correcting for this effect, as is evident at the beginning of
our baseline periods where @cbv is strongly elevated due to the high mobility of the
animals. Future work should explore more sophisticated approaches to disentangle the
effects of locomotion and arousal on @cbv from the effects of pharmacological compounds.

==== Statistical Limitations and Future Analytical Approaches

The relatively small sample sizes in some groups of the Cannabinoids project limit the
statistical power of our analyses---particularly in the vehicle, @cbd, and @am groups. A
future improvement that we plan to implement is to create a larger control session by
pooling data from all of our @phfusi projects, similarly to what we did in the Opioids
project. While this would not compensate for the small sample sizes of some treatment
groups---for example, @cbd and @am sessions---it would allow us to perform statistical
thresholding on the group-level correlation matrices and identify significant @fc
alterations with greater confidence.

The Cannabinoids project is still at a preliminary stage, and further analyses are
needed to fully characterize the effects of cannabinoids on brain @fc. Future work will
include additional acquisitions on @cb1\-knockout mice to confirm the specificity of the
observed effects to @cb1 activation, and analysis of the sparse 3D+t acquisitions from
the Cannabinoids project. Additionally, we plan to go beyond correlation-based @fc
analyses and perform clustering-based @fc analyses to improve interpretation of the
observed @fc alterations---for example, @cap analysis @Tagliazucchi2011 @Liu2013
@Liu2018, with which we already have encouraging preliminary results not shown in this
manuscript. Indeed, correlation is a summary statistic that reduces large temporal
windows into a single value reflecting linear relationships, potentially obscuring the
rich temporal dynamics that @fusi's high temporal resolution can capture.
Clustering-based analyses would allow us to leverage @fusi's resolution to study
activation and inhibition patterns of specific regions at individual time points,
providing insights into the exact timing and sequence of cannabinoid-induced network
changes. This approach is particularly justified given that @fusi studies have already
demonstrated the ability to detect single hemodynamic events in specific regions such as
the hippocampus @Bergel2020 @CybisPereira2025, suggesting that frame-level analyses
could reveal discrete activation patterns that are averaged out in correlation-based
approaches. Such temporal precision may be especially important for capturing acute
cannabinoid effects that last only a few minutes or identifying the precise onset timing
of slower network reorganization processes.

=== Conclusion

The Cannabinoids project demonstrates the potential of awake @fusi to characterize the
complex neuropharmacological effects of cannabinoids, extending the methodological
framework established in the Opioids project to a different class of psychoactive
compounds. The biphasic @fc alterations observed with @thc and #ref(<cp>)---featuring
rapid cortical-thalamic effects followed by slower hippocampal changes---reveal distinct
temporal patterns of network reorganization that align well with known @cb1 receptor
distribution patterns. Notably, dose-dependence of some of these alterations provdes
encouraging evidence of the pharmacological relevance of the observed @fc changes.

However, the preliminary nature of these results and the challenges posed by
cannabinoid-induced mobility reduction highlight important limitations in interpreting
@fc changes in the context of altered behavioral states. The strong effects of @thc and
@cp on locomotion raise questions about whether the observed hippocampal alterations
reflect direct pharmacological effects or secondary changes related to altered spatial
navigation and arousal states. This confound emphasizes the importance of developing
analytical approaches that can dissociate drug-specific network effects from
behaviorally-mediated changes.

The methodological limitations identified in this project---including small sample sizes
and single-slice imaging---provide important guidance for future @phfusi investigations.
The planned implementation of clustering-based analyses, such as @cap analysis,
represents a promising direction for @fusi's high temporal resolution to capture the
frame-wise dynamics of cannabinoid effects that may be obscured by correlation-based
approaches.

Together with the Opioids project, these results contribute to a growing understanding
of how different classes of psychoactive compounds produce distinct @fc signatures in
the awake mouse brain. The cannabinoid findings, while preliminary, add to the
foundation for developing @fc\-based approaches to neuropharmacological screening and
provide insights into the network-level effects of compounds with significant
therapeutic potential.

== Psilocybin: Preliminary Results

=== Introduction

Psychedelic compounds have experienced a remarkable renaissance in neuroscience and
clinical research, driven by mounting evidence of their potential to treat previously
intractable neuropsychiatric conditions. Psilocybin, the primary psychoactive component
of "magic mushrooms," has emerged as a particularly promising therapeutic agent, with
clinical trials demonstrating rapid and sustained improvements in treatment-resistant
depression, anxiety, and addiction when administered in controlled clinical settings
@Dodd2022 @vonRotz2023 @CarhartHarris2016 @Barrett2020.

The therapeutic landscape for psilocybin-based interventions has expanded dramatically,
with many registered clinical trials currently investigating its efficacy across diverse
neuropsychiatric conditions @psilocybinmethamphetamine9594 @psilocybinocd22999
@psilocybindepression0442 @precisionfunctional1653 @psilocybinpharmacokinetics3707
@recap2midazolam2192 @psilocybinassistedtherapy4522. Recent Phase 2 randomized
controlled trials have demonstrated that single high doses of psilocybin
(#qty(25, "mg")) can produce significant and sustained reductions in depressive
symptoms lasting up to six months in patients with major depressive disorder
@psilocybindepression0442 @vonRotz2023. Systematic reviews and meta-analyses further
support these findings, documenting significant improvements in depression, anxiety, and
addiction-related symptoms with psilocybin-assisted therapy while emphasizing its
manageable safety profile in controlled conditions @Metaxa2024 @Dodd2022.

Functional neuroimaging studies have revealed complex patterns of brain network
reorganization that correlate with both acute subjective effects and long-term
therapeutic outcomes. Human @fmri investigations consistently show that psilocybin
reduces connectivity within canonical networks such as the #gls("dmn", first: true) and executive
control network while enhancing cross-network integration @Frautschi2024 @Bene2025.
These connectivity changes, particularly decreased activity in the medial prefrontal
cortex and posterior cingulate cortex, correlate with ego dissolution experiences and
may underlie antidepressant effects by normalizing hyperactive @dmn patterns
characteristic of depression @Frautschi2024 @Kuburi2022. Complementary @pet studies have
confirmed serotonergic mediation through @fiveht#sub[2A] receptors, with receptor
occupancy correlating with both subjective experiences and @fc changes @Frautschi2024
@Nichols2020.

However, a critical gap remains in understanding how acute neurobiological changes
translate into sustained therapeutic benefits persisting for weeks to months after
treatment. While current research has mapped acute @fc changes during the psychedelic
experience, most investigations focus on immediate rather than sustained neuroplastic
effects underlying therapeutic efficacy. The few studies examining lasting effects show
mixed findings, with some reporting persistent network connectivity alterations up to
one month post-administration @Barrett2020, while others found changes undetectable at
three months @McCulloch2021.

The majority of preclinical investigations have relied on anesthetized preparations,
which may fundamentally alter drug responses and neuroplastic changes, limiting clinical
translation. Recent studies using BOLD fMRI in awake rats show mixed results, with some
reporting widespread positive activation and increased connectivity @Liu2023 @Fuini2025,
while anesthetized preparations show more variable patterns @Spain2015, highlighting the
importance of conducting psychedelic research in behaviorally relevant, conscious
states.

A critical question concerns whether acute hallucinogenic effects are necessary for
therapeutic benefits. This has both theoretical and practical implications, as
non-hallucinogenic alternatives could dramatically expand clinical utility by reducing
monitoring requirements and enabling use in broader patient populations. While human
studies suggest mystical experiences correlate with therapeutic outcomes @Dodd2022, the
mechanistic relationship between acute network reorganization and lasting benefits
remains unclear. Preclinical studies report conflicting results regarding whether
@fiveht#sub[2A] receptor activation---which gates hallucinogenic effects---is necessary
for therapeutic actions.

The Psilocybin project was designed to address these fundamental questions using awake
@fusi to characterize both acute and lasting effects of psilocybin on brain @fc. Our
investigation focused on three key objectives: first, to characterize acute effects of
clinically relevant psilocybin doses on @fc patterns in awake mice; second, to determine
whether acute changes predict lasting network alterations persisting beyond the
pharmacological window; and third, to assess whether acute behavioral effects
(head-twitch response) correlate with @fc changes and whether @fiveht#sub[2A] receptor
activation is necessary for sustained @fc alterations.

This work represents a crucial step toward understanding neurobiological mechanisms
underlying psilocybin's therapeutic effects and may inform development of optimized
treatment protocols that maximize therapeutic benefit while minimizing unwanted acute
effects.

=== Methods <sec:psilocybin-methods>

The Psilocybin project was conducted following the same methodological framework as
the Cannabinoids project (@sec:cannabinoids-methods).

==== Experimental Protocol

@fusi acquisitions were performed on a total of 106 mice, with 93 mice retained for
analysis after quality control (@tab:psilocybin-dataset).

#figure(
  placement: auto,
  booktabs-table(
    columns: 5,
    header: (
      [Treatment],
      [$N_"mice"$],
      [$N_"mice post-QC"$],
      [Duration (min)],
      [Sampling frequency (Hz)],
    ),

    [Vehicle Dose-Response],
    [40],
    [36],
    [90],
    [2.5],

    [Vehicle Chemical-Control],
    [65],
    [48],
    [100],
    [2.5],

    [Vehicle (D0)],
    [11],
    [11],
    [90],
    [2.5],

    [Psilocybin #qty(1, "mg/kg") (D0)],
    [10],
    [9],
    [90],
    [2.5],

    [Psilocybin #qty(5, "mg/kg") (D0)],
    [10],
    [8],
    [90],
    [2.5],

    [Psilocybin #qty(10, "mg/kg") (D0)],
    [10],
    [10],
    [90],
    [2.5],

    [Vehicle + Vehicle (D0)],
    [10],
    [8],
    [100],
    [2.5],

    [Vehicle + Psilocybin #qty(5, "mg/kg") (D0)],
    [11],
    [7],
    [100],
    [2.5],

    [Vehicle + Lisuride #qty(0.8, "mg/kg") (D0)],
    [11],
    [10],
    [100],
    [2.5],

    [MDL #qty(0.5, "mg/kg") + Vehicle (D0)],
    [10],
    [9],
    [100],
    [2.5],

    [MDL #qty(0.5, "mg/kg") + Psilocybin #qty(5, "mg/kg") (D0)],
    [10],
    [9],
    [100],
    [2.5],

    [MDL #qty(0.5, "mg/kg") + Lisuride #qty(0.8, "mg/kg") (D0)],
    [10],
    [9],
    [100],
    [2.5],

    [Vehicle (D7)],
    [10],
    [8],
    [30],
    [2.5],

    [Psilocybin #qty(1, "mg/kg") (D7)],
    [10],
    [7],
    [30],
    [2.5],

    [Psilocybin #qty(5, "mg/kg") (D7)],
    [10],
    [8],
    [30],
    [2.5],

    [Psilocybin #qty(10, "mg/kg") (D7)],
    [10],
    [9],
    [30],
    [2.5],

    [Vehicle + Vehicle (D7)],
    [10],
    [8],
    [30],
    [2.5],

    [Vehicle + Psilocybin #qty(5, "mg/kg") (D7)],
    [11],
    [7],
    [30],
    [2.5],

    [Vehicle + Lisuride #qty(0.8, "mg/kg") (D7)],
    [11],
    [9],
    [30],
    [2.5],

    [MDL #qty(0.5, "mg/kg") + Vehicle (D7)],
    [10],
    [8],
    [30],
    [2.5],

    [MDL #qty(0.5, "mg/kg") + Psilocybin #qty(5, "mg/kg") (D7)],
    [10],
    [9],
    [30],
    [2.5],

    [MDL #qty(0.5, "mg/kg") + Lisuride #qty(0.8, "mg/kg") (D7)],
    [10],
    [7],
    [30],
    [2.5],

    table.hline(stroke: 0.05em),

    [Total (independent)],
    [106],
    [93],
    [],
  ),
  kind: table,
  caption: figure-caption(
    [Characteristics of the Psilocybin dataset.],
    [Characteristics include the number of mice before and after #gls("qc", first: true), the
      duration of each session, and the corresponding sampling frequency. Each session
      consisted of a 30-minute baseline acquisition. Dose-response sessions were
      followed by a 1-hour follow-up session. Chemical-control sessions were followed by
      a 30-minute acquisition, then injection of a second compound (Vhicle, psilocybin
      #qty(5, "mg/kg"), or lisuride #qty(0.8, "mg/kg")), and a 40-minute follow-up.
      Longitudinal sessions were performed 7 days after the first session and consisted
      of a 30-minute baseline acquisition. All acquisitions were performed at a
      sampling frequency of #qty(2.5, "Hz").
    ],
  ),
) <tab:psilocybin-dataset>

All sessions started with a 30-minute baseline acquisition. Dose-response sessions
were followed by injection of a vehicle or psilocybin compound at different
doses---#qty(1, "mg/kg"), #qty(5, "mg/kg"), or #qty(10, "mg/kg")---and a follow-up
acquisition of 1 hour. Chemical-control sessions were followed by a first injection of
either vehicle or MDL #qty(0.5, "mg/kg")---a highly potent antagonist of the
@fiveht#sub[2A] receptor---, then a 30-minute acquisition, followed by a second
injection of either vehicle, psilocybin #qty(5, "mg/kg"), or lisuride
#qty(0.8, "mg/kg")---a non-hallucinogenic @fiveht#sub[2A] receptor agonist---, and finally
a 40-minute follow-up acquisition. Longitudinal sessions were performed 7 days after
the first session and consisted only of the 30-minute baseline acquisition.

For @fc analysis, all sessions were divided into phases of #qty(10, "min") each, with
the baseline periods denoted as BP1 and BP3, and the subsequent periods denoted as SP1
to SP7 (@fig:psilocybin-experimental-protocol).

#figure(
  placement: auto,
  cetz.canvas(
    length: 1cm,
    {
      import cetz.draw: *

      // Set up styling
      set-style(
        stroke: (thickness: 2pt, paint: black),
        fill: none,
      )

      let scale-factor = 0.35

      /*********************************************************************************
       * Dose-reponse paradigm
       ********************************************************************************/

      let y = 0
      content((-.25, y), anchor: "east", text(size: 1em, weight: "bold")[Dose\ response])

      // BP segments (3 segments with black color)
      for i in range(0, 3) {
        let x-start = (4.1 * i) * scale-factor
        let x-end = x-start + 3.9 * scale-factor
        let x-mid = x-start + 1.95 * scale-factor

        line((x-start, y), (x-end, y), stroke: (thickness: 2pt, paint: black))
        content((x-mid, y + 0.3), text(size: 1em, weight: "bold")[BP#(i + 1)])
        content((x-mid, y - 0.3), text(size: 1em)[10 min])
      }

      // SP segments (6 segments with gray color)
      for i in range(1, 7) {
        let x-start = (8.2 + 4.1 * i) * scale-factor
        let x-end = x-start + 3.9 * scale-factor
        let x-mid = x-start + 1.95 * scale-factor

        line((x-start, y), (x-end, y), stroke: (thickness: 2pt, paint: gray))
        content((x-mid, y + 0.3), text(size: 1em, weight: "bold")[SP#i])
        content((x-mid, y - 0.3), text(size: 1em)[10 min])
      }

      // First arrow (black) - treatment
      line(
        (12.2 * scale-factor, y - 2 * scale-factor),
        (12.2 * scale-factor, y - 0.1 * scale-factor),
        stroke: (thickness: 1.5pt, paint: black),
        mark: (end: ">", fill: black),
      )
      content((12.2 * scale-factor, y - 2.8 * scale-factor), text(size: 1em)[Injection])

      /*********************************************************************************
       * Chemical-control paradigm
       ********************************************************************************/

      let y = -2
      content((-.25, y), anchor: "east", text(size: 1em, weight: "bold")[Chemical\ control])

      // BP segments (3 segments with black color)
      for i in range(0, 3) {
        let x-start = (4.1 * i) * scale-factor
        let x-end = x-start + 3.9 * scale-factor
        let x-mid = x-start + 1.95 * scale-factor

        line((x-start, y), (x-end, y), stroke: (thickness: 2pt, paint: black))
        content((x-mid, y + 0.3), text(size: 1em, weight: "bold")[BP#(i + 1)])
        content((x-mid, y - 0.3), text(size: 1em)[10 min])
      }

      // SP segments (6 segments with gray color)
      for i in range(1, 8) {
        let x-start = (8.2 + 4.1 * i) * scale-factor
        let x-end = x-start + 3.9 * scale-factor
        let x-mid = x-start + 1.95 * scale-factor

        line((x-start, y), (x-end, y), stroke: (thickness: 2pt, paint: gray))
        content((x-mid, y + 0.3), text(size: 1em, weight: "bold")[SP#i])
        content((x-mid, y - 0.3), text(size: 1em)[10 min])
      }

      // First arrow (black) - treatment
      line(
        (12.2 * scale-factor, y - 2 * scale-factor),
        (12.2 * scale-factor, y - 0.1 * scale-factor),
        stroke: (thickness: 1.5pt, paint: black),
        mark: (end: ">", fill: black),
      )
      content((12.2 * scale-factor, y - 2.8 * scale-factor), text(size: 1em)[First injection])

      // Second arrow (gray) - treatment with AM251 + THC
      line(
        (24.5 * scale-factor, y - 2 * scale-factor),
        (24.5 * scale-factor, y - 0.1 * scale-factor),
        stroke: (thickness: 1.5pt, paint: gray),
        mark: (end: ">", fill: gray),
      )
      content(
        (24.5 * scale-factor, y - 2.8 * scale-factor),
        align(center)[#text(size: 1em)[Second injection]],
      )

      /*********************************************************************************
       * Longitudinal paradigm
       ********************************************************************************/

      let y = -4
      content((-.25, y), anchor: "east", text(size: 1em, weight: "bold")[Longitudinal])

      // BP segments (3 segments with black color)
      for i in range(0, 3) {
        let x-start = (4.1 * i) * scale-factor
        let x-end = x-start + 3.9 * scale-factor
        let x-mid = x-start + 1.95 * scale-factor

        line((x-start, y), (x-end, y), stroke: (thickness: 2pt, paint: black))
        content((x-mid, y + 0.3), text(size: 1em, weight: "bold")[BP#(i + 1)])
        content((x-mid, y - 0.3), text(size: 1em)[10 min])
      }
    },
  ),
  caption: figure-caption(
    [Experimental protocol for the Psilocybin project.],
    [All sessions started with a baseline consisting of three #qty(10, "min") periods
      (BP1 to BP3). Dose-response sessions (*top*) were followed by injection of a vehicle
      or different doses of psilocybin (black arrow) and a follow-up acquisition of one
      hour (SP1 to SP6). Chemical-control sessions (*middle*) were followed by a first
      injection of either vehicle or MDL (black arrow), then a #qty(30, "min") acquisition
      (SP1 to SP3), followed by a second injection of either vehicle, psilocybin, or
      lisuride (gray arrow), and finally a #qty(40, "min") follow-up acquisition (SP4 to
      SP6). Longitudinal sessions (*bottom*) were performed 7 days after the first session
      and consisted of only the baseline acquisition (BP1 to BP3).
    ],
  ),
) <fig:psilocybin-experimental-protocol>

=== Results

==== Mouse Mobility

Mouse mobility during baseline periods showed consistent variability across all sessions
of the Psilocybin project, with mice moving approximately 40% to 60% of the time at the
beginning of sessions (@fig:psilocybin-mobility). Similar to the Opioids and
Cannabinoids projects, vehicle sessions exhibited characteristic temporal dynamics with
a progressive decrease in mobility, reaching approximately 20% by the end of the
session. This decrease was observable even across the 30-minute baseline acquisitions in
longitudinal sessions, confirming the robustness of this habituation effect across
different experimental paradigms.

Psilocybin administration produced a significant reduction in mouse mobility, although
this effect was much less dramatic than that observed in the Cannabinoids project
(@fig:cannabinoids-mobility). The mobility reduction appeared to be dose-dependent on
average, though high variability prevented detection of significant differences between
individual doses. The peak reduction occurred approximately 30 minutes post-injection,
suggesting a delayed onset compared to the immediate effects observed with cannabinoids.

Vehicle pre-treatment followed by psilocybin #qty(5, "mg/kg") injection produced a
similar reduction in mobility to that observed in dose-response sessions. However,
lisuride #qty(0.8, "mg/kg") injection produced distinctly different effects, leading to
a transient increase in mobility lasting 10 to 20 minutes post-injection before
returning to vehicle levels after approximately 30 minutes. Notably, neither the
psilocybin-induced decrease nor the lisuride-induced increase in mobility were
significantly blocked by MDL #qty(0.5, "mg/kg") pre-treatment, suggesting that these
locomotor effects are not mediated by @fiveht#sub[2A] receptor activation. No
significant differences in mobility were observed between longitudinal sessions and
vehicle controls, indicating that psilocybin did not produce lasting changes in
spontaneous locomotor activity.

#figure(
  placement: auto,
  image("figures/psilocybin/motion.png"),
  caption: figure-caption(
    [Mouse mobility in the Psilocybin project.],
    [Average time series of fraction of time spent in motion are displayed for each
      treatment group. Corresponding longitudinal sessions are displayed on the right.
      The time series are averaged across all acquisitions of the session, with the
      shaded area representing the 95% confidence interval.],
  ),
) <fig:psilocybin-mobility>

==== Cerebral Blood Volume

Regional #gls("rcbv", first: true) measurements revealed elevated baseline values at the beginning of
each session (@fig:psilocybin-cbv-dose-response), consistent with patterns observed in
the Opioids and Cannabinoids projects (@fig:opioids6 and
@fig:cannabinoids-cbv-dose-response). Vehicle sessions showed the characteristic pattern
of less pronounced @rcbv decreases compared to mobility changes, with hippocampal @rcbv
showing a slight increase over the session duration.

Psilocybin administration produced significant and relatively dose-dependent
vasodilation, primarily localized to the isocortex. At the lowest dose (
#qty(1, "mg/kg")), this vasodilation was subtle and peaked approximately 10 minutes
post-injection. At higher doses (#qty(5, "mg/kg") and #qty(10, "mg/kg")), the
vasodilation was more pronounced and exhibited earlier onset, peaking around 5 minutes
post-injection. Following the initial vasodilation at the highest doses, a global
vasoconstriction emerged, primarily driven by the thalamus. Longitudinal sessions showed
no significant @rcbv effects relative to vehicle controls, indicating that acute
psilocybin administration did not produce persistent vascular alterations.

#figure(
  placement: auto,
  image("figures/psilocybin/cbv_dose_response.png"),
  caption: figure-caption(
    [@Cbv changes in response to injection of psilocybin.],
    [Average raster plots of @rcbv time series are displayed for each dose-reponse
      treatment group. Corresponding longitudinal sessions are displayed on the right.
      @rcbv is expressed as a percentage relative to the minimum value recorded during the
      30-minute baseline.],
  ),
) <fig:psilocybin-cbv-dose-response>

Chemical control experiments revealed that vehicle pre-treatment did not alter the
strong cortical vasodilation following psilocybin #qty(5, "mg/kg") injection
(@fig:psilocybin-cbv-chemical-control). Lisuride #qty(0.8, "mg/kg") injection produced
cortical vasodilation that exceeded even the highest psilocybin dose, occurring
immediately after injection and persisting for 20 to 30 minutes. MDL #qty(0.5, "mg/kg")
treatment alone produced no significant @rcbv changes relative to vehicle control.
However, MDL pre-treatment reduced the vasodilatory amplitude observed with both
psilocybin and lisuride injections, suggesting that the vasodilatory effects of these
compounds are at least partially mediated by @fiveht#sub[2A] receptor activation.
Interestingly, MDL pre-treatment followed by lisuride injection produced strong
vasoconstriction across all regions following the initial cortical vasodilation,
indicating complex receptor interactions beyond simple @fiveht#sub[2A] antagonism.

Again, no significant effects were observed in longitudinal sessions relative to vehicle
controls, suggesting that the acute vasodilatory and vasoconstrictive effects of
psilocybin and lisuride do not produce lasting changes in @rcbv.

#figure(
  placement: auto,
  image("figures/psilocybin/cbv_chemical_control.png"),
  caption: figure-caption(
    [@Cbv changes in response to chemical control administration.],
    [Average raster plots of @rcbv time series are displayed for each chemical-control
      treatment group. Corresponding longitudinal sessions are displayed on the right.
      @rcbv is expressed as a percentage relative to the minimum value recorded during the
      30-minute baseline.],
  ),
) <fig:psilocybin-cbv-chemical-control>

==== Functional Connectivity

Group-level correlation matrices revealed dose-dependent alterations in @fc following
psilocybin administration (@fig:psilocybin-correlation-matrices). Unlike the
Cannabinoids project, large vehicle control sessions were acquired to ensure sufficient
statistical power for group-level analyses, enabling application of statistical
thresholding (two-sample $t$-tests, $p < 0.05$ FDR-corrected) to identify significant
@fc alterations relative to vehicle controls.

#figure(
  placement: auto,
  image("figures/psilocybin/group-level_correlation-matrices.png"),
  caption: figure-caption(
    [Group-level @fc:short correlation matrices for all treatments of the Psilocybin
      project.],
    [An example correlation matrix is displayed at the top left of the figure, showing
      @roi acronyms (@tab:roi-acronyms) on the axes. All correlation matrices display
      three black squares, corresponding from top to bottom to cortical, hippocampal,
      and thalamic @roi:pl. The bottom triangle of each matrix shows the group-level
      average correlation coefficients, while the top triangle shows the corresponding
      difference relative to the vehicle control session. All differences are shown
      with a statistical threshold of $p < 0.05$ FDR-corrected. Group-level correlation
      matrices were computed for each treatment and each temporal phase
      (@fig:psilocybin-experimental-protocol). Corresponding longitudinal sessions are
      displayed on the right.
    ],
  ),
) <fig:psilocybin-correlation-matrices>

Psilocybin administration produced biphasic @fc alterations across most @roi:pl
(@fig:psilocybin-connectivity-timeseries-dose-response). The primary effects included
increases in @fc between bilateral lateral cortex hemispheres and between the
hippocampus and ventral thalamus, accompanied by decreases in bilateral hippocampal @fc
and bilateral dorsal and ventral thalamic @fc. These alterations appeared to result from
differential temporal dynamics, as bilateral hippocampal and thalamic @fc progressively
increased over vehicle control sessions, while psilocybin-treated animals maintained
relatively stable post-injection connectivity patterns. At the highest doses
(#qty(5, "mg/kg") and #qty(10, "mg/kg")), bilateral hippocampal @fc showed slight
decreases immediately following injection. The lowest psilocybin dose (#qty(1, "mg/kg"))
produced significant effects in lateral cortex, ventral thalamus, and
hippocampo-thalamic connections, though bilateral hippocampal and thalamic alterations
required higher doses. All effects demonstrated dose-dependence, with the two highest
doses producing very similar response patterns. No longitudinal effects were observed
across any psilocybin dose, indicating that @fc alterations were limited to the acute
drug period.

#figure(
  placement: auto,
  image("figures/psilocybin/connectivity_timeseries_dose_response.png"),
  caption: figure-caption(
    [Group-level @fc:short time series for psilocybin dose-response sessions and
      relevant @roi:short pairs.],
    [Time series of @fc changes are displayed for each psilocybin treatment group and
      relevant @roi pairs selected by visual inspection of the group-level correlation
      matrices (@fig:psilocybin-correlation-matrices). Time series show the average
      correlation coefficients between the selected @roi pairs for each treatment group
      and each temporal phase, with shaded areas representing 95% confidence intervals.
    ],
  ),
) <fig:psilocybin-connectivity-timeseries-dose-response>

Chemical control experiments revealed that vehicle pre-treatment followed by psilocybin
#qty(5, "mg/kg") produced similar @fc alterations to dose-response sessions, with the
exception of bilateral lateral cortex and dorsal thalamic connections, which showed no
significant changes (@fig:psilocybin-connectivity-timeseries-chemical-control-vh).
Lisuride #qty(0.8, "mg/kg") injection produced distinct effects, including strong,
transient decreases in bilateral lateral cortical @fc and sustained decreases in
bilateral hippocampal @fc, while bilateral thalamic @fc remained unchanged. Again, no
significant changes in @fc were observed in corresponding longitudinal sessions relative
to vehicle controls.

#figure(
  placement: auto,
  image("figures/psilocybin/connectivity_timeseries_chemical_control_vh.png"),
  caption: figure-caption(
    [Group-level @fc:short time series for vehicle pre-treatment sessions and relevant
      @roi:short pairs.],
    [],
  ),
) <fig:psilocybin-connectivity-timeseries-chemical-control-vh>

MDL #qty(0.5, "mg/kg") treatment alone produced significant decreases in bilateral
hippocampal @fc similar to high-dose psilocybin effects, along with smaller amplitude
decreases in bilateral ventral thalamic @fc
(@fig:psilocybin-connectivity-timeseries-chemical-control-mdl). Notably, MDL
pre-treatment did not block the strong bilateral lateral cortical @fc decreases
following lisuride injection, nor did it prevent hippocampo-thalamic @fc increases after
psilocybin injection. Interestingly, MDL pre-treatment enhanced hippocampo-thalamic
connectivity increases following lisuride injection compared to vehicle pre-treatment,
suggesting complex receptor interactions beyond simple @fiveht#sub[2A] blockade.

#figure(
  placement: auto,
  image("figures/psilocybin/connectivity_timeseries_chemical_control_mdl.png"),
  caption: figure-caption(
    [Group-level @fc:short time series for MDL pre-treatment sessions and relevant
      @roi:short pairs.],
    [],
  ),
) <fig:psilocybin-connectivity-timeseries-chemical-control-mdl>

Together, these results demonstrate that psilocybin administration produces
dose-dependent @fc alterations characterized by decreases in bilateral hippocampal and
thalamic @fc, and increases in hippocampo-thalamic connectivity
(@fig:psilocybin-summary). The pattern of effects suggests that psilocybin's actions
involve both @fiveht#sub[2A] receptor-dependent and independent mechanisms, with the
latter potentially contributing to the observed connectivity changes through
interactions with other neurotransmitter systems.

#figure(
  placement: auto,
  image("figures/psilocybin/summary.png"),
  caption: figure-caption(
    [Summary of the psilocybin @fc alterations.],
    [The figure summarizes the main @fc alterations observed in the Psilocybin
      project, using the psilocybin #qty(10, "mg/kg") session as the representative
      example showing the highest effect. The top two rows show the average correlation
      matrices and seed-based maps for the vehicle control and the psilocybin treatments,
      respectively, during the post-injection phase (SP1). The bottom two rows show the
      same treatments during the last post-injection phase (SP6). These two phases were
      selected to show the rapid (SP1) and slow (SP6) alterations in @fc, respectively.
    ],
  ),
) <fig:psilocybin-summary>

=== Discussion

==== Pharmacological Insights and Regional Specificity

The preliminary results of the Psilocybin project expand upon those of the Opioids and
Cannabinoids projects, providing further evidence for the specificity of @fc alterations
to different classes of psychoactive compounds. While three drug classes represent a
limited sample for declaring complete specificity, the dose-dependence of the observed
effects and their distinct temporal dynamics suggest that the @fc alterations are not
simply due to non-specific pharmacological effects or behavioral confounds.

Our observations of dose-dependent @fc alterations are consistent with recent rodent
studies demonstrating that psilocybin induces dose-dependent changes in brain network
organization @Silverstein2024 @Fuini2025. However, the localization of our observed
effects, primarily in the hippocampus and thalamus, does not agree with the
aforementioned studies, which reported widespread alterations in cortical, striatal,
and ventral regions. Moreover, our findings do not match the known distribution of
@fiveht#sub[2A] receptors in the mouse brain. Indeed, @fiveht#sub[2A] receptors are
primarily expressed in some areas of the cerebral cortex (piriform, entorhinal), of the
limbic system (septum, amygdala, nucleus accumbens), basal ganglia (striatum,
subthalamic nucleus), brainstem (substantia nigra, reticular cell groups), and olfactory
system @Weber2010 @Chiu2023. Once again, many of these areas are challenging to image
transcranially with @fusi, limiting the amount of information that can be gathered
without craniotomy.

Notably, our findings contrast with human neuroimaging studies that consistently report
lasting effects of psilocybin on brain network organization. We observed no persistent
alterations in @fc, @rcbv, or mobility at the 7-day time point, even at the highest dose
of #qty(10, "mg/kg"). This absence of lasting effects could reflect differences in
psilocybin pharmacokinetics between mice and humans, species-specific neural plasticity
mechanisms, or limitations in the sensitivity of our @fusi approach to detect subtle
long-term changes. This discrepancy raises important questions about the translational
relevance of our findings and highlights the need for careful consideration of species
differences when interpreting preclinical psychedelic research.

Although not included in these preliminary results, head-twitch responses (@htr) and
brain psilocin levels were measured by Miguel Farinha Ferreira in separate cohorts. @htr
are rhythmic head movements specific to @fiveht#sub[2A] receptor activation and serve as
a widely-used behavioral marker of hallucinogenic activity in preclinical studies
@CORNE1963 @BEDARD1977 @Halberstadt2011 @Canal2012. Future analyses will examine the
relationship between @htr temporal dynamics and observed @fc alterations. Given that
@htr are characterized by rhythmic head movements, they may be detectable in the brain
tissue velocity data computed from beamformed @iq signals, potentially providing a
simultaneous behavioral marker of hallucinogenic effects during @fusi acquisition.
Similarly, brain psilocin level measurements will allow assessment of the relationship
between pharmacokinetics and @fc alterations, helping to dissociate drug-specific
effects from behavioral confounds and providing insights into the dose-dependence of
psilocybin's network effects.

==== Vascular Effects

Our observations of dose-dependent psilocybin-induced vasodilation, primarily localized
to the cortex, reveal complex vascular dynamics that highlight current inconsistencies
in the psychedelic neuroimaging literature. The existing evidence presents
contradictory findings regarding psilocybin's effects on #gls("cbv", first: true), with studies
reporting both increases and decreases in vascular responses depending on methodology,
anesthetic state, and brain regions examined @Fuini2025 @Spain2015.

Recent neuroimaging investigations have demonstrated highly results regarding
psilocybin's vascular effects. In awake rats, Fuini and colleagues reported
dose-dependent increases in positive @bold signal---indicative of increased
#ref(<cbv>)---particularly in the primary somatosensory cortex, basal ganglia, and
thalamus @Fuini2025, though these effects showed much more sustained temporal dynamics
than the rapid onset and biphasic response we observed with @fusi. Interestingly, Liu
and colleagues also found widespread positive @bold activation and increased functional
connectivity following #qty(2.0, "mg/kg") psilocybin, but this study was conducted in
anesthetized rats, suggesting that anesthetic state alone cannot fully explain the
contradictory findings @Liu2023.

However, Spain and colleagues found a more complex pattern in anesthetized rats, with
#qty(2.0, "mg/kg") psilocin causing significant increases in @bold signal in the
olfactory system, limbic and visual cortices, but decreases in the somatosensory cortex,
thalamus, and hippocampus @Spain2015. This regional heterogeneity---with some areas
showing increased activation while others show decreased activation within the same
study---highlights the complex and region-specific nature of psilocybin's vascular
effects. Notably, Spain et and colleagues also demonstrated that psilocin enhanced blood
flow during whisker stimulation despite concurrent decreases in neural activity,
indicating complex modulation of neurovascular coupling that may be relevant to
understanding our own findings.

The situation becomes even more complex when considering human neuroimaging studies,
which show yet another pattern of responses: Carhart-Harris and colleagues found sharp
decreases in cerebral blood flow and @bold signal at rest, particularly in the
prefrontal cortex and anterior cingulate @CarhartHarris2012a, but enhanced @bold signal
in visual cortex and somatosensory areas during task performance @CarhartHarris2012b.

@fusi offers several methodological advantages that may help resolve some of these
inconsistencies. The superior temporal resolution of @fusi enables detection of fast
vascular dynamics that may be missed or temporally averaged in slower imaging
approaches. Additionally, @fusi's direct measurement of #gls("rcbv", first: true) changes provides
higher sensitivity and specificity compared to indirect measures like @bold signal,
which reflects a complex mixture of blood oxygenation, volume, and flow changes.
Additionally, awake @fusi protocols preserve the natural neurovascular coupling that may
be altered by anesthesia.

The temporal dynamics we observed---rapid onset vasodilation followed by sustained
vasoconstriction---may represent the true biphasic vascular response to psilocybin that
is obscured or averaged out in lower temporal resolution studies. The initial
vasodilatory phase could reflect immediate increases in neural activity and metabolic
demand, while the later vasoconstrictive phase may result from direct @fiveht#sub[2A]
receptor-mediated vascular effects, consistent with the known vasoconstrictive
properties of this receptor @DYER1973 @Kovcs2012 @Spain2015.

The partial attenuation of vasodilatory responses by MDL pretreatment confirms that
@fiveht#sub[2A] receptors contribute to psilocybin's vascular effects. However, the
incomplete blockade suggests involvement of additional receptor systems or indirect
mechanisms. The distinct temporal and regional patterns we observed with
lisuride---including stronger cortical vasodilation than even high-dose
psilocybin---further demonstrate that different serotonergic compounds produce distinct
vascular signatures that require high-sensitivity approaches to accurately characterize.

Our findings highlight the importance of using high-sensitivity vascular imaging
techniques in awake preparations when evaluating neuropharmacological effects on
cerebrovascular function. The contradictory results in the current literature may
reflect fundamental methodological limitations and the complex, region-specific nature
of psilocybin's vascular effects. @fusi's superior sensitivity to @cbv changes, combined
with high temporal resolution and awake experimental conditions, provides a valuable
tool for resolving these apparent discrepancies and advancing our understanding of
psychedelic-induced neurovascular responses.

==== Interpretational Challenges and Behavioral Confounds

The interpretation of our psilocybin-induced @fc alterations faces several important
challenges, particularly regarding the relationship between drug-specific network
effects and secondary behavioral changes. The observed reductions in mouse mobility,
while less dramatic than those seen with cannabinoids, still raise questions about
whether the @fc changes reflect direct pharmacological effects on neural circuits or
secondary consequences of altered behavioral states.

Like in the Cannabinoids project, the pattern of bilateral hippocampal and thalamic @fc
decreases we observed could potentially reflect changes in spatial navigation or
exploratory behavior rather than direct drug effects on these circuits. However, given
than the dose-dependence of these effects is much more pronounced than that of the
mobility reduction, we suggest that they are not simply attributable to generalized
behavioral suppression.

Recent electrophysiological studies provide additional context for interpreting these
behavioral confounds. High-density EEG recordings in rats have shown that psilocybin's
effects on cortical networks can be dissociated from movement changes @Silverstein2024.
At moderate doses (#qty(1, "mg/kg")), psilocybin caused transient increases in movement
while still producing profound changes in gamma connectivity, whereas higher doses
(#qty(10, "mg/kg") induced behavioral quiescence alongside even more pronounced network
alterations. This dissociation between movement and connectivity changes supports the
interpretation that the @fc alterations we observed reflect direct pharmacological
effects rather than secondary consequences of behavioral suppression.

The chemical control experiments provide additional evidence for the pharmacological
specificity of our findings. The fact that MDL pretreatment partially blocked some
psilocybin effects while failing to prevent others suggests complex receptor
interactions beyond simple @fiveht#sub[2A] antagonism. The distinct effects of
lisuride---including transient bilateral cortical @fc decreases and sustained
hippocampal changes---further demonstrate that different serotonergic compounds produce
distinct @fc signatures, supporting the view that our observations reflect specific
pharmacological mechanisms rather than non-specific drug effects.

==== Methodological Limitations and Technical Considerations

The Psilocybin project shares the same methodological limitations as our previous
pharmacological @fusi investigations (@sec:opioids-methodology-discussion,
@sec:cannabinoids-methodological-limitations).

==== Statistical Limitations and Future Analytical Approaches

The large vehicle control sessions in the Psilocybin project enabled statistical
thresholding of group-level analyses, representing a significant improvement over the
Cannabinoids project. However, we plan to further enhance our analytical approach in a
similar manner to the Cannabinoids project, by exploring clustering-based approaches
such as #gls("cap", first: true) analysis. Additionally, the integration of both behavioral and
pharmacokinetic data presents opportunities for more sophisticated analytical
approaches. The availability of brain psilocin level measurements will enable modeling
the relationship between pharmacokinetics and @fc alterations, as we did in the Opioids
project. Similarly, the potential detection of @htr in tissue velocity data could
provide a real-time behavioral marker of hallucinogenic effects, allowing direct
examination of the relationship between subjective-like effects and network
reorganization.

=== Conclusion

The Psilocybin project provides important insights into the acute effects of a classic
psychedelic on brain network organization, extending our pharmacological @fusi approach
to a third major class of pharmacological compounds. The dose-dependent @fc alterations
we observed---characterized by decreased bilateral hippocampal and thalamic connectivity
coupled with increased hippocampo-thalamic connectivity---demonstrate specific network
signatures that distinguish psilocybin from opioids and cannabinoids. These findings
align with recent advances in rodent psychedelic research showing complex, multi-scale
network reorganization involving altered oscillatory dynamics and enhanced global
integration.

However, several important limitations constrain the interpretation of our findings. The
absence of lasting @fc changes, contrary to human neuroimaging studies, raises questions
about translational relevance and highlights the need for further preclinical
investigations. The behavioral confounds associated with reduced mobility, while less
pronounced than those observed with cannabinoids, still complicate the interpretation of
network changes and emphasize the importance of developing analytical approaches that
can dissociate direct pharmacological effects from secondary behavioral influences.

The partial sensitivity of psilocybin's effects to @fiveht#sub[2A] receptor blockade
with MDL, combined with the distinct effects of lisuride, suggests complex
pharmacological mechanisms involving multiple receptor systems. These findings highlight
the sophisticated receptor interactions underlying psychedelic drug effects and
highlight the value of chemical control experiments in pharmacological @fusi studies.

Future work will address the methodological limitations identified in these preliminary
results, particularly regarding spatial coverage and analytical approaches. The
integration of volumetric @fusi with pharmacokinetic measurements could provide a more
comprehensive understanding of psilocybin's effects on brain network organization.
Additionally, the application of advanced analytical techniques that leverage @fusi's
high temporal resolution---including frame-wise analyses---may reveal network dynamics
that are obscured by traditional correlation-based methods.

Together with the Opioids and Cannabinoids projects, these findings contribute to an
emerging understanding of how different classes of pharmacological compounds produce
distinct yet overlapping signatures of brain network reorganization. While each project
has revealed drug-specific patterns of connectivity changes, common themes have emerged,
including the importance of temporal dynamics, dose-dependence, and regional specificity
in determining network effects. These insights provide a foundation for developing
@fc\-based approaches to neuropharmacological screening and offer mechanistic insights
into the network-level effects of compounds with significant therapeutic potential.

== Chapter Conclusion

This chapter represents a pioneering application of #gls("fusi", first: true) to systematic
neuropharmacological investigation, establishing @fusi as a powerful tool for
characterizing drug effects on brain network organization in awake, behaving animals.
Through comprehensive studies of three major classes of psychoactive
compounds---opioids, cannabinoids, and psilocybin---we have demonstrated that each drug
class produces distinct, reproducible patterns of functional connectivity reorganization
that correlate with their known pharmacological profiles and behavioral effects.

The opioid investigations revealed a robust connectivity signature characterized by
cortico-subcortical dysconnectivity that strongly correlates with analgesic efficacy
while showing minimal association with respiratory depression or locomotion. This
dissociation between therapeutic and adverse effects through connectivity analysis
represents a significant advance toward developing safer analgesics with improved
therapeutic windows. The demonstration of dose-dependence, temporal dynamics, receptor
specificity, and tolerance development validates the pharmacological relevance of these
connectivity changes and establishes a framework for using @fusi in analgesic drug
development.

The cannabinoid studies revealed biphasic connectivity alterations featuring rapid
cortical-thalamic effects followed by slower hippocampal network reorganization. The
regional specificity of these changes, particularly enhanced hippocampal responsiveness,
aligns well with known @cb1 receptor distribution patterns and provides mechanistic
insights into cannabinoids' cognitive and memory-related effects. The stark contrast
between @thc/@cp\-induced connectivity changes and @cbd's lack of effect demonstrates
@fusi's ability to discriminate between psychoactive and non-psychoactive cannabinoid
compounds.

The psilocybin investigations extended our pharmacological @fusi approach to psychedelic
compounds, revealing dose-dependent alterations in hippocampo-thalamic networks that
were partially sensitive to @fiveht#sub[2A] receptor blockade. While the absence of
lasting connectivity changes contrasts with human neuroimaging findings, these results
highlight important species differences and methodological considerations for
translational psychedelic research.

Critically, the methodological advances developed through these
investigations---including optimized preprocessing pipelines, motion artifact control,
and analytical frameworks---proved essential for isolating genuine
pharmacologically-induced connectivity changes from confounding factors. The denoising
benchmark presented in @ch:denoising provided the foundation for reliably detecting
drug-specific network signatures, without which interpretation of pharmacological
effects would have remained fundamentally compromised.

Beyond immediate pharmacological insights, these studies establish @fusi\-based
connectivity analysis as a valuable tool for drug development and neuropharmacological
screening. The ability to simultaneously measure connectivity patterns, cerebral blood
volume changes, and behavioral responses provides a comprehensive framework for
characterizing compound effects across multiple biological scales. The dose-dependent
nature of observed effects, combined with their correlation with established
pharmacological readouts, demonstrates that @fusi connectivity signatures provide
meaningful biomarkers of drug efficacy and mechanism of action.

The drug-specific nature of connectivity patterns across opioids, cannabinoids, and
psilocybin suggests that @fusi may enable rapid classification of novel compounds based
on their network effects. This capability could prove invaluable for early-stage drug
discovery, particularly for compounds targeting the central nervous system where
traditional screening approaches often fail to predict clinical efficacy.

Several limitations constrain the current findings and point toward future
methodological developments. The reliance on single-slice imaging reduces spatial
coverage of key brain regions, particularly striatal and reward circuits central to many
drug effects. The persistent challenges of disentangling direct pharmacological effects
from secondary behavioral changes highlight the need for more sophisticated analytical
approaches that can model the complex relationships between drug action, behavior, and
network function.

Future directions should prioritize volumetric @fusi approaches combined with more
comprehensive behavioral monitoring to provide fuller characterization of drug effects.
The integration of pharmacokinetic measurements with connectivity analysis, as
demonstrated in the opioid studies, represents a promising approach for understanding
dose-response relationships and optimizing therapeutic dosing strategies. Additionally,
the development of clustering-based analytical methods that leverage @fusi's superior
temporal resolution may reveal drug-induced network dynamics that are obscured by
traditional correlation-based approaches.

The work presented in this chapter establishes pharmacological @fusi as a mature
experimental paradigm capable of generating novel insights into drug mechanisms and
supporting translational neuropharmacology. As the field continues to grapple with the
challenges of developing safer and more effective therapeutics, the comprehensive,
multi-scale characterization capabilities demonstrated here position @fusi as an
essential tool for bridging the gap between molecular mechanisms and clinically relevant
outcomes. The foundation provided by these studies will enable future investigations to
tackle increasingly sophisticated questions about drug action on brain networks and
their therapeutic implications.
