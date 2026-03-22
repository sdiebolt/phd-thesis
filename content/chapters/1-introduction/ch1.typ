#import "@preview/unify:0.7.1": *
#import "/helpers.typ": *
#import "/glossary.typ": *

= Introduction <ch:introduction>

#objective[
  This chapter establishes the necessary context and foundation for understanding the
  methodological and scientific contributions presented in this thesis. We trace the
  historical evolution of neuroimaging techniques leading to #gls("fusi", first: true), examine the
  physiological basis underlying hemodynamic imaging, and provide background on the
  pharmacological systems investigated. This chapter aims to:

  - Review the historical evolution of neuroimaging techniques, from early anatomical
    studies to modern functional imaging.
  - Review @fusi principles, from ultrasound physics to signal processing challenges
    in awake animal preparations.
  - Establish #gls("nvc", first: true) mechanisms that link neuronal activity to vascular responses
    measured by functional neuroimaging.
  - Present functional connectivity concepts and analytical frameworks for measuring
    inter-regional brain relationships.
  - Provide pharmacological background on opioid, cannabinoid, and serotonergic
    systems relevant to this work.
  - Contextualize the emergence of pharmaco-@fusi as a tool for studying drug-induced
    network alterations.

  These concepts situate the contributions of subsequent chapters within the broader
  field of neuroimaging research.
]

== Brain Imaging: Historical Context and Evolution

Neuroimaging, the visualization of the brain's structure and function, has evolved
remarkably since its inception. The journey began with early anatomical studies and
observations of brain injuries, leading to the development of techniques that allowed
for the non-invasive exploration of the living brain. This section traces the historical
milestones that shaped neuroimaging, from ancient observations to the sophisticated
functional neuroimaging technologies of today.

=== Early Efforts to Understand the Brain <sec:early-efforts>

The quest to understand the brain reaches back to antiquity. Hippocrates (460-377 BC),
often referred to as the "Father of Medicine", was among the first to recognize the
brain as the center of sensation and intelligence---rather than the heart, as many of
his contemporaries believed @Panourias2005. Through careful observations of patients
with head injuries, Hippocrates began to correlate specific brain injuries with
particular functional deficits. Already, he noted that patients with head injuries
on the left side of the body often exhibited symptoms on the right side, and vice-versa,
suggesting a lateralization of function that would later be confirmed by modern
neuroscience @Khoshbin2007.

The anatomical foundations of neuroimaging were established during the Renaissance when
Andreas Vesalius (1514-1564) challenged the long-standing anatomical doctrines of Galen
of Pergamon (129-216 AD) through direct observations. His revolutionary work, _De Humani
Corporis Fabrica Libri Septem_ (1543), included detailed illustrations of the brain and
its structures (@fig:vesalius_willis). Although criticized for certain inaccuracies in
the neuroanatomical sections, his detailed illustrations of the brain in _Liber
Septimus_ of _De Fabrica_ marked a crucial step forward in neuroanatomy @Scatliff2013.

A century after Vesalius, Thomas Willis (1621-1675) made landmark contributions to
neuroanatomy in Oxford during the tumultuous period of the English Civil War. Willis's
seminal work _Cerebri Anatome_ (Anatomy of the Brain), published in 1664, established
the concept of neurology and contained detailed descriptions of the brain, spinal cord,
and peripheral and autonomic nervous systems @Molnr2004. With the assistance of
Christopher Wren (1632-1723), who drafted the illustrations, Willis provided
unprecedented insights into cerebral structures (@fig:vesalius_willis). He is perhaps
best known for his description of the arterial circle at the base of the brain (the
"circle of Willis"), which remains eponymous to this day. Unlike previous anatomists,
Willis was particularly interested in correlating brain structure with function. He was
the first to propose that the cerebral cortex was the seat of higher cognitive
functions. Willis based this theory on his observation that the human cortex contained
more gyri and convolutions than those of other animals, which he linked to superior
human intellect @Molnr2004. His insights into the relationship between brain anatomy and
pathology laid the groundwork for modern clinical neuroscience.

#figure(
  placement: auto,
  image("figures/vesalius_willis.png"),
  caption: figure-caption(
    [Early illustrations of the brain.],
    [(*Left*) Brain dissection with dura mater open, Vessels from the arachnoid layer
      are visible on the surface. Adapted from
      #link("https://archive.org/details/gri_33125008502920/page/606/mode/2up")[_De Humani
        Corporis Fabrica Libri Septem_ by Andreas Vesalius]. (*Right*) Base of the human
      brain with nerves and vessels, in particular the circle of Willis. Adapted from
      #link("https://archive.org/details/cerebrianatomecu1666will/page/n39/mode/2up")[_Cerebri
        Anatome_ by Thomas Willis] with illustrations by Christopher Wren.],
  ),
) <fig:vesalius_willis>

The 19#super[th] century saw the emergence of phrenology, developed by Franz Joseph Gall
(1758-1828) in 1796, which attempted to correlate brain function with the shape of the
skull. While phrenology has been discredited as a science, it represented an early
attempt to map brain functions to specific regions. More legitimate progress came in the
19#super[th] century when Paul Broca (1824-1880) identified a region in the left frontal
lobe associated with speech production by studying patients with aphasia. Similarly,
Carl Wernicke (1848-1904) identified another region critical for language comprehension.
These discoveries, based on postmortem examinations of patients with specific deficits,
established the principle of cerebral localization that would later drive functional
neuroimaging @Khoshbin2007.

While Broca and Wernicke were establishing the principle of cerebral localization
through lesion studies, another important contribution to understanding brain function
came from Angelo Mosso (1846-1910), an Italian physiologist who took a different
approach. Rather than relying on postmortem examinations, Mosso developed innovative
methods to study @cbf in relation to mental activity in living subjects @Mosso1881. In
the 1880s, Mosso invented the "human circulation balance", an apparatus that could
detect small shifts in blood distribution when a subject lying on the balanced platform
engaged in mental tasks @Sandrone2013. He observed that the balance would tip toward the
head during cognitive effort, suggesting increased @cbf during mental activity. His work
provided early empirical evidence that brain function was associated with changes in
#ref(<cbf>)---a principle that would become foundational for modern functional
neuroimaging techniques.

#figure(
  placement: auto,
  image("figures/mosso.png"),
  caption: figure-caption(
    [Angelo Mosso's "human circulation balance".],
    [The human circulation balance
      was used to measure @cbf:long changes during cognitive tasks. Adapted from
      @Sandrone2013.
    ],
  ),
)

Building upon Mosso's observations, Charles Roy (1854-1897) and Charles Sherrington
(1857-1952) provided further evidence for the relationship between brain function and
blood flow in their 1890 paper @Roy1890 @Cole2020. Through experiments on anesthetized
animals, they demonstrated that electrical stimulation of sensory nerves lead to an
expansion of the cerebral cortex, corresponding to increases in arterial pressure. This
expansion was typically followed by a decrease in pressure and contraction of the brain.
Roy and Sherrington also made important observations regarding pharmacological
influences on @cbf. In their experiments, they documented that intravenous injection of
caffeine produced a "persistent and well-marked expansion, leaving the brain more
expanded than before the caffeine was injected" @Roy1890. These observations led Roy and
Sherrington to propose their revolutionary hypothesis that "there are two more or less
distinct mechanisms for controlling the cerebral circulation, viz.---firstly, an
intrinsic one by which the blood-supply of various parts of the brain can be varied
locally in accordance with local requirements, and secondly, an extrinsic, viz.---the
vasomotor nervous system, whose action affects the amount of blood passing through the
brain in virtue of the dependence of the latter circulation on the general arterial
blood-pressure" @Roy1890. This idea of #gls-long("nvc")---that is, that there exist a link
between neuronal activity and blood flow---was a significant step forward in
understanding the physiological basis of brain function.

#figure(
  placement: auto,
  image("figures/roy.png"),
  caption: figure-caption(
    [Correspondence of brain expansion and arterial pressure studies by Charles Roy and
      Charles Sherrington.],
    [Relationship between brain expansion (oncograph) and
      arterial pressure (kymograph) during electrical stimulation of the sciatic nerve
      (*left*) or mechanical stimulation of the lingual nerve (*right*). Adapted from
      @Roy1890.],
  ),
)

During this period, the brain could only be visualized directly through postmortem
examination or during surgery. Physicians relied on indirect methods to assess brain
function, such as observing behavioral changes after injury or disease. The challenge of
visualizing the living brain remained insurmountable until the dawn of modern
neuroimaging technologies.

=== The Birth of Modern Neuroimaging <sec:birth_modern_neuroimaging>

The birth of modern medical imaging can be traced to Wilhelm Conrad Röntgen's
(1845-1923) discovery of X-rays in 1895 @Rntgen1896. This revolutionary finding allowed
physicians to visualize internal body structures non-invasively for the first time.
However, this discovery alone did not immediately lead to neuroimaging applications, as
the brain is encased within the skull---a strong X-ray absorber---and consists primarily
of soft tissue that is relatively transparent to X-rays. Thus, conventional radiography
had limited utility for neuroimaging purposes.

#figure(
  placement: auto,
  image("figures/roentgen.png", width: 50%),
  caption: figure-caption(
    [The first X-ray image.],
    [The first X-ray image of a human hand, taken by Wilhelm
      Röntgen in 1895. The image shows the bones of the hand and the ring worn by
      Röntgen's wife. Adapted from @Rntgen1896.],
  ),
)

To overcome these limitations, Walter Dandy (1886-1946) developed ventriculography in
1918 and pneumoencephalography in 1919 @DANDY1918 @DANDY1919. These techniques involved
injecting air into the @csf to create contrast within the ventricular system,
allowing visualization of brain structures and pathologies affecting them
(@fig:dandy). While these procedures provided strong clinical value, they were
unfortunately painful and carried significant risks, including infection and
haemorrhages @Moseley1976. Additionally, they provided limited information about
the brain tissue itself, as they primarily focused on the ventricular system and
surrounding structures.

#figure(
  placement: auto,
  image("figures/dandy.png"),
  caption: figure-caption(
    [Early ventriculogram and pneumoencephalogram.],
    [(*Left*) Ventriculogram of a
      twelve-year-old patient with hydroencephalus and a large cerebellar tumor removed.
      Adapted from @DANDY1918. (*Right*) Pneumoencephalogram in a normal brain. The sulci
      and cisterna are more visible than in the ventriculogram. Adapted from @DANDY1919.],
  ),
) <fig:dandy>

A significant advance came in 1927 when Egas Moniz (1874-1955) introduced cerebral
angiography, a technique that involved injecting a contrast agent---sodium iodide---into
the carotid artery to visualize cerebral blood vessels on X-ray images @Moniz1927
(@fig:moniz). While initially risky, this procedure revolutionized the diagnosis of
vascular lesions, such as aneurysms and arteriovenous malformations, and certain brain
tumors that altered normal vascular patterns.

#figure(
  placement: auto,
  image("figures/moniz.png"),
  caption: figure-caption(
    [Cerebral angiographies for diagnosis of brain tumors.],
    [Injection of sodium iodide
      in the carotid artery lead to the first diagnosis of intracranial pathologies using
      cerebral angiographies. The left angriography shows a normal brain, while a frontal
      lobe tumor is visible on the right angiography. Adapted from @Moniz1934.],
  ),
) <fig:moniz>

In 1948, George Moore (1920-2008) recognized that radioactive tracers could be used to
detect brain tumors @Moore1948. His discovery that radioactive diiodofluorescein
accumulated in tumors allowed their detection using external radiation
counters---referred to as "gamma cameras" in this context. This basic principle would
be refined a few years later into techniques like @spect and @pet @Khoshbin2007.

Parallel to these developments, Hans Berger (1873-1941) recorded the first human @eeg in
1924 @Berger1929. While not an imaging technique in the traditional sense, @eeg provided
the first real-time visualization of brain activity by recording electrical
potentials from the scalp (@fig:eeg). This breakthrough enabled the study of brain
function in healthy individuals and those with neurological disorders, particularly
epilepsy, and established the foundation for modern electrophysiological techniques.

#figure(
  placement: auto,
  image("figures/eeg.png"),
  caption: figure-caption(
    [One of the first @eeg:short recordings.],
    [(*Top*) @eeg recorded by Hans Berger on a
      15-year-old boy. (*Bottom*) 10 Hertz frequency reference. Adapted from
      @Berger1929.],
  ),
) <fig:eeg>

=== The Tomographic Revolution

The landscape of neuroimaging was fundamentally transformed in the early 1970s with the
development of @ct by Godfrey Hounsfield (1919-2004) and Allan MacLeod Cormack
(1924-1998), who shared the 1979 Nobel Prize in Physiology or Medicine for this
invention @Cormack1963 @Hounsfield1973 @Ambrose1973. The first clinical @ct scanner was
installed at Atkinson Morley's Hospital in London in 1971, producing the first brain
scan of a patient with a frontal lobe tumor (@fig:ct).

#figure(
  placement: auto,
  image("figures/ct.png"),
  caption: figure-caption(
    [The first clinical @ct:short scans.],
    [One of the first clinical @ct scan of the brain. A
      cystic craniopharyngioma is visible as a dark blob, with a locule extending into the
      left frontal lobe. Adapted from @Ambrose1973.],
  ),
) <fig:ct>

@ct scanning overcame the limitations of conventional X-rays by taking multiple
cross-sectional images from different angles and using computer algorithms to
reconstruct detailed images of internal structures. This revolutionary technique
provided unprecedented images of the brain's structure, allowing physicians to identify
tumors, hemorrhages, infarcts, and other pathologies without invasive procedures. The
impact was immediate and dramatic; pneumoencephalography rapidly became obsolete, and
the diagnosis and management of neurological disorders were transformed.

Concurrently, the basis for functional neuroimaging emerged with the refinement of
@spect and @pet in the 1970s @Davis2020. These nuclear medicine techniques use
radioactive tracers to map physiological processes like glucose metabolism, blood flow,
and neurotransmitter activity (@fig:pet). But as we'll see later, @pet in particular
emerged as a powerful tool for research into brain function, later allowing scientists
to correlate cognitive tasks with regional changes in metabolism or blood flow.

#figure(
  placement: auto,
  image("figures/pet.png"),
  caption: figure-caption(
    [Early positron imaging of the brain.],
    [(*Left*) Coincidence and unbalance scans of a
      patient showing a recurrent brain tumor under a previous operation site. These scans
      were obtained using the first clinical positron imaging device. Adapted from
      @Brownell1953. (*Right*) @pet image of the brain, with two tomographic slices. A
      tumor is visible on the lower transverse slice. Adapted from @Brownell1999.],
  ),
) <fig:pet>

=== Magnetic Resonance Imaging

While @ct represented a massive leap forward, @mri, developed in the 1970s, offered even
greater advantages for neuroimaging. Unlike @ct, which uses ionizing radiation, @mri
employs strong magnetic fields and radio waves to generate images based on the behavior
of hydrogen atoms in tissues (@fig:mri). The technique was developed through the
contributions of multiple scientists, including Paul Lauterbur and Peter Mansfield, who
received the 2003 Nobel Prize for their work @Lauterbur1973 @Mansfield1977.

#figure(
  placement: auto,
  image("figures/mri.png", width: 60%),
  caption: figure-caption(
    [The first @mri:short image of the brain.],
    [First @mri image of a human brain by Ian
      Robert Young and Hugh Clow. The eyes and ventricles are visible. Adapted from
      @Young1978.],
  ),
) <fig:mri>

@mri provided superior soft tissue contrast compared to @ct, allowing better
differentiation between gray and white matter, visualization of subtle abnormalities,
and multiplanar imaging capabilities. These advantages made @mri the preferred modality
for many neurological conditions, particularly those affecting the brain's soft tissues.
Over time, innovations like @dwi and @mrs expanded @mri's capabilities to provide
information about tissue microstructure and biochemistry.

=== The Functional Imaging Era <sec:functional-imaging-era>

The late 20#super[th] century ushered in a revolution in brain imaging, allowing researchers to
move beyond purely structural assessments and into visualizing the functioning brain.
This transition from static anatomical images to dynamic functional maps represented a
paradigm shift that continues to shape our understanding of brain-behavior
relationships.

==== Electroencephalography

As detailed in @sec:birth_modern_neuroimaging, #gls("eeg", first: true) might arguably represent the
oldest functional neuroimaging method still in use today, dating back to Hans Berger's
first human recordings in 1924 @Berger1929. By recording electrical potentials from
electrodes placed on the scalp, @eeg directly measures the summation of postsynaptic
potentials of cortical pyramidal neurons @Lenartowicz2010. A few years later, Pauline
(1896-1942) and Hallowell Davis (1896-1992) achieved the first human #gls("erp", first: true)
recordings by averaging @eeg traces across responses induced by auditory stimulation
@Davis1939a @Davis1939b. While early @erp research focused primarily on sensory-evoked
potentials, the technique has since expanded to study a wide range of cognitive
processes, including attention and memory @Luck2017 (@fig:erp).

#figure(
  placement: auto,
  image("figures/erp.png"),
  caption: figure-caption(
    [Example @eeg:short/@erp:short experiment.],
    [(*A*) @eeg electrode locations on the scalp.
      (*B*) @eeg traces from the Pz electrode in an experiment where a patient was
      presented with either the letter X or O, the latter being presented less frequently.
      Dashed lines show the onset of the stimulus, and rectangles indicate epochs of @eeg
      data time-locked to the stimulus. (*C*) Averaged @erp waveforms from the Pz
      electrode for both X and O letters. Time 0 corresponds to the stimulus onset. (*D*)
      Spatial distribution of voltage on the scalp near the peak of the P3 wave (400
      milliseconds after stimulus onset) in the averaged @erp waveforms shown in (*C*).
      Adapted from @Luck2017.],
  ),
) <fig:erp>

@eeg offers several significant advantages as a neuroimaging technique. Its most
valuable characteristic is its exceptional temporal resolution on the order of 1
millisecond or better, allowing researchers to measure neuronal activity in real-time
with excellent precision. This makes @eeg particularly valuable for studying the rapid
sequence of cognitive processes and determining exactly when the brain differentiates
between conditions. @eeg is also relatively inexpensive, has fewer contraindications,
and is more tolerant of subject movement than other neuroimaging modalities. This
accessibility has enabled @eeg research across diverse populations including infants,
clinical patients, and other groups who may have difficulty remaining still during
lengthy imaging procedures. However, despite excellent temporal precision, @eeg's
spatial resolution---several centimeters---remains limited due to the difficulty of
locating areas activated by a given response. Additionally, @eeg primarily detects
activity from cortical regions with limited sensitivity to deeper structures @Cole2020.

==== Magnetoencephalography

While @eeg had provided temporal insights into brain function since the 1920s, the
development of @meg in the late 1960s and early 1970s offered new capabilities. David
Cohen performed the first @meg recordings in 1968, measuring the magnetic fields
produced by the same neuronal currents that generate @eeg signals using a copper
induction coil as a detector @Cohen1968 (@fig:meg_first). However, it wasn't until the
introduction of @squid:pl that @meg became practically viable for research and clinical
applications. Indeed, @meg requires highly sensitive magnetometers to detect the
extremely weak magnetic fields produced by the brain, which are on the order of
#num("e-14") Tesla---approximately a billion times weaker than the Earth's magnetic
field. The main technical challenge of @meg is thus to isolate these weak brain
signals from environmental noise.

#figure(
  placement: auto,
  image("figures/meg.jpg"),
  caption: figure-caption(
    [First @meg:short recording using a @squid:short by David Cohen in 1971.],
    [During the
      acquisition, the subject closed their eyes, resulting in a very noticeable alpha
      rhythm. Adapted from @Cohen2004.],
  ),
) <fig:meg_first>

Recent advances have introduced alternative technologies such as @opm:pl, which operate
at room temperature and can be positioned closer to the scalp, increasing signal
detection capabilities. @opm\-@meg systems offer several advantages over traditional
@squid\-@meg, including wearability, compactness, shorter detection distance, and the
ability to accommodate subject movement during scanning @Yang2024.

Like @eeg, @meg offers excellent temporal resolution (on the order of milliseconds), but
provides improved spatial resolution (on the order of one millimeter) and better
localization due to magnetic fields being less distorted by the skull and scalp than
electrical potentials (@fig:meg_recent). However, @meg is generally only sensitive to
sources located in the brain sulci, where the orientation of neuronal currents is
parallel to the skull surface---and therefore the magnetic field is entering and leaving
the skull. In contrast, @eeg is sensitive to sources located in both the sulci and the
top of the gyri @Cohen1983.

#figure(
  placement: auto,
  image("figures/meg_recent.jpg", width: 100%),
  caption: figure-caption(
    [Detection of an epileptic spike using @meg:short.],
    [(*A.*) @meg traces with an epileptic
      spike marked with orange and red arrows. (*B.*) Sources of the epileptic spike
      overlaid on a structural @mri image. Adapted from @Khan2014.],
  ),
) <fig:meg_recent>

Despite technological advances, limitations remain, including substantial cost,
technical complexity, and the requirement for specialized magnetically shielded rooms.
Nevertheless, @meg has proven valuable for mapping sensory and motor cortices,
investigating language processing, and studying oscillatory brain activity across
various cognitive domains @Yang2024.

==== Invasive Electrophysiological Recording

While non-invasive techniques like @eeg and @meg provided valuable insights into brain
function, the quest for higher resolution neuronal signals led to the development of
invasive electrophysiological recording methods. Although electrical recordings from
nerves and muscles date back to the 18#super[th] century @Galvani1791, the foundations for
modern invasive recording were established in 1957 when David Hubel (1926-2013)
developed tungsten electrodes capable of recording from individual neurons in mammalian
brains @Hubel1957. This breakthrough, along with his subsequent work with Torsten Wiesel
(born 1924) on visual cortex organization @Hubel1962, demonstrated the unprecedented
detail that could be achieved by placing electrodes directly within neuronal tissue.

Invasive electrophysiological recording encompasses several complementary techniques
that capture neuronal activity at different scales. Single-unit activity (@sua) records
action potentials from individual neurons, providing the highest resolution view of
neuronal computation at the cellular level. Multi-unit activity (@mua) captures the
collective spiking activity of small populations of neurons near the electrode tip,
offering insights into local network dynamics. Local field potentials (@lfp) measure the
summed synaptic activity and slow oscillations from larger neuronal populations,
typically in frequency bands below 300 Hz. Finally, electrocorticography (@ecog) employs
electrode arrays placed directly on the cortical surface, recording population-level
electrical activity with superior spatial resolution compared to scalp @eeg
@Chaudhary2025 (@fig:invasive_electrophy).

#figure(
  placement: auto,
  image("figures/invasive_electrophy.png"),
  caption: figure-caption(
    [Brain signals recorded using non-invasive and invasive electrophysiological
      techniques.],
    [@meg uses magnetometers to record magnetic fields that travel through the skull and
      scalp. @eeg uses electrodes placed on the scalp to record electrical potentials
      from the brain. @ecog uses electrodes placed directly on the cortical surface to
      record electrical activity from the brain. @lfp measures local field potentials
      from a small population of neurons, while @sua and @mua measure action potentials
      from individual neurons or small groups of neurons, respectively. Vectorized head
      courtesy of NIAID.],
  ),
) <fig:invasive_electrophy>

These invasive techniques offer several critical advantages over their non-invasive
counterparts. Most notably, they allow direct measurement of neuronal activity without
proxy---unlike modalities that rely on the #gls-long("nvc")---, enabling researchers to
directly observe the rapid dynamics of neuronal computation. The proximity to neuronal
sources dramatically improves signal-to-noise ratios and allows access to high-frequency
neuronal signals that are otherwise attenuated by tissues in non-invasive recordings.

Recent advances in invasive electrophysiology have significantly expanded applications
across clinical, research, and technological domains. In epilepsy treatment, @ecog now
enables accurate cortical function mapping during surgery and supports resective
interventions @Cometa2022. Moreover, high-frequency oscillations recorded via @ecog have
emerged as promising biomarkers for refining surgical targets, particularly in pediatric
cases @Klooster2015. These applications have extended to oncological settings, where
@ecog monitoring during glioma surgery helps evaluate abnormal excitability around
tumors @NCT04497142. Invasive recordings from pharmacoresistant epilepsy patients have
also revolutionized basic neuroscience by providing unprecedented access to human
cognition at cellular and network levels. These recordings have advanced understanding
of memory, attention, and decision-making through broadband population activity and
high-gamma oscillations @Helfrich2022. Animal studies have complemented this research,
with sophisticated recording arrays revealing neuronal dynamics underlying complex
behaviors @Palma2022. Finally, integration with advanced computational approaches has
driven remarkable progress in brain-machine interface technology. High-density
intracortical arrays and hybrid electrode designs now enable simultaneous recording of
spiking activity and field potentials, improving decoding accuracy and paving the way
for long-term, clinically viable neuroprosthetic systems @MllerPutz2021.

However, the invasive nature of these techniques presents significant limitations. In
humans, their application is primarily restricted to clinical settings where surgical
access is already warranted, such as during epilepsy monitoring or brain tumor
resection. This constraint limits the populations that can be studied and the types of
experimental paradigms that are feasible. Additionally, the surgical implantation
carries inherent risks and ethical considerations that must be carefully weighed against
potential scientific or clinical benefits.

Despite these limitations, invasive electrophysiological recording continues to bridge
fundamental neuroscience with clinical applications, offering unique insights into brain
function that complement findings from non-invasive neuroimaging methods. The
exceptional temporal and spatial resolution of these techniques remains unmatched for
understanding neuronal mechanisms at the scale most relevant to computation and
pathology.

==== Single Photon Emission Computed Tomography and Positron Emission Tomography

Following the work of George Moore (see @sec:birth_modern_neuroimaging), #gls("spect", first: true)
was among the first imaging modalities that relied on detecting emissions from
radioactive isotopes injected into the bloodstream. While the first @spect system was
described by David Khul (1929-2017) and Roy Edwards in 1963 @Kuhl1963, initial
limitations in the technology's performance limited its adoption. Fortunately,
technological advances in the 1970s and 1980s made @spect more clinically viable,
evolving into the @spect systems used today @Hutton2013. @spect is based on the
detection of single photon emissions from radioisotopes like #super[123]I and
#super[99m]Tc using gamma cameras. @spect isotopes have been primarily developed to
measure @cbf, allowing for the detection of changes in blood flow patterns associated
with various conditions, such as stroke or cognitive processes.

