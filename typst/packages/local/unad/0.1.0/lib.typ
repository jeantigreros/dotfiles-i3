#let conf(titulo: [], autor: [], escuela: [], curso: [], tutor: [], doc
) = {
  set page(paper: "us-letter", margin: 1in, numbering: "1") // Hoja carta, numeración APA
  set text(size: 12pt)       // Fuente estándar APA, interlineado doble
  set bibliography(style: "apa")
  set par(leading: 1em*1.5)
  set page(margin: 1in)                    // Márgenes APA de 1 pulgada
  let uni="Universidad Nacional Abierta y A Distancia"
  show heading.where(level: 1): it => [
    #pagebreak()
    #it
  ]

  place(
    top + center,
    float: true,
    scope: "parent", 
    align(center)[
      #set text(weight: "bold", size: 14pt)
      #grid(
        columns: (1),
        rows: (7em),
        [#titulo],
        [#autor],
        [#escuela, #uni],
        [#curso],
        [#tutor]
      )
      #datetime.today().display()
    ],
  )
  doc
}

