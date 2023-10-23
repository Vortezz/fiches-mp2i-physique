#import "@preview/cetz:0.0.1"

#set page(header: box(width: 100%, grid(
  columns: (100%),
  rows: (20pt, 8pt),
  align(right, text("FICHE TP - MÉTHODE D'EULER")),
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

#titleBox("Méthode d'Euler")

= Présentation

La méthode d'Euler est une méthode de résolution numérique d'équations différentielles. Elle est basée sur le principe de la tangente à la courbe représentative de la solution de l'équation différentielle.

= Principe algorithmique

On considère une équation différentielle de la forme $y' = f(x, y)$, avec $f$ une fonction continue. On cherche à déterminer une fonction $y$ telle que $y' = f(x, y)$.

On divise l'intervalle $[t_"min", t_"max"]$ en $n$ sous-intervalles de longueur $Delta t$ (appelé pas de résolution). Et on a donc $t_k$ = $t_"min" + k * Delta t$.

On cherche à déterminer $y_k$ tel que $y_k$ = $y(t_k)$. Puisque l'on connaît $y_0$ (on connaît $y(t_"min")$), on peut déterminer tous les $y_k$ en utilisant la relation de récurrence suivante :

$ y_(k+1) = y_k + f(t_k, y_k) * Delta t $

= Exemple d'application

On considère la fonction `euler` suivante :

```python
def euler(F, y_0, tmin, tmax, dt):
    list_t = np.arange(tmin, tmax + dt, dt)
    N = len(list_t)
    y = np.zeros(N)

    y[0] = y_0

    for k in range(N - 1):
        y[k + 1] = y[k] + F(y[k], tmin + k * dt) * dt

    return list_t, y
```

On considère l'équation différentielle $y' = y$ avec $y(0) = 1$.

On a donc $f(x, y) = y$ et $y_0 = 1$.

On peut donc définir la fonction `F` suivante :

```python
def F(y, x):
    return y
```

On peut alors tracer la solution de l'équation différentielle sur l'intervalle $[0, 10]$ avec un pas de résolution de $0.1$ (valeurs prises pour l'exemple) :

```python




import matplotlib.pyplot as plt

t, y = euler(F, 1, 0, 10, 0.1)

plt.clf()
plt.figure()

plt.plot(t, y, ".") # On ne relie pas les points en physique
plt.xlabel("X (unité)")
plt.ylabel("Y (unité)")

plt.legend()

plt.show()
```

Il sera donc possible de visualiser l'allure de la solution de l'équation différentielle.

= Bonnes pratiques

Il faut toujours vérifier que le pas de résolution est suffisamment petit pour que la solution obtenue soit proche de la solution réelle.

Si le pas de résolution est trop grand, la solution obtenue sera très éloignée de la solution réelle.

Mais si le pas de résolution est trop petit, le temps de calcul sera très long.

Il faut donc trouver un compromis entre la précision de la solution et le temps de calcul.