@pet builds on the same principles by using positron-emitting radionuclides. The
development of @pet began in the early 1950s with the work of Wrenn, Good, and Handler
@Wrenn1951. The technique was further refined by many groups of investigators, leading
to the first multislice cylindrical array @pet scanner, the PETT (the first "T", for
transaxial, was later dropped), developed by Ter-Pogossian and colleagues
@TerPogossian1975. @pet can use isotopes to measure @cbf (for example, #super[15]O) and
@cbv (for example, #super[11]CO), but also physiological processes such as glucose
metabolism (for example, #super[18]F) @Lenartowicz2010. Compared to @spect, @pet offers
higher sensitivity and spatial resolution while providing quantitative data on metabolic
processes and receptor binding. However, @pet requires an on-site cyclotron for the
production of its short-lived isotopes, while @spect uses isotopes that are more readily
available @Prasad2019.

Both @spect and @pet introduced the ability to probe molecular and metabolic processes
in the living brain, providing insights that were previously inaccessible through
electrophysiological means. However, these techniques are limited by their reliance on
radioactive tracers that expose patients to ionizing radiation, limiting their utility
for repeated measurements in both research and clinical scenarios @Lenartowicz2010.
Additionally, their relatively low spatial resolution---on the order of 1 to 10
millimeters---and their poor temporal resolution---on the order of seconds to
minutes---limited their ability to capture rapid changes in brain activity compared to
later methods @Cole2020. Despire these drawbacks, both @spect and @pet remain powerful
tools in the evaluation of various neurological conditions (@fig:newberg_tsujikawa).

#figure(
  placement: auto,
  image("figures/newberg_tsujikawa.png"),
  caption: figure-caption(
    [Recent uses of @spect:short and @pet:short in functional neuroimaging.],
    [(*A.*) _@spect:short used to assess the distribution of @cbf in the brain._
      Technetium #super[99m]Tc bicisate was injected intravenously to two patients (top
      and bottom rows) with postoperative dental pain for #gls("cbf", first: true) imaging. (_Top row_)
      After receiving ketorolac for pain relief, the first patient showed a decrease @cbf
      in the anterior cingulate cortex (_arrow_). (_Bottom row_) In contrast, the second
      patient received a placebo and showed an increase in anterior cingular @cbf
      (_arrow_) associated with worserning pain. Adapted from @Newberg2011. (*B.*)
      _@pet:short used to assess the distribution of #gls("cb1", first: true) in the brain._ A patient
      was injected with #super[11]C-SD5024, a @cb1 ligand that allows mapping the
      distribution of @cb1 in the brain. Baseline @mri and dynamic @pet images are shown
      across several time points after injection. Adapted from @Tsujikawa2014.],
  ),
) <fig:newberg_tsujikawa>

==== Functional Magnetic Resonance Imaging

A transformative development in functional neuroimaging came in the early 1990s with the
advent of @fmri. The technique emerged from John Belliveau (1959-2014) and colleagues'
landmark study which demonstrated that task activation could be detected in humans using
@mri and intravascular contrast agents @Belliveau1991. However, this approach still
suffered from the limitation of requiring the injection of a contrast agent, which was
not ideal for repeated measurements. The breakthrough came when Seiji Ogawa (born 1934)
and colleagues discovered that deoxyhemoglobin's paramagnetic properties could serve as
an endogenous contrast agent for @mri, creating what became known as the @bold signal
@Ogawa1990. Like @cbf measuring isotopes used in @pet, the @bold signal capitalized on
the @nvc:long first observed by Angelo Mosso and later refined by Charles Roy and
Charles Sherrington---the relationship between neuronal activity and localized changes
in @cbf (@sec:neurovascular-coupling). Only one year after Belliveau and colleagues'
study, three groups published articles demonstrating the feasibility of using @mri to
detect changes in the @bold signal associated with neuronal activity @Ogawa1992 @Kwong1992
@Bandettini1992 (@fig:kwong1992). This pioneering work laid the foundation for the rapid
development of @fmri as the gold-standard technique for functional neuroimaging.

#figure(
  placement: auto,
  image("figures/kwong1992.png"),
  caption: figure-caption(
    [Early @bold:short\-@fmri:short study of visual stimulation by Kwong and colleagues.],
    [(*Left*) Baseline and difference @mri images during darkness (OFF) or photic
      stimulation (ON). @bold:short signal changes are visible in the occipital lobe
      during visual stimulation. (*Right*) @bold signal changes in a @roi:long within
      the visual cortex visual stimulation. Times courses are shown for the IR (flow
      sensitive) and GE (oxygenation sensitive) techniques. Adapted from @Kwong1992.],
  ),
) <fig:kwong1992>

The ability to detect task-related changes in neuronal activity rapidly led to
groundbreaking studies mapping functional specialization in the human brain
@Kanwisher2010 @Fiebelkorn2020. Equally significant was the discovery that spontaneous
fluctuations in the @bold signal during rest revealed intrinsic correlations between
distributed brain regions, giving rise to resting-state @fmri as a powerful tool for
investigating brain networks @Biswal1995 @Raichle2001 @Fox2007 @Buckner2013
(@fig:buckner2013).

#figure(
  placement: auto,
  image("figures/buckner2013.png", width: 60%),
  caption: figure-caption(
    [#Glspl("rsn", first: true) identified using @fmri:short.],
    [@fmri can be used to identify networks of correlated brain regions during
      rest---see @sec:understanding-functional-connectivity for more details. Each map has been
      computed from the data of 1000 subjects, and assigned a label that corresponds to
      the common name of the network found in the literature. Adapted from
      @Buckner2013.],
  ),
) <fig:buckner2013>

Unlike @pet, @fmri offers relatively high spatial resolution combined with reasonable
temporal resolution, without requiring radioactive tracers. At conventional field
strengths (#qty(1.5, "T") and #qty(3, "T")), @fmri studies typically achieve spatial
resolutions of about #qtyrange(1, 3, "mm") with @tr:pl of #qtyrange(1, 3, "s"). On the
other hand, @fmri at ultra-high field strengths (#qty(7, "T") and above) can routinely
be pushed to submillimeter levels (around #qty(0.75, "mm") or better) with potential
temporal resolutions ranging from typical @tr:pl of a few seconds in high-resolution
protocols to sub-second @tr:pl when employing accelerated methods @Markuerkiaga2021
@Sorger2020 @Feinberg2018.

Despite its advantages, several limitations constrain @fmri's utility. The @bold signal
represents an indirect measure of neuronal activity, mediated by a complex coupling
process between neuronal activity and its corresponding vascular response
@Logothetis2001. This hemodynamic response is inherently slow, typically peaking several
seconds after neuronal activation, which limits @fmri\'s temporal resolution relative to
electrophysiological methods. Additionally, @fmri is sensitive to a range of artifacts
including motion, susceptibility distortions near air-tissue interfaces, and variations
in physiological factors such as heart rate and respiration @Geuter2017.

==== Optical Imaging Methods

Optical imaging has a long history in the field of neuroscience, dating back to the work
of Ramón y Cajal (1852-1934) and his pioneering use of silver staining techniques to
visualize neuronal structures in the brain (@fig:cajal). Nowadays, optical imaging
encompasses a wide range of techniques that leverage light interactions with biological
tissues to visualize structure and function. Notably, these methods span the
translational spectrum from preclinical animal models to human applications, offering
complementary advantages to established neuroimaging modalities like @fmri, @pet, and
@eeg.

#figure(
  placement: auto,
  image("figures/cajal.png"),
  caption: figure-caption(
    [Drawings of neurons by the father of modern neuroscience, Ramón y Cajal.],
    [(*Left*) A Purkinje neuron from the human cerebellum. (*Middle*) A pyramidal neuron
      from the human cerebral cortex. (*Right*) Glial cells from the cerebral cortex of a
      child. Reproduced with permission from Legado Cajal-CSIC.],
  ),
) <fig:cajal>

In preclinical animal research, calcium imaging represents one of the most established
optical approaches, using calcium-sensitive fluorophores to directly report neuronal
activity @Weisenburger2018 (@fig:twop). Advanced viral transduction and genetic
targeting allow cell-type-specific recordings with high spatiotemporal precision. To
visualize this activity at microscopic scales, multiphoton microscopy has become
instrumental. @Twop microscopy employs near-infrared excitation to induce
simultaneous absorption of two photons, enabling imaging at cellular resolution in
cortical tissue while minimizing photodamage. @Threep microscopy extends these
capabilities deeper into tissue, reaching subcortical structures with greater
penetration though requiring more complex instrumentation @Markicevic2021.

For capturing activity across larger cortical areas, widefield epifluorescence imaging
offers another modality for high temporal resolution monitoring of both calcium signals
and hemodynamic responses. Though limited to superficial layers, this approach allows
visualization of neuronal activity and blood flow dynamics across the entire cortical
surface @Markicevic2021. Widefield techniques include @iosi and @lsi for hemodynamic
monitoring, @sfdi for quantitative tissue characterization, and calcium imaging for
direct neuronal activity measurement. Meanwhile, emerging techniques like photoacoustic
imaging bridge the gap between high-resolution microscopy and whole-brain imaging by
combining optical excitation with ultrasonic detection, achieving deeper penetration
while maintaining image contrast @Razansky2021.

#figure(
  placement: auto,
  image("figures/twop.png"),
  caption: figure-caption(
    [Example widefield, two-photon, and three-photon microscopy images.],
    [(*A*) Widefield calcium imaging setup for awake mice. An example image shows the
      resulting widefield fluorescence signal from the from the dorsal cortex. Corresponding
      brain regions are shown on the right. (*B*) Three example images of fluorescence
      changes corresponding to cortical activity during behavior. Time series of
      fluorescence changes are shown on the bottom for the three pixels indicated by
      asterisks in the first image. Grey dashed lines indicate the time at which each image
      was taken. Adapted from @Ren2021. (*C*) Diffence in @snr between @twop and @threep
      imaging relative to depth in the mouse brain. Adapted from @Prevedel2025.],
  ),
) <fig:twop>

The drive toward imaging in naturalistic behaviors has led to miniaturized head-mounted
optical devices, allowing functional imaging in freely moving animals @Chen2022. These
wearable systems facilitate the study of neuronal circuit dynamics during natural
behaviors while preserving high spatial resolution. In many cases, optical imaging
modalities are integrated with complementary techniques like electrophysiology or
optogenetics, enabling simultaneous recording and manipulation of neuronal circuits
@Markicevic2021.

In human neuroimaging, @fnirs has emerged as the dominant optical technique. @Fnirs
leverages near-infrared light to measure changes in oxy- and deoxy-hemoglobin
concentrations in cortical tissue, providing indirect measures of neuronal activity.
Early foundational work by Frans Jöbsis (1929-2006) paved the way for @fnirs development
@Jobsis1977, which has since evolved into more sophisticated approaches @Ayaz2022.
Initial systems provided only basic measurements of hemodynamic responses by tracking
hemoglobin oxygenation changes. Modern high-density @dot systems now enable retinotopic
mapping and other functional analyses with spatial resolutions approaching those of
@fmri in certain cortical areas @Zeff2007 (@fig:zeff2007). Integration with other
modalities, such as @eeg and @fmri, along with advances in probe design have enhanced
capabilities for naturalistic and continuous recording @Cutini2012.

#figure(
  placement: auto,
  image("figures/zeff2007.png"),
  caption: figure-caption(
    [Retinotopic mapping of the visual cortex with high-density @dot:short.],
    [(*A left*) Schematic of the @dot imaging system, with @led:pl in red and photodiode
      detectors in blue. (*A right*) Placement of the @dot imaging grid on the scalp over the
      visual cortex. (*B*) Schematic of a coronal activation image recorded from the
      visual cortex. Visual stimuli were presented as black-and-white radial grids on a
      gray background. (*C*) Axial image slice of a cortical activation. Coronal images
      shown correspond to the dotted area. (*D*) Activation images showing the temporal
      response of the #glspl("dhbo2", first: true). The stimulus occurred between 0 and
      10 seconds. (*E*) Functional activation time courses for nine stimuli (@dhbo2: red;
      @dhbr: blue; @dhbt: green). (*F*) Functional mapping of the cortical responses to
      different polar angles of the visual stimulus. Adapted from @Zeff2007.],
  ),
) <fig:zeff2007>

Despite their considerable advantages, optical imaging methods face common limitations
across both animal and human applications. Light scattering and absorption in biological
tissue restrict penetration depth, generally limiting direct measurements to cortical
regions. In animal models, imaging deeper structures often requires invasive
preparations such as cranial windows, while in humans, extracerebral contamination from
scalp and skull necessitates advanced signal processing. Similarly, the @snr:pl of fast
optical signals can be limited, sometimes requiring signal averaging for reliable
measurement @Hillman2007.

Nevertheless, optical imaging techniques occupy a valuable position in the
neuroscientific toolkit by offering unique combinations of spatial and temporal
resolution. In animal research, they provide unprecedented cellular-resolution access to
neuronal activity in living subjects. In human applications, they enable portable,
cost-effective functional neuroimaging in diverse populations and settings. As
instrumentation advances and computational methods improve, these techniques will
continue to enhance our understanding of neuronal function across species, providing
critical insights that complement those obtained through other neuroimaging approaches.

==== Functional Ultrasound Imaging <sec:fusi-history>

#Gls("fusi", first: true)#footnote[You may encounter two acronyms for @fusi:long in the literature:
  fUS and fUSI. The technology was originally introduced using the former acronym.
  However, following a community vote at the fUSbrain \#DAYS 2025 conference, a majority
  adopted the @fusi acronym, which is now the preferred terminology.] is the most recent
addition to the family of functional neuroimaging modalities, building upon decades of
advances in ultrasound technology. @fusi is based on ultrasonography---also known as
echography---, a widely used medical imaging technique since the 1950s (@fig:life1954)
that uses high-frequency sound waves to create images of internal structures. However,
ultrasonography's application to functional neuroimaging remained limited for many years
due to its insufficient sensitivity to detect the subtle blood flow changes associated
with brain activity---the @nvc:long, upon which @fmri, @pet, and @fnirs also rely
(@sec:neurovascular-coupling).

#figure(
  placement: auto,
  image("figures/life1954.png"),
  caption: figure-caption(
    [The "Somascope", an early ultrasonography system],
    [(*Left*) Dr. Douglass Howry's (1920-1969) "Somascope" system, which was developed
      to image the human body using ultrasound. A patient is immersed in a water bath, and
      an image of its kidney is displayed on the oscilloscope screen. (*Right*) Leg of a
      mutton pierced by several spikes of different materials. The Somascope image on the
      bottom shows a cross-section of the mutton leg, with all four spikes and a belt of
      fatty tissue visible. Adapted from @Life1954.],
  ),
) <fig:life1954>

Early attempts at functional brain activity assessments with ultrasound were made
possible in the 1980s, when Rune Aaslid (born 1943) and colleagues demonstrated the use
of noninvasive #gls("tcd", first: true) to measure blood flow velocity in the basal cerebral arteries
@Aaslid1982. This pioneering work laid the foundation for the rapid development of @ftcd
as a functional neuroimaging tool @Gomez1990 @Njemanze1991 @Kelley1992 @Hartje1994
@Hartje1994 @Knecht1996 @Deppe1997. However, while @ftcd is useful for some brain
activity assessments, such as evaluating the lateralization of cognitive functions
(@fig:knecht1996), it is limited to the vascular territory of the insonified artery.
Thus, @ftcd recordings of @cbf velocities are very far from the fine-grained spatial
mapping that techniques like @fmri, @pet, and @fnirs can provide @Jansen2004.

#figure(
  placement: auto,
  image("figures/knecht1996.png"),
  caption: figure-caption(
    [Experimental @ftcd:short setup to assess language lateralization.],
    [A patient is presented with a letter on a computer screen and asked to find four
      words starting with that letter. A commercially available @ftcd system is used to
      record @cbf velocities from both @mca:pl. Averaging across stimulus trials allows
      identification of the pattern of @cbf velocity increase and differentiation
      between hemispheres. Adapted from @Knecht1996.],
  ),
) <fig:knecht1996>

A transformative breakthrough came in the late 1970s with the introduction of ultrafast
ultrasound imaging, allowing for a dramatic increase in frame rates from the standard 50
frames per second to thousands of frames per second @Bruneel1977. Following this initial
development, 30 years of research led by several groups culminated in the 2000s with the
release of the first commercially available ultrafast ultrasound imaging system---the
Aixplorer, by Supersonic Imagine. The increase in temporal resolution enabled by these
ultrafast systems allowed for the detection of @cbf velocities previously undetectable
with conventional ultrasound imaging techniques @Tanter2014.

In 2011, Émilie Macé and colleagues used an Aixplorer system to demonstrate that
ultrafast Doppler ultrasound could detect changes in @cbf during whisker stimulation in
rats @Mac2011. This landmark study marked the birth of @fusi as a full-fledged
neuroimaging technique. Since then, @fusi has undergone rapid development, with
advancements in imaging hardware, software, and the introduction of 3D volumetric
imaging @Demene2015 @Rabut2019 @Brunner2020 @Bertolo2023. These advancements have
expanded its applications from anesthetized animals to awake, behaving subjects across
multiple species, including rodents, nonhuman primates, and humans @Montaldo2022
(@fig:fusi). @fusi has been used to investigate a wide range of topics, including the
mapping of functional brain networks @Ferrier2020, the study of @nvc:long
@Tournissac2022, and the assessment of brain activity during cognitive tasks
@Dizeux2019.

#figure(
  placement: auto,
  image("figures/montaldo2022.png"),
  caption: figure-caption(
    [Example applications of @fusi:short.],
    [(*A*) Whole-brain activity in head-fixed mice during
      visuomotor reflexes, showing 3D (left) and coronal (right) views. (*B*) Brain activity
      in a freely moving rat, displayed as peak cross-correlation maps between rat speed and
      @fusi signals across two brain planes. (*C*) Deep cortical activity in macaques
      performing memory-guided motor tasks, highlighting regions with higher activation for
      contralateral vs. ipsilateral targets. (*D*) Noninvasive bedside imaging of neonatal
      brain through the fontanelle, showing 3D vascular reconstruction and intrinsic
      correlation maps. Adapted from @Montaldo2022.
    ],
  ),
) <fig:fusi>

In @fusi, the signal is proportional to the #gls("cbv", first: true) and increases when vasodilation
occurs in response to neuronal activity. Its spatial resolution varies depending on the
frequency of the ultrasound waves used: lower frequencies provide better penetration at
the cost of spatial resolution, and vice versa. @fusi typically operates at frequencies
ranging from #qty(5, "MHz") in humans to #qty(15, "MHz") in rodents, thus allowing for
spatial resolutions ranging from #qty(300, "um") to #qty(100, "um") respectively. Its
temporal resolution is on the order of #qtyrange(0.1, 1, "s") and it is typically
sensitive to blood flow velocities as slow as #qty(1, "mm/s") @Tanter2014. This
resolution has proven sufficient to map ocular dominance columns in primates @Blaize2020
and resolve individual barrels in the rodent somatosensory cortex @Brunner2020, as well
as detect functional signals in deep brain structures such as the amygdala and thalamic
nuclei @Mace2018 @SansDublanc2021.

A defining advantage of @fusi is its compatibility with other neuroimaging modalities.
The technique has been successfully combined with electrophysiological recordings
@NunezElizalde2022 @Bergel2024 and optogenetics @SansDublanc2021, enabling multimodal
investigations of brain function. Furthermore, its portability allows imaging in freely
moving animals @Tiran2017 @Sieu2015 @ElHady2024 @CybisPereira2025, opening possibilities
for studying natural behaviors that are difficult to examine using methods like @fmri.

In clinical applications, @fusi has been used in several key areas. In adult humans, it
has been employed to map cortical function both through direct surgical access
@Imbault2017 @Soloukey2020 @Soloukey2025 and through acoustically transparent cranial
windows @Rabut2024. In neonatal care, @fusi enables imaging through the fontanelle to
detect epileptic seizures and monitor brain connectivity @Demene2017 @Demen2019
@Baranger2021. Additionally, it has been used during spinal cord surgery to map spinal
functional responses to electrical stimuli @Agyeman2024.

Despite its advantages, @fusi faces certain limitations. The skull presents a
significant challenge, as it severely attenuates and diffracts ultrasound signals,
making transcranial imaging difficult except in mice and young rats with thin skulls.
Solutions have been proposed, including the use of contrast agents and acoustic reporter
genes to enhance signal detection through the skull @Errico2016 @Heiles2021.
Additionally, while volumetric imaging is now possible @Mace2018 @Rabut2019 @Brunner2020
@Bertolo2023, it typically comes with reduced sensitivity compared to single-plane
imaging due to technological constraints of current matrix arrays @Montaldo2022.

When compared to other neuroimaging modalities, @fusi occupies a unique niche between
@fmri and optical techniques. @fusi offers higher spatial and temporal resolution than
@fmri, while being more portable and less expensive#footnote[A small animal #qty(7, "T")
  @fmri system ranges from #qty(800000, "usd") to #qty(2000000, "usd") @Klaunberg2004,
  while a @fusi system ranges from #qty(50000, "usd") to #qty(600000, "usd") depending on
  the configuration and manufacturer.] Meanwhile, @fusi offers deep brain coverage not
achievable with optical methods. However, it lacks the whole-brain coverage of @fmri in
most species, is limited by the invasiveness of craniotomies required in larger animals
and humans, and cannot directly measure neuronal activity like electrophysiological
methods. As the technology continues to mature and becomes more accessible, @fusi will
be increasingly adopted by the neuroscience community as a powerful tool for
investigating brain function across multiple scales and species.

=== The Importance of Preclinical Imaging and Animal Models

Preclinical imaging and animal models have been central to the evolution of functional
neuroimaging modalities and the advancement of neuroscience research in general. These
approaches enable researchers to develop, refine, and validate imaging techniques under
controlled experimental conditions that are not ethically or technically feasible in
human subjects @Beckmann2001. In doing so, they have provided deep insights into the
underlying neurovascular mechanisms, neuronal circuit dynamics, and disease
pathophysiology, forming a translational bridge between basic science and clinical
applications @Cunha2013.

One of the primary advantages of using animal models in preclinical imaging is the
ability to employ genetically engineered species---including transgenic, knock-in, and
knock-out mice---to mimic human neurodegenerative conditions such as Alzheimer’s
disease, Parkinson’s disease, and other disorders @Dawson2018. These models allow
investigators to assess cognitive functions, track disease progression longitudinally,
and evaluate the impact of therapeutic interventions with high specificity. The
controlled environment in animal studies further permits the detection of subtle changes
in brain function and vascular integrity that would be obscured by intersubject
variability in human studies @Beckmann2007.

Technological advancements in imaging hardware and software have been facilitated
significantly by preclinical studies. All of the neuroimaging modalities discussed in
the previous sections have matured owing to rigorous testing in animal models
@Cunha2013. While the development of these modalities is typically driven by clinical
applications, animal models enable the optimization of imaging parameters and protocols.
For instance, animal studies have fostered advancements in the design of radio-frequency
coils and animal positioning devices that are instrumental for achieving high @snr:pl in
small animal brains @Beckmann2007.

Animal models have also played a pivotal role in demonstrating and understanding the
@nvc:long #cite(<Gao2017>) (see @sec:neurovascular-coupling). By using invasive
techniques alongside @fmri in animals, researchers have been able to dissect whether
@fmri signals reflect presynaptic inputs, postsynaptic firing, or a combination thereof
@Goense2008. This mechanistic understanding is essential for interpreting imaging
biomarkers in both preclinical and clinical settings, thereby enhancing the reliability
and interpretability of neuroimaging data.

Moreover, animal models have proven particularly valuable for characterizing
#gls("fc", first: true)---the spatial and temporal coordination of neuronal activity
across brain regions, see @sec:understanding-functional-connectivity for more details.
@Rsfmri studies in rodents have revealed networks that mirror those observed in humans,
such as the @dmn, thus providing a basis for comparative research across species
@GutierrezBarragan2024. Such studies enhance our understanding of how neuronal circuits
reorganize during disease or recovery from injury, offering insights that are directly
translatable to human conditions.

The use of animal models extends beyond rodents to include larger and more anatomically
comparable species, such as pigs and nonhuman primates. The pig brain, with its
gyrencephalic structure and complex cortical architecture, offers a unique model for
studying higher-order cognitive functions and neurovascular dynamics that are closer to
the human brain than those in rodents @Sauleau2009. These large-animal models prove
invaluable when investigating the spatial distribution of blood flow changes and
functional connectivity in the context of neurosurgical planning or the development of
new imaging protocols.

Through their contribution to the development, refinement, and application of functional
neuroimaging modalities, preclinical imaging and animal models continue to be
indispensable tools in neuroscience research. They have not only provided mechanistic
insights into the fundamental processes underlying brain function and dysfunction but
also established a critical translational pipeline that bridges basic research with
clinical practice. The future of neuroimaging research, therefore, relies heavily on the
ongoing integration and innovation within preclinical models, promising ever-deeper
understanding and improved interventions for complex brain disorders.

== Principles of Functional Ultrasound Imaging <sec:fusi>

As detailed in @sec:fusi-history, #gls("fusi", first: true) has recently emerged as a powerful tool for
investigating brain function. Yet, the physical principles underlying @fusi were
progressively established over more than one century, beginning with the publication of
_The Theory of Sound_ by Lord Rayleigh (1842-1919) in 1877 @Rayleigh1877 and the
discovery of the piezoelectric effect by Jacques (1855-1941) and Pierre Curie
(1859-1906) in 1880 @Curie1880. In this section, we will briefly review the principles
underlying ultrasound imaging, the transition from conventional to ultrafast ultrasound
imaging, and the challenges and solutions in signal processing that have shaped the
development of @fusi.

=== Principles of Ultrasound Imaging <sec:principles-ultrasound>

Ultrasound imaging operates on a principle similar to echolocation, used by animals such
as bats and dolphins for navigation and hunting. Just as a bat emits sound waves that
bounce off objects in its environment and return as echoes, ultrasound imaging scanners
send ultrasound waves into the body and capture their reflections. The fundamental
principle, known as the _pulse-echo_ principle, is straightforward: a short acoustic
pulse transmitted into tissues will partially reflect at the interface between tissues
with different acoustic properties. Provided that the speed of sound in the tissue is
known---typically around #qty(1540, "m/s") in soft tissues---, the time it takes for the
echoes to return can be used to calculate the distance to the reflecting surfaces
#footnote[The time needed for an ultrasound pulse to go to a depth of $z$ and come back
  to the probe is $t = (2z) / c$, where $c$ the speed of sound.]. Meanwhile, the amplitude
