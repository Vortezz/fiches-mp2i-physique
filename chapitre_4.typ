#import "@preview/cetz:0.0.1"
#import "@local/typst-plot:0.0.1": plot, sample

#set page(header: box(width: 100%, grid(
  columns: (100%),
  rows: (20pt, 8pt),
  align(right, text("CHAPITRE 4. RÉGIME PERMANANT DANS UN CIRCUIT D'ORDRE 1")),
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

#titleBox("Régime permanent dans un circuit d'ordre 1")

= Le condensateur

== Présentation

Le *condensateur* est un dipôle _linéaire_ composé de deux armatures séparées par un milieu isolant (*diélectrique*). C'est l'un des composant de base en électronique. Il est schématisé comme ci dessous :

#figure(
  cetz.canvas(length: 1cm, debug: false, {
    import cetz.draw: line
    import "@local/circuitypst:0.0.1": node, to

    to("capacitor", (-2,0), (2,0), label: "C", v: $U$, i: $i$)
  }),
  caption: [Schématisation du condensateur]
)

On a $+Q$ la charge algébrique portée par l'armature de gauche. Puisque le _condensateur est globalement neutre_, $-Q$ est la charge portée par l'armature de droite.

On a le rapport $Q = C U$ avec $C$ la *capacité du condensateur* en fahrad (F).

== Caractéristique U/I

En convention récepteur on a $I = c (d U)/(d t)$.

#proof("On a " + $(d Q)/(d t) = (delta Q)/(d t) = i$ + " et " + $Q = C U$ + " donc " + $i = (d Q)/(d t) = (d C U)/(d t) = c (d U)/(d t)$)

== Approche énergétique

On a $E$ l'énergie stockée dans un condensateur tel que $E = 1/2 C U^2$.

#proof($P_("reçue") = U I = U C (d U)/(d t) = (d)/(d t)(1/2 C U^2)$ + " et " + $P_("reçue") = (d E)/(d t)$ + " d'où " + $E = 1/2 C U^2 + A$ + " avec " + $A = 0$)

Aux bornes d'une condensateur $U$ est une fonction continue par le temps.

#proof("On suppose " + $U$ + " discontinue de " + $E$ + " aussi. " + $P = (d E)/(d t)$ + ", ainsi on a une puissance infinie ce qui n'est possible.")

== Association série et parallèle de condensateurs

=== Association parallèle

Dans le schéma suivant, on a $C = C_1 + C_2$ :

#figure(
  cetz.canvas(length: 1cm, debug: false, {
    import cetz.draw: line, content
    import "@local/circuitypst:0.0.1": node, to

    to("capacitor", (-2,1), (0,1), label: $C_1$, i: $i_1$)
    to("capacitor", (-2,-1), (0,-1), label: $C_2$, i: $i_2$, name: "R2")

    line((-2,1), (-2,-1))
    line((0,1), (0,-1))
    line((0,0), (0.5,0), name: "equiv")
    line((-2,0), (-2.5,0))

    node("currarrow", (-2.2, 0))
    content((rel: (0, 0.3)), $i$)

    line((-2, -1.7), (0, -1.7), mark: (start: ">"), name: "tension")
    content((rel: (-1, -0.3)), $U$)

    content("equiv", h(4em)+[équivalent à], anchor: "left")

    to("capacitor", (5,0), (9,0), label: $C$, i: $i$, v: $U$)
  }),
  caption: [Association parallèle de condensateurs]
)

#proof("Loi des noeuds, " + $I = i_1 + i_2$ + ", d'après la caractéristique " + $U I$ + " du condensateur, " + $i_1 = C_1 (d U)/(d t)$ + " et " + $i_2 = C_2 (d U)/(d t)$ + " soit " + $i = C_1 (d U)/(d t) + C_2 (d U)/(d t) = (C_1 + C_2) (d U)/(d t)$)

=== Association série

Dans le schéma suivant, on a $1/C_(\eq) = 1/C_1 + 1/C_2$ :

