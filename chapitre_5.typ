#import "@preview/cetz:0.0.1"
#import "@local/typst-plot:0.0.1": plot, sample

#set page(header: box(width: 100%, grid(
  columns: (100%),
  rows: (20pt, 8pt),
  align(right, text("CHAPITRE 5. CIRCUITS ÉLECTRIQUES LINÉAIRES D'ORDRE 2")),
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

#titleBox("Circuits électriques linéaires d'ordre 2")

= L'oscillateur non amorti

== Présentation

On considère le schéma suivant pour l'*oscillateur non amorti* :

#figure(
  cetz.canvas(length: 1cm, debug: false, {
    import cetz.draw: line, content
    import "@local/circuitypst:0.0.1": node, to

    to("idealTension", (-2, -1), (-2, 1), name: "idealTension", i: $i$)

    to("interruptor", (-2,1), (2,1), label: $K$)
    to("capacitor", (2,1), (2,-1), label: $C$, i: $i$, v: $U_C$)
    to("bobine", (2,-1), (-2,-1), label: $L$, i: $i$, v: $U_L$, name: "R2")
  }),
  caption: [Oscillateur non amorti (LC série)]
)

On a la loi des mailles $E = U_L + U_C$, la caractéristique $U I$ de la bobine $U_L = L (d i)/(d t)$ et la caractéristique $U I$ du condensateur $i = c (d U_c)/(d t)$.

Ainsi on a l'équation différentielle linéaire à coefficient constant d'ordre 2 suivante : $E = L C (d^2 U_C)/(d t^2) + U_C " avec " U_(c)(0) = 0 $

C'est l'équation différentielle de _l'oscillateur harmonique_.

Il est possible de la mettre sous forme canonique : $dot.double(Theta) + omega_0^2 Theta = "2"^"nd" "membre"$, avec $omega_0$ la *pulsation caractéristique* en $r a d . s^(-1)$. La pulsation caractéristique du LC série est $omega_0 = 1/(sqrt(L C))$.

La forme générale des équations différentielles linéaires à coefficient constant d'ordre 2 sont : $Theta_g = A cos(omega_0 t) + B sin(omega_0 t)$ et $Theta_g = C cos(omega_0 + phi)$.

Dans le cas des LC série, $U_(C)(t) = E(1 - cos(omega_0 t))$.

#proof("On a " + $s_p = E "ainsi" U_(C)(t) = E - A cos(omega_0 t) + B sin(omega_0 t) "," "ensuite on évalue" A "et" B$ + " avec les conditions initiales. " + $cases(U_(C)(0^-) = 0, i(0^-) = 0) ==> cases(U_(C)(0^+) = 0, i(0^+) = 0) ==> cases(U_(C)(0^+) = 0, C (d U_C)/(d t)(0^+) = 0) ==> cases(E + A cos(0) + B sin(0) = 0, (d E)/(d t) - A sin(0) + B cos(0) = 0) ==> cases(A = -E, B = 0)$)

== Remarques

L'oscillateur non amorti admet la courbe suivante :

#figure(plot(
        sample(x => (1 - calc.cos(3 * x)), min: 0.1, max: 6, samples: 50),
        width: 6cm,
        mirror: false,
        height: 2cm,
        x-label: $t$ + " (s)",
        y-label: $E$ + " (V)"
      ),
  caption: [Courbe de l'oscillateur amorti])

L'oscillateur possède donc un _comportement oscillent_ avec $2 pi f = omega_0$.

Dans la solution $E cos(omega_0 t)$, $E$ représente l'amplitude des oscillements tandis que $omega_0 t$ représente la ? de phase. Dans la formule $A cos(omega_0 t + phi)$ avec $phi$ la phase à l'origine des temps.

_Le portrait de phase ne sera pas évoqué dans cette fiche, il forme une ellipse autour de l'origine pour $U$ et une ellipse autour de $E$ pour $u$._

== Énergie du GBF

L'énergie fournie par le  GBF (*générateur basse fréquence*) se distribue entre une petite partie stockée dans la bobine et une partie stockée dans le condensateur. En moyenne le GBF ne fournit pas de puissance.

#proof("On réalise un bilan d'énergie, et on intègre sur une grande valeur de t.")