of the echoes provides information about the acoustic properties of the tissues.

#figure(
  placement: auto,
  image("figures/echolocation.png"),
  caption: figure-caption(
    [Echolocation in bats and ultrasound imaging.],
    [(*Left*) A bat emits a sound pulse that travels through the air, bounces off objects,
      and returns as echoes. The bat uses these echoes to determine the distance and
      properties of the objects in its environment. (*Right*) An ultrasound probe emits a
      sound pulse into the body, which reflects off tissue interfaces and returns as echoes.
      The ultrasound system processes these echoes to create images of internal
      structures. Created in #link("https://BioRender.com").],
  ),
)

The term _ultrasound_ refers to sound waves with frequencies above the upper limit of
human hearing, which is around #qty(20, "kHz"). In the context of medical imaging,
ultrasound waves are typically in the range of #qtyrange(1, 30, "MHz"). Thanks to their
short wavelength---on the order of #qtyrange(0.05, 1, "mm")---, these high-frequency
sound waves allow imaging of small structures. However, high frequencies also come with
a trade-off. As ultrasound waves propagate through tissues, their energy is gradually
absorbed and converted to heat---a process called attenuation. Attenuation is
frequency-dependent and follows an exponential decay, with an attenuation coefficient
that varies with the type of tissue. For example, the attenuation coefficient in the
brain is around #qty(0.85, "dB/cm/MHz"), while in bone it can be as high as
#qty(20, "dB/cm/MHz") @Suetens2009. For example, a #qty(5, "MHz") ultrasound wave
propagating through the human brain will lose half its amplitude#footnote[A loss of
  #qty(6, "dB") corresponds to an amplitude loss of approximately 50%.] after traversing
only #qty(1.4, "cm")! This creates a fundamental compromise in ultrasound imaging:
higher frequencies provide better resolution but shallower penetration, while lower
frequencies can reach deeper tissues but with reduced detail.

Ultrasound waves can be both generated and detected using _piezoelectric transducers_.
These devices exploit the piezoelectric effect, discovered by Jacques and Pierre Curie
in 1880 @Curie1880, whereby certain crystalline materials---such as quartz, ceramics,
and certain polymers---convert mechanical deformation into electrical signals and vice
versa. When an alternating electrical voltage is applied to a piezoelectric crystal, it
rapidly changes shape at the same frequency, generating sound waves that propagate into
the surrounding medium. When the reflected waves return, they mechanically deform the
crystal, generating electrical signals that can be measured and processed to create
images.

Modern ultrasound probes consist of linear arrays containing dozens to hundreds of
individual piezoelectric elements, each capable of generating its own acoustic wave.
When a single element is excited, it produces a spherical wave that spreads out in all
directions. However, by carefully controlling the timing---or delay---with which each
element in the array is excited, the ultrasound system can shape and steer the resulting
wavefront. When elements are excited simultaneously, they produce a broad, unfocused
plane wave. When excited with progressively increasing delays across the array, they
create a focused beam that converges to a specific point in the tissue, much like how a
lens focuses light. This process is called _transmit beamforming_ and allows the system
to concentrate acoustic energy at a desired location, improving image quality and
enabling precise measurements of specific tissue regions. In contrast, when the
reflected echoes are received, the system performs _receive beamforming_, combining the
signals from multiple elements to enhance the signal from a specific location while
reducing noise from other directions. Applying receive beamforming on each pixel of an
image grid allows the system to reconstruct a two-dimensional image
(@fig:ultrasound_beamforming).

#figure(
  placement: auto,
  image("figures/transmit_receive_beamforming.png"),
  caption: figure-caption(
    [Transmit and receive beamforming in ultrasound imaging.],
    [(*Left*) Transmit beamforming: the ultrasound system excites the elements of the
      probe according to a hyperbolic delay law, creating a focused beam that converges to
      a specific point in the tissue. Only the scatterers located inside the focused
      beam will produce strong echoes. (*Right*) Receive beamforming: the system combines
      the signals from multiple elements according to the receive delay law to enhance
      the signal from a specific location while reducing noise from other directions.
      The received signals will be coherently summed, and the resulting amplitude is
      displayed as a pixel in the image. The process is repeated for each pixel in the
      image grid, reconstructing a two-dimensional image of the tissue. Adapted from
      @BarangerPhD and created in #link("https://BioRender.com").],
  ),
) <fig:ultrasound_beamforming>

=== Conventional Ultrasound Imaging Modes <sec:conventional-ultrasound>

Traditional ultrasound systems operate in several distinct imaging modes, each designed
to extract different types of information from the acoustic signals. The most basic
mode, called _A-mode_ (amplitude mode), displays the amplitude of reflected echoes as a
function of time---and therefore depth---along a single line through the tissue
(#ref-sub-fig(<fig:a-m-b-modes>, "A")). A-mode would typically be used to measure the
thickness of tissues, for example inside the eye. While A-mode provides detailed
information about structures along one direction, it offers limited spatial information
and is primarily used today for specialized applications like measuring eye dimensions.

For applications requiring temporal information, _M-mode_ (motion mode) repeatedly
acquires A-mode signals along a single line over time, creating a two-dimensional
display with depth on one axis and time on the other
(#ref-sub-fig(<fig:a-m-b-modes>, "B")). M-mode is particularly useful for cardiac
imaging, where it can track the motion of heart walls and valves with excellent temporal
resolution along one dimension.

The familiar grayscale ultrasound images seen in clinical practice use _B-mode_
(brightness mode) imaging. In B-mode, the ultrasound system sequentially acquires
multiple A-mode lines across different directions and assembles them into a
two-dimensional image. The amplitude of each echo is converted to a brightness level:
strong reflections from tissue boundaries appear bright (hyperechoic), while weak
reflections from blood or fluid appear dark (hypoechoic)
(#ref-sub-fig(<fig:a-m-b-modes>, "C")). This line-by-line acquisition process creates
detailed anatomical images but inherently limits the speed at which complete images can
be formed.

#figure(
  placement: auto,
  image("figures/a_m_b_modes.png"),
  caption: figure-caption(
    [A-mode, M-mode, and B-mode ultrasound images.],
    [
      (*A*) A-mode displays the amplitude of echoes as a function of time (depth). (*B*)
      M-mode repeatedly acquires A-mode signals along a single line over time, creating
      a two-dimensional display with depth on one axis and time on the other. (*C*)
      B-mode assembles multiple A-mode lines into a two-dimensional image, where
      brightness represents echo amplitude.
    ],
  ),
) <fig:a-m-b-modes>

The sequential nature of conventional ultrasound acquisition---whether building up a
B-mode image line-by-line or tracking motion in M-mode---imposes constraints on imaging
speed. Each acoustic pulse must travel to the deepest region of interest and return
before the next pulse can be transmitted, creating an upper limit on how quickly the
system can interrogate different regions of tissue. For brain imaging at typical depths
of several centimeters, this constraint limits conventional systems to frame rates of
#qtyrange(10, 100, "Hz")#footnote[The time needed for an ultrasound pulse to go to a
  depth of $z$ and come back to the probe is $t = (2z) / c$, where $c approx
  qty("1540", "m/s")$ is the speed of sound in soft tissues. At a typical depth of 4
  cm, a conventional ultrasound system using 128 focused lines at 4 focal depths would
  require $approx qty("27", "ms")$ to acquire a single image, resulting in a frame rate
  of $approx qty("38", "Hz")$.]. While adequate for anatomical imaging and measuring
flow in large vessels, these frame rates prove insufficient for capturing the subtle
hemodynamic changes that characterize neuronal activity in the brain's
microvasculature.

=== Principles of Doppler Ultrasound <sec:principles-doppler>

The ability to detect and measure motion is one of ultrasound's most powerful
capabilities, enabled by the _Doppler effect_---a phenomenon familiar from everyday
experience, discovered by Christian Doppler (1803-1853) in 1842 @Doppler1842. Just as
the pitch of an ambulance siren appears to increase as it approaches and decrease as it
moves away, the frequency of ultrasound waves changes when they reflect off moving
objects. In medical ultrasound, these "moving objects" are primarily red blood cells
flowing through vessels---although it is also possible to measure motion of tissue
structures, such as the heart walls. Doppler ultrasound is thus particularly valuable
for cardiovascular and cerebrovascular imaging.

==== Continuous Wave Doppler

_@Cw Doppler_ represents the most direct application of the Doppler effect in
ultrasound. The system uses separate transducer elements to simultaneously transmit a
continuous sinusoidal wave and receive the reflected signal. When an ultrasound wave
with frequency $f_T$ encounters a red blood cell moving with velocity $v$ at an angle
$theta$ relative to the ultrasound beam, the frequency $f_R$ of the reflected wave
shifts according to the Doppler equation,

$ f_D = f_R - f_T = (2 v cos(theta)) / (c + v cos(theta)) f_T, $

where $c$ is the speed of sound in the medium#footnote[See @Suetens2009[p.~136--137] for
  a proof of the Doppler frequency.]. In practice, since the velocity of the
red blood cells is much smaller than the speed of sound, the equation can be simplified
to

$ f_D approx (2 v cos(theta)) / c f_T. $ <eq:doppler>

In practice, the insonified region will contain multiple red blood cells moving at
different velocities. Thus, the recorded signal will contain a spectrum of frequencies.
By analyzing this spectrum, the system can determine the velocity of blood flow in the
insonified region (@fig:cw-and-pw-doppler).

#figure(
  placement: auto,
  image("figures/cw_and_pw_doppler.png"),
  caption: figure-caption(
    [Examples of @cw:short and @pw:short Doppler ultrasound.],
    [(*Top*) In @cw Doppler, a continuous wave is transmitted, and the reflected signal
      is continuously recorded to estimate the velocity of moving scatterers. On the
      right, an example @cw Doppler acquisition on a diseased heart is shown. Above is
      displayed a color Doppler image showing the direction of the @cw line. (*Bottom*)
      In @pw Doppler, short pulses are transmitted at regular intervals, and the echoes
      from a specific depth are sampled to estimate the velocity of moving scatterers.
      On the right, an example @pw Doppler spectrum from the renal artery is shown.
      Above is displayed a color Doppler image showing the direction of the @pw line and
      the depth of the sampled region. Adapted from @Suetens2009[Figures 11.13 and
        11.15], courtesy of Philips Healthcare. Created in #link("https://BioRender.com").
    ],
  ),
) <fig:cw-and-pw-doppler>

The primary advantage of @cw Doppler is its ability to detect high-velocity flow without
aliasing constraints, making it particularly useful for measuring fast flow in stenotic
vessels or cardiac applications. However, since @cw Doppler transmits and receives
continuously, no time-of-flight information is available, and the system cannot
determine the depth of the detected motion. Thus, @cw Doppler cannot be used to form
images.

==== Pulsed Wave Doppler

_@Pw Doppler_ achieves depth selectivity by relying on the pulse-echo principle
described in @sec:principles-ultrasound. Unfortunately, using short ultrasound pulses
prevents reliable frequency measurements, such that the Doppler effect as described in
@eq:doppler cannot be directly measured. Instead, @pw Doppler systems transmit short
pulses at regular intervals---characterized by the #ref(<prf>)---and record echoes
returning from a specific depth. If scatterers---such as red blood cells---are moving
through the insonified region, they will produce echoes whose phase will shift between
successive pulses. Thus, information about one single location can be obtained.

The choice of @prf is constrained by the target depth: echoes must return from the
deepest region of interest before the next pulse is transmitted to avoid ambiguity. This
imposes an upper limit on the @prf according to

$ f_"PRF" <= c / (2 d), $

where $c$ is the speed of sound and $d$ is the target depth.

At each pulse repetition, the system samples the recorded signal---referred to as the
_@rf signal_#footnote[The recorded signal is called the @rf signal as its frequency is in
  the megahertz range, similar to radio waves.]---at the precise time corresponding to
echoes from the target depth. For stationary tissue, successive samples from the same
depth would be identical. However, when blood flows through the target depth, the
phase of successive echoes progressively shifts due to the changing distance traveled by
the ultrasound waves between successive pulses. This phase evolution creates a slowly
varying signal whose central frequency corresponds to the Doppler shift given in
@eq:doppler (@fig:cw-and-pw-doppler). This signal is generally referred to as the
_Doppler signal_.

To extract the velocity information, @pw Doppler systems typically analyze the frequency
spectrum of this slowly-varying sampled signal. Like @cw Doppler, the system can
identify the dominant frequency components in the sampled signal's spectrum and convert
them to velocity measurements using @eq:doppler.

However, sampling only a single point of the @rf signal at each pulse repetition
provides no information about the direction of flow---both approaching and receding
blood flows would produce the same slowly-varying signal. To determine flow direction,
@pw Doppler systems typically acquire two samples of the @rf signal for each pulse,
separated by less than a quarter of a period. By comparing these two closely spaced
samples, the system can determine whether the signal phase is increasing or decreasing
between successive pulses, thus distinguishing between flow toward and away from the
transducer.

#figure(
  placement: auto,
  image("figures/doppler_direction.png"),
  caption: figure-caption(
    [Obtaining directionality from @pw:short Doppler.],
    [(*a*) Consider a scatterer moving toward or away from the ultrasound probe.
      Recording one sample after each ultrasound pulse (red and green dots) will not
      allow determination of the direction of the scatterer. Indeed, the sample obtained
      after the second pulse (green dot) will be identical whether the scatterer is
      moving toward or away from the probe. (*b*) If instead we record two samples
      separated by less than a quarter of a wavelength after each ultrasound pulse (red
      and green dots), we can determine the direction of the scatterer. Indeed, the
      second samples acquired at $t_"R2"$ are different depending on whether the
      scatterer is moving toward or away from the probe! Adapted from
      @Suetens2009[Figure 6.24].
    ],
  ),
) <fig:doppler-direction>

==== Color Doppler <sec:color-doppler>

_Color Doppler_ extends the principles of @pw Doppler to create two-dimensional velocity
maps by applying Doppler detection simultaneously across multiple spatial locations
within the imaging field. Instead of interrogating a single depth, the system divides
the imaging region into a grid of small sample volumes and estimates the Doppler shift
at each location.

However, color Doppler employs a different approach to velocity estimation compared to
@pw Doppler. While @pw Doppler can afford to collect many samples over time at a single
location and perform spectral analysis to obtain a velocity estimation, color Doppler
faces a critical time constraint. Indeed, color Doppler systems must estimate velocity
at potentially hundreds of spatial locations across the image and then move on to
acquire the next frame to maintain real-time imaging.

For this reason, color Doppler typically uses only a few pulses per spatial location and
employs phase-shift-based methods rather than spectral analysis. The system tracks the
phase evolution between successive echoes and estimates the mean velocity at each
spatial location according to

$ v = (Delta phi c f_"PRF") / (4 pi f_T), $ <eq:color-doppler>

where $Delta phi$ is the phase difference between successive pulses and $f_"PRF"$ is the
@prf. $Delta phi$ can be determined by sampling two subsequent pulses at time instances
separated by less than a quarter of a wavelength (@fig:doppler-direction). This approach
is computationally efficient and well-suited to the limited number of samples available
per spatial location.

Unfortunately, color Doppler faces yet another challenge: _tissue clutter_. The signals
backscattered by slowly moving tissue---for example, due to cardiac pulsation,
breathing, or probe motion---are generally much stronger than those from blood flow,
particularly in small vessels#footnote[The signal from red blood cells is typically
  #qty(40, "dB"), or 100 times, weaker than the signal from the surrounding tissue!].
Thus, isolating the signals from moving blood and tissue requires careful signal
processing if the goal is to obtain accurate blood velocity estimates. When imaging
blood flow, color Doppler systems employ _clutter filters_---typically high-pass
temporal filters that suppress low-frequency (that is, low-velocity) tissue signals
while preserving higher-frequency (that is, high-velocity) blood flow signals. This
filtering creates a trade-off: aggressive filtering removes tissue clutter but may also
eliminate slow blood flow signals from smaller vessels, while conservative filtering
preserves slow flow but leaves residual clutter artifacts.

The estimated velocities are then color-coded and superimposed onto the conventional
grayscale B-mode image. Flow is typically displayed using red and blue colors to
distinguish direction, with color intensity reflecting velocity magnitude
(@fig:color-and-power-doppler).

#figure(
  placement: auto,
  image("figures/color_and_power_doppler.png"),
  caption: figure-caption(
    [Example of color and power Doppler imaging.],
    [(*Left*) A color Doppler image of the superficial femoral artery (SFA) and the
      superficial femoral vein (SFV) overlaid on the B-mode image. Adapted from
      @Evans2011. (*Right*) A power Doppler image of the renal vasculature. Adapted from
      @Szabo2014, courtesy of Philips Healthcare.],
  ),
) <fig:color-and-power-doppler>

This phase-based approach represents a trade-off: color Doppler provides only a mean
velocity estimate per pixel rather than the detailed spectral information available from
@pw Doppler, but this enables rapid surveying of flow across the entire imaging field.
The consequence is reduced sensitivity to slow flow compared to @pw Doppler, since fewer
samples result in poorer @snr for velocity estimation.

Color Doppler inherits the limitations of @pw Doppler, including angle dependency and
aliasing constraints. Additionally, the need to transmit multiple pulses per spatial
location significantly reduces the frame rate compared to conventional B-mode imaging.
Despite these limitations, color Doppler provides valuable flow information in clinical
applications involving relatively large vessels with favorable imaging angles. However,
for detecting the slow flow in small cerebral vessels relevant to functional brain
imaging, alternative approaches become necessary.

==== Power Doppler

_Power Doppler_ represents a departure from velocity-based Doppler techniques by
focusing on the power of the Doppler signal rather than its frequency content. Instead
of measuring how fast blood is moving, power Doppler detects the presence of moving
blood by analyzing the total energy in the Doppler-shifted frequencies, regardless of
their specific values.

This approach offers several significant advantages over conventional color Doppler.
Most importantly, power Doppler is almost angle-independent. While conventional color
Doppler completely fails to detect flow perpendicular to the ultrasound beam (due to
zero frequency shift), power Doppler can usually detect perpendicular flow, although
with reduced sensitivity compared to flow aligned with the beam. This near
angle-independence makes power Doppler far more robust for detecting flow in vessels
with unfavorable orientations.

Power Doppler also exhibits superior sensitivity to slow flow. While color Doppler
requires sufficient @snr to reliably estimate specific frequencies, power Doppler simply
needs to detect the presence of frequency content above a threshold. This makes it
particularly effective for detecting low-velocity flow in small vessels, where
conventional Doppler signals might be buried in noise. However, power Doppler still
relies on clutter filters to properly separate echoes from moving blood from those from
slowly moving tissues, which can lead to similar trade-offs as in color Doppler.

The technique works by computing the integrated power spectral density of the Doppler
signal across all frequencies, effectively measuring

$ P = integral |S(f)|^2 dif f, $ <eq:power-doppler>

where $S(f)$ is the complex spectrum of the Doppler signal. The resulting power value
correlates with the volume of moving blood within the sample volume rather than its
velocity, making power Doppler a measure of blood volume changes rather than flow speed
(@fig:color-and-power-doppler).

Regarding directional information, power Doppler does not inherently sacrifice this
capability. By employing @iq demodulation---see @sec:iq-demodulation for more
details---and spectral analysis techniques that separate positive and
negative Doppler frequencies, it is theoretically possible to distinguish between blood
volumes moving toward versus away from the transducer. However, implementing such
spectral analysis methods (for example, @fft) in conventional ultrasound scanners is
technically challenging due to the limited number of temporal samples available per
spatial location---the same time constraint that affects color Doppler. As a result,
most clinical power Doppler implementations focus on the total integrated power across
all frequencies, effectively trading directional information for computational
efficiency and robust detection of blood volume presence.

=== Signal Processing: From @rf:short Signals to Images <sec:rf-to-images>

Modern ultrasound systems employ a sophisticated signal processing pipeline to transform
raw @rf signals into meaningful anatomical and functional images. Understanding this
pipeline is essential for grasping how @fusi extracts hemodynamic information from
acoustic signals and understanding the limitations and challenges of the technique.

After emitting pulses into tissues, the transformation of the reflected acoustic waves
to images involves several key steps:

- _@Rf acquisition_: Each transducer element records high-frequency @rf
  signals between each pulse.
- _@iq demodulation_: high-frequency @rf signals are demodulated into #gls("iq", first: true)
  components, allowing recovery of amplitude and phase information independently of
  the carrier (ultrasound) frequency.
- _Receive beamforming_: @iq signals from all elements are combined on a pixel grid.
- _Imaging mode processing_: beamformed @iq signals are processed to form images in
  different modes, such as B-mode, color Doppler, or power Doppler.

==== @Iq Demodulation <sec:iq-demodulation>

@Iq demodulation is a signal processing technique that allows extraction of the
amplitude and phase information from a modulated carrier signal, such as the received
@rf signal, without retaining the high-frequency carrier component. In ultrasound
imaging, the received @rf signals oscillate at the ultrasound frequency of the
transmitted pulse---typically #qtyrange(1, 30, "MHz"). According to the Nyquist-Shannon
sampling theorem, correct sampling of the received pulses should be done at a frequency
at least twice that of the transmitted pulse frequency#footnote[In practice, sampling is
  often done at four times the transmitted pulse frequency. This allows sampling every
  quarter of a period, enabling extraction of directional information by properly sampling
  the signal phase (@fig:doppler-direction).]. However, pulse-echo systems rely only on
the amplitude and phase---to estimate reflectivity and motion, respectively---of the
received pulses. Since the amplitude and phase information varies at a much lower
frequency than the @rf carrier signal, @iq demodulation would allow for a significant
reduction in sampling rate, thus reducing the data volume that needs to be transferred
from the echograph to the computer.

To demonstrate the mathematical foundation behind @iq demodulation, consider that the
@rf signal received after an ultrasound pulse can be modeled as#footnote[A more thorough
  description of @iq demodulation for general bandpass signals is available in
  @Franks1969.]

$ "RF"(t) = A(t) cos(2 pi f_T t + phi(t)), $

where $A(t)$ is the time-varying amplitude, $f_T$ is the carrier frequency, $phi$ is
the time-varying phase, and $t$ is the time relative to the pulse emission @Angelsen1981.

@Iq demodulation extracts the amplitude and phase information by mixing $"RF"(t)$
with a reference signal, generally at the same frequency as the transmitted pulse. Using
the trigonometric identities

$
  cos(a)cos(b) = (cos(a + b) + cos(a - b)) / 2, \
  cos(a)sin(b) = (sin(a + b) - sin(a - b)) / 2,
$

we get the raw in-phase component as

$ I_"raw" (t) = "RF"(t) times cos(2 pi f_T t) = 1 / 2 A(t) (cos(4 pi f_T t + phi(t)) + cos(phi(t)), $

and the raw quadrature component as

$ Q_"raw" (t) = "RF"(t) times (-sin(2 pi f_T t)) = 1 / 2 A(t) (sin(phi(t)) - sin(4 pi f_T t + phi(t))). $

Both raw components contain high-frequency terms at $4 pi f_T$ and low-frequency terms
containing the desired information. Thus, by absorbing the $1 / 2$ factor into the
amplitude $A(t)$ and low-pass filtering the raw components, we can obtain the
in-phase and quadrature components:

$
  I(t) = A(t) cos(phi(t)), \
  Q(t) = A(t) sin(phi(t)).
$

For simplicity, these components are often combined into a single complex signal,

$ "IQ"(t) = I(t) + j Q(t) = A(t) e^(j phi(t)), $

where $j$ is the imaginary unit. This representation preserves both amplitude $A(t) =
|"IQ"(t)|$ and phase $phi(t) = arg("IQ"(t))$ information. Thus, $"IQ"(t)$ can be
decimated to a much lower sampling rate than the original @rf signal without losing
information about the amplitude and phase of the received signal.

==== Receive Beamforming

After @iq demodulation, signals from all transducer elements are combined on a pixel
grid to form an image. Multiple approaches exist for this process, but the most common
is @das beamforming @Perrot2021. For each pixel in the desired image grid, the system
applies appropriate time delays to the @iq signals from different elements and sums
them,

$
  "IQ"_"beamformed" (x, z) = sum_(e in"elements") "IQ"_e (tau_e (x, z)) e^(2 j
  pi f_T tau_e (x, z)),
$

where $(x, z)$ are the pixel coordinates in the image grid, and $tau_e (x, z)$ is the
travel time of the emitted pulse from the transducer to the pixel $(x, z)$ and back to
an element $e$ of the transducer. The factor $e^(2 j pi f_T tau_e (x, z))$ comes from
the fact that summation and @iq demodulation are not commutative operations---see
@Horvat1992 for more details.

==== Processing Beamformed @iq:short Signals

Repeating sequences of pulses, @iq demodulation, and receive beamforming leads to series
of @iq signals for each pixel in the image grid. Thus, beamformed @iq signals are
sampled at the #gls("prf", first: true), which is typically much lower than the original @rf sampling
rate. The sampling time of the beamformed @iq signals is therefore referred to as _slow
time_ $k$ to distinguish it from the _fast time_ $t$ of the original @rf signals:

$ "IQ"_"beamformed" (x, z, k) = A_"beamformed" (x, z, k) e^(j phi_"beamformed" (x, z, k)). $

From these slow-time signals, we can compute the different imaging modes described in
@sec:conventional-ultrasound and @sec:principles-doppler. For example, B-mode images
would be obtained by computing the modulus of the beamformed @iq signals at each
pixel $(x, z)$,

$ "B"(x, z, k) = |"IQ"_"beamformed" (x, z, k)| = A_"beamformed" (x, z, k). $ <eq:b-mode>

Meanwhile, color Doppler images would be obtained from @eq:color-doppler, where the
phase shift $Delta phi$ between two successive slow-time samples can be computed as

$
  Delta phi(x, z, dot) & = arg("IQ"_"beamformed" (x, z, k + 1) "IQ"_"beamformed"^* (x, z, k)), \
                       & = phi(x, z, k + 1) - phi(x, z, k).
$

Finally, power Doppler images would be obtained from @eq:power-doppler, where the power
$P$ would be computed by summing the squared modulus of the beamformed @iq signals
over range of slow-time samples $K$,

$ P(x, z, dot) = sum_(k in K) |"IQ"_"beamformed" (x, z, k)|^2 = sum_(k in K) A_"beamformed" (x, z, k)^2. $

=== From Conventional to Ultrafast Ultrasound

==== Where Conventional Ultrasound Imaging Falls Short

Conventional ultrasound imaging constructs images using a sequential line-by-line
approach by focusing ultrasound beams. As we have seen in @sec:conventional-ultrasound,
this sequential scanning process inherently limits the temporal resolution of
conventional ultrasound systems to #qtyrange(10, 100, "Hz"). While this temporal
resolution is sufficient for many clinical applications, it poses challenges for imaging
swift movements and high-velocity flows.

Paradoxically, this low temporal resolution is also particularly problematic for imaging
very slow flows, such as those found in the brain's microvasculature. Indeed, these slow
flows are often difficult to distinguish from the surrounding tissues, as they produce
very weak echoes with similar velocities. Clutter filters would require a large amount
of temporal samples to reliably distinguish slow flows from tissue---something that is
intrinsically challenging in conventional ultrasound systems due to the limited number
of temporal samples available per spatial location.

==== The Solution: Plane-Wave Imaging

The breakthrough that lead to ultrafast ultrasound imaging was the adoption of _plane
wave transmissions_. Bruneel and colleagues first coined the term "ultrafast" in 1977
to describe a new ultrasound imaging technique consisting in transmitting unfocused
plane waves that insonify the entire field of view simultaneously @Bruneel1977. This
fundamental change eliminates the sequential scanning constraint, as a single
transmission can provide information about the entire imaging region. Thus, ultrafast
ultrasound systems can achieve frame rates of several kilohertz.

Although proposed in the 1970s, the practical implementation of ultrafast ultrasound
imaging remained limited for decades due to the technical challenges of processing the
large amounts of data generated by plane wave transmissions. Only in the early 2000s did
advances in computing power and signal processing techniques enable the emergence of
ultrafast ultrasound as a practical imaging modality. The first ultrafast ultrasound
system combining plane wave transmissions with parallel receive beamforming was
introduced in 1999 by Sandrin and colleagues @Sandrin1999. This system demonstrated the
feasibility of ultrafast imaging up to 10,000 frames per second, and validated its
potential for real-time imaging of shear wave propagation in phantoms.

During plane wave transmission, all transducer elements are excited simultaneously,
creating a broad wavefront that propagates uniformly through the tissue. The trade-off
is immediate: while plane wave transmission dramatically increases acquisition speed,
individual plane wave images suffer from reduced image quality compared to focused
transmission. Indeed, the backscattered echoes from all scatterers in the insonified
region will overlap and interfere. Additionally, the lack of focusing means that
each region of the image is insonified with a much lower acoustic energy.

#figure(
  placement: auto,
  image("figures/plane_wave.png"),
  caption: figure-caption(
    [Plane wave imaging in ultrafast ultrasound.],
    [
      (*Left*) In plane wave imaging, all transducer elements are excited
      simultaneously, creating a broad wavefront that insonifies the entire field of
      view. (*Right*) The backscattered echoes from all scatterers in the insonified
      region are recorded simultaneously. Created in #link("https://BioRender.com").
    ],
  ),
)

