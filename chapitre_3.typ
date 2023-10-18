#import "@preview/cetz:0.0.1"

#set page(header: box(width: 100%, grid(
  columns: (100%),
  rows: (20pt, 8pt),
  align(right, text("CHAPITRE 3. BASES DE L'ÉLECTRICITÉ")),
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

#titleBox("Bases de l'électricité")

= Généralités

== La charge électrique

La *charge* est une qualité intrinsique d'une particule (comme la masse). Elle s'exprime en Coulomb (C) et est de dimension $I.T^(-1)$. La charge est une grandeur scalaire *algébrique* ($+$ ou $-$), une grandeur *algébrique* et est *conservatrice* (un système fermé est de charge fixe).

La charge est portée par les électrons ($-e$) et les protons ($e$), avec $e = 1.6 * 10^(-19) C$ la *charge élémentaire*.

== Le courant électrique

Le *courant électrique* est un déplacement d'ensemble de charges.

== Dipôle électrique, branche, maille, circuit

Un *dipôle* possède 2 pôles, lui permettant d'être traversé par un courant électrique. Une association de dipôles forme un *circuit*.

Une association de dipôles à la "_queue-leu-leu_" appelée *association série* forme une *branche*.

Une association de dipôles qui boucle sur elle même est appelée une *maille*.

== Intensité électrique

L'*intensité électrique* est un débit de charge noté $I$.

On a $I = frac(delta Q, d t)$ avec $delta Q$ la charge qui traverse la section pendant $Delta t$.

Pour mesurer l'intensité on utilise un ampèremètre branché en _série_ avec le $+$ sur le _mA_ et le $-$ sur le _COM_.

#figure(
  cetz.canvas(length: 1cm, debug: false, {
    import cetz.draw: line
    import "@local/circuitypst:0.0.1": node, to

    to("amperemeter", (-2,0), (2,0), label: "")
  }),
  caption: [Ampèremètre en série]
)

On a la *loi des noeuds* car il n'y a pas d'accumulation dans les noeuds : 

$ sum_("entrant") I = sum_("sortant") I $

= La tension électrique

== Retour sur l'analogie

On a $U$ la *tension électrique* une _différence de potentiel_ en Volts (V) : $U_("AB") = V_A - V_B$

Pour mesurer une tension on utilise un voltmètre branché en _dérivation_ avec le $+$ sur le $ohm$ et le $-$ sur le _COM_.

#figure(
  cetz.canvas(length: 1cm, debug: false, {
    import cetz.draw: line
    import "@local/circuitypst:0.0.1": node, to

    line((-2,0), (2,0))
    line((-1,0), (-1,1))
    line((1,0), (1,1))

    to("voltmeter", (-1,1), (1,1), label: "")
  }),
  caption: [Voltmètre en dérivation]
)

== Addivité des tensions et loi des mailles

La tension est une grandeur additive, et on a la *loi des mailles* :

$ sum_("tension \nmailles") epsilon_i U_i = 0 "avec" epsilon_i = cases(
  1 "si" U_i "dans le sens de parcours",
  -1 "sinon"
) $

La _loi des mailles_ et la _loi des noeuds_ sont les lois de *Kirchhoff*. Elles sont valables en régime continu et en régime lentement variable (_ARQS_).

= Approximation des régimes quasi stationnaires (_ARQS_)

Pour dire qu'un système est *lentement variable* il faut que $tau >> frac(d,c)$, avec $tau$ le temps caractéristique d'évolution de la source, $d$ la taille du circuit et $c$ la vitesse de la lumière dans le vide.

Si ce critère est vérifié, alors tous les points du circuit _voient_ en même temps tout changement du signal source.

Puisque les générateurs de TP on un $tau >> 3 "ns"$, alors on est dans l'_ARQS_ en TP.

= Résistors

== Généralités

Un *résistor* est un dipôle qui conduit plus ou moins bien l'électricité.

On schématise un résistor de la manière suivante :

#figure(
  cetz.canvas(length: 1cm, debug: false, {
    import cetz.draw: line
    import "@local/circuitypst:0.0.1": node, to

    to("R", (-2,0), (2,0), label: "R", i: $i$, v: $U_R$)
  }),
  caption: [Schéma d'un résistor]
)

