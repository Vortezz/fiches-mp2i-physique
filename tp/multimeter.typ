#import "@preview/cetz:0.0.1"

#set page(header: box(width: 100%, grid(
  columns: (100%),
  rows: (20pt, 8pt),
  align(right, text("FICHE TP - MULTIMÈTRE")),
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

#titleBox("Multimètre")

= Présentation

Le multimètre est un appareil de mesure qui permet de mesurer des grandeurs électriques telles que la tension, l'intensité ou la résistance. On appelle voltmètre la partie du multimètre qui permet de mesurer la tension, ampèremètre la partie qui permet de mesurer l'intensité et ohmmètre la partie qui permet de mesurer la résistance.

= Voltmètre

Pour mesurer la tension aux bornes d'un dipôle, il faut brancher le voltmètre en dérivation du dipôle.

Il faut brancher le $+$ sur la borne $Omega$ et le $-$ sur la borne $C O M$.

#figure(
  cetz.canvas(length: 1cm, debug: false, {
    import cetz.draw: line
    import "@local/circuitypst:0.0.1": node, to

    to("R", (-2,0), (2,0), label: "R")

    line((-1,0), (-1,1.5))
    line((1,0), (1,1.5))

    to("voltmeter", (-1,1.5), (1,1.5), label: "")
  }),
  caption: [Mesure avec un voltmètre]
)

Pour avoir une mesure correcte, il faut que le voltmètre ait une résistance interne très grande devant la résistance du dipôle. (Le voltmètre est modélisé par un interrupteur ouvert.)

Il est aussi possible d'ajuster le _RANGE_ du voltmètre pour avoir une mesure avec différents ordres de grandeur.

= Ampèremètre

Pour mesurer l'intensité qui traverse un dipôle, il faut brancher l'ampèremètre en série avec le dipôle.

Il faut brancher le $+$ sur la borne $m A$ (ou $mu A$) et le $-$ sur la borne $C O M$.

#figure(
  cetz.canvas(length: 1cm, debug: false, {
    import cetz.draw: line
    import "@local/circuitypst:0.0.1": node, to

    to("amperemeter", (-2,0), (0,0), label: "")
    to("R", (0,0), (2,0), label: "R")
  }),
  caption: [Mesure avec un ampèremètre]
)

Pour avoir une mesure correcte, il faut que l'ampèremètre ait une résistance interne très faible devant la résistance du dipôle. (L'ampèremètre est modélisé par un fil.)

Il est aussi possible d'ajuster le _RANGE_ de l'ampèremètre pour avoir une mesure avec différents ordres de grandeur.

#emoji.warning *Il est très important de faire attention aux valeurs maximales que peut mesurer l'ampèremètre. Si le courant est trop fort, l'ampèremètre peut être endommagé.*

= Ohmmètre

Pour mesurer la résistance d'un dipôle, il faut brancher l'ohmmètre en série avec le dipôle. Il faut que le dipôle ne soit pas alimenté.

Il faut brancher le $+$ sur la borne $Omega$ et le $-$ sur la borne $C O M$.

#figure(
  cetz.canvas(length: 1cm, debug: false, {
    import cetz.draw: line
    import "@local/circuitypst:0.0.1": node, to

    to("ohmmeter", (-2,0), (2,0), label: "")

    line((-2,0), (-2,1.5))
    line((2,0), (2,1.5))

    to("R", (-2,1.5), (2,1.5), label: "R")
  }),
  caption: [Mesure avec un ohmmètre]
)

Il est aussi possible d'ajuster le _RANGE_ de l'ohmmètre pour avoir une mesure avec différents ordres de grandeur.

#emoji.warning *Il est primordial de ne pas alimenter le dipôle pour utiliser l'ohmmètre.*