==== Coherent Compounding

To recover image quality while maintaining speed advantages, ultrafast systems employ
_coherent compounding_---a technique that reconstructs focused ultrasound beams
computationally rather than physically. The approach involves transmitting a set of
plane waves at different tilt angles, typically 5 to 40 angles spanning $plus.minus
qty("10", "deg")$ to $plus.minus qty("20", "deg")$. While each individual plane wave
produces a low-quality image with poor resolution and contrast, the coherent combination
of multiple angled acquisitions can recreate the focusing effects that would occur with
conventional focused transmission.

Montaldo and colleagues showed that by adding only a few plane wave angles---around
10---, coherent compounding can achieve image quality comparable to that of conventional
focused ultrasound while maintaining frame rates in the kilohertz range @Montaldo2009.
However, the computational cost of coherent compounding is significant: coherent
compounding requires fast data transfer from the echograph to the
computer#footnote[Typical ultrafast ultrasound imaging sequences generate data at a rate
  of around #qtyrange(2, 6, "GB/s"). This is expected to increase considerably with denser
  ultrasound probes and the need to image larger fields of view.], as well as
high-performance computing hardware to beamform and compound large amounts of
data---typically a few gigabytes per second---in real time.

#figure(
  placement: auto,
  image("figures/coherent_compounding.png"),
  caption: figure-caption(
    [Coherent compounding in ultrafast ultrasound imaging.],
    [
      B-mode images of anechoic ultrasound phantoms show the effect of coherent
      compounding relative to conventional focused ultrasound imaging. Conventional
      ultrasound imaging provides high-quality images at the cost of low temporal
      resolution. In contrast, plane wave imaging achieves very high temporal resolution
      but provides low-quality images. By coherently combining multiple plane wave
      images acquired at different angles, ultrafast ultrasound systems can achieve the
      same image quality as conventional ultrasound while maintaining high temporal
      resolution. Adapted from @Tanter2014.
    ],
  ),
)

=== Functional Ultrasound Imaging: Implementations and Constraints

By combining ultrafast plane wave imaging, coherent compounding, and the power Doppler
technique, Émilie Macé and colleagues pioneered #gls("fusi", first: true) in 2011 @Mac2011. As detailed
in @sec:fusi-history, @fusi was developed as a functional neuroimaging technique that
relies on @nvc:long mechanisms (see @sec:neurovascular-coupling) to detect hemodynamic
changes associated with neuronal activity. Since its inception, @fusi has rapidly
evolved from a proof-of-concept technique to an emerging neuroimaging modality with
unique capabilities that position it distinctively among brain imaging techniques. @fusi
resolutions on the order of #qtyrange(100, 300, "µm") spatial and #qtyrange(0.1, 3, "s")
temporal, with high sensitivity to #gls("cbv", first: true) changes and the ability to image deep into
tissues without contrast agents. However, its practical implementation involves specific
technical considerations and constraints that are critical for understanding both its
current capabilities and limitations. This section examines the technical
specifications, experimental configurations, and practical challenges that define the
current state of @fusi.

==== Experimental Setups

===== Preclinical Imaging

_Anesthetized setups_ represent the most straightforward implementation of @fusi for
preclinical imaging, particularly in mice and rats @Mac2011 @Osmanski2014 @Brunner2018
@Boido2019 @Vidal2020b @Nayak2021 (#ref-sub-fig(<fig:fusi-rodent-setups>, "A")).
Anesthesia offers controlled conditions with minimal motion artifacts, allowing for
extended acquisition periods and seamless integration with complimentary techniques such
as electrophysiological recordings. In young adult mice, anesthesia enables minimal
invasiveness via transcranial imaging through shaved skin#footnote[Transcranial imaging
  is limited to mice up to approximately 13 weeks of age. The thicker skulls of older mice
  cause excessive attenuation that is problematic for most applications.]. In rats,
transcranial imaging is also feasible but requires skull thinning to reduce attenuation.
However, skull attenuation always remains problematic for deep or lateral#footnote[Due
  to the steep angle of the lateral skull bones relative to the plane waves, reflection
  becomes particularly strong, leading to strong signal loss.
] brain regions, along with
regions situated under skull sutures#footnote[Skull sutures are fibrous joints that
  connect the bones of the skull, consisting of dense connective tissue that gradually
  fuses after birth. They're problematic because of their thickness which attenuates
  ultrasound waves.
]. When skull attenuation becomes too problematic, as is the case in
larger species, a craniotomy is typically performed to remove the skull over the region
of interest.

_Awake head-fixed setups_ require substantially more complex experimental protocols
(#ref-sub-fig(<fig:fusi-rodent-setups>, "B"). In animals such as mice, ferrets, pigeons,
and primates, awake imaging has been achieved using head-fixation devices @Ferrier2020
@Bimbard2018 @Rau2018 @Dizeux2019. Generally, these devices consist in surgically
implanting metal plates to the skull. While invasive, this approach reduces head motion
and can allow for some behavioral paradigms using systems such as running wheels,
treadmills, or locomotion platforms.

_Awake freely-moving setups_ represent the most technically challenging implementations,
often requiring miniaturized probe systems and lightweight mounting hardware
(#ref-sub-fig(<fig:fusi-rodent-setups>, "C")). Freely-moving setups setups have been
demonstrated in mice, rats, crows, and primates @Sieu2015 @Urban2015 @Bergel2018
@Bergel2020 @Rabut2020 @Liao2024 @Griggs2023. In these cases, probe-mounting systems are
surgically implanted to the skull, allowing the probe to be attached to the animal's
head while minimizing the impact on the animal behavior. Currently, awake preclinical
imaging setups typically require chronic cranial windows in all animals except mice.

#figure(
  placement: auto,
  image("figures/fusi_rodent_setups.png"),
  caption: figure-caption(
    [Examples of @fusi:short setups in rodents.],
    [
      (*A*) Anesthetized setup in rodents. (_Top_) Schema of an anesthetized setup. The
      animal is placed in a stereotaxic frame#footnote[A stereotaxic frame is a
        positioning device used in neuroscience and neurosurgery that holds an animal or
        human head in a fixed position while allowing researchers or surgeons to
        accurately target specific brain locations using three-dimensional coordinates.],
      and the ultrasound probe is placed on the scalp using a motorized setup. A heating
      pad is used to maintain the temperature of the animal during the acquisition.
      (_Bottom_) Photo of an anesthetized setup during whisker stimulation in a mouse.
      The ultrasound probe is hidden inside the blue probe holder. Clear ultrasound gel
      is visible between the probe and the scalp. The two metal ear-bars are part of the
      stereotaxic frame. The cotton swab is used for whisker stimulation. Adapted from
      @Bertolo2021. (*B*) Awake head-fixed setup in rodents. (_Top_) Schema of an awake
      head-fixed setup with Mobile HomeCage#sym.trademark.registered locomotion
      platform. The animal is head-fixed to a metal post but can move its body inside an
      air-lifted cage, allowing for for two-dimensional locomotion. Like the
      anesthetized setup, the ultrasound probe is placed on the scalp using a motorized
      setup. (_Bottom_) Schematic and photo of a chronic cranial window for awake
      imaging in mice. The cranial window is performed by removing the skull over the
      region of interest and installing a 3D-printed cranial implant with a protective
      film. The implant is then secured to a metal head-plate that allows fixation to
      head-fixation devices such as the Mobile HomeCage#sym.trademark.registered. The
      photo on the right shows the brain seen through the protective film from the
      cranial implant. Adapted from @Edelman2024. (*C*) Awake freely-moving setup in
      rodents. (_Top_) Schema of an awake freely-moving setup. A miniaturized ultrasound
      probe is mounted on the animal's head using a surgically implanted head-plate.
      This leaves the animal relatively free to move in its environment. (_Bottom_)
      Photo of a rat with an implanted head-plate, with or without attached ultrasound
      probe. Adapted from @Urban2015. Created in #link("https://BioRender.com").
    ],
  ),
) <fig:fusi-rodent-setups>

===== Clinical Imaging

Human @fusi applications remain largely experimental but have been demonstrated in both
anesthetized and awake adult humans, and during sleep in human neonates. During
neurosurgical procedures, @fusi has been demonstrated in patients under anesthesia for
both brain and spinal cord imaging @Imbault2017 @Agyeman2024, and during awake brain
surgery for vascular and functional imaging @Imbault2017 @Soloukey2020 @Soloukey2023.
In these cases, the ultrasound probe is typically placed directly on the brain or spinal
cord surface after a craniotomy or laminectomy, respectively. Of course, such procedures
are highly invasive and practically limited to intraoperative applications.

Less invasive approaches were recently demonstrated by two research groups in patients
with chronic acoustic windows @Rabut2024 @Soloukey2025. In these cases, patients who
received a hemicraniectomy#footnote[Partial removal of the skull.] for medical
reasons---such as brain injury or tumor resection---underwent a cranioplasty to replace
the missing skull part using a material with low acoustic attenuation. Both research
groups demonstrated that vascular and functional imaging is possible through these
acoustic windows, allowing for repeated imaging sessions in awake patients.

Neonatal imaging probably represents the most successful non-invasive human application,
where @fusi can access the brain through the fontanelle---the soft membranous areas
between skull bones that remain open during early development @Demene2017 @Baranger2021.
These applications have enabled monitoring of brain activity and connectivity in
newborns without any surgical intervention, paving the way towards new insights into
neonatal brain development and pathologies. A clinical trial is soon expected to start
to assess the clinical value of @fusi in neonatal brain imaging @NCT06940713.

#figure(
  placement: auto,
  image("figures/human_fusi.png"),
  caption: figure-caption(
    [Examples of @fusi:short setups in humans.],
    [
      (*A*) Intraoperative @fusi setup. The ultrasound probe is held by an
      intraoperative arm to ensure proper stabilization, and placed directly on the
      brain surface during awake brain surgery. Adapted from @Soloukey2023. (*B*)
      Acoustic window setups for @fusi in humans. Two schemas of acoustic windows are
      shown. @fusi can be performed by placing the ultrasound probe directly on the skin
      above the acoustic window. Adapted from @Rabut2024 and @Soloukey2025 (*C*)
      Neonatal @fusi setup. The ultrasound probe is secured to a probe holder that is
      attached above the fontanelle with straps. Adapted from @Baranger2021.
    ],
  ),
)

==== Spatial Coverage and Temporal Resolution

Current @fusi implementations employ two primary acquisition approaches, each with
distinct coverage characteristics. _Linear probe_ systems enable high-quality
single-plane imaging with spatial resolutions ranging from #qty(100, "um") to
#qty(300, "um") depending on the ultrasound frequency. However, these probes are
inherently limited to imaging a single plane at a time, typically covering a field of
view of around #qtyrange(1, 4, "cm") wide and deep#footnote[The plane width is around
  #qtyrange(0.4, 1, "cm") depending on the depth and probe]. Imaging larger brain regions
requires mechanical scanning of the probe, which comes at the cost of reduced temporal
resolution. For example, a typical linear probe system can achieve frame rates of
#qtyrange(1, 10, "Hz") for single-plane imaging, but this drops to around
#qty(0.5, "Hz") or less when scanning four planes sequentially#footnote[Mechanical
  scanning is typically done by moving the probe using a motorized stage. For example, the
  Iconeus One system takes around #qty(200, "ms") to move the probe between two planes.].
Currently, the vast majority of @fusi studies use linear probe systems, sometimes with
sequential mechanical scanning to access larger brain regions.

_Matrix probe_ systems represent a significant technological advancement, enabling
volumetric imaging capabilities of around #qtyrange(1, 3, "cm^3") @Rabut2019
@Brunner2020 @Sauvage2020. However, this gain in volumetric coverage comes at the cost
of lower spatial resolution---typically #qtyrange(200, 500, "um") depending on the
matrix probe type and ultrasound frequency---, heavily reduced sensitivity, and greatly
increased data volume and computational complexity. Thus, the maximal temporal
resolution of matrix probe systems is typically limited to around
#qtyrange(0.6, 1.4, "Hz") @Rabut2019 @Brunner2020. Additionally, volumetric matrix
probes require craniotomies to reduce skull attenuation and achieve sufficient signal
quality for functional imaging, even in mice.

A good middle-ground solution are _multiarray probes_, recently developed by Bertolo and
colleagues @Bertolo2021. These probes consist of multiple linear arrays arranged in
parallel, allowing for simultaneous imaging of multiple planes. Multiarray probes offer
the same spatiotemporal resolution and sensitivity as conventional linear probes.
However, due to the gap between the arrays, these probes still require mechanical
scanning to cover a continuous volume, which reduces the temporal resolution to around
#qty(0.4, "Hz") or less.

Of note, no current @fusi system can achieve whole-brain coverage for functional
imaging. Although the term "whole-brain" is often used in the current literature to
describe the capabilities of @fusi for imaging in mice, it is unfortunately misleading
and contibutes to the confusion new users may face when trying to understand the state
of the art#footnote[A similar case may be made of the term "non-invasive", which is even
  misleadingly used in some articles to describe craniotomy-based setups @Nayak2023.]
@Markicevic2021 @Mace2018 @Rabut2019 @Brunner2020 @Bertolo2021 @Brunner2021
@Beliard2024. In mice, even mechanical scanning and volumetric matrix probes can only
access part of the brain while retaining sufficient temporal resolution @Rabut2019
@Mace2018 @Brunner2021. In transcranial setups, lateral cortical areas and posterior
structures like the cerebellum often remain inaccessible due to skull curvature and
thickness. Awake imaging in rodents adds further limitations, as muscles adjacent to the
skull can create strong motion artifacts that overwhelm current clutter filters,
reducing the effective field of view. Additionally, cranial windows are required to
reliably access deep regions and avoid excessive skull attenuation under cranial
sutures.

==== Clutter filtering

As @fusi relies on the power Doppler technique, one of the primary challenges is to
isolate the weak Doppler signals from moving red blood cells against the much stronger
tissue clutter. Indeed, if proper filtering is not applied, the intensity of @fusi
images will not reflect the cerebral blood volume changes correctly, leading to biased
estimation of the hemodynamic responses to neuronal activity. The signal from red blood
cells is typically #qty(40, "dB"), or 100 times, weaker than the signal from the
surrounding tissue, creating an #gls("snr", first: true) challenge for functional imaging applications.

As discussed in @sec:principles-doppler, _clutter filters_ are employed to suppress
low-frequency tissue signals while preserving higher-frequency blood flow signals.
Clutter filters are typically applied to beamformed @iq signals (@sec:rf-to-images)
before computing power Doppler images. The choice and implementation of clutter
filtering strategies determines the sensitivity and specificity of @fusi for detecting
functional hemodynamic changes.

===== Temporal High-Pass Filtering

The most straightforward approach uses _temporal high-pass filtering_#footnote[Here,
  "temporal filtering" refers to filtering out temporal frequencies from each
  signal, as opposed to "spatial filtering", which would refer to filtering out spatial
  frequencies from each image.], which removes low-frequency components associated with
slow tissue movement. High-pass filters are particularly effective to isolate fast blood
flows, such as those in large vessels. Unfortunately, this approach fails when blood
flow velocities are low relative to surrounding tissue movements.

This limitation is particularly problematic in the brain, where the signal from small
vessels is of primary interest for functional imaging. Cortical arterioles in rat brains
carry red blood cells at mean velocities of around #qtyrange(10, 25, "mm/s"), while
these velocities can go down to around #qty(0.5, "mm/s") in capillaries @Mac2011. To
remove sufficient clutter signals, the first @fusi studies used high-pass filters with
cut-off frequencies around #qty(75, "Hz") @Mac2011 @Osmanski2014. Unfortunately, this
meant removing any blood flow velocities below around #qty(3.5, "mm/s") (see
@eq:doppler). Moreover, this approach was severely limited when imaging awake animals,
as any strong tissue motion would completely overwhelm the clutter filter by creating
Doppler frequencies above the filter cut-off frequency.

===== Static @svd:short\-Based Filtering

The limitation of temporal high-pass filtering led to the development of more
sophisticated filtering approaches that relied not only on temporal frequencies, but
also on the spatial characteristics of the @iq signals. The key insight driving these
methods is that tissue motion and blood flow exhibit different spatiotemporal
characteristics: tissue motion tends to be spatially coherent across large regions and
temporally correlated, while blood flow signals are more spatially localized to vascular
structures and exhibit different temporal dynamics.

Demené and colleagues demonstrated in 2015 that the #gls("svd", first: true) can effectively exploit
these differences to separate tissue clutter from blood flow signals in @fusi
@Demene2015. Although already used in conventional ultrasound imaging @Ledoux1997
@Yu2007, @svd\-based clutter filtering was not widely applied due to the requirement for
large amounts of spatial and temporal samples for the @svd to be effective. For @fusi,
ultrafast imaging was instrumental as it offered high frame rates and dense spatial
sampling. Thus, Demené and colleagues showed that @svd\-based clutter filters
substantially surpassed temporal high-pass filters in removing tissue clutter while
retaining slow blood flows (@fig:svd-filter-motion). As we'll see, the introduction of
@svd\-based clutter filters was a major breakthrough for @fusi, unlocking the ability to
image slow blood flows even in the presence of strong tissue motion.

#figure(
  placement: auto,
  image("figures/svd_filter_motion.png"),
  caption: figure-caption(
    [Comparison between high-pass and @svd:short\-based clutter filters during strong motion.],
    [
      (*A*) The effect of different singular (_top_) and frequency (_bottom_) thresholds
      are compared on average power Doppler images of a neonate brain during strong
      motion. The red frame indicates the best clutter rejection according to
      clinicians. The @svd\-based clutter filter clearly outperforms the temporal
      high-pass filter by removing the tissue clutter while preserving much more of the
      vasculature, even when compared to very low frequency cut-offs. (*B*) The red
      cross in *A* indicates a region of interest where the spectra of the tissue and
      blood signals extracted using both filters are compared. The blood flow from this
      region could not have ever been correctly detected using a temporal high-pass
      filter, as its peak frequency is entirely overlapped by the tissue clutter
      spectrum. Adapted from @Demene2015.
    ],
  ),
) <fig:svd-filter-motion>

@Svd\-based clutter filters treat beamformed @iq signals as matrices where rows
correspond to time samples and columns correspond to spatial locations (pixels). The
thin @svd#footnote[The thin @svd discards singular vectors corresponding to the
  null-space of the matrix to be more memory efficient.] of such a matrix $X$ is
then#footnote[A refresher on the mathematical foundations of the @svd may be found in
  @Axler2024[p.~270].]

$ X = U Sigma V^*, $ <eq:svd>

where $U$ is the $("time", "pixels")$ unitary#footnote[A matrix is unitary if its
  inverse equals its conjugate transpose.] matrix containing the left singular vectors,
$Sigma$ is a $("pixels", "pixels")$ diagonal matrix of singular values, and $V^*$ is the
conjugate transpose of the $("pixels", "pixels")$ unitary matrix containing the right
singular vectors.

To better interpret this decomposition, it may be useful to rewrite @eq:svd as

$ X = sum_(i=1)^r sigma_i bold(u)_i bold(v)_i^*, $ <eq:svd-sum>

where $sigma_i$ are the singular values (constituting the diagonal of $Sigma$, in
decreasing order), $bold(u)_i$ are the left singular vectors (stacked as columns in
$U$), and $bold(v)_i$ are the right singular vectors (stacked as columns in $V$). Thus,
the @svd decomposes the beamformed @iq matrix $X$ into a weighted sum of rank-1
matrices, where each rank-1 matrix is formed by the outer product of a left singular
vector and a right singular vector. Note that since $U$ and $V$ are unitary, the energy
of each rank-1 matrix is entirely determined by the square of the corresponding singular
value $sigma_i^2$. In the @fusi literature, these rank-1 matrices are often referred to
as _modes_, and corresponding singular vectors as _spatial modes_ or _temporal modes_,

Given the two relations

$
  X X^* = U Sigma V^* V Sigma^* U^* = U Sigma^2 U^*, \
  X^* X = V Sigma^* U^* U Sigma V^* = V Sigma^2 V^*,
$

we conclude that the left singular vectors in $U$ are the eigenvectors of the $("time",
  "time")$ left Gram matrix $X X^*$, and the right singular vectors $V$ are the
eigenvectors of the $("pixels", "pixels")$ right Gram matrix $X^* X$. Thus, the left
singular vectors in $U$ correspond to _temporal components_ of the @iq signals, while the
right singular vectors in $V$ correspond to _spatial components_.

The key principle is that tissue clutter, being spatially coherent and more energetic,
will tend to be captured by singular vectors with highest singular values. Blood flow
signals, being less spatially coherent and relatively very weak, will be distributed
across the remaining singular vectors with lower singular values. Thus, clutter
filtering can be achieved by performing a "reverse truncated @svd": we remove a given
number of singular vectors with highest singular values and reconstruct the filtered
signals from the remaining vectors.

However, contrary to temporal high-pass filtering, @svd\-based clutter filters is
generally not applied to whole acquisitions. Indeed, the complexity the @svd is
$O(min(m n^2, m^2 n))$ @Golub1996. A typical beamformed @iq matrix of size
$(300000, 10000)$#footnote[This matrix size corresponds to a 10-minute acquisition at a
  #gls("prf", first: true) of #qty(500, "Hz") with an image grid of 10,000 pixels.] represents
#qty(24, "GB") of data when stored as single-precision complex numbers. Running an @svd
on such a matrix would take tens of minutes on a high-performance computer, require an
additional #qty(24, "GB") of memory to store the resulting singular vectors, and even
more for the computation of the @svd itself. Additionally, real-time visualization
constraints generally require the @svd to be computed on a block-by-block basis to
allow for real-time computation of the power Doppler images. Thus, @svd\-based clutter
filters are typically applied to blocks of a few hundred beamformed @iq images.
Generally, the same number of beamformed @iq images is used for both the clutter
filtering, and for the computation of the power Doppler images#footnote[This number is
  typically selected such that the corresponding temporal duration encompasses a few
  cardiac cycles, so as to avoid pulsatile artifacts across power Doppler images.].

The threshold of @svd\-based clutter filters---that is, the number of singular vectors
to filter out from each block of beamformed @iq images---is often determined empirically
based on visual inspection of the resulting power Doppler images. The same threshold is
typically applied to all blocks of an acquisition. Such clutter filtering strategies
are referred to as _static_ @svd\-based clutter filters and have been employed in the
vast majority of @fusi studies @Demene2015 @Ferrier2020 @Bimbard2018 @Rabut2020.

While static @svd\-based clutter filters represent a significant improvement over
temporal high-pass filtering, they still face several fundamental limitations that
become particularly apparent in awake imaging setups. The primary limitation stems from
the assumption that the optimal number of singular vectors to remove in each block
remains constant throughout an acquisition. In practice, this assumption fails during
brain movement: optimal thresholds vary significantly depending on the minimal velocity
of blood flow to be detected, and the amount of tissue motion present in the @iq block
to be filtered (@fig:svd-tissue-movement). The need to address this limitations led to
the development of adaptive filtering approaches that can dynamically adjust filtering
parameters based on the characteristics of each block of beamformed @iq images.