On a *loi d'Ohm* : $U = R I$ avec $R$ la résistance en Ohm ($Omega$), attention, en convention générateur on a $U = bold(-) R I$.

Un résistor est un dipôle _passif_, en l'absence de _U_ pas de _I_ et un dipôle _linéaire_ car _U_ et _I_ sont linéairement liés.

En pratique, un résistor est un morceau de matérieau doté d'une *conductivité électrique* notée $sigma$ en $S.m^(-1)$.

On a la relation suivante : $R = frac(l, sigma S)$ ($l$ la longueur et $S$ la surface)

On considère les résistances suivantes :

- $R_("fil") = 0.1 Omega$
- $R_("voltmètre") = 10 M Omega$ (modélisé par un interrupteur ouvert)
- $R_("ampèremètre") = 0.1 Omega$ (modélisé par un fil)

On a aussi une tension nulle dans un fil.

== Associations de résistors et pont diviseurs

=== Association série

Dans le schéma suivant, on a $R = R_1 + R_2$ :

#figure(
  cetz.canvas(length: 1cm, debug: false, {
    import cetz.draw: line, content
    import "@local/circuitypst:0.0.1": node, to

    to("R", (-2,0), (0,0), label: $R_1$, i: $i$, v: $U_1$)
    to("R", (0,0), (2,0), label: $R_2$, i: $i$, v: $U_2$, name: "R2")

    line((-1.5, -1.1), (1.5, -1.1), mark: (start: ">"), name: "tension")
    content((rel: (-1.5, -0.3)), $U$)

    content("R2", h(4em)+[équivalent à], anchor: "left")

    to("R", (5,0), (9,0), label: $R$, i: $i$, v: $U_R$)
  }),
  caption: [Association série de résistors]
)

#proof("D'après la loi d'Ohm on a : " + $U_1 = R_1 i$ + " et " + $U_2 = R_2 i$ + " soit " + $U = U_1 + U_2 = R_1 i + R_2 i = (R_1 + R_2) i$ + " ainsi " + $R = R_1 + R_2$)

=== Pont diviseur

On considère le schéma en figure 4, on a $U_1 = frac(R_1, R_1 + R_2) U$.

#proof("On a " + $U_1 = R_1 i$ + " et " + $U = (R_1 + R_2) i$ + " soit " + $U_1 / U = (R_1 i)/((R_1 + R_2) i) = (R_1)/(R_1 + R_2)$)

=== Association en dérivation

Dans le schéma suivant, on a $1/R_(\eq) = 1/R_1 + 1/R_2$ :

#figure(
  cetz.canvas(length: 1cm, debug: false, {
    import cetz.draw: line, content
    import "@local/circuitypst:0.0.1": node, to

    to("R", (-2,1), (0,1), label: $R_1$, i: $i_1$, v: $U_1$)
    to("R", (-2,-1), (0,-1), label: $R_2$, i: $i_2$, v: $U_2$, name: "R2")

    line((-2,1), (-2,-1))
    line((0,1), (0,-1))
    line((0,0), (0.5,0), name: "equiv")
    line((-2,0), (-2.5,0))

    node("currarrow", (-2.2, 0))
    content((rel: (0, 0.3)), $i$)

    line((-2, -2.2), (0, -2.2), mark: (start: ">"), name: "tension")
    content((rel: (-1, -0.3)), $U$)

    content("equiv", h(4em)+[équivalent à], anchor: "left")

    to("R", (5,0), (9,0), label: $R_(\eq)$, i: $i$, v: $U$)
  }),
  caption: [Association en dérivation de résistors]
)

#proof("D'après la loi des mailles on a " + $U_1 = U_2 = U$ + " et d'après la loi d'Ohm, " + $U = R_1 i = R_2 i$ + " soit d'après la loi des noeuds " + $i = i_1 + i_2 = (U)/(R_1) + (U)/(R_2) = U(1/R_1 + 1/R_2)$ + " ainsi " + $U = (1/(1/R_1 + 1/R_2)) I$)

=== Pont diviseur de courant

