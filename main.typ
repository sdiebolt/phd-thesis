#import "helpers.typ": *
#import "@preview/hydra:0.6.1": hydra
#import "@local/psl-thesis:0.1.0": psl-thesis-covers
#import "glossary.typ": *

// Figure show rules must come BEFORE make-glossary to avoid conflicts
// See: https://github.com/typst-community/glossarium#show-rules-conflicts
#set figure(numbering: it => {
  let hdr = counter(heading).get().first()
  let num = query(
    selector(heading).before(here()),
  )
    .last()
    .numbering
  numbering(num, hdr, it)
})
#show figure.caption: set align(left)
#show figure.caption: set text(size: 9pt)

// The glossary is defined in the glossary.typ file.
#show: make-glossary
#register-glossary(entry-list)

// skip header and footer on empty pages
#show pagebreak.where(to: "odd"): set page(header: none, footer: none)

#set page(header: context {
  if calc.odd(here().page()) {
    align(right, emph(hydra(2)))
  } else {
    align(left, emph(hydra(1)))
  }

  // Avoid drawing the line on chapter pages.
  let headings = query(selector(heading.where(level: 1)).after(here()))
  if headings.len() > 0 {
    let h = headings.first()
    let is-on-this-page = h.location().page() == here().page()
    if is-on-this-page or here().page() == 1 { return }
  }
  line(length: 100%)
})

// Choose between fr and en to set the front cover language.
#set text(lang: "en", font: "Fira Sans", size: 11pt)
#show math.equation: set text(font: "Fira Math")
#show raw: set text(font: "Fira Code", size: 1.2em, weight: "bold", fill: colors.code)
#set math.equation(number-align: bottom)
#set math.equation(numbering: it => {
  let count = counter(heading).get()
  numbering("1.1", count.at(0), it)
})

// Set chapter style for first level headings.
#set heading(numbering: "1.1")
#show heading.where(level: 1): set heading(supplement: "Chapter")

#show heading.where(level: 1): it => {
  // Reset counters for figures, tables, and equations.
  counter(figure.where(kind: image)).update(0)
  counter(figure.where(kind: table)).update(0)
  counter(figure.where(kind: raw)).update(0)
  counter(math.equation).update(0)

  pagebreak(to: "odd", weak: true)

  if it.numbering != none {
    let label = str(it.label)
    if label != none {
      if label.starts-with("ch:") {
        set text(size: 36pt)
        [Chapter]
        h(0.5em)
        text(context counter(heading).display(), fill: colors.accent, size: 58pt, weight: "bold")
        h(0.5em)
      } else if label.starts-with("ap:") {
        set text(size: 36pt)
        [Appendix]
        h(0.5em)
        text(context counter(heading).display("A"), fill: colors.accent, size: 58pt, weight: "bold")
        h(0.5em)
      }
    }
  }

  v(0em)
  text(it.body, size: 36pt, weight: "light")
  v(1em)
}

// Increase size of heading levels >1, since level 1 is the chapter title.
#show heading.where(level: 2): set text(size: 18pt)
#show heading.where(level: 3): set text(size: 16pt)
#show heading.where(level: 4): set text(size: 14pt)
#show heading.where(level: 5): set text(size: 12pt)

// Set color for citations (keep colored).
#show cite: it => {
  show regex("[^();]"): set text(fill: colors.accent)
  it
}

// Set color for links, but NOT for glossarium entries (acronyms should be black)
// Glossarium links point to label(key) (e.g. label("fusi")), and each entry also
// has a companion label("__gls:" + key) in the document. We query for that companion
// label to detect glossarium links.
#show link: it => context {
  let is-glossarium = false
  if type(it.dest) == label {
    let dest-str = str(it.dest)
    if query(label("__gls:" + dest-str)).len() > 0 {
      is-glossarium = true
    }
  }

  if is-glossarium {
    set text(fill: black)
    it
  } else {
    set text(fill: colors.accent)
    it
  }
}

// Set color for refs (figures, tables, sections, etc.)
#show ref: it => {
  let element = it.element
  let target = str(it.target)
  if element != none {
    if target.starts-with("fig:") or target.starts-with("tab:") {
      set text(fill: colors.figure)
      it
    } else {
      // Other refs use default color
      it
    }
  } else {
    it
  }
}