#figure(
  placement: auto,
  image("figures/svd_tissue_movement.png"),
  caption: figure-caption(
    [Comparison between @svd:short clutter filter thresholds with and without tissue
      motion.],
    [Power Doppler images of a neonate brain were acquired while the patient remained
      still (*Top*) or moved (*Bottom*). When no motion is present, a threhsold of 60 is
      sufficient to remove the tissue clutter. However, when the patient moves, even a
      thershold of 100 does not entirely remove the tissue clutter relative to the
      no-motion case. Adapted from @Baranger2018.],
  ),
) <fig:svd-tissue-movement>

===== Adaptive @svd:short\-Based Filtering

The limitations of static @svd\-based clutter filtering motivated the development of
adaptive clutter filtering strategies for @fusi capable of dynamically adjusting the number
of removed singular vectors based on the characteristics of each @iq block. In 2018,
Baranger and colleagues compared several adaptive @svd filtering strategies and proposed
a new adaptive filtering framework based on the similarity of the spatial singular
vectors @Baranger2018.

====== Energy Criteria

The most intuitive approach to adaptive filtering exploits the energy distribution
across singluar vectors. Since tissue motion typically exhibits higher energy than blood
flow signals, Baranger and colleagues proposed several threshold estimators based on
singular value magnitudes---that is, on the energy of the corresponding singular
vectors.

A direct approach involves setting thresholds based on the magnitude of singular values
relative to the total signal energy, assuming that values above a certain decibel level
correspond to tissue components. This approach is simple to implement but stays
parametric, as it requires the user to select a threshold value in decibels.

An alternative parametric strategy considers the cumulative energy distribution, where
the threshold is determined when the ratio between blood signal energy (sum of remaining
singular values) and total signal energy reaches a predetermined level. This approach
recognizes that tissue and blood signals occupy distinct energy subspaces within the
@svd decomposition.

A non-parametric energetic method identifies characteristic changes in the singular
value distribution by detecting inflection points in the singular value curve. This
approach assumes that the transition from tissue-dominated to blood-dominated singular
vectors manifests as detectable changes in the rate of singular value decay.

====== Frequency Criteria

Given the traditional use of high-pass filtering in Doppler imaging, several adaptive
methods analyze the characteristics of temporal singular vectors. Contrary to high-pass
clutter filters, these methods rely on the @svd decomposition to separate tissue and
blood signals on new subspaces where their overlapped frequencies might be separated.
The power spectral density of temporal singular vectors then provides insights into the
frequency content associated with different components of the decomposition.

Frequency-based estimators include analysis of the central frequency, standard
deviation, and bandwidth of temporal singular vectors. The underlying principle assumes
that tissue motion exhibits distinct frequency characteristics compared to blood flow,
with tissue generally occupying lower frequency ranges. Adaptive thresholds can be
determined either through parametric cutoffs on these spectral statistics or by
identifying inflection points where frequency characteristics change significantly.

====== Spatial Correlation Criteria

The optimal strategy proposed by Baranger and colleagues in their 2018 study leverages
the characteristics of the spatial singular vectors. This method recognizes that tissue
motion exhibits high spatial coherence across large regions, while blood flow signals
show more localized, less correlated spatial patterns.

This estimator consists in computing the correlation matrix of the magnitude of spatial
singular vectors. This correlation matrix, referred to as the spatial similarity matrix,
reveals distinct subspaces corresponding to tissue, blood, and noise components.
Tissue-related vectors typically exhibit high mutual correlation, appearing as coherent
blocks in the correlation matrix, while blood flow vectors show lower inter-correlation
due to the heterogeneous nature of vascular networks (@fig:adaptive-svd).

#figure(
  placement: auto,
  image("figures/adaptive_svd.png"),
  caption: figure-caption(
    [Adaptive @svd:short\-based clutter filtering using the spatial similarity matrix.],
    [The performance of the static and adaptive @svd\-based clutter filters are compared
      on two @fusi images neonate brains. (*a* and *e*) The spatial similarity matrices of
      the two acquisitions are computed as the correlation matrix of the magnitude of
      spatial singular vectors. (*b* and *f*) The power Doppler images from the two
      acquisitions obtained after static @svd clutter filtering is shown. The first 60
      singular vectors with highest energy were removed. The contrast in the first
      acquisition is poor, and a lot of clutter remains in the second acquisition (*c* and
      *g*) The power Doppler images obtained after adaptive @svd clutter filtering are
      shown. The first 50 and 134 singular vectors were respectively removed. The
      contrast has been improved in the first acquisition, and most of the clutter has
      been removed in the second acquisition. (*d* and *h*) To remove the noise
      subspace, singular vectors after indices 633 and 640 were removed, respectively.
      Removal of the noise subspace increased the contrast in both acquisitions. Adapted
      from @Baranger2018.],
  ),
) <fig:adaptive-svd>


This spatial analysis enables automatic identification of subspace boundaries without
requiring parametric tuning. The method proves particularly robust across varying
clinical conditions, as it adapts to the actual spatial characteristics present in each
temporal block rather than relying on predetermined assumptions about motion or flow
speeds.

However, this approach assumes both that the tissue and blood components have distinct
spatial distributions, and that the correlation structure between the magnitude of
singular vectors will lead to a clear separation between tissue and blood components.
While these assumptions were found to be valid in many clinical applications by Baranger
and colleagues, they unfortunately do not always hold
(@fig:bad-spatial-similarity-matrices). As noted in @Baranger2018, @fusi data acquired
in awake rodents using ultrasound frequencies around #qty(15, "MHz") often lead to
spatial similarity matrices that do not exhibit clear tissue and blood subspaces, making
the spatial correlation-based adaptive @svd filtering ineffective.

#figure(
  placement: auto,
  image("figures/bad_spatial_similarity_matrices.png"),
  caption: figure-caption(
    [Example spatial similarity matrices that do not exhibit clear tissue and blood subspaces.],
    [Adapted from @BarangerPhD.],
  ),
) <fig:bad-spatial-similarity-matrices>

=== Technical Maturity and Future Considerations

The development of functional ultrasound imaging represents a convergence of
technological advances that has transformed ultrasound from a primarily anatomical
imaging modality into a tool for investigating brain function. Ultrafast plane wave
imaging has overcome the temporal resolution limitations of conventional ultrasound,
while coherent compounding has preserved image quality at kilohertz frame rates. Most
critically, @svd\-based clutter filters have enabled reliable separation of weak blood
flow signals from stronger tissue motion artifacts, unlocking awake @fusi imaging
applications.

==== Technical Limitations and Maturity

Despite these advances, fundamental constraints persist. Current systems cannot achieve
true whole-brain imaging while maintaining necessary temporal resolution, with coverage
remaining partial even with advanced probe configurations. The computational demands of
real-time processing pose infrastructure challenges, and adaptive filtering
effectiveness depends on spatial distribution assumptions that do not always hold,
particularly in high-frequency imaging or complex motion scenarios.

From a technical perspective, @fusi has reached sufficient maturity for robust
preclinical applications in anesthetized preparations. However, for awake imaging---the
most scientifically valuable scenarios---the technology remains developmental, requiring
further algorithmic innovations to handle the increased complexity.

==== Future Outlook

Continued evolution will likely require advances in probe design, algorithmic approaches
to clutter filtering, and standardization as the technology transitions from specialized
research tool to broader adoption. The technical foundation established demonstrates
@fusi's viability as a functional neuroimaging modality, but translating these
capabilities into robust scientific insights depends critically on understanding the
@nvc:long relationship that links hemodynamic signals to underlying neuronal activity.

== Neurovascular Coupling: Bridge Between Neuronal Activity and Imaging <sec:neurovascular-coupling>

The functional neuroimaging techniques described in the previous sections---@fmri, @pet,
@fnirs, and #ref(<fusi>)---all depend on a fundamental biological relationship: the
brain's ability to adjust blood flow in response to neuronal activity. This #gls("nvc", first: true)
forms the physiological foundation that enables hemodynamic measurements to serve as
proxies for neuronal function. Understanding the mechanisms, temporal dynamics, and
limitations of @nvc is therefore essential for interpreting @fusi signals and designing
effective experimental paradigms. This section will examine the brain's metabolic
demands, the cellular architecture of the neurovascular unit, and the temporal
characteristics that link neuronal activity to the hemodynamic responses measured by
functional neuroimaging techniques.

=== The Brain's High Energy Demand

The human brain represents one of the most metabolically demanding organs, consuming a
disproportionate amount of energy relative to its size. Despite accounting for only
approximately #qty(2, "%") of total body weight, the brain consumes
#qtyrange(15, 20, "%") of the body's resting energy @Attwell2010. This substantial
metabolic burden reflects the computational demands of neuronal processing.

The brain's energy requirements stem primarily from the processes underlying neuronal
computation. Indeed, the majority of cerebral energy consumption is dedicated to
maintaining the ion gradients that generate synaptic and action
potentials#footnote[Synaptic potentials are temporary electrical changes in a neuron's
  membrane potential that occur when neurotransmitters from a presynaptic neuron bind to
  receptors on the postsynaptic neuron. Action potentials are rapid, temporary changes in
  electrical voltage across a neuron's membrane that propagate along the nerve fiber to
  transmit information.] @Attwell2001 @Attwell2010. Active transport mechanisms,
particularly the sodium-potassium pump, continuously restore ion gradients disrupted by
neuronal activity, consuming significant amounts of @atp in the process. Additional
energy supports neurotransmitter synthesis, vesicle recycling, and maintenance of
cellular integrity.

Most importantly, the brain possesses no energy reserves, creating a critical
vulnerability whereby brain function depends entirely on continuous glucose and oxygen
delivery through cerebral circulation @Iadecola2017. This metabolic constraint has
shaped cerebral vascular organization and regulation, as brief interruptions in energy
supply can rapidly compromise neuronal function and cause irreversible brain damage.

These metabolic demands have driven the evolution of sophisticated #gls("nvc", first: true) mechanisms
that dynamically match blood flow delivery to local metabolic needs. These mechanisms
enable rapid increases in local blood flow---termed _functional hyperaemia_---in brain
regions experiencing increased neuronal activity. This coupling ensures adequate glucose
and oxygen delivery while facilitating removal of metabolic byproducts including carbon
dioxide, lactate, and heat @Iadecola2017.

=== The Neurovascular Complex: A Functional Framework

As discussed in @sec:early-efforts, the relationship between neuronal activity and
cerebral blood flow was first empirically demonstrated by pioneers such as Mosso, Roy,
and Sherrington in the late 19#super[th] century @Mosso1881 @Roy1890. Unfortunately,
these early efforts were largely dismissed or overlooked by the scientific community,
such that the neuronal and vascular systems were considered largely independent for much
of the 20#super[th] century @Iadecola2017.

The formal recognition of the integrated nature of these systems only emerged in the
early 21#super[st] century, with the introduction of the #gls("nvu", first: true) at the Stroke
Progress Review Group meeting of the National Institute of Neurological Disorders and
Stroke @Iadecola2017. The @nvu represents a functional multicellular complex that
regulates cerebral blood flow, maintains the #gls("bbb", first: true), and coordinates
neuronal activity with vascular responses @Iadecola2017.

==== Cellular Components of the Neurovascular Unit

_Neurons_ serve as the primary drivers of brain activity, initiating @nvc by signaling
changes in metabolic demand. Through the release of neurotransmitters, neurons not only
initiate synaptic transmission but also modulate astrocytic and endothelial signaling,
ensuring that blood flow is locally matched to neuronal energy requirements
@Iadecola2017.

_Endothelial cells_ line the brain's blood vessels, forming a continuous and selectively
permeable barrier. Their polarized membranes contain specific proteins that control
molecular traffic between blood and brain parenchyma. Most importantly, endothelial
cells propagate neurovascular signals from capillaries around active neurons back to
larger vessels, thereby ensuring a coordinated response to neuronal activity
@Iadecola2017.

_Pericytes_ are in direct contact with the endothelium and embedded within the vascular
basement membrane. These cells wrap around capillaries and serve multiple roles,
including maintaining blood-brain barrier integrity by modulating endothelial cell gene
expression and contributing to angiogenesis @Bell2020. Some pericytes also act
as contractile cells that regulate capillary blood flow, although the extent of their
role in this process remains debated @Iadecola2017.

_#Glspl("smc")_ are predominantly found in arteriole and arterial walls within the
@nvu. These cells generate contractile forces that regulate vessel diameter and vascular
tone, ensuring appropriate blood distribution during both resting and active periods.
Their role is critical in fine-tuning vascular perfusion in response to either
downstream signals or changes in systemic factors---such as increases in arterial
pressure or changes in partial pressure of oxygen and carbon dioxide @Iadecola2017.

_Astrocytes_ are another essential @nvu component. These glial cells#footnote[Glial
  cells are supportive cells in the nervous system that provide structural support,
  insulation, and maintenance functions for neurons, including forming myelin sheaths,
  regulating the chemical environment, and facilitating communication between nerve
  cells.] extend polarized endfeet that enwrap blood vessels almost completely. Astrocytes
modulate the @nvc by responding to neuronal activity with calcium signals and releasing
vasoactive substances to adjust vascular tone. The extent of their role in regulating
blood flow remains debated, although it is generally agreed that astrocytes play a
crucial role in the @nvc in at least some parts of the cerebrovascular tree
@Iadecola2017.

_Microglia_, the brain's resident immune cells, represent another component whose role
in @nvc is still being actively investigated. Recent research has demonstrated that
microglia modulate both baseline cerebral blood flow and neurovascular responses
@Fu2025. However, their precise mechanisms and relative importance compared to other
@nvu components remain areas of active investigation.

==== From Unit to Complex

Recent advances in single-cell transcriptomics and functional imaging have revealed
substantial heterogeneity across different regions of the cerebrovascular tree
@Schaeffer2021. This recognition has led to the emergence of the concept of the
"neurovascular complex", which acknowledges that the @nvu is not a single entity that is
identical across the entire brain. Rather, the segmental diversity suggests that
@nvc:long mechanisms operate through distinct cellular pathways and signaling molecules
depending on vascular location and local tissue requirements. Understanding this complex
organization provides the foundation for interpreting hemodynamic signals measured by
functional neuroimaging techniques, which depend on the coordinated vascular responses
generated by this integrated neurovascular complex.

=== Cerebrovascular Architecture and Flow Control

The cerebral circulation presents a hierarchical organization designed to deliver
oxygenated blood from the heart to brain tissue and return deoxygenated blood to the
circulation (@fig:human-brain-vasculature and @fig:mouse-brain-vasculature). This
vascular tree exhibits distinct structural and functional characteristics across
different segments, each with specific capabilities for blood flow regulation and
metabolic support.

#figure(
  placement: auto,
  image("figures/human_brain_vasculature.png"),
  caption: figure-caption(
    [Hierarchical organization of the human cerebral vasculature.],
    [The internal carotid, one of the major arteries perfusing the brain, features thick
      layers of #glspl("smc", first: true) and rich innvervation. As vessels become
      smaller (middle cerebral artery #sym.arrow.r pial arterioles #sym.arrow.r
      penetrating arterioles), the @smc layer progressively thins and innvervation shifts
      from extrinsic to intrinsic nerves. At capillary level, @smc:pl are replaced by
      pericytes. Adapted from @Schaeffer2021.],
  ),
)
<fig:human-brain-vasculature>

#figure(
  placement: auto,
  image("figures/mouse_brain_vasculature.png"),
  caption: figure-caption(
    [Hierarchical organization of the mouse cerebral vasculature.],
    [(*A*) Atlas of the C57BL/6 mouse cerebrovascular tree. The main arteries (red) and
      veins (blue) are represented. Acronyms are and hierarchical tree are provided in
      (*B*) and (*C*). The main imaging plane used in Chapters @ch:denoising[] and
      @ch:pharmacofusi[] is indicated by the black dashed line. Adapted from
      @Xiong2017.],
  ),
)
<fig:mouse-brain-vasculature>


==== Hierarchical Organization

Blood reaches the brain through major extracranial arteries, including the internal
carotid and vertebral arteries which converge at the circle of Willis located at the
base of the brain @Schaeffer2021. These large vessels contain thick layers of
@Smc:pl and are richly innervated. The circle of Willis and its major branches, such
as the middle cerebral artery, provide the primary distribution network for cerebral
blood flow while maintaining collateral connections that ensure continued perfusion in
case of vessel occlusion.

From the circle of Willis, pial arteries and arterioles extend across the brain surface
forming an dense network. These surface vessels still contain multiple layers of @smc:pl
to respond to systemic signals---such as increases in arterial pressure or changes in
partial pressure of oxygen and carbon dioxide---and retrograde signals coming from
deeper parts of the vascular tree. Pial vessels give rise to penetrating arterioles that
dive into the brain parenchyma, initially surrounded by perivascular spaces containing
various cell types including perivascular macrophages#footnote[Macrophages are large
  immune cells that engulf and digest pathogens, dead cells, cellular debris, and other
  foreign substances to help protect the body from infection and maintain tissue health.
  Microglia are the brain's resident macrophages.] @Schaeffer2021.

As vessels penetrate deeper into brain tissue, their structure becomes progressively
simplified. Penetrating arterioles possess thinner smooth muscle cell layers and reduced
perivascular innervation @Schaeffer2021. Intraparenchymal arteriole contain only single
layers of smooth muscle cells. At this level, the perivascular space disappears as
vascular and glial basement membranes fuse, creating direct contact between vessels and
astrocytic endfeet.

The transition from arterioles to capillaries marks a fundamental change in vascular
organization. Capillaries are not surrounded by smooth muscle cells, but by pericytes
@Schaeffer2021. This capillary network provides the primary site for nutrient and gas
exchange while maintaining the closest proximity to neurons. The venous system then
collects deoxygenated blood and metabolic waste products for return to the systemic
circulation.

==== Species Considerations: Mouse vs. Human Vessel Dimensions

While the hierarchical organization of cerebral circulation is conserved across
mammalian species, vessel dimensions vary considerably. In mice, the model used
throughout Chapters @ch:denoising[] and @ch:pharmacofusi[], vessel diameters are
substantially smaller than their human counterparts. The internal carotid artery in mice
ranges from #qty(100, "um") to #qty(200, "um") in diameter @Qian2018, compared to
several millimeters in humans @Schaeffer2021. Similarly, mouse pial arteries average
#qty("34+-8", "um") and penetrating arterioles measure #qty("17+-5", "um") (mean
#sym.plus.minus standard deviation) @Sekiguchi2014, while human pial vessels range from
#qtyrange(200, 1000, "um") and penetrating arterioles measure #qtyrange(40, 50, "um")
@Schaeffer2021. At the capillary level, mouse vessels average approximately
#qty(3, "um") in diameter @Todorov2020, compared to #qtyrange(6, 7, "um") in humans
@Schaeffer2021.

=== Mechanisms of Neurovascular Coupling

The mechanisms underlying @nvc have been the subject of extensive research, yet
important questions remain about how neuronal activity translates into vascular
responses. Understanding these mechanisms is essential for interpreting functional
neuroimaging signals, as different coupling pathways may contribute differently to the
hemodynamic responses measured by techniques such as @fusi.

==== Feedforward vs. Feedback Mechanisms

The traditional view proposed that @nvc operates through metabolic feedback, where
increased neuronal activity leads to local depletion of oxygen or glucose, subsequently
triggering compensatory increases in blood flow. However, experimental evidence has
increasingly challenged this simple model @Iadecola2017.

The _metabolic feedback hypothesis_ suggests that when neurons become active, their
increased metabolic demand leads to local changes in metabolite concentrations that
signal the need for increased blood flow. Adenosine, produced during @atp breakdown, is
a well-established example of such metabolic signaling, acting as a potent vasodilator
when energy demands are high @Attwell2010. In this model, the vasculature "senses"
theses metabolic changes and responds by dilating to increase blood flow, thereby
restoring the balance between supply and demand. A negative feedback loop ensues to
ensure that the increase in blood flow matches the metabolic requirements of the
active neurons The feedback hypothesis was originally supported by the vasodilatory
effects of hypoxia---lack of oxygen---and hypercapnia---excess carbon dioxide.

However, evidence suggests against a pure metabolic feedback model. Most notably, it has
been shown that during functional hyperemia, the increase in @cbf was four times greater
than the increase in @atp production and oxygen consumption @Raichle2006 @Lin2010. This
excess explains why the #gls("bold", first: true) signal measured by @fmri increases following neuronal
activity. @fusi studies have also demonstrated that carbon dioxide, a classic metabolic
byproduct, does not contribute to @nvc under normal physiological conditions
@Tournissac2024. Furthermore, pharmacological studies blocking neurotransmitter
signaling pathways greatly reduced vascular responses while having minimal effects on
energy consumption @Attwell2010. Finally, functional hyperaemia persists even when
oxygen and glucose are in excess @Iadecola2017. Together, these observations suggest
that blood flow regulation operates---at least in part---independently of metabolic
demand @Iadecola2017

Instead, a _feedforward hypothesis_ has emerged, suggesting that neurons themselves
initiate vascular responses through direct signaling mechanisms @Iadecola2017. In this
model, the synaptic activity of neurons triggers a signaling cascade that involves the
activation of glial cells, like astrocytes, and the release of several vasoactive agents
such as nitric oxide, potassium ions, and prostaglandins @Attwell2010 @Iadecola2017.
Essentially, neuronal activity itself preemptively "calls for" increased blood flow,
anticipating its metabolic needs.

Current understanding suggests that both mechanisms likely operate together, with
feedforward pathways dominating normal physiological responses by initiating a rapid
increase in blood flow, while metabolic feedback "fine-tunes" this perfusion while
providing additional regulation under conditions of high energy demand or vascular
compromise (@fig:feedforward-feedback) @Iadecola2017.

#figure(
  placement: auto,
  image("figures/feedforward_feedback.png"),
  caption: figure-caption(
    [Feedforward and feedback mechanisms in neurovascular coupling.],
    [Glutamate release during synaptic activity triggers a signaling cascade mediated by
      vasoactive compounds such as @no and prostanoids. These compounds initiate the
      feedforward component of the #gls("nvc", first: true) by dilating arterioles and capillaries.
      Concurrently, active neurons consume oxygen and produce vasoactive metabolic
      by-products such as adenosine, lactate, and carbon dioxide. This increased
      metabolism drives the feedback component of the @nvc, fine-tuning the blood flow
      response to match the metabolic needs of the tissue. Adapted from @Iadecola2017.],
  ),
) <fig:feedforward-feedback>

==== Retrograde Vasodilation

Capillaries, being closest to active neurons, are the primary sites for detecting
local changes in neuronal activity. However, their small size gives them limited
capacity for diameter change. Thus, while the @nvc is initiated at the capillary
level, vasodilatory signals must propagate upstream along the vascular tree to ensure
that larger arterioles and pial arteries also dilate. This mechanism, referred to as
_retrograde vasodilation_, is critical for coordinating the functional hyperemia
@Iadecola2017.

Endothelial cells play a central role in this propagation process, acting as conduits
for transmitting signals from capillaries to larger vessels via intercellular junctions
@Iadecola2017. This propagation ultimately travels to @smc:pl, inducing their relaxation
and resulting in vessel dilation. Along the way, interneurons and other vascular
mechanisms might have a role in focusing the hemodynamic response to avoid flooding a
larger area than necessary @Schaeffer2021.

Implications of signal propagation are particularly relevant for functional
neuroimaging. The hemodynamic signals measured by techniques like @fusi reflect the
integrated output of the retrograde vasodilation mechanisms rather than simple local
responses, leading to an overestimation of the spatial extent of neuronal activity
@Iadecola2017. Understanding propagation dynamics is therefore crucial for interpreting
the spatial and temporal characteristics of imaging signals and relating them to
underlying neuronal activity patterns.

=== Temporal Dynamics of Hemodynamic Responses

Despite the complexity of the @nvc, studying the temporal characteristics of hemodynamic
responses is fundamental to interpreting the signals from functional neuroimaging
modalities. Indeed, the relationship between neuronal activity and vascular responses
determines both the effective temporal resolution of these modalities, but also the
interpretability of the measured signals. Thus, there was from the very beginning
a great appeal in defining mathematical models to describe hemodynamic responses.

==== Hemodynamic Response Function

A #gls("hrf", first: true) is a mathematical model that describes the temporal relationship between
neuronal activity and vascular responses---such as @cbf, @cbv, or oxygenation changes.
However, measuring both direct neuronal activity and their corresponding hemodynamic
responses simultaneously is challenging. Consequently, @hrf:pl was originally defined
operationally as the impulse response function between induced neuronal
activity---typically through controlled stimulations or experimental tasks---and the
resulting changes in signals measured by functional neuroimaging techniques---such as
@fmri, @pet, or @fusi.

The earliest @hrf models employed simple box-car functions, essentially comparing
baseline signals with stimulation periods @Petersen1988 @Belliveau1991 @Bandettini1992
@Kwong1992. Remarkably, these simple box-car models already provided good correlations
between stimulation patterns and functional signals, leading to the first spatial maps
of brain activity @Petersen1988 @Belliveau1991. Such a straightforward approach is still
widely used in the contemporary @fusi literature when looking for activated regions
without considering the temporal dynamics of the hemodynamic response @Gesnik2017
@Rabut2019 @Provansal2021 @Droguerre2022. However, research groups at the origin of the
earliest @fmri studies already recognized the importance of the temporal characteristics
of hemodynamic responses they observed @Bandettini1992 @Kwong1992.

Of course, there is no single, universal @hrf. Given the heterogeneous nature of the
@nvc and the multitude of functional neuroimaging modalities, the @hrf exhibits
significant variation across modalities, species, brain regions, brain states, and
experimental conditions. Unfortunately, this makes the term "@hrf" somewhat ambiguous,
as its interpretation depends on the specific context in which it is used
@Handwerker2004 @Pisauro2013 @Boido2019 @Claron2023 @NunezElizalde2022. These variations
have important implications for interpreting functional neuroimaging data and comparing
results across different experimental paradigms @Handwerker2012.

===== Species Differences: Human vs. Mouse

In general, @hrf:pl are faster in small laboratory animals such as mice and rats
compared to humans, reflecting differences in cerebrovascular organization and scaling
relationships @Chen2023 @Claron2023 @NunezElizalde2022 (@fig:hrf-examples). This timing
difference must be considered when translating findings between preclinical animal
studies and human neuroimaging research.