#figure(
  cetz.canvas(length: 1cm, debug: false, {
    import cetz.draw: line, content
    import "@local/circuitypst:0.0.1": node, to

    to("capacitor", (-2,0), (0,0), label: $C_1$, i: $i$, v: $U_1$)
    to("capacitor", (0,0), (2,0), label: $C_2$, i: $i$, v: $U_2$, name: "R2")

    line((-1.5, -1.1), (1.5, -1.1), mark: (start: ">"), name: "tension")
    content((rel: (-1.5, -0.3)), $U$)

    content("R2", h(4em)+[équivalent à], anchor: "left")

    to("capacitor", (5,0), (9,0), label: $C$, i: $i$, v: $U_C$)
  }),
  caption: [Association série de condensateurs]
)

= Étude de la charge d'un condensateur

== Mise en équation

#figure(
  cetz.canvas(length: 1cm, debug: false, {
    import cetz.draw: line, content
    import "@local/circuitypst:0.0.1": node, to

    to("idealTension", (-2, -1), (-2, 1), name: "idealTension", i: $i$)

    to("capacitor", (-2,1), (2,1), label: $C_1$, i: $i$, v: $U_R$)
    to("R", (2,1), (2,-1), label: $C_2$, i: $i$, v: $U_C$, name: "R2")

    line((2,-1), (-2,-1), name: "tension")
  }),
  caption: [Circuit RC (Résistance/Condensateur)]
)

On a la loi des mailles $E = U_R + U_C$, la loi d'Ohm $U_R = R i$ et la caractéristique $U/i$ du condensateur $i = c (d U_c)/(d t)$.

Ainsi on a $E = R i + U_C = R C (d U_c)/(d t) + U_C$ avec $tau = R C$ le temps caractéristique.

On en déduit une équation différentielle pour la charge $E C = R C (d q)/(d t) + q$.

Pour résoudre une équation différentielle linéaire d'ordre 1 :

- Si il y a un second membre, on cherche une _solution particulière_ $s_p$ de l'équation avec second membre (ici $s_p = E$).
- Chercher la forme générale des _solutions générales sans second membre_ $s_(g)(t)$. Il y a apparition de constantes (ici $s_(g)(t) = A e^(-t/tau)$)
- La solution est $s_p + s_g$. Il faut ensuite déterminer les constantes (ici $U_(C)(t) = E(1-e^(-t/tau))$)

== Durée du transitoire, temps de réponse

*Temps du réponse à X%* : Temps au bout duquel $(|U - U_0|)/(|U_(infinity)-U_0|)$ a varié de X%.

- $63% : tau$
- $95% : 3 tau$
- $99% : 5 tau$

== Bilan d'énergie

$ P_("fournie") &= P_("joule") + P_C + "(loi d'Ohm et loi des mailles dans le circuit RC)" \ integral_0^t E i d t' &= integral_0^t R i^2 d t' + integral_0^t (d)/(d t)(1/2 C U^2) d t' $

== Analyse graphique d'une réponse indicielle

#grid(
    columns: (50%, 50%),
    {
      "Méthode de la tangeante (dépréciée) :"
      plot(
        sample(x => (1 - calc.exp(-x/1)), min: 0.1, max: 6, samples: 50),
        sample(x => x, min: 0.1, max: 1.5, samples: 50),
        sample(x => 1, min: 0.1, max: 6, samples: 50),
        width: 6cm,
        mirror: false,
        height: 4cm
      )
    },
    {
        "Méthode des 63% :"
      plot(
        sample(x => (1 - calc.exp(-x/1)), min: 0.1, max: 6, samples: 50),
        sample(x => x, min: 1.499, max: 1.5, samples: 50),
        sample(x => 1, min: 0.1, max: 6, samples: 50),
        sample(x => 0.63, min: 0.1, max: 6, samples: 50),
        width: 6cm,
        mirror: false,
        height: 4cm
      )
    }
)

== Dipôle équivalent à un condensateur en régime permanent