#let abstract-en = [
  #gls("fusi", first: true, capitalize: true) is a promising neuroimaging technique for studying brain function in
  preclinical models. @fusi:short offers advantages in cost, spatiotemporal resolution,
  and the ability to image awake, behaving animals. However, critical methodological
  challenges have limited its widespread adoption for awake paradigms, particularly the
  presence of motion artifacts that systematically vary between experimental conditions.
  This thesis addresses this limitation through comprehensive methodological innovations
  and validates @fusi:short for neuropharmacological research. Through systematic
  evaluation of nearly 800 preprocessing configurations across multiple datasets, we
  characterized the spatial and temporal properties of motion artifacts in awake
  @fusi:short and developed optimized denoising paradigms. Our findings demonstrate that
  adaptive clutter filtering outperforms traditional static methods, high-pass filtering
  exceeds conventional band-pass approaches, and anatomical CompCor confounds improve
  upon global signal regression for functional connectivity analysis. These advances
  improve the robustness of group-level comparisons previously compromised by
  motion-related confounds. We then validated @fusi:short as a tool for
  neuropharmacological investigations through systematic studies of three major drug
  classes---opioids, cannabinoids, and serotonergic psychedelics---in awake mice. Each
  drug class produced distinct functional connectivity signatures that could serve as
  pharmacological "fingerprints". The opioid study revealed cortico-subcortical
  dysconnectivity correlating with analgesic efficacy while showing minimal association
  with adverse effects. The cannabinoid study demonstrated biphasic connectivity
  alterations featuring rapid cortical-thalamic effects followed by slower hippocampal
  alterations. Finally, the psilocybin study showed dose-dependent alterations in
  hippocampo-thalamic networks partially sensitive to @fiveht:short#sub[2A] receptor
  blockade. Pharmacological relevance was validated through evaluation of
  dose-dependence, temporal dynamics, receptor specificity, and tolerance development.
  To conduct these studies, we developed research infrastructure including
  @fusi:short\-@bids:short, a community-driven data standardization framework extending
  established neuroimaging standards to accommodate @fusi:short\-specific requirements,
  and PyfUS, a comprehensive Python analysis package that bridges academic research
  needs with commercial software development. PyfUS served as a testing platform for the
  methodological innovations developed in this work, before implementation in the
  Iconeus software suite. These contributions demonstrate @fusi:short's potential as a
  cost-effective neuroimaging tool for discriminating between compounds with distinct
  mechanisms of action, suggesting applications in pharmacological screening and drug
  development.
]
#let keywords-end = [
  Functional ultrasound imaging, Motion artifact correction,
  Neuropharmacology, Functional connectivity, Data standardization
]

#let abstract-fr = [
  L'imagerie fonctionelle par ultrasons (fUSI) est une technique de neuroimagerie
  prometteuse pour l'étude du fonctionnement cérébral dans les modèles précliniques.
  Elle offre des avantages en termes de coût, de résolution spatio-temporelle, et de
  capacité à imager des animaux éveillés et en mouvement. Toutefois, son adoption pour
  l'imagerie éveillée reste freinée par des verrous méthodologiques importants, en
  particulier la sensibilité aux artefacts de mouvement qui varient selon les conditions
  expérimentales. Cette thèse propose des solutions innovantes pour lever cette
  limitation et démontre le potentiel du @fusi dans la recherche neuropharmacologique.
  Par l'évaluation systématique de près de 800 configurations de prétraitement sur
  plusieurs jeux de données, nous avons caractérisé les propriétés spatiales et
  temporelles des artéfacts de mouvement en @fusi éveillé et développé des stratégies de
  corrections optimisées. Nos résultats démontrent que le filtrage adaptatif de
  _clutter_ est plus efficace que les méthodes statiques traditionnelles, que le
  filtrage passe-haut surpasse les approches passe-bande conventionelles, et que la
  prise en compte de composantes anatomiques (CompCor) améliore nettement la régression
  de nuisances dans les analyses de la connectivité fonctionnelle. Ces avancées
  renforcent la fiabilité des comparaisons inter-groupes, souvent compromises par les
  artéfacts de mouvement. Nous avons ensuite validé l'intérêt du @fusi pour les études
  pharmacologiques à travers l'étude de trois classes majeures de composés---opioïdes,
  cannabinoïdes, et psychédéliques sérotoninergiques---chez des souris éveillées. Chaque
  classe induit des altérations spécifiques de la connectivité fonctionnelle,
  assimilables à de véritables "empreintes pharmacologiques". L'étude des opioïdes
  révèle une dysconnectivité cortico-sous-corticale associée à l'efficacité analgésique,
  sans forte corrélation avec les effets secondaires. Les cannabinoïdes induisent une
  dynamique biphasique, marquée par des effets rapides cortico-thalamiques suivis d'une
  altération plus lente de l'hippocampe. Enfin, la psilocybine provoque des
  modifications dose-dépendantes des réseaux hippocampo-thalamiques, sensibles en partie
  au blocage des récepteurs @fiveht#sub[2A]. Ces résultats valident la pertinence
  pharmacologique du @fusi à travers l’analyse de la dose-réponse, des dynamiques
  temporelles, de la spécificité des récepteurs, et du développement de la tolérance.
  Pour conduire ces études, nous avons développé des outils de structuration de données
  et d'analyse standardisés, dont @fusi\-@bids, une extension du standard de
  neuroimagerie @bids adaptée aux spécificités du @fusi, ainsi que PyfUS, une librairie
  Python d'analyse @fusi. Conçu à l’interface entre recherche académique et
  développement industriel, PyfUS a servi de plateforme pour tester et valider les
  innovations méthodologiques avant leur intégration dans des logiciels commerciaux
  d'Iconeus, garantissant fiabilité et flexibilité. Ces contributions démontrent le
  potentiel du @fusi comme outil de neuroimagerie accessible et puissant, capable de
  différencier des composés aux mécanismes d'action distincts, suggérant des
  applications dans le criblage pharmacologique et le développement de médicaments.
]
#let keywords-fr = [
  Imagerie fonctionelle par ultrasons, Correction des artéfacts de mouvement,
  Neuropharmacologie, Connectivité fonctionnelle, Structuration de données
]