#figure(
  placement: auto,
  image("figures/example_hrfs.png"),
  caption: figure-caption(
    [Example @hrf:pl in humans, rodents, and macaques.],
    [(*A*) Example @hrf:short models in humans, mice, and rats, defined using
      @bold\-@fmri measurements in response to external stimuli. Mice and rats were
      anesthetized, while humans were awake. @hrf:pl from rodents show faster dynamics
      than in humans. Adapted from @Chen2023 (*B*) Example @hrf derived from simultaneous
      electrophysiology and @fusi measurements in awake mice. Here, authors were able to
      determine the optimal @hrf relating neuronal firing across many neurons (black) to
      @fusi signals (red), showing good agreement during both stimulus-induced activity
      and at rest. Adapted from @NunezElizalde2022. (*C*) Example @hrf derived from
      simultaneous electrophysiology and @fusi measurements in awake macaques. Here,
      authors used a different electrophysiological approach than in *B*, recording
      single neurons. They then determined the optimal @hrf relating signals from
      these neurons (blue) to @fusi signals (orange). However, contrary to *B*, they
      found good agreement between neuronal firing and @fusi signals only during
      stimulus-induced activity, but not at rest. This further shows the variability of
      @hrf:pl across species, recording modalities, and experimental conditions. Adapted
      from @Claron2023.],
  ),
) <fig:hrf-examples>

In awake mice, @fusi measurements reveal @hrf characteristics with a peak delay of
around 2.1 seconds and a #gls("fwhm", first: true) of approximately 2.9 seconds @NunezElizalde2022.
Similarly, optical imaging studies in awake mice cortex show comparable temporal
profiles @Pisauro2013. These rodent @hrf timings contrast with the @hrf:pl typically
observed in human @bold\-@fmri studies, which reaches peak amplitude at around 5 seconds
with @fwhm of approximately 5 seconds @Boynton1996 @Glover1999. The faster hemodynamic
responses in small animals likely reflect the substantially smaller cerebrovascular
dimensions and faster metabolisms.

===== Modality-Dependent Characteristics

The @hrf varies significantly across different neuroimaging modalities, reflecting the
distinct physiological processes each technique measures. Understanding these
differences is crucial for interpreting hemodynamic signals and comparing results
between imaging approaches.

@Bold\-@fmri signals are maybe the most studied in terms of temporal dynamics. After
stimulation, there is often an initial dip in oxygenation reflecting increased metabolic
demand, followed by a larger overshoot in oxygenation from increased blood flow, and
finally a post-stimulus undershoot that can persist for tens of seconds @Mateo2017
@Gao2017. This complex temporal profile arises from the interplay between blood flow,
volume, and oxygenation changes, with the @bold signal primarily reflecting the
"oversupply" of oxygenated blood to active brain regions.

Optical imaging spectroscopy studies have revealed that different hemodynamic parameters
exhibit distinct temporal characteristics even when measured simultaneously. @Cbf
responses tend to track arterial dilation closely with time constants of a few seconds,
while @cbv changes reflect the combined contributions of arterial and venous responses
with potentially longer time courses @Drew2011. @fusi measurements, which primarily
reflect @cbv changes, show @hrf characteristics that closely match those derived from
optical imaging of awake mice cortex @Pisauro2013 @NunezElizalde2022.

==== Impact of Anesthesia

The characteristics of the @hrf:pl are strongly influenced by the physiological state
of the subject, with variations in both the temporal dynamics and amplitude of
neurovascular responses. These state-dependent changes represent one of the most
important sources in variability of the @hrf:pl in functional neuroimaging experiments,
and must be considered when interpreting results.

Anesthesia, an often necessary condition for preclinical functional neuroimaging, causes
a strong reduction in hemodynamic response amplitudes compared to awake conditions
(@fig:anesthetized-vs-awake). Studies comparing awake and anesthetized mice have
revealed that while visual stimulation produces only a modest increase in spike rates in
awake animals (around 20% increase compared to anesthetized conditions), the @cbv
response shows a much larger increase (around 100%) @Pisauro2013 @Gao2017. This effect
indicates that anesthesia directly impairs the @nvc mechanisms rather than simply
reducing responses proportionally to neuronal activity. Two-photon microscopy studies
have also demonstrated that arterial dilations in response to sensory stimulation are
two-fold or greater in awake compared to anesthetized animals @Drew2011 @Gao2017.

#figure(
  placement: auto,
  image("figures/anesthetized_vs_awake.png"),
  caption: figure-caption(
    [Comparison of hemodynamic responses in awake and anesthetized states.],
    [(*A*) Example @bold responses in the primary visual cortex of awake and anesthetized
      monkeys following visual stimulation (dashed line). (*B*) Example @iosi responses
      in the primary visual cortex of awake and anesthetized mice following visual
      stimulation. Adapted from @Pisauro2013.],
  ),
) <fig:anesthetized-vs-awake>

Anesthesia also significantly slows the temporal dynamics of hemodynamic responses,
introducing substantial delays in the @bold, @cbv, and @cbf @hrf:pl. Comparative studies
have found approximately a 2-second delay in the @cbv @hrf in anesthetized mice relative
to awake animals @Pisauro2013. Importantly, this temporal shift far exceeds the modest
(about 100 ms) slowing of neuronal dynamics caused by anesthesia, clearly demonstrating
that anesthesia fundamentally alters the dynamics of the @nvc rather than simply
delaying neuronal responses @Gao2017. Similar slowing of @bold hemodynamic responses has
been observed in anesthetized compared to awake monkeys @Pisauro2013.

Moreover, the amplitude and temporal characteristics of the @nvc under anesthesia are
highly sensitive to the specific anesthetic agent and dosage employed. Results obtained
under different anesthetic protocols are often not directly comparable, and the
approximately linear @nvc relationship observed in awake animals is not consistently
maintained under anesthesia @Masamoto2012 @Gao2017. This sensitivity underscores the
complexity of anesthetic effects on neurovascular coupling mechanisms.

These alterations reflect the disruption that anesthetics cause across multiple systems
involved in the @nvc. For instance, anesthetics generally reduce brain metabolism and
neuronal firing rates, and alter cardiovascular functions such as heart rate and blood
pressure regulation @Gao2017. The impact of anesthesia on @nvc has driven the functional
neuroimaging field toward awake animal preparations to obtain measurements that are more
translatable to human conditions @Gozzi2025. Given its compatibility with awake
preparations, @fusi represents a promising approach for awake studies, as it offers
sufficient @snr:long to capture single-trial hemodynamic responses in behaving animals
@NunezElizalde2022.

==== Frequency-Dependent Coupling

The relationship between neuronal activity and hemodynamic responses exhibits strong
frequency dependence, with coupling strength varying systematically across different
temporal scales. This frequency dependence has important implications for understanding
the temporal resolution and interpretability of functional neuroimaging signals.

Studies combining electrophysiological recordings with @fusi have revealed that the
coupling between neuronal firing and hemodynamic signals is strongest at low
frequencies. Spectral coherence analysis shows peak correlation between #num(0.01) and
#qty(0.1, "Hz"), declining gradually to chance levels at approximately #qty(0.3, "Hz")
@NunezElizalde2022. This frequency dependence indicates that low-frequency fluctuations
in @fusi reflect genuine neuronal activity, while fluctuations at higher frequencies
likely represent measurement noise or physiological processes unrelated to local
neuronal activity.

The frequency dependence of neurovascular coupling has also been demonstrated through
studies of ultra-slow oscillations in arteriole diameter and their relationship to
neuronal activity. These vasomotor oscillations, occurring around #qty(0.1, "Hz"), show
strong coherence with the envelope of gamma-band neuronal activity, with neuronal
activity leading vasodilation by approximately 2 seconds @Mateo2017. The bandwidth of
this coupling extends from #num(0.05) to #qty(0.30, "Hz"), consistent with the broad
spectrum of vasomotion observed in cerebral arterioles @Drew2011.

===== Implications for Functional Neuroimaging

The frequency-dependent nature of @nvc creates inherent limitations on the temporal
resolution achievable with hemodynamic neuroimaging techniques. For instance, the
rolloff of coupling strength above #qty(0.3, "Hz") observed in @fusi suggests that
hemodynamic signals cannot reliably track neuronal activity changes occurring on
timescales faster than approximately 3 seconds @NunezElizalde2022. This limitation
affects the ability to resolve rapid changes in brain state and constrains the temporal
precision with which neuronal computations can be inferred from hemodynamic
measurements.

However, the high @snr:long achievable with @fusi enables single-trial measurements that
can capture moment-by-moment fluctuations in neuronal activity within the frequency range
where coupling is reliable @NunezElizalde2022. This capability represents a significant
advancement over traditional neuroimaging approaches that require averaging across
multiple trials or extended time periods to achieve adequate statistical power.

Understanding these temporal characteristics of @nvc is essential not only for
interpreting individual brain responses, but also for studying how different brain
regions communicate with each other. The frequency selectivity and regional variability
of the @nvc have direct implications for measuring the connectivity between brain areas,
where synchronized hemodynamic fluctuations are used to infer underlying neuronal
network activity.

== Understanding Functional Connectivity <sec:understanding-functional-connectivity>

Modern neuroimaging has revealed that brain regions rarely operate in isolation.
Instead, spatially distinct areas exhibit coordinated fluctuations in their activity,
forming functional networks that support cognitive processes, sensory integration, and
motor control. Functional connectivity---defined as the statistical dependencies between
neuronal signals recorded from different brain regions---has emerged as a powerful
framework for investigating these inter-regional relationships. Unlike traditional
activation studies that identify "where" brain activity occurs, functional connectivity
examines "how" different regions coordinate their responses over time. For @fusi, the
technique's high temporal resolution and compatibility with awake preparations creates
unique opportunities to examine connectivity dynamics on behaviorally relevant
timescales. This section will explore how functional connectivity relates to effective
and structural connectivity and the methodological approaches for measuring functional
connectivity.

=== Historical Perspectives on Brain Organization

==== Localizationism and Connectionism Views

As discussed in @sec:early-efforts, early work by Gall, Broca, and Wernicke established
the principle of cerebral _localizationism_ that emphasized that brain functions could
be mapped to specific anatomical regions. This localizationist view remained largely
supported during the 19#super[th] century due to the success of lesion studies and
electrical stimulation paradigms that linked specific brain areas to distinct cognitive
and motor functions @Friston2011.

However, the localizationist perspective faced criticism near the end of the
19#super[th] century. The emergence of _connectionist_ ideas emphasized the importance
of inter-regional communication and the distributed nature of brain function. Indeed,
further observations of brain lesion patients revealed that functional impairments
could result from disrupted connections between brain areas rather than localized tissue
damage alone @Friston2011. This marked the emergence of _functional integration_ as a
complementary principle to _functional segregation_, recognizing that while each brain
area may have specialized functions, these areas must work together through
inter-regional communication to support complex behaviors
(@fig:segregation-vs-integration).

#figure(
  placement: auto,
  image("figures/segregation_vs_integration.jpg"),
  caption: figure-caption(
    [Functional segregation vs. integration in brain organization.],
    [Nodes represent brain regions, while edges represent connections between
      them. (*a.*) Network segregation is defined as the organization of nodes into
      modules (shaded areas representing densely interconnected groups with sparse
      between-module connections). (*b.*) Network integration is defined as long-range
      connectivity between distant regions facilitated by connector hubs (highly
      connected nodes that link different modules). Adapted from @ShenoyHandiru2021.],
  ),
) <fig:segregation-vs-integration>

The advent of modern neuroimaging techniques, particularly @fmri, revolutionized the
study of brain organization by enabling non-invasive examination of brain activity in
humans. Early @fmri studies revealed that even simple cognitive tasks engage distributed
networks of brain regions, supporting the connectionist view of brain function
@Friston1994. Notably, the discovery of spontaneous correlated activity between
functionally related regions during rest established that the brain maintains intrinsic
patterns of functional connectivity independent of external tasks @Biswal1995. This
discovery fundamentally changed our understanding of the brain from a passive,
stimulus-driven system to an actively maintained network with ongoing inter-regional
communication @Friston2011.

==== From Regional Activity to Network Organization

The early decades of functional neuroimaging research were predominantly focused on
identifying brain regions that showed increased activation during specific tasks
#cite(<Friston1994>)---an approach that essentially represented an extension of the
localizationist views @Friston2011. While valuable for mapping functional
specialization, this activation-based paradigm proved insufficient for understanding how
different brain regions coordinate their activity to support complex cognitive
functions.

A critical shift occurred when researchers recognized that understanding brain function
required examining not just which regions were active, but how the activity of different
regions was coordinated @Stephan2009 @Friston2011 @ThomasYeo2011 @Buckner2013. This
realization led to the development of functional connectivity methods, which examine the
statistical relationships between neuronal signals recorded from spatially distinct
brain regions. The focus shifted from identifying "activated" regions to understanding
the patterns of inter-regional communication that underlie brain function @Friston2011.

The recognition that brain function emerges from coordinated activity of distributed
neuronal networks gave rise to methodological approaches that emphasize the study of
brain networks rather than individual regions @Friston2011 @ThomasYeo2011 @Buckner2013.
This perspective views the brain as a complex system comprised of nodes (brain regions
or neuronal populations) connected by edges (functional or anatomical connections),
where function arises from dynamic interactions between the network parts rather than
their individual contributions.

Contemporary neuroscience increasingly applies graph theory to quantify brain
organization, revealing that brain networks exhibit "small-world" characteristics that
optimize the trade-off between functional specialization and integration @Sporns2004.
These networks demonstrate high local clustering for specialized processing---that is,
nodes tend to form tightly connected groups---while maintaining short path lengths
between regions for efficient global communication. Importantly, brain networks are
dynamic systems whose connection patterns evolve over multiple temporal scales, from
rapid task-related reconfigurations to slower experience-dependent changes @Bassett2011.

=== Defining Brain Connectivity

Understanding the measurement and interpretation of brain connectivity requires careful
consideration of its conceptual foundations and methodological implementations. This
section establishes the theoretical framework for connectivity analysis, distinguishing
between different types of connectivity measures and their specific applications in
neuroimaging research.

==== The Three Pillars of Brain Connectivity

Modern connectivity research is built upon three fundamental concepts that capture
different aspects of inter-regional brain relationships (@fig:connectivity-types)
@Friston2011. Each type provides unique insights into brain organization and serves
distinct research purposes.

#figure(
  placement: auto,
  image("figures/connectivity_types.png"),
  caption: figure-caption(
    [The three pillars of brain connectivity.],
    [Structural connectivity represents the anatomical pathways connecting brain
      regions. Functional connectivity captures statistical dependencies between neuronal
      signals recorded from distinct regions, often through temporal correlations.
      Functional connections may exist even in the absence of structural coupling.
      Effective connectivity refers to the causal influence one neuronal system exerts
      over another, requiring explicit models of how observed activity is generated.],
  ),
) <fig:connectivity-types>

_Structural connectivity_ represents the anatomical pathways that physically connect
brain regions, typically measured through white matter tractography using diffusion
tensor imaging @Sporns2005. These anatomical connections provide the physical substrate
for neuronal communication, constraining but not fully determining functional interactions
@Sporns2005 @Buckner2013. Structural connectivity can be thought of as the "hardware" of
brain networks---the physical infrastructure that enables information flow between
regions.

_Functional connectivity_ is operationally defined as the statistical dependencies
between neuronal signals recorded from spatially distinct brain regions @Friston2011.
Most commonly measured through temporal correlations, functional connectivity reflects
the degree to which different brain areas exhibit synchronized activity patterns.
Importantly, functional connectivity is a statistical construct that does not directly
represent physical connections but rather captures the coordinated dynamics of
distributed neuronal populations @Friston2011.

_Effective connectivity_ refers explicitly to the causal influence that one neuronal
system exerts over another, either at synaptic or population levels @Friston2011. Unlike
functional connectivity, effective connectivity requires explicit models of how observed
neuronal activity is generated, enabling inferences about directed causal relationships
between brain regions. Effective connectivity represents the "software" of brain
networks---the dynamic, context-dependent patterns of influence that determine
information flow.

The relationship between these connectivity types is hierarchical and complementary.
Structural connectivity provides constraints on effective connectivity by determining
which regions can directly influence each other. Effective connectivity, in turn,
generates the patterns of statistical dependencies that are measured as functional
connectivity @Friston2011. Understanding these relationships is crucial for interpreting
connectivity findings and choosing appropriate analysis methods.

==== Functional Connectivity: Core Concepts <sec:functional-connectivity-concepts>

Functional connectivity represents the temporal correlation between time series recorded
from different brain regions. For two regions with time series $x$ and $y$, functional
connectivity is typically defined using the Pearson correlation coefficient
@Stephan2009:

$ r_(x y) = (op("cov")(x, y)) / (sigma_x sigma_y), $

where $sigma_x$ and $sigma_y$ are the standard deviations and $op("cov")(x, y)$ is the
covariance of the two time series. The Pearson correlation coefficient captures the
degree to which two regions exhibit synchronized fluctuations over time, with values
ranging from -1 (perfect anti-correlation) to +1 (perfect positive correlation).

While Pearson's correlation remains the most common method for estimating functional
connectivity, numerous alternative statistics exist in the scientific literature
@Liu2025. These include methods that rely on temporal or spectral information, capture
nonlinear dependencies, or describe time-varying relationships. The choice of
pairwise statistic should always be guided by the specific research question. Indeed,
different statistics can capture distinct aspects of the relationship between regions,
and thus may lead to different interpretations of functional connectivity @Liu2025.

Unfortunately, interpreting functional connectivity results suffers from limitations
inherent to correlation analysis @Stephan2009 @Friston2011. Observed correlations
between two regions can arise from:

1. direct influence from region $x$ to region $y$,
2. direct influence from region $y$ to region $x$,
3. bidirectional influences between regions,
4. common input from a third region influencing both.

Functional connectivity alone cannot distinguish between these scenarios. Instead,
models of effective connectivity are required to infer causal relationships and
understand the underlying mechanisms generating the observed correlations.

The interpretation of functional connectivity is further complicated by its dependence
on the underlying neuronal synchronization mechanisms. Correlations in @fmri or @fusi
signals reflect the statistical dependencies of slow hemodynamic fluctuations which
arise from complex neurovascular coupling processes @Friston2011. These hemodynamic
correlations are presumed to reflect neuronal synchronization, but the relationship
between neuronal and vascular dynamics introduces additional interpretative challenges
that must be considered in connectivity analysis (see @sec:neurovascular-coupling).

Additional limitations arise when comparing functional connectivity between different
groups or experimental conditions @Friston2011. Changes in connectivity measures can
occur even when the underlying neuronal coupling remains identical. This is the case
when there are confounding factors that affect the measured signals, such as
variations in signal-to-noise ratio, differences in neuronal firing rates, or
variations in the amplitude of hemodynamic responses.

Fortunately, these limitations do not preclude the use of functional connectivity
entirely. Indeed, the sensitivity of correlation measures to various sources of
between-group differences---whether they reflect genuine coupling changes, noise
variations, or signal amplitude differences---can actually be advantageous for
developing biomarkers or diagnostic tools. Thus, functional connectivity can be used for
classification purposes, such as distinguishing between patient populations and
controls, or separating subjects based on different treatments or experimental
conditions.

The key distinction lies in the research objective: functional connectivity excels at
_detecting differences between groups_, while effective connectivity is required for
_understanding the mechanistic basis of those differences_ @Friston2011.

==== Task-Based Versus Resting-State Paradigms

Functional connectivity can be measured under two primary experimental conditions, each
revealing different aspects of brain network organization @Friston2011 @Buckner2013.

_Task-based_ functional connectivity measures inter-regional correlations during
specific cognitive or motor tasks. This approach reveals how brain networks reconfigure
to support particular functions and how connectivity patterns change with different task
demands @Friston2011. Task-based connectivity provides insights into the dynamic,
context-dependent aspects of brain network organization and enables investigation of how
specific cognitive processes emerge from coordinated neuronal activity.

_Resting-state_ functional connectivity measures correlations in spontaneous brain
activity recorded while subjects are at rest, typically with eyes closed or fixating on
a visual target @Biswal1995 @Buckner2013. This approach has revealed robust,
reproducible networks of intrinsically correlated brain regions that ressemble
anatomical networks and maintain coherent activity patterns even in the absence of
explicit tasks (@fig:buckner2013) @Fox2005 @Raichle2001 @Buckner2013. The discovery of
these "resting-state networks" fundamentally changed our understanding of brain
organization, revealing that the brain is not a passive system awaiting external
stimulation but rather an intrinsically active network with dynamic and organized
patterns of communication.

The relationship between task-based and resting-state connectivity patterns is complex
and continues to be investigated @Buckner2013. While resting-state networks often
parallel task-activation networks, rest should not be considered an unbiased view of
brain organization. Rather, rest represents another task state with its own specific
cognitive operations and connectivity patterns. Both approaches provide complementary
insights into brain network organization, with task-based studies revealing
context-dependent reconfigurations and resting-state studies revealing intrinsic
organizational principles.

For @fusi applications, the choice between task-based and resting-state paradigms
depends on the specific research questions and experimental constraints. The high
temporal resolution of @fusi makes it particularly well-suited for examining the rapid
dynamics of connectivity changes during task performance, while its ability to record
from multiple regions simultaneously enables comprehensive mapping of resting-state
networks.

==== Temporal Dynamics of Functional Connectivity

An assumption underlying traditional connectivity analysis is the stationarity of
correlation patterns---that is, the assumption that connectivity relationships remain
constant over the measurement period @Calhoun2014. This assumption underlies static
functional connectivity analysis, where correlation coefficients are typically computed
over entire scanning sessions, often lasting 5 to 30 minutes @Calhoun2014 @Luppi2024
@Liu2025 @ThomasYeo2011.

However, accumulating evidence suggests that the connectivity strength and configuration
of brain networks evolves over multiple temporal scales @Calhoun2014 @Bassett2011. This
realization has led to the development of _dynamic functional connectivity_ approaches
that examine how correlation patterns evolve over time. Dynamic connectivity analysis
typically employs sliding window techniques, computing correlations over shorter time
windows (for example, 1 to 2 minutes) that are moved across the entire time series
@Chang2010.

Dynamic connectivity studies have revealed several important features of brain network
organization. First, connectivity patterns exhibit structured fluctuations that can be
clustered into discrete "connectivity states" @Calhoun2014. Second, the temporal
evolution of these states appears to follow systematic patterns that may reflect
different cognitive or physiological brain states @Calhoun2014 @GutierrezBarragan2024
@Liu2013. Third, alterations in connectivity dynamics have been associated with various
neurological and psychiatric conditions, suggesting that temporal variability in
connectivity may serve as a sensitive biomarker of brain function @Calhoun2014.

The interpretation of dynamic connectivity findings requires careful consideration of
methodological factors, including window length selection, statistical thresholds, and
the temporal resolution of the underlying signals @Calhoun2014. For @fusi, the high
temporal resolution (hundreds of milliseconds to seconds) provides unique opportunities
to examine connectivity dynamics on behaviorally relevant timescales, potentially
revealing aspects of network function that are invisible to slower imaging modalities.

=== Methodological Approaches for Mapping Functional Connectivity

The analysis of functional connectivity requires systematic approaches for extracting
meaningful patterns of inter-regional relationships from neuroimaging data. This section
examines the principal frameworks used to map functional connectivity, from seed-based
analyses to decomposition techniques and advanced causal modeling approaches.

==== Seed-based Connectivity Analysis

Seed-based connectivity analysis represents the most intuitive and widely-used approach
for studying functional connectivity @Fox2005 @Buckner2013 @Luppi2024 @Liu2025.
Seed-based methods involve selecting #glspl("roi", first: true)---referred to as
_seeds_---from which to extract average time series. Then, _connectivity matrices_ can
be obtained by computing pairwise statistics between seed time series, or _connectivity
maps_ can be generated by computing pairwise statistics between each seed time series
and that of each brain voxel (@fig:seed-based-connectivity). Connectivity matrices and
maps can then be thresholded to identify significantly related regions, typically using
multiple comparison corrections to control for false positive rates. As discussed in
@sec:functional-connectivity-concepts, the most common pairwise statistic is the Pearson
correlation coefficient, but other statistics can also be used depending on the specific
research question and data characteristics @Liu2025.

#figure(
  placement: auto,
  image("figures/seed_based.png"),
  caption: figure-caption(
    [Seed-based connectivity analysis.],
    [(*A*) Resting-state seed-based connectivity analysis in humans. A seed region is
      selected in the left somatomotor cortex (_top left_), from which the average @bold
      time course is extracted (_top right_). Correlation maps are then computed between
      the seed time course and the time courses of all other brain voxels, resulting in
      a connectivity map. This process is repeated across ten subjects, and the
      connectivity maps are averaged to obtain a group-level map. The map is then
      thresholded to identify statistically significant regions (_bottom_). Adapted from
      @Fox2005. (*B*) Voxel-wise functional connectivity matrices for awake vs.
      anesthetized mice. Voxels are organized in main network modules, labeled on the
      sides. Adapted from @GutierrezBarragan2022. (*C*) Two example seed-based
      correlation maps computed from @fusi in neonates. Seeds were placed in the left
      frontal lobe. Adapted from @Baranger2021.
    ],
  ),
) <fig:seed-based-connectivity>

The selection of seed regions is a critical step in seed-based connectivity analyses, as
results are inherently dependent on the a priori definition of the seeds. Seeds are
generally defined based on anatomical or functional criteria. Anatomically-defined seeds
are typically based on established brain atlases, such as the automated anatomical
labelling (AAL) @TzourioMazoyer2002 @Rolls2015 @Rolls2020 and Harvard-Oxford
@Frazier2005 @Makris2006 @Desikan2006 @Goldstein2007 atlases in humans, or the Allen
Mouse Brain @Wang2020 and Waxholm Space @Kleven2023 atlases in rodents.
On the other hand, functionally-defined seeds may be identified through functional
atlases derived from functional connectivity studies, such as the Power, Glasser, and
Schaefer atlases in humans @Power2011 @Glasser2016 @Schaefer2017, or through data-driven
approaches such as #gls("pca", first: true) and #gls("ica", first: true).

Seed-based connectivity analysis is particularly useful for exploratory studies, where
the goal is to discover unknown connectivity patterns across the whole field of view,
potentially revealing new network relationships. Such exploratory analyses can also help
shape hypotheses for subsequent studies by identifying regions of interest that
exhibit strong functional connectivity with the seed regions. However, hypothesis-driven
studies are best suited for effective connectivity models, where specific predictions
about connectivity can be tested based on predefined coupling hypotheses @Stephan2009.