On considère le schéma en figure 5, on a $i_1 = (R_2)/(R_1 + R_2) i$.

=== Puissance dissipée par un résistor

On a $P = R I^2$ la puissance dissipée par effet Joule.

#proof($P_("reçue") = U i = U_R i_R = R i_R i_R = R i_R^2$ + " (en convention récepteur)")

= Masse

La *masse* est le point d'un circuit de potentiel nul, $V = 0V$, c'est l'origine des potentiels. En théorie elle est choisie arbitrairement, en pratique elle est imposée par certains appareils électriques reliés à la Terre. On la schématise de la manière suivante :

#figure(
  cetz.canvas(length: 1cm, debug: false, {
    import cetz.draw: line, content
    import "@local/circuitypst:0.0.1": node, to

    line((-2,0), (2,-0))

    to("ground", (0, 0), ())
  }),
  caption: [Schématisation d'une masse]
)

= Générateur de tension

== Générateur (source) de tension idéal

Le *générateur de tension idéal* est un générateur qui impose une tension entre ses bornes, il est schématisé de la manière suivante avec $E$ sa *force électromotrice* ou f.e.m.

#figure(
  cetz.canvas(length: 1cm, debug: false, {
    import cetz.draw: line, content
    import "@local/circuitypst:0.0.1": node, to

    to("idealTension", (-2, 0), (2,0), name: "idealTension", i: $i$)
  }),
  caption: [Schématisation d'un générateur de tension idéal]
)

$U$ est ainsi indépendante de $I$, c'est un dipôle _actif_ car $U != 0V$ même si $I = 0A$.

== Générateur de tension réel

On a le *générateur de Thévenin* schématisé de la manière suivante avec un générateur idéal et une résistance interne :

#figure(
  cetz.canvas(length: 1cm, debug: false, {
    import cetz.draw: line, content
    import "@local/circuitypst:0.0.1": node, to

    to("idealTension", (-2, 0), (0,0), name: "idealTension", i: $i$)
    to("R", (0, 0), (2,0), name: "idealTension", v: $U_R$, convention: 1, label: $R_i$)

    line((-1, -1.5), (1, -1.5), mark: (end: ">"), name: "tension")
    content((rel: (-1, -0.3)), $U$)
  }),
  caption: [Schématisation d'un générateur de Thévenin]
)

On a $U = U_R + E = E - R i$ (convention générateur).

- À $I = 0A$, le générateur ne _débite_ pas, sa *tension à vide* est sa f.e.m.
- Sinon il _débite_ $U < E$, et il apparaît une chute de tension à ses bornes

On a $P_("fournie") = U I = (E - R_i i) i = E i - R_i i^2$

= Générateur de courant (HP)

On a le *générateur de courant idéal* schématisé ci dessous :

#figure(
  cetz.canvas(length: 1cm, debug: false, {
    import cetz.draw: line, content
    import "@local/circuitypst:0.0.1": node, to

    to("idealCurrent", (-2, 0), (2,0), name: "idealTension", i: $i$)
  }),
  caption: [Schématisation d'un générateur de courant idéal]
)

Le *générateur de Norton* est un modèle de générateur de courant réel schématisé ci dessous :

#figure(
  cetz.canvas(length: 1cm, debug: false, {
    import cetz.draw: line, content
    import "@local/circuitypst:0.0.1": node, to

    to("R", (-2, 0.75), (2,0.75), name: "idealTension", i: $i_0$, label: $R_n$)
    to("idealCurrent", (-2, -0.75), (2,-0.75), name: "idealTension", i: $i_1$)
    
    line((-2,0.75), (-2,-0.75))
    line((2,0.75), (2,-0.75))
    line((-2,0), (-2.5,0), name: "equiv")
    line((2,0), (2.5,0))

    node("currarrow", (-2.2, 0))
    content((rel: (0, 0.3)), $i$)
  }),
  caption: [Schématisation d'un générateur de Norton]
)

On a $U = - R_n (i - i_0) = R_n i_0 - R_n i$ soit $U = C_("te") - R_n i$

On a le résultat HP de l'équivalence Thévenin/Norton si $cases( 
  R_n = R_i,
  R_n I = E)$