#show: psl-thesis-covers.with(
  titles: (
    en: [Functional ultrasound imaging applied to the pharmacological fingerprinting of
      functional connectivity in awake mice],
    fr: [Application de l'imagerie fonctionnelle par ultrasons à la découverte d'empreintes pharmacologiques de la connectivité fonctionnelle chez la souris éveillée],
  ),
  author: [Samuel Le Meur-Diebolt],
  date: [October 2#super[nd], 2025],
  doctoral-school: (
    name: [Frontières de l'Innovation en Recherche et Éducation],
    number: [474],
  ),
  institute: [École Supérieure de Physique et de Chimie Industrielles de la Ville de
  Paris, Institute of Psychiatry and Neurosciences of Paris, and Institute Physics for Medicine Paris],
  institute-text-size: 10pt,
  institute-logo: image("./logos/espci_logo.png", width: 14cm),
  specialty: [Neuroscience and neurological disorders],
  jury: (
    (
      firstname: "Pierre",
      lastname: "Pouget",
      title: "PhD, Paris Brain Institute",
      role: "President",
    ),
    (
      firstname: "Alessandro",
      lastname: "Gozzi",
      title: "PhD, Istituto Italiano di Tecnologia",
      role: "Referee",
    ),
    (
      firstname: "David",
      lastname: "Maresca",
      title: "PhD, Delft University of Technology",
      role: "Referee",
    ),
    (
      firstname: "Sarah",
      lastname: "Stankowicz",
      title: "PhD, Beacon Biosignals",
      role: "Member",
    ),
    (
      firstname: "Charlie",
      lastname: "Demené",
      title: "PhD, Physics for Medicine",
      role: "Member",
    ),
    (
      firstname: "Thomas",
      lastname: "Deffieux",
      title: "PhD, Physics for Medicine",
      role: "PhD supervisor",
    ),
    (
      firstname: "Zsolt",
      lastname: "Lenkei",
      title: "MD, PhD, Institute of Psychiatry and Neurosciences of Paris",
      role: "PhD supervisor",
    ),
  ),
  abstracts: (fr: abstract-fr, en: abstract-en),
  keywords: (fr: keywords-fr, en: keywords-end),
  back-text-size: 8pt,
  front-margin: (left: 2cm, right: 1.25cm, top: 2cm, bottom: 3.25cm),
  back-margin: (left: 1.75cm, right: 1.25cm, top: 2cm, bottom: 3.25cm),
)

// Justify text.
#set par(justify: true)

#set page(numbering: "i")
#counter(page).update(0)

#include "content/front/acknowledgments.typ"
#include "content/front/abstract-fr.typ"
#include "content/front/abstract-en.typ"

// Table of contents and lists
#show outline.entry.where(level: 1): it => {
  v(12pt, weak: true)
  strong(it)
}

#show outline: set heading(outlined: true)
#outline(depth: 3, title: "Table of contents")

// author: laurmaedje
// Allows to use a different figure caption in the outline, to avoid long captions.
#show outline: it => {
  in-outline.update(true)
  it
  in-outline.update(false)
}

#outline(
  title: "Figures",
  target: figure.where(kind: image),
)

#outline(
  title: "Tables",
  target: figure.where(kind: table),
)

#set page(numbering: "1")
#counter(page).update(0)

#include "content/chapters/1-introduction/ch1.typ"
#include "content/chapters/2-denoising/ch2.typ"
#include "content/chapters/3-pharmaco/ch3.typ"
#include "content/chapters/4-standardization/ch4.typ"
#include "content/back/conclusion.typ"

#show bibliography: set text(size: 9pt)
#bibliography(
  "main.bib",
  title: "Bibliography",
  style: "apa",
)

#heading([Glossary], numbering: none)
#print-glossary(
  entry-list,
  user-print-group-heading: (group, level: 2) => {
    // Use unnumbered headings for glossary groups
    // Handle case where level might be none
    let lvl = if level == none { 2 } else { level }
    heading(group, level: lvl, numbering: none, outlined: false)
  },
)

#include "content/back/publications.typ"

#counter(heading).update(0)
#set heading(numbering: "A.1")
#show heading.where(level: 1): set heading(supplement: "Appendix")
#include "content/back/appendix-fusi-bids.typ"

// The fUSI-BIDS appendix is 25 pages long.
#counter(page).update(n => n + 25)
#include "content/back/appendix-python-vs-matlab.typ"