The principal advantages of seed-based methods include their simplicity and
computational efficiency. Results can be easily visualized as statistical maps and
compared across different experimental conditions or populations. However, limitations
include their limited interpretability due to the lack of causal information, the
inherent bias introduced by seed selection, the assumption that single regions
adequately represent network activity, and the inability to simultaneously examine
multiple networks without a priori specification of seed locations.

For @fusi applications, seed-based analysis is particularly well-suited for exploratory
analyses examining specific network disruptions or for validating connectivity patterns
identified through other neuroimaging modalities. The high temporal resolution of @fusi
enables detailed examination of lag relationships between seed and target regions,
potentially revealing directionality information. Moreover, its spatial resolution
allows for precise spatial parcellation of brain regions, enabling more accurate seed
definition and connectivity mapping.

==== Principal Component Analysis (PCA)

@Pca represents the foundational approach for data-driven connectivity analysis. The
use of @pca for neuroimaging was popularized in the functional neuroimaging field by
Friston and colleagues in 1993, starting with @pet and @fmri#footnote[Although
  @pca:short was already used in neuroimaging @Moeller1991, its use to obtain spatial
  patterns of coherent activity was popularized by Friston and colleagues.
] @Friston1993a
@Friston1993b. Textbooks typically introduce @pca as a dimensionality reduction
technique that transforms a set of standardized#footnote[Here, standardization refers to
  centering to zero mean and scaling to unit variance.] variables into a new set of
uncorrelated variables---referred to as _#ref(<pc:pl>)_---with maximum variance, where
each new variable is a linear combination of the original variables @Westfall2017
@Duda2000 @Everitt2011 @Jackson1991 @Johnson2007 @Jolliffe2010. @Pc:pl are then
ordered according to the amount of variance they explain in the original data. The
data dimensionality is reduced by selecting a subset of the @pc:pl that capture most of
the variance, while discarding the remaining @pc:pl.

A more intuitive way to think
about @pca may be to consider that the @pc:pl maximize their average squared Pearson's
correlation with all original variables#footnote[Correlation maximization only holds if
  the original variables have been standardized. When using centered but non-unit variance
  variables, the @pc:pl will maximize the average squared Pearson's correlations weighted
  by the variance of the original variables (see @Westfall2017 for a thorough discussion
  on this difference). Additionally, using non-centered variables will lead to even more
  complex relationships: see @Honeine2014 @Kim2023 for discussions on the consequences.].
That is, the first @pc is the variable that is on average "most correlated" with all
other variables, the second @pc is the variable that is uncorrelated with the first @pc
and on average most correlated with all other variables, and so on @Westfall2017.

Understanding @pca through the lens of maximizing average correlation is particularly
useful for functional connectivity analysis. In this context, @pca can be used to
extract spatial patterns of temporally correlated regions (_eigenimages_ or _spatial
modes_) and associated temporal expressions (_temporal modes_) that describe how the
spatial pattern evolves over time. Moreover, these patterns are extracted without a
priori specification of the regions or networks of interest, making @pca a powerful
tool for exploratory analyses of functional connectivity (@fig:pca-connectivity).

#figure(
  placement: auto,
  image("figures/pca_modes.png"),
  caption: figure-caption(
    [@Pca for functional connectivity analysis.],
    [Example @pca components extracted from a @fusi acquisition in an awake mouse. The
      acquisition consisted of a single 2D plane acquired during 30 minutes. Two example
      #gls("pc", first: true) are shown, with their corresponding spatial and temporal modes. Spatial
      modes are arbitrarily thresholded to highlight the most active regions, overlaid
      on the Allen Mouse Brain template @Wang2020. The first spatial mode shows coherent
      signals in the hippocampus and thalamus, while the second spatial mode shows
      coherent signals between the thalamus and cortex.

    ],
  ),
) <fig:pca-connectivity>

==== Independent Component Analysis (ICA)

@Ica takes a stricter approach to decomposition by maximizing statistical
independence rather than linear correlation @Hyvrinen2000. The key distinction between
@pca and @ica lies in their optimization criteria and the types of relationships they
can capture. @Pca maximizes correlation between components and the original
variables, which effectively captures only linear relationships. In contrast, @ica
maximizes statistical independence between components, which can reveal more complex
relationships that may not be apparent through correlation-based approaches
(@fig:correlation-vs-independence).

#figure(
  placement: auto,
  image("figures/correlation_examples.png", width: 100%),
  caption: figure-caption(
    [Difference between linear and non-linear relationships.],
    [
      Sets of $(x, y)$ data points illustrating the difference between correlation-based
      (@pca\-like) and independence-based (@ica\-like) decompositions. The Pearson
      correlation coefficient is shown above each set. @Pca would successfully
      identify relationships in linear cases with good correlation (top row), but would
      struggle with scenarios involving nonlinear dependencies (bottom row) or cases
      where correlation is weak despite clear statistical dependence. @Ica, by
      maximizing statistical independence rather than correlation, can potentially
      capture these more complex relationships that exhibit statistical dependence
      without linear correlation. Image from the public domain.
      #link("https://en.wikipedia.org/wiki/Correlation")[Original source.]],
  ),
) <fig:correlation-vs-independence>

The motivation behind @ica stems from the observation that neuroimaging measurements
typically reflect approximately linear mixtures of multiple underlying sources
(neuronal, artifacts, noise). According to the central limit theorem#footnote[The
  central limit theorem states that a properly normalized sum of independent random
  variables will tend toward a Gaussian distribution as the number of variables increases,
  even if the original variables themselves are not Gaussian.], these linear mixtures will
tend to be Gaussian distributed, even if the underlying sources are non-Gaussian. Thus,
assuming that the only Gaussian components in the measured signals are these mixed
signals, @ica seeks to recover the underlying source signals by maximizing their
non-Gaussianity @Friston1998. Various algorithms implement this principle, including
FastICA @Hyvrinen2000, Infomax @Bell1995, and JADE @Cardoso1993, each with different
optimization strategies and convergence properties @Calhoun2006.

For studying functional connectivity---which fundamentally concerns temporally
correlated patterns of activity---the most principled approach would be to identify
spatial components that are statistically independent in their temporal evolution. This
approach, originally applied to @eeg and @meg data, is now termed _temporal #ref(<ica>)_
@Makeig1997 @Calhoun2001a. However, computational constraints led to the predominant use
of _spatial #ref(<ica>)_ in @fmri analysis, which instead finds temporal components that
are spatially independent @Mckeown1998a @Mckeown1998b. This approach treats space as the
dimension of independence, identifying spatially distinct networks whose temporal
activities may be correlated. While less intuitive for connectivity analysis, spatial
@ica proved computationally more tractable for the large spatial dimension and
relatively small temporal dimension typical of early @fmri datasets.

Although spatial @ica remains the most widely used approach for @fmri connectivity
analysis, the choice between spatial and temporal @ica remains a topic of debate
@Friston1998 @Calhoun2001a @Calhoun2006 @Smith2012. Each approach has its own advantages
and limitations, and the choice should be guided by the specific research question and
data characteristics. For example, while temporal @ica requires a sufficient number of
time points to reliably estimate independent temporal modes, it allows for shared
spatial structure between modes, which might be physiologically more realistic than the
spatial independence assumption of spatial @ica. Conversely, spatial @ica allows for the
identification of spatially distinct networks that may be more interpretable in terms of
functional anatomy (@fig:example-ica) @Friston1998.

#figure(
  placement: auto,
  image("figures/example_ica.png"),
  caption: figure-caption(
    [Example spatial @ica:short analysis on @fusi:short acquisitions in awake mice.],
    [Six spatial components are shown for a single-subject (*A*) and group-level (*B*)
      spatial @ica in awake mice. Group-level @ica is performed by concatenating
      multiple acquisitions along the time dimension. Cortical and hippocampal areas
      from the Paxinos atlas are overlaid @Paxinos_Franklin_2019. Some components show
      coherent activity in functionally relevant areas (components 1, 2, 4, and 6),
      while others reflect acoustic or vascular artifacts (components 3 and
      5). Adapted from @Ferrier2020.
    ],
  ),
) <fig:example-ica>

==== Group-Level @ica:short and Dual Regression Methods

_Group-level #ref(<ica>)_ extends single-subject decomposition to identify common
network patterns across multiple subjects while preserving individual variability
@Calhoun2001b. The most common approach involves temporal concatenation, where
individual subject time series are concatenated along the temporal dimension to create a
single group dataset with extended acquisition length. This concatenated dataset
undergoes @ica decomposition to identify group-level spatial components and their
associated temporal dynamics#footnote[Note that this approach could also be performed
  using @pca. While @ica is often preferred for its ability to capture
  non-linear relationships, group-level @pca is often used as a preprocessing step to
  reduce the dimensionality of the data before applying group-level @ica @Smith2014.].

The temporal concatenation approach assumes that the same spatial networks are present
across all subjects, but allows their temporal expression to vary between individuals
and experimental conditions. This assumption is generally reasonable for
well-established brain networks, such as sensorimotor, visual, and default mode
networks, which show consistent spatial patterns across subjects @Damoiseaux2006.

_Dual regression_ provides a method for back-projecting group-level @ica results to
individual subjects @Filippini2009 @Beckmann2009. This two-stage regression approach
enables the estimation of subject-specific spatial maps and time courses while
maintaining the network structure identified at the group level. In the first regression
stage, group-level spatial components are used as spatial regressors against individual
subject data to obtain subject-specific time courses. In the second stage, these time
courses are regressed against the individual subject data to produce subject-specific
spatial maps. This approach enables statistical comparison of network properties between
groups or experimental conditions while accounting for individual differences in network
expression (@fig:dual-regression).

#figure(
  placement: auto,
  image("figures/dual_regression.png"),
  caption: figure-caption(
    [Dual regression for group-level spatial @ica:short.],
    [(*A*) Group-level @ica:short is performed on a concatenated dataset from multiple
      subjects, yielding group-level spatial components and their associated time courses.
      (*B*) Individual subject data are then regressed against the group-level spatial
      components to obtain subject-specific time courses. (*C*) These subject-specific
      time courses are regressed against the individual subject data to produce
      subject-specific spatial maps. (*D*) Finally, spatial maps can be statistically
      compared across subjects to characterize group differences. Adapted from
      @Beckmann2009.
    ],
  ),
) <fig:dual-regression>

==== Identification of Functionally Relevant @ica:short/@pca:short Components

A critical challenge in both @pca and @ica lies in distinguishing functionally relevant
components from artifacts and noise sources @Fox2007. Both decomposition techniques
typically produces a mixture of components reflecting neuronal networks, physiological
artifacts (cardiac, respiratory), motion-related artifacts, and scanner-related noise.

The most straightforward approach to component classification is manual classification,
where experts visually inspect the spatial and temporal characteristics of each
component to identify functionally relevant networks @Griffanti2017. Functionally
relevant components typically exhibit several characteristics:

- _Spatial coherence_: Spatial components should show spatially contiguous activation
  patterns that correspond to known anatomical or functional brain networks.
- _Temporal characteristics_: Temporal components typically exhibit fluctuations in the
  infra-slow frequency range (< #qty(0.1, "Hz")) and should not show obvious periodic
  patterns associated with cardiac or respiratory cycles, or strong high-frequency
  spikes that may indicate motion artifacts.
- _Signal-to-noise properties_: Functionally relevant components usually explain
  substantial variance in the data and show robust activation patterns.

Automated @ica classification approaches have been developed to reduce subjectivity and
improve reproducibility in component selection. Such methods were typically developed to
classify noise and artifact components @Griffanti2014 @SalimiKhorshidi2014 @Pruim2015.
Automatic classification use machine learning algorithms trained on manually classified
components to automatically identify artifact and neuronal components based on spatial,
temporal, and frequency domain features.

For @fusi data, several specific considerations apply to component identification:

- _Vascular artifacts_: The hemodynamic basis of power Doppler signals means that
  components reflecting large vessels or global vascular fluctuations must be
  carefully distinguished from neuronally-driven hemodynamic changes
- _Motion sensitivity_: The high motion-sensitivity of @fusi makes it particularly
  sensitive to small brain movements, requiring careful assessment of motion-related
  components.
- _Acoustic artifacts_: @fusi acquisitions can be affected by acoustic artifacts, in
  particular in transcranial paradigms. These artifacts can manifest as spatially
  coherent components near echogenic structures such as the skull or muscles.

The identification of functionally relevant networks can be facilitated by comparison
with established network atlases and by examining the relationship between component
time courses and experimental variables or behavioral measures @Smith2009 @Calhoun2001a.
Components showing task-related modulation or correlations with physiological measures
are more likely to reflect genuine neuronal activity.

For @fusi connectivity studies, the combination of group-level @ica with careful
component classification could provide a powerful approach for identifying robust,
reproducible network patterns while accounting for individual differences and
experimental variables @Ferrier2020.

==== Graph Theory and Network Analysis

Graph theory provides a mathematical framework for characterizing brain connectivity
patterns by representing the brain as a network of nodes (brain regions) connected by
edges (functional or structural connections) @Sporns2004 @Bullmore2009. This approach
enables quantitative analysis of network topology and organizational principles that
complement traditional connectivity methods (@fig:network-analysis).

#figure(
  placement: auto,
  image("figures/network_analysis.png"),
  caption: figure-caption(
    [Network analysis for structural and functional networks.],
    [Brain network analysis can be conducted from the following steps. (*1*) The network
      nodes are defined from brain regions (for example, from electrode placement or @fmri
      segmentation). (*2*) The association between each pair of nodes is computed using
      pairwise statistics (for example, correlation, coherence, or connection
      probability). (*3*) Pairwise connections are compiled into a matrix which is
      thresholded to decide which connections are strong enough to include in the final
      network. (*4*) Network metrics are computed from the resulting netwwork and compared
      to equivalent random networks for statistical validation. Adapted from
      @Bullmore2009.
    ],
  ),
) <fig:network-analysis>

Brain networks are typically characterized using several key metrics. Clustering
coefficient measures local network cohesion, quantifying the tendency of neighboring
nodes to be interconnected. Path length characterizes global network efficiency by
measuring the shortest communication paths between brain regions. Networks exhibiting
both high clustering and short path lengths display so-called _small-world_ properties,
optimizing the balance between local specialization and global integration @Watts1998
@Sporns2004 @Bassett2006.

Additional important measures include modularity, which quantifies the network's
division into discrete functional communities, and centrality measures that identify
highly connected "hub" regions playing crucial roles in network communication
@Sporns2004 @Bullmore2009.

Network analysis offers several key advantages for understanding brain organization. It
provides a powerful framework for quantifying organizational principles that are shared
across complex systems, enabling informative comparisons between different brain
networks and species @Sporns2004 @Bullmore2009. The identification of small-world
properties reveals an efficient architecture that balances functional segregation and
integration while minimizing connection costs. Network metrics also serve as attractive
intermediate phenotypes for neuropsychiatric disorders, potentially providing diagnostic
markers and enabling computational modeling of how developmental abnormalities lead to
observed dysconnectivity patterns.

However, network analysis faces several important limitations that must be carefully
considered. In particular, the definition of nodes and edges, and the thresholding
strategies used to define significant connections, can significantly influence the
resulting network metrics @Bullmore2009. Moreover, the lack of established statistical
theory for most network metrics means that statistical inference is typically performed
using permutation-based approaches, which can be computationally expensive
@Bullmore2009.

For @fusi applications, network analysis could provide a powerful framework for
functional connectivity studies, particularly given the technique's high spatial
resolution. However, the current limitations of @fusi in terms of field of view and
loss of sensitivity in transcranial applications means that network analyses are
currently limited to very few brain regions.

==== Coactivation Patterns (CAPs)

@Cap analysis represents a return to first-order statistics approaches that identify
discrete brain states characterized by specific patterns of regional activation
@Tagliazucchi2011 @Liu2013 @Liu2018. Rather than examining correlations between time
series, @cap analysis identifies time points when specific sets of brain regions are
co-activated, revealing a dynamic repertoire of brain states occurring during rest or
task performance.

The @cap analysis approach involves several key steps. First, an optional selection of
individual time frames is performed to focus on periods of interest. These periods could
be defined based on behavioral events, high global signal, or activation in a seed
region. Then, selected frames are clustered using unsupervised methods---typically
k-means clustering---to identify recurring patterns of co-activation across the brain.
Each cluster centroid represents a distinct #ref(<cap>)---that is, a spatial pattern of
brain activation that occurs repeatedly across time (@fig:cap-analysis).

#figure(
  placement: auto,
  image("figures/caps.png"),
  caption: figure-caption(
    [Principle of @cap:short analysis.],
    [(*A*) Example @bold\-@fmri time series are shown for two brain regions (anterior
      cingulate (ACg) and somatosensory cortex (SSs)), as well as the global brain
      signal. These signals show periods or coherent or divergent activity across time.
      Standardized frames are shown for some of these periods: F1 and F4 show concurrent
      activations or deactivations in ACg and SSs, while F2 and F3 show opposing
      activity. (*B*) These observations motivate the clustering approach used in
      @Cap analysis. A clustering approach---for example, k-means---identifies
      #glspl("cap", first: true) as the centroids of the clusters of standardized frames. Clustering
      can be performed on single subjects or on concatenated data from multiple
      subjects, similarly to group-level @ica:short. Adapted from
      @GutierrezBarragan2019.
    ],
  ),
) <fig:cap-analysis>

@Cap analysis offers several advantages for @fusi connectivity studies. The high
temporal resolution of @fusi enables detailed examination of brief coactivation events.
Moreover, @cap:pl can reveal non-stationary dynamics and identify discrete brain states
that may be obscured by averaging over extended time periods @Liu2013
@GutierrezBarragan2019.

The temporal occurrence of different @cap:pl can provide insights into the dynamic
organization of brain networks. @Cap:pl may exhibit structured temporal sequences,
with certain patterns preferentially following others, suggesting systematic transitions
between brain states @GutierrezBarragan2022. Additionally, the relationship between @cap
occurrence and behavioral or physiological variables can reveal how specific brain
states relate to different functional demands.

==== Dynamic Causal Modeling (DCM)

Dynamic causal modeling represents the most principled approach for investigating
effective connectivity @Friston2003 @Friston2011. Unlike functional connectivity, which
measures statistical dependencies, @dcm explicitly models the mechanisms underlying
observed signals and tests specific hypotheses about directed causal relationships.

@Dcm is based on state-space models expressed as differential equations that govern
the dynamics of neuronal populations,

$
  (dif x) / (dif t) = f(x, u, theta) + omega, \
  y = g(x, u, theta) + upsilon,
$

where $x$ represents the hidden neuronal states, $f$ is a function that describes the
dynamics of these states, $u$ denotes external inputs (experimental manipulations or
stimuli), $theta$ represents unknown parameters (including connection strengths), $y$ is
the observed data, $g$ is an observation function (such as a hemodynamic model), and
$omega$ and $upsilon$ represent random process and observation noise, respectively.
Given the complexity of such models, @dcm typically relies on bilinear approximations to
make the estimation tractable @Friston2003 @Friston2011.

The key innovation of @dcm lies in its ability to distinguish between different network
architectures through Bayesian model comparison. Competing hypotheses about connectivity
patterns are formulated as different @dcm architectures, and model evidence quantifies
which hypothesis best explains the observed data while penalizing model complexity
@Stephan2009 @Penny2004.

However, @dcm has several important limitations that must be considered @Poldrack2011.
@Dcm depends on the a priori specification of anatomical models and regions of
interest. Given the complexity of the model space, assumptions about the underlying
connectivity structure must be made to define only a few candidate models for testing
with @dcm. The validity of these assumptions is critical and may bias interpretations if
the specified models do not accurately reflect the underlying connectivity mechanisms.
Additionally, while @dcm shows good reproducibility within subjects, parameter estimates
are not always reliable, particularly when correlations exist between parameters
@Poldrack2011 @Rowe2010.

==== Granger Causality

Granger causality provides an approach to directed connectivity analysis based on the
principle that causes precede effects in time @Granger1969 @Seth2015. A time series $X$
is said to Granger-cause another time series $Y$ if past values of $X$ provide better
predictions of future values of $Y$ than past values of $Y$ alone.

While conceptually appealing, the application of Granger causality to neuroimaging data
faces several challenges @Friston2011 @Seth2015. The slow dynamics of hemodynamic
responses can obscure fast neuronal interactions, and violations of the stationarity
assumption may compromise results. Additionally, Granger causality can be sensitive to
confounding variables and may detect statistical rather than true causal relationships.

The high temporal resolution of @fusi may provide good conditions for Granger causality
analysis. However, careful consideration of lag structures and validation against known
connectivity patterns remains essential.

==== Summary

The analysis of functional connectivity encompasses multiple methodological approaches,
each with distinct advantages and limitations. Seed-based methods provide intuitive
insights into regional relationships but lack causal information and depend on a priori
region selection. Data-driven approaches like @pca and @ica enable network discovery
without a priori region selection but require careful distinction between neuronal
signals and artifacts. Advanced techniques such as @dcm offer mechanistic insights into
effective connectivity but are computationally intensive and constrained by model
specification requirements.

For @fusi, the combination of high spatial and temporal resolution creates unique
opportunities to examine functional connectivity dynamics on behaviorally relevant
timescales. The technique's compatibility with awake preparations enables investigation
of network patterns during natural behaviors, while its spatial resolution allows
detailed examination of local connectivity relationships. However, the hemodynamic basis
of @fusi signals requires consideration of @nvc:long mechanisms when interpreting
connectivity results, particularly regarding the temporal delays and spatial extent of
vascular responses.

As @fusi continues to mature, the integration of multiple connectivity approaches will
provide essential foundations for understanding how brain networks are modulated by
experimental interventions, including the pharmacological manipulations examined in the
following sections.

== Pharmacological Applications of @fusi:short

Modulating brain specific neurotransmitter systems through pharmacological interventions
provides a powerful approach for investigating brain function. By selectively altering
the activity of specific neurotransmitter systems, researchers can gain insights into
how these systems contribute to global brain organization and activity. In this context,
functional connectivity can be used to obtain "fingerprints" of alterations caused by
pharmacological compounds. Although these fingerprints do not provide direct mechanistic
insights---keeping in mind that functional connectivity is not equivalent to effective
connectivity (@sec:functional-connectivity-concepts)---they can provide valuable
information to classify drug compounds based on their global effects on brain networks.
This section will introduce the pharmacological principles underlying the three drug
families investigated in this PhD thesis: opioids, cannabinoids, and psychedelics. It
will also discuss how functional connectivity can be used to investigate the effects of
these drugs on brain function.

=== Introduction to Pharmacology

Humans have used chemical substances to alter their mental and physical states for
millennia. Originally derived from plants, these substances have been used for
therapeutic, recreational, and ritualistic purposes. Coffee, whose first written
mentions date back to the 16#super[th] century, is thought to have been used as a
stimulant for centuries @Ukers1922. Curare, a plant extract, was used by indigenous
South Americans to poison arrows for hunting. Opium, derived from the poppy plant, has
been used for pain relief for thousands of years @Brunton2022. These early uses, often
based on empirical observations of substance effects, have gradually evolved into the
scientific discipline of _pharmacology_.

#quote(block: true, attribution: [@Currie2018a])[
  Pharmacology is the scientific study of the action and effects of drugs on living
  systems and the interaction of drugs with living systems.
]

This definition of pharmacology, common to many pharmacology textbooks, highlight its
two main subdivisions (@fig:pharmaco_kinetics_vs_dynamics): _pharmacokinetics_---the
study of how the body affects a drug through absorption, distribution, metabolism, and
excretion---and _pharmacodynamics_---the study of how a drug affects the body through
its mechanism of action @Currie2018a @Currie2018b.

#figure(
  placement: auto,
  image("figures/pharmaco_kinetics_vs_dynamics.png"),
  caption: figure-caption(
    [Pharmacokinetics and Pharmacodynamics.],
    [Pharmacokinetics is the study of how the body affects a drug through absorption,
      distribution, metabolism, and excretion. Pharmacodynamics is the study of how a drug
      affects the body through its mechanism of action. Adapted from @Currie2018a.],
  ),
) <fig:pharmaco_kinetics_vs_dynamics>

It is clear that the definition of a drug is very broad and encompasses a wide range of
chemical substances. The word _pharmacology_ itself derives from the Greek words
_pharmakon_, meaning both "drug" and "poison", and _logos_, meaning "study", reflecting
the dual nature of chemical compounds that can produce both beneficial and harmful
effects @Leake1961. This duality is a fundamental aspect of pharmacology, as even the
same compound can have different effects depending on the dose, route of administration,
and characteristics of the organism receiving the drug. Arsenic, for example, is lethal
at low doses---around #qty(1, "mg/kg/d")---but was historically used to treat syphilis.
Similarly, curare is used in modern medicine as a muscle relaxant during surgery.

The transformation of pharmacology into a quantitative science began in the 20#super[th]
century, with the development of statistical methods to study dose-effect relationships
@Leake1961 @Trevan1927. John William Trevan's 1927 work provided the first firm
scientific basis for dose-effect relationships, demonstrating that biological
responses to varying drug dosages follow sigmoid laws (@fig:dose-response).

#figure(
  placement: auto,
  image("figures/dose_response.png"),
  caption: figure-caption(
    [Dose-effect relationships in pharmacology.],
    [Trevan's 1927 work established that there is no "minimum effective dose" for a
      drug---that is, that determining the exact effective dose for a single individual is
      impossible. Rather, he proposed statistical methods to study dose-effect
      relationships, showing that these relationships generally follow sigmoid laws. The
      curves shown here represent the mortality-dose relationships of four
      poisons---digitalis, cocaine, echitamine, and dysentery toxin---on different animals
      (frog or mice). The dose scale is arbitrary and depends on the poison. Adapted from
      @Trevan1927.
    ],
  ),
) <fig:dose-response>

=== Receptors and Drug Action

Drugs typically exert their effects by interacting with specific molecular targets, most
commonly _receptors_#footnote[Other targets include enzymes, transporters, ion channels,
  or even DNA.] @Rang2013. Receptors are specialized proteins that reside in cell
