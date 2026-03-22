#import "@preview/suboutline:0.3.0": suboutline

#let colors = (
  accent: rgb(113, 127, 184),
  code: rgb(127, 113, 184),
  figure: rgb(184, 113, 127),
)

#let in-outline = state("in-outline", false)
#let figure-caption(title, description) = context if in-outline.get() { title } else {
  strong(title) + " " + description
}

#let ref-sub-fig(target, sub) = {
  show ref: it => {
    let el = it.element
    if el != none {
      link(
        el.location(),
        text(fill: colors.figure)[#el.caption.supplement #numbering(
            el.caption.numbering,
            ..el.caption.counter.at(el.location()),
          )#sub],
      )
    } else {
      text(fill: ref-color)[#it]
    }
  }
  ref(target)
}

#let publication(authors, title, venue, doi: none) = {
  set par(leading: 0.8em)
  [#authors. _[#title]_. #venue]
  if doi != none {
    [\ DOI: #link("https://doi.org/" + doi)[#doi]]
  }
}

#let objective(content) = {
  align(
    center,
    block(
      width: 100%,
      fill: white,
      stroke: colors.accent,
      inset: 10pt,
      radius: 4pt,
      align(left)[
        #place(
          top + left,
          dy: -16pt,
          dx: -30pt,
          block(
            fill: white,
            outset: 8pt,
            text(fill: colors.accent, weight: "bold", size: 14pt)[Objectives],
          ),
        )
        #content
      ],
    ),
  )

  v(2em)

  heading([Table of contents], depth: 2, outlined: false, numbering: none)
  line(length: 100%)
  suboutline(title: none, indent: auto, depth: 1)
  line(length: 100%)
  pagebreak()
}

// Table utilities
#let booktabs-table(columns: none, header: none, ..rows) = {
  set table(stroke: none)
  set text(size: 8pt)
  set par(justify: false)

  let toprule = table.hline(stroke: 0.08em)
  let bottomrule = toprule
  let midrule = table.hline(stroke: 0.05em)

  table(
    columns: columns,
    toprule,
    inset: (x: 3pt, y: 4pt),
    table.header(..header),
    midrule,
    ..rows,
    bottomrule,
  )
}

#let todo(it) = {
  set text(weight: "bold", fill: red)

  highlight[#it]
}