En régime permanent, un condensateur est équivalent à un *interrupteur ouvert* ($I = 0A$).

= La bobine

== Présentation

La *bobine* est un dipôle composé d'un enroulement d'un fil sur lui-même.

Une bobine est schématisée de la manière suivante :

#figure(
  cetz.canvas(length: 1cm, debug: false, {
    import cetz.draw: line
    import "@local/circuitypst:0.0.1": node, to

    to("bobine", (-2,0), (2,0), label: "L", v: $U$, i: $i$)
  }),
  caption: [Schématisation d'une bobine]
)

== Caractéristique U/I

En convention récepteur, $U_L = L (d i)/(d t)$ avec $L$ l'inductance (_self_) en Henry (H).

Les bobines sont des dipôles _linéaires_ (relation U/I), et ont une inductance de quelques dizaines de _mA_ en TP. $L$ dépend des propriétés de la bobine tels que le _nombre de fils_ et la _quantité de spires_ (tours).

== Approche énergétique

On a l'énergie stockée dans une bobine $E = 1/2 L i^2$ en convention générateur.

#figure(
  cetz.canvas(length: 1cm, debug: false, {
    import cetz.draw: line
    import "@local/circuitypst:0.0.1": node, to

    to("bobine", (-2,0), (2,0), label: "L", v: $U$, i: $i$, convention: 1)
  }),
  caption: [Schématisation d'une bobine]
)

#proof($P_("reçue") = - U I "et " U_L = - L (d i)/(d t) "(convention générateur)"$ + ". Donc " + $P_("reçue") = - (- L (d i)/(d t)) i = L (d i)/(d t) i = (d)/(d t)(1/2 L i^2)$ + " d'où " + $E = 1/2 L i^2$)

L'intensité est _continue_ dans un bobine.

== Associations séries et parallèles de bobines

=== Association série

#figure(
  cetz.canvas(length: 1cm, debug: false, {
    import cetz.draw: line, content
    import "@local/circuitypst:0.0.1": node, to

    to("bobine", (-2,0), (0,0), label: $L_1$, i: $i$, v: $U_1$)
    to("bobine", (0,0), (2,0), label: $L_2$, i: $i$, v: $U_2$, name: "R2")

    line((-1.5, -1.1), (1.5, -1.1), mark: (start: ">"), name: "tension")
    content((rel: (-1.5, -0.3)), $U$)

    content("R2", h(4em)+[équivalent à], anchor: "left")

    to("bobine", (5,0), (9,0), label: $L$, i: $i$, v: $U_C$)
  }),
  caption: [Association série de bobines]
)

#proof("On a " + $U = U_1 + U_2 = L_1 (d i)/(d t) + L_2 (d i)/(d t) = (L_1 + L_2) (d i)/(d t)$)

=== Association parallèle

Dans le schéma suivant, on a $1/C_(\eq) = 1/C_1 + 1/C_2$ :

#figure(
  cetz.canvas(length: 1cm, debug: false, {
    import cetz.draw: line, content
    import "@local/circuitypst:0.0.1": node, to

    to("bobine", (-2,1), (0,1), label: $L_1$, i: $i_1$)
    to("bobine", (-2,-1), (0,-1), label: $L_2$, i: $i_2$, name: "R2")

    line((-2,1), (-2,-1))
    line((0,1), (0,-1))
    line((0,0), (0.5,0), name: "equiv")
    line((-2,0), (-2.5,0))

    node("currarrow", (-2.2, 0))
    content((rel: (0, 0.3)), $i$)

    line((-2, -1.7), (0, -1.7), mark: (start: ">"), name: "tension")
    content((rel: (-1, -0.3)), $U$)

    content("equiv", h(4em)+[équivalent à], anchor: "left")

    to("bobine", (5,0), (9,0), label: $L$, i: $i$, v: $U$)
  }),
  caption: [Association parallèle de bobines]
)

== Dipôle équivalent à une bobine en régime permanent

En régime continu, la bobine se comporte comme un _fil_ ($U = 0V$).