membranes or within cells and bind to specific molecules called _ligands_ to initiate a
biological response. Ligands can be endogenous molecules, such as neurotransmitters or
hormones, or exogenous compounds, such as drugs or toxins @Currie2018a.

Drug-receptor interactions are characterized by several key properties that determine
therapeutic outcomes and experimental responses @Currie2018a.
- _Specificity_ measures the degree to which a ligand binds to a particular receptor
  relative to other receptors: a drug with high specificity will primarily bind to its
  intended receptor, while a drug with low specificity may interact with multiple
  receptors, leading to off-target effects.
- _Affinity_ measures the strength of the interaction between a ligand and its receptor:
  a drug with high affinity binds tightly to its receptor, requiring lower concentrations
  to achieve a response, while a drug with low affinity requires higher concentrations
  to bind effectively.
- _Potency_ refers to the amount of a drug required to produce a specific effect:
  a potent drug produces a significant response at low concentrations, while a less
  potent drug requires higher concentrations to achieve the same effect.
- _Efficacy_ describes the maximum response that a drug can elicit _in vivo_. Efficacy
  is distinct from potency, as a drug can be potent but may have undesirable
  interactions _in vivo_---such as low absorption or rapid metabolism---that limit its
  maximum effect.

Receptors fall into two major categories with different mechanisms and temporal
characteristics. _Ionotropic receptors_ belong to an ion channel that opens upon
activation, allowing ions to flow across the cell membrane. Thus, ionotropic receptors
produce fast and brief responses that underlie rapid synaptic signaling. In contrast,
_metabotropic receptors_ are indirectly linked to ion channels through biochemical
signalling pathways @Kandel2021, producing slower and longer lasting effects than
ionotropic receptors.

The three drug families---opioids, cannabinoids, and serotonin receptor
agonists---investigated in this thesis primarily target metabotropic receptors,
specifically _#ref(<gpcr:pl>)_. @Gpcr:pl represent the largest family of membrane
receptors, binding to a wide variety of ligands, including neurotransmitters, hormones,
odorant- or light-sensitive molecules, and many others @Kandel2021. The modulatory
nature of @gpcr signaling makes these receptors particularly relevant for functional
neuroimaging studies, as they can produce long-lasting changes in neuronal activity over
timescales that are compatible with hemodynamic imaging techniques like @fusi. Moreover,
their circuit-wide effects can produce large-scale effects that are likely to lead to
changes in functional connectivity patterns.

The effects of ligands at receptors depend not only on receptor type but also on the
nature of ligand-receptor interactions (@fig:pharmaco_receptors). Ligands that activate
receptors are called _agonists_, while those that block receptor activation are called
_antagonists_. Agonists are further classified based on their efficacy: _full agonists_
elicit the maximal response possible from a receptor, while _partial agonists_ produce
submaximal effects. Meanwhile, antagonists can prevent receptor activation through
different mechanisms. _Competitive antagonists_ compete with agonists for the same
binding site and can be overcome by increasing agonist concentration, while
_non-competitive antagonists_ bind to different sites and cannot be overcome by higher
agonist doses. A special class of ligands, _inverse agonists_, bind to receptors and
produce opposite effects to those of agonists.

#figure(
  placement: auto,
  image("figures/pharmaco_receptors.png"),
  caption: figure-caption(
    [Ligand types and their effects on receptors.],
    [Ligands can be classified into agonists and antagonists, based on whether they
      activate or suppress receptors. Agonists can be further classified into full and
      partial agonists depending on their efficacy. Adapted from @Currie2018a.],
  ),
) <fig:pharmaco_receptors>

These pharmacological principles provide the foundation for understanding how specific
drug families modulate brain networks. The following sections examine the opioid,
endocannabinoid, and serotonergic systems---each representing distinct @gpcr\-mediated
pathways with characteristic distributions throughout the brain.

=== Opioid System

The _opioid system_ represents one of the most clinically relevant neurotransmitter
pathways, mediating pain relief, reward processing, and various physiological functions.
This system was first recognized through the effects of opium-derived compounds like
morphine, which provided powerful analgesia but also caused dependence and tolerance.
The discovery of specific opioid receptors in the early 1970s, followed by the
identification of endogenous opioid peptides, revealed that the brain possesses an
intrinsic pain-control mechanism that exogenous opiates exploit @Ballantyne2017.

The opioid system comprises three primary receptor subtypes: mu ($mu$), delta ($delta$),
and kappa ($kappa$) opioid receptors, all of which are @gpcr:pl widely distributed
throughout the central nervous system @Trescot2008. Mu receptors, located primarily in
the brainstem, medial thalamus, and reward-related structures, mediate the most
clinically relevant effects, including analgesia, euphoria, and respiratory depression.
In contrast, delta and kappa receptors have been found to be more involved in mood
regulation and stress responses, with activation of the kappa receptor sometimes
producing dysphoric effects.

Clinical applications of opioids span from acute surgical pain management to chronic
pain conditions, making them among the most prescribed medications worldwide. However,
their therapeutic benefits are complicated by significant adverse effects that limit
their clinical utility @Strang2020. Tolerance develops with repeated exposure, requiring
progressively higher doses to achieve the same analgesic effect. Physical dependence
emerges as the body adapts to chronic opioid presence, leading to withdrawal symptoms
upon discontinuation. Most concerning is the development of addiction—a complex
neurobiological condition characterized by compulsive drug-seeking behavior despite
harmful consequences. These issues have contributed to a global opioid crisis, with
overdose deaths largely attributed to respiratory depression, the most dangerous acute
side effect of mu receptor activation.

Clinically important opioids studied in this thesis---including morphine, fentanyl,
methadone, and buprenorphine---primarily target mu receptors but exhibit different
pharmacological profiles that may explain distinct functional connectivity patterns. The
opioid system's widespread distribution and involvement in reward processing through
interactions with dopaminergic pathways make it particularly suitable for studies
investigating network-level drug effects. Understanding opioid-induced changes in
functional connectivity could provide useful insights about the ongoing clinical
challenges of balancing analgesic efficacy with risks of tolerance, dependence, and
potentially fatal respiratory depression.

=== Endocannabinoid System

The endogenous cannabinoid system---or _endocannabinoid system_---represents a complex
neuromodulatory network that was discovered through investigations into the psychoactive
effects of @thc, the primary active component of cannabis @Finn2021 @Lu2016
@DiMarzo2015. Like the endogenous opioid system, the endocannabinoid system remained
unknown until the discovery of cannabinoid receptors in the late 1980s, followed by the
identification of endogenous cannabinoids in the early 1990s @Finn2021. This relatively
recent discovery revealed that the brain possesses an intrinsic signaling system that
cannabis compounds exploit to produce their effects.

The endocannabinoid system comprises two primary @gpcr:pl: _#ref(<cb1>)_ and
_#ref(<cb2>)_, each with distinct distributions and functions @Finn2021. @cb1 receptors
are the most abundant @gpcr:pl in the central nervous system, densely expressed in
regions including the cortex, basal ganglia, hippocampus, and cerebellum @Lu2016. These
receptors primarily function as presynaptic modulators, inhibiting neurotransmitter
release and serving as "circuit breakers" that prevent excessive neuronal activity
@Katona2008. @cb2 receptors are predominantly found in peripheral immune tissues, though
they can be upregulated in the CNS under pathological conditions.

The system is activated by two primary endogenous ligands: _#ref(<aea>)_ and
_#ref(<twoag>)_, both derived from membrane lipid precursors @DiMarzo2015. Unlike
classical neurotransmitters stored in vesicles, endocannabinoids are synthesized "on
demand" following neuronal activation and rapidly degraded by specific enzymes. @aea
acts as a partial agonist at @cb1 receptors, while @twoag functions as a full agonist at
both @cb1 and @cb2 receptors and is typically present at higher brain concentrations.

The primary exogenous cannabinoids studied in this thesis---@thc, @cbd, and
#ref(<cp>)---exhibit different pharmacological profiles that may lead to distinct
functional connectivity patterns. @thc acts as a partial agonist at both @cb1 and @cb2
receptors, producing the characteristic psychoactive effects including euphoria, altered
perception, and impaired memory. In contrast, @cp is a synthetic cannabinoid that
functions as a full agonist at both @cb1 and @cb2 receptors with approximately ten-fold
higher potency than @thc, making it a valuable research tool for studying maximal
cannabinoid receptor activation without the partial agonism limitations of @thc.
Finally, @cbd demonstrates complex pharmacology with minimal @cb1 activity but
interactions with multiple other receptor systems, although it does not produce
psychoactive effects like @thc @Finn2021.

Clinically, cannabinoids have gained renewed interest following changing legal
landscapes and accumulating evidence for therapeutic applications. @cbd\-based
medications have received regulatory approval for specific indications such as epilepsy,
while research continues into potential applications of @thc for pain, anxiety, and
neurodegenerative disorders. However, @thc's psychoactive properties and potential for
dependence continue to limit broader clinical adoption.

=== Serotonergic System

The serotonergic system represents one of the most evolutionarily ancient and
functionally diverse neurotransmitter networks in the brain @Jacobs1992. Serotonin---or
#ref(<fiveht>)---is synthesized in the raphe nuclei, with receptors distributed
extensively throughout the central nervous system, modulating diverse functions
including mood, cognition, sleep-wake cycles, and sensory perception @Beliveau2016. This
widespread influence stems from the diversity of serotonin receptors---comprising seven
main families (@fiveht#sub[1] through @fiveht#sub[7]) with 14 known subtypes, all
@gpcr:pl except the ionotropic @fiveht#sub[3] receptor @Beliveau2016.

Among these receptors, _@fiveht#sub[2A] receptors_ hold particular significance for
understanding psychedelic drug effects. These receptors are highly expressed in cortical
regions, particularly the prefrontal cortex, where they modulate both pyramidal neurons
and GABAergic interneurons @Bortolato2013. @fiveht#sub[2A] activation typically produces
neuronal depolarization and increased excitability, contrasting with the inhibitory
effects of many other serotonin receptor subtypes.

Psychedelics represent a unique class of @fiveht#sub[2A] receptor agonists that produce
alterations in perception, cognition, and consciousness. Psychedelics can generally be
classified into three main families based on their chemical structure: tryptamines (for
example, psilocybin/psilocin, @dmt), phenethylamines (for example, mescaline, 2C
compounds), and ergolines (for example, @lsd, lisuride) @Nichols2016.

The two serotonergic compounds investigated in this thesis---psilocybin and
lisuride---are both agonists at @fiveht#sub[2A] receptors but exhibit distinct
pharmacological profiles. Psilocybin is a naturally occurring psychedelic compound found
in certain mushrooms, that is rapidly converted to psilocin after ingestion @Lowe2021.
Psilocin is a partial agonist with high affinity for @fiveht#sub[2A] receptors, though
it also binds to other serotonin receptor subtypes including @fiveht#sub[1A] and
@fiveht#sub[2C] @Lowe2021. Psilocin belongs to the tryptamine family and produces
characteristic effects including visual hallucinations, altered sensory perception, and
changes in self-awareness and emotional processing. On the other hand, lisuride is a
non-psychedelic ergoline derivative that exhibits a more complex pharmacological profile
with significant activity at multiple serotonin, dopamine, and adrenergic receptors
@Horowski2021.

Clinical and research interest in psychedelics has experienced several waves of
development, from early discoveries in the mid-20#super[th] century through decades of
regulatory restrictions to a recent renaissance beginning in the 2000s @Nichols2016
@Lowe2021. Contemporary clinical trials have demonstrated remarkable therapeutic
potential across multiple mental health conditions, with psilocybin showing efficacy in
treating treatment-resistant depression @CarhartHarris2016, cancer-related anxiety and
depression @Griffiths2016, and achieving smoking cessation rates of up to 80%
@Johnson2014. Additional therapeutic applications include significant reductions in
obsessive-compulsive disorder symptoms @Moreno2006 and alcohol addiction
@Bogenschutz2015, often accompanied by profound mystical experiences that can lead to
lasting positive personality changes and increased psychological openness
@Griffiths2006.

Despite their generally favorable safety profile---psychedelics are physiologically
safe, non-addictive, and may enhance neuroplasticity---these compounds carry significant
risks that necessitate careful clinical supervision @Nichols2016 @Lowe2021. Acute
adverse effects include severe psychological distress with panic reactions, dangerously
impaired judgment that can lead to harmful behaviors, and dose-dependent vascular
complications. Rare but serious long-term effects include @hppd and the potential for
transient psychosis at high doses @Litjens2014. The therapeutic promise of these
compounds highlights the critical importance of understanding their network-level
effects on brain function, particularly regarding how acute psychedelic experiences
translate into sustained therapeutic benefits.

Having reviewed the primary neurotransmitter systems studied in this work, we now turn
to the neuroimaging approaches used to investigate their modulation by pharmacological
agents.

=== Functional Neuroimaging in Pharmacological Studies

Functional neuroimaging has become an indispensable tool in modern pharmacology,
enabling investigators to visualize and quantify in vivo brain activity changes
associated with drug administration @Honey2004 @Borsook2006. The advent of techniques
such as @fmri and its variant, @phfmri, has greatly enhanced our understanding of how
pharmacological agents modulate neural circuitry and neurotransmitter activity at both
regional and network levels.

Early applications of functional neuroimaging in pharmacology demonstrated the
feasibility of measuring drug effects on specific brain regions @Honey2004; for
instance, mapping alterations in pain pathways @Wise2002 or changes in emotional
processing networks following psychotropic administration
@KalinFunctionalMagneticResonance1997. Functional neuroimaging methodologies evolved
from task-based designs to resting-state paradigms, enabling detailed characterization
of brain neuroactivity in response to drug administration. This shift allowed
researchers to investigate the temporal dynamics of @bold signal changes varying over
minutes to hours due to pharmacodynamics, tissue penetrability, and metabolic issues
@Leslie2000.

The integration of multiple neuroimaging modalities has significantly enhanced the
field's capabilities. The complementary value of @fmri when combined with @pet has been
particularly valuable, with @pet providing precise measurements of receptor occupancy
and neurotransmitter release while @fmri captures downstream functional consequences
@Chen1997 @Minzenberg2011 @Jenkins2012. This multimodal approach has enabled researchers
to differentiate drug mechanisms, validate target engagement, and predict therapeutic
efficacy across various central nervous system disorders, from pain and depression to
schizophrenia and addiction.

=== The Emergence of Pharmaco-@fusi:short

#Gls("fusi", first: true) has increasingly been applied to pharmacological studies thanks to its
relatively low cost, high spatiotemporal resolution, and great sensitivity. In this
context, the technique has been termed _#ref(<phfusi>)_. These studies have explored
various drugs and their effects on @cbv:long, functional connectivity, and neurovascular
coupling, often providing insights into mechanisms of action and drug-induced brain
changes.

Rabut and colleagues introduced @phfusi in 2020, demonstrating its potential to monitor
drug effects on @cbv:long and functional connectivity in awake and behaving mice
@Rabut2020. They specifically studied the effects of scopolamine, a psychoactive
compound that modifies cholinergic neurotransmission, observing time- and dose-dependent
alterations in functional connectivity that were reversible by an antagonist. This
seminal work demonstrated one of the technique's strongpoints: the ability to study
drug effects without the biases introduced by anesthesia, a common requirement for
traditional preclinical neuroimaging techniques like @fmri.

Subsequent studies rapidly expanded the applications of @phfusi across various drug
classes and research questions. Soon after Rabut's seminal work, Vidal and colleagues
demonstrated the potential of @phfusi to monitor cerebral activity changes after
pharmacological challenge in mice, specifically profiling donepezil alone and its
combination with mefloquine in the context of Alzheimer's disease @Vidal2020a. They
revealed synergistic hemodynamic effects in the hippocampus, showcasing the technique's
versatility in studying drug interactions. The same research group further applied
@phfusi to study the effects of atomoxetine, a norepinephrine reuptake inhibitor, at
increasing doses in anesthetized rats @Vidal2020b. This study revealed dose-dependent
hemodynamic effects in the visual cortex, dentate gyrus, and thalamus, with faster
cerebral blood volume increases at higher doses, highlighting @fusi's superior
sensitivity compared to @fmri for pharmacological challenges.

The technique's versatility was further demonstrated by Ionescu and colleagues, who used
@phfusi to characterize acute and delayed S-ketamine effects on functional connectivity
in healthy mice, specifically investigating frequency-specific effects across various
slow frequency bands @Ionescu2023. Recent advances have incorporated sophisticated
analytical approaches, with Deighton and colleagues utilizing @phfusi in combination
with convolutional neural networks and class activation mapping to monitor drug-induced
brain activity changes, providing an unbiased detection and localization of drug effects
across the brain @Deighton2024. The integration of @fusi with complementary techniques
has also proven valuable, as demonstrated by Yan and colleagues, who combined @fusi with
electroencephalography to simultaneously measure cerebral blood volume and local field
potential responses to cocaine administration, revealing complex neurovascular coupling
dynamics @Yan2025.

The rapid adoption of @phfusi reflects its unique advantages over traditional
neuroimaging approaches, including superior spatiotemporal resolution, the ability to
study awake and behaving animals, and sensitivity to both acute and chronic drug effects
on brain function and connectivity.

=== Summary

In summary, pharmacological interventions provide a powerful approach for investigating
brain function by selectively modulating specific neurotransmitter systems. The three
drug families examined in this thesis---opioids, cannabinoids, and serotonergic
compounds---target distinct @gpcr\-mediated pathways with characteristic distributions
throughout the brain, each offering unique insights into neural network organization.
Opioids, primarily acting through mu-opioid receptors, are clinically relevant for pain
management but pose significant risks of tolerance and addiction. The endocannabinoid
system, discovered through cannabis research, modulates neuronal activity via @cb1 and
@cb2 receptors and shows therapeutic promise across multiple conditions. Serotonergic
psychedelics, particularly @fiveht#sub[2A] receptor agonists like psilocybin, represent
a renaissance in psychiatric medicine with remarkable therapeutic potential for
treatment-resistant conditions.

The evolution of functional neuroimaging techniques has transformed our ability to study
these pharmacological effects in vivo. While traditional approaches like @phfmri
established the foundation for understanding drug-induced brain changes, the emergence
of @phfusi:long offers advantages in cost and spatiotemporal resolution, and the ability
to study awake, behaving animals. This technical advancement enables more precise
characterization of how these diverse drug families modulate brain networks, providing
crucial insights into both their therapeutic mechanisms and potential adverse effects.
The integration of these pharmacological tools with advanced neuroimaging approaches
forms the methodological foundation for investigating drug-induced alterations in brain
functional connectivity.

== Thesis Objective and Structure

This @phd work was conducted as a joint PhD funded by Iconeus, under the supervision of
Dr. Zsolt Lenkei from the @ipnp and Dr. Thomas Deffieux from the Physics for Medicine
Institute.

Iconeus is a spinoff company from Physics for Medicine that develops commercial @fusi
systems. The company was funded in 2016 by Professor Mickael Tanter, the inventor of
@fusi, along with co-founders Dr. Zsolt Lenkei, Dr.Bruno Osmanski, Dr. Thomas Deffieux,
Dr. Ludovic Lecointre, and Dr. Mathieu Pernot.  Its mission is to accelerate
neuroscience discovery by making @fusi accessible and reliable for laboratories
worldwide, while continuing to push the boundaries of the technology for both
fundamental and translational research. To bring this vision to fruition, Iconeus built
on a portfolio of Inserm patents in @fusi and @ulm, six of which are now exclusively
licensed to the company. Development efforts were supported by several public funding
programs, including an Advanced ERC Grant, as well as the ESPCI Paris "PC Up" incubator
program.

The company has developed the Iconeus One system, a portable @fusi platform designed
specifically for neuroscientists, and has established collaborations---including
research partnerships and client installations---with over 60 organizations worldwide.
Since its launch in 2020, the Iconeus One has been used in more than 40 peer-reviewed
studies, covering topics from sensory processing to neurological disease models.

Iconeus currently employs around 40 staff members, bringing together expertise in
neuroscience, acoustics, software engineering, and data science, as well as dedicated
teams for marketing, customer support, and administration. This multidisciplinary
environment supports the company's dual focus on driving innovation in @fusi technology
and ensuring its effective implementation in neuroscience research. In parallel, Iconeus
is actively engaged in multiple clinical research projects exploring the potential of
@fusi and @ulm for diagnostic applications in neurosurgery, neonatal care, and vascular
diseases.

The project presented in the following chapters emerged at the intersection of two
complementary needs: Iconeus' requirement for advanced methodological frameworks to
process awake @fusi data, and the ongoing pharmaco-@fusi research program led by the Dr.
Zsolt Lenkei's team. This convergence created a unique opportunity to address both
commercial software development needs and fundamental research challenges
simultaneously.

=== Primary Objectives

This thesis addresses critical methodological challenges in @fusi while demonstrating
its potential for neuropharmacological research in awake mice. The work is organized
around three interconnected objectives that collectively advance @fusi as a reliable,
cost-effective neuroimaging tool for preclinical research. The primary objectives are
threefold:

1. *Methodological innovation in @fusi preprocessing*: the first objective aims to
  address the critical challenge of motion artifacts that significantly compromise data
  quality in awake @fusi acquisitions. The goal is to develop robust preprocessing
  pipelines specifically designed to detect and remove motion-related confounds while
  preserving genuine functional connectivity signals. This requires establishing
  comprehensive quality control metrics and benchmarking frameworks that enable
  systematic evaluation of denoising strategies, ultimately optimizing the entire @fusi
  preprocessing pipeline from clutter filtering through confound regression.
2. *Neuropharmacological applications of @fusi*: The second objective seeks to
  establish #gls("phfusi", first: true) as a reliable tool for investigating how psychoactive compounds
  modulate brain network organization. The aim is to examine the effects of three major
  drug classes---opioids, cannabinoids, and serotonergic psychedelics---on functional
  connectivity patterns in awake mice to gain insights into their distinct mechanisms of
  action. This objective includes correlating network alterations with behavioral
  outcomes to understand how pharmacological interventions translate into functional
  changes, positioning @phfusi as a valuable framework for drug development and
  neuropharmacological research.
3. *Research infrastructure development*: The third objective recognizes that
  sustainable growth of the @fusi field requires robust data management and analysis
  infrastructure to prevent fragmentation challenges faced by other neuroimaging
  modalities. The goal is to extend the @bids framework to @fusi through a @bep,
  addressing @fusi\-specific requirements while integrating with the broader
  neuroimaging ecosystem. This objective also seeks to develop a standardized analysis
  pipeline that implements the methodological advances from the first objective, while
  ensuring compatibility and transfer capabilities to the Iconeus software suite to
  bridge academic research and commercial application.

=== Thesis Structure

This thesis is organized into four interconnected chapters that build upon each other to
address the primary objectives outlined above.

#strong[@ch:introduction] establishes the conceptual foundation for the work presented
in subsequent chapters. It traces the historical evolution of neuroimaging techniques
and introduces key concepts in brain connectivity, with particular emphasis on the
neurovascular coupling mechanisms that underlie functional imaging methods. The chapter
provides detailed background on @fusi principles and its unique advantages for
preclinical research, followed by an overview of the methodological challenges this
technique faces, particularly regarding signal denoising in awake animal preparations.
The introduction also covers the pharmacological systems investigated in this
work—opioid, cannabinoid, and serotonergic pathways—highlighting their relevance to both
basic neuroscience and clinical applications. Finally, it outlines the need for
standardization in neuroimaging data handling and analysis that motivated the
development of tools and extensions to existing frameworks.

#strong[@ch:denoising] directly addresses the critical challenge of detecting and
removing motion artifacts in transcranial @fusi of awake mice. Motion artifacts
significantly hinder reliable data acquisition and group-level comparisons, particularly
in awake animals where brain movement persists despite head fixation. Through systematic
evaluation of denoising strategies across nearly 800 different preprocessing
configurations, this chapter characterizes the spatial and temporal properties of motion
artifacts and establishes robust quality control metrics for assessing @fusi acquisition
quality. The work benchmarks multiple denoising approaches across all processing
stages—including clutter filtering, scrubbing, frequency filtering, and confound
regression—to provide optimized denoising paradigms tailored to different experimental
constraints. The chapter challenges current standard practices by demonstrating that
adaptive clutter filtering is superior to traditional static methods and that high-pass
filtering outperforms conventional band-pass approaches for @fusi data.

#strong[@ch:pharmacofusi] presents the results from three systematic pharmacological
@fusi investigations examining the effects of opioids, cannabinoids, and psilocybin on
brain function in awake mice. The work establishes @fusi as a viable tool for
neuropharmacological investigations by demonstrating its sensitivity to detect
drug-induced alterations in brain activation and functional connectivity patterns. Each
pharmacological study characterizes drug-specific connectivity signatures that can serve
as pharmacological "fingerprints" for different classes of compounds acting on distinct
receptor systems. The chapter validates the pharmacological relevance of observed
connectivity changes through systematic evaluation of dose-dependence, temporal
dynamics, receptor specificity, and tolerance development, while correlating functional
connectivity alterations with complementary behavioral and physiological measures. The
work demonstrates that @fusi can effectively discriminate between compounds with
distinct mechanisms of action, establishing its utility for pharmacological research
applications.

#strong[@ch:tools] presents two major contributions that address critical needs for
standardization and analysis tools. The first contribution is the development of
@fusi\-@bids:short, a community-driven extension of the @bids specifically designed for
@fusi datasets. This standardization framework addresses @fusi\-specific challenges
while integrating with the broader neuroimaging ecosystem. The second contribution is
PyfUS, a comprehensive Python analysis package that provides essential research
infrastructure while allowing future implementations in Iconeus' software suite.
Together, these tools position the @fusi field to avoid the fragmentation challenges
that have historically affected other neuroimaging modalities.

=== Interconnections and Impact

These four chapters represent interconnected contributions that collectively advance
@fusi as a mature neuroimaging modality. The methodological advances in motion artifact
correction (@ch:denoising) proved essential for the pharmacological investigations
(@ch:pharmacofusi), enabling the isolation of drug-induced connectivity changes from
motion-related artifacts. The software infrastructure (@ch:tools) provided the
analytical foundation for both the denoising benchmark and pharmacological studies,
while the data organization standards facilitate reproducibility and data sharing across
the broader research community. Together, this work establishes @fusi as a
cost-effective, high-resolution alternative to existing neuroimaging techniques for
studying brain function in preclinical models, with particular advantages for
investigations requiring awake, behaving animals.
