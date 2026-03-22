= fUSI-BIDS BEP v0.0.11 <ap:fusi-bids>

// See https://forum.typst.app/t/how-can-i-insert-content-from-a-pdf-into-my-document/476/3
// for this workaround to include pages from a PDF document. PDF pages were converted to
// SVG using pdf2svg.
// Include a certain number of pages with specific names
#let count = 25
#[
  // This depends on you needs, you may omit parts of this.
  // We reset the styles for the pages here to ensure we don't draw
  // over the included pages.
  #set page(numbering: none, footer: none, header: none /* ... */)
  #for p in range(1, count + 1) {
    // Using `page` to ensure each included page is it's own page
    // in the final document.
    // Using `page.background` to ensure we use the margins too.
    page(background: image("fusi-bids/fusibids-page" + str(p) + ".svg"))[]
  }
]
// Reset our page counter to ensure they don't interfere with it.
// This depends on your document, you may omit this.
#counter(page).update(n => n - count)
