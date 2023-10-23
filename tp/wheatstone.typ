#import "@preview/cetz:0.0.1"

#set page(header: box(width: 100%, grid(
  columns: (100%),
  rows: (20pt, 8pt),
  align(right, text("FICHE TP - PONT DE WHEATSTONE")),
  line(length: 100%),
)), footer: box(width: 100%, grid(
  columns: (50%, 50%),
  rows: (8pt, 20pt),
  line(length: 100%),
  line(length: 100%),
  align(left, text("Victor Sarrazin - MP2I")),
  align(right, text("Louis Le Grand - 2023/2024")),
)))

#set heading(numbering: "I.1.a")

#let titleBox(title) = align(center, block(below: 20pt, box(height: auto, fill: rgb("#eeeeee"), width: auto, inset: 40pt, text(title, size: 20pt, weight: "bold"))))

#let proof(content) = text("Preuve", weight: "semibold", fill: rgb("#666666")) + h(1em) + text(content, size: 10pt, fill: rgb("#888888"))

#titleBox("Pont de Wheatstone")

= Présentation

Le pont de Wheatstone est un montage électrique utilisé pour mesurer une résistance inconnue. Il est composé de quatre résistances, dont une inconnue, et d'une source de tension. Il est utilisé dans de nombreux domaines, notamment en physique pour mesurer la résistance d'un conducteur, ou en médecine pour mesurer la résistance de la peau.

= Principe

Le principe du pont de Wheatstone est de mesurer la valeur de la résistance inconnue en équilibrant le pont. Pour cela, on utilise un voltmètre pour arriver à l'équilibre. On peut alors déterminer la valeur de la résistance inconnue à partir des valeurs des autres résistances.

= Montage

Le montage du pont de Wheatstone est le suivant :

#figure(
  cetz.canvas(length: 1cm, debug: false, {
    import cetz.draw: line
    import "@local/circuitypst:0.0.1": node, to

    to("idealTension", (-3,0), (3,0), label: "")

    to("R", (-2,4), (0,4), label: $R_v$)
    to("R", (-2,1), (0,1), label: $X$)
    to("R", (0,4), (2,4), label: $R_1$)
    to("R", (0,1), (2,1), label: $R_2$)

    line((-2,4), (-2,1))
    line((2,4), (2,1))

    to("R", (0,4), (0,2.5), label: "R")
    to("voltmeter", (0,2.5), (0,1))

    line((-3,0), (-3,2.5))
    line((3,0), (3,2.5))

    line((-3,2.5), (-2,2.5), label: $U$)
    line((2,2.5), (3,2.5), label: $U$)
  }),
  caption: [Pont de Wheatstone]
)

= Équilibre du pont de Wheatstone

Pour que le pont de Wheatstone soit équilibré, il faut que la tension aux bornes du voltmètre soit nulle. On a alors :

$ frac(R_v,X) = frac(R_1,R_2) $

= Mesure de la résistance inconnue

On peut alors déterminer la valeur de la résistance inconnue à partir des valeurs des autres résistances :

$ X = frac(R_2 R_v, R_1) $