#import "@preview/touying:0.6.1": *
#import themes.metropolis: *

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [git],
    author: [Kimi Müller],
    date: datetime.today(),
  ),
)

// Farb- und Hilfsfunktionen für die CLI-Grammatik
#let wer(it) = text(fill: rgb("#e63946"), weight: "bold", it)      // Rot: Wer
#let was(it) = text(fill: rgb("#1d3557"), weight: "bold", it)      // Blau: Was
#let wie(it) = text(fill: rgb("#e09f3e"), weight: "bold", it)      // Gelb/Orange: Wie
#let worauf(it) = text(fill: rgb("#2a9d8f"), weight: "bold", it)   // Grün: Worauf

#let cmdbox(it) = block(
  fill: rgb("#f8fafc"),
  inset: (x: 12pt, y: 8pt),
  radius: 6pt,
  stroke: 1pt + rgb("#cbd5e1"),
  it,
)

#title-slide()

= Motivation

== Das Problem

#grid(
  columns: (1fr, 1.1fr),
  gutter: 2em,
  [
    *Das Szenario:*
    #v(0.5em)
    Alice und Bob arbeiten gemeinsam am selben Softwareprojekt.
    
    #v(0.5em)
    Beide müssen gleichzeitig Code schreiben, Fehler beheben und Funktionen ergänzen.
  ],
  [
    *Typische Kollaborationsfallen:*
    #v(0.5em)
    - *Gegenseitiges Überschreiben:* \
      Alice speichert `app.py`, während Bob zeitgleich darin arbeitet.
    - *Datei-Chaos:* \
      `projekt_bob.zip`, `projekt_alice_final.zip`
    - *Fehlende Nachvollziehbarkeit:* \
      Wer hat wann was geändert? Warum funktioniert der Code plötzlich nicht mehr?
  ]
)

== Die Lösung

#grid(
  columns: (0.7fr, 1.3fr),
  gutter: 2em,
  align: (center + horizon, left + horizon),
  [
    #image("assets/linus-torvalds.jpg", width: 85%)
  ],
  [
    - *2005 erfunden* für die weltweite Zusammenarbeit am Linux-Kernel.
    - *Dezentral & Verteilt*: Jedes Teammitglied besitzt lokal die komplette Projekthistorie.
    - *Gemeinsam & Unabhängig*: Mehrere Personen arbeiten zeitgleich an denselben Dateien, ohne sich zu blockieren.
    - *Nicht-destruktiv*: Änderungen werden nachvollziehbar dokumentiert und fusioniert (Merge).
  ]
)

= Terminal

== GUI vs. Terminal

#align(center + horizon)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 1.5em,
    align: center,
    [
      #text(1.1em, weight: "bold")[GUI]
      #v(0.4em)
      #image("assets/Screenshot-GUI.png", width: 105%)
    ],
    [
      #text(1.1em, weight: "bold")[Terminal]
      #v(0.4em)
      #image("assets/Screenshot-CLI.png", width: 105%)
    ]
  )
]

== Ablauf im Terminal

*Ein Gespräch per Textzeile:*

#v(1.2em)

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1.2em,
  [
    #cmdbox[
      *1. Prompt* \
      #v(0.4em)
      #text(size: 0.85em)[_Wo befinde ich mich gerade?_ \
      Arbeitsverzeichnis & Kontext]
    ]
  ],
  [
    #cmdbox[
      *2. Befehl* \
      #v(0.4em)
      #text(size: 0.85em)[_Was soll getan werden?_ \
      Genaue Anweisung per Tastatur]
    ]
  ],
  [
    #cmdbox[
      *3. Enter* \
      #v(0.4em)
      #text(size: 0.85em)[_Ausführen!_ \
      Computer verarbeitet und antwortet]
    ]
  ]
)

= Befehlsstruktur

== 1. Wortdefinition: "Kowalski, Analyse!" (Wer & Was)

#grid(
  columns: (1fr, 1.1fr),
  gutter: 1.5em,
  align: horizon,
  [
    #image("assets/kowalski_analyse.jpg", width: 100%)
  ],
  [
    Jeder Befehl braucht mindestens einen *Akteur* und eine *Aktion*:

    #v(0.8em)
    #cmdbox[
      #text(1.3em)[#wer[Kowalski], #was[Analyse]!]
    ]

    #v(0.8em)
    - #wer[Wer macht es?] -> Das Programm / Tool
    - #was[Was wird getan?] -> Die gewünschte Aktion
  ]
)

== 1. Transfer auf Git: git status

#align(center)[
  #v(0.5em)
  #cmdbox[
    #text(1.4em)[
      #wer[Kowalski] #was[Analyse]
    ]
  ]

  #v(0.5em)
  #pause
  #text(1.5em)[$arrow.b$]
  #v(0.5em)

  #cmdbox[
    #text(1.4em)[
      #wer[git] #was[status]
    ]
  ]

  #v(0.8em)
  - #wer[git]: Das Programm / der Akteur.
  - #was[status]: Die Aktion (Subcommand) – "Zeige mir den aktuellen Zustand im Projekt".
  - *Orientierung:* Welche Dateien wurden seit dem letzten Stand verändert?
]

== 2. Wortdefinition: "Kowalski, Analyse, kurz!" (Das "Wie")

#grid(
  columns: (1fr, 1.1fr),
  gutter: 1.5em,
  align: horizon,
  [
    #image("assets/kowalski_analyse_kurz.jpg", width: 100%)
  ],
  [
    Aktionen lassen sich über *Optionen (Flags)* verfeinern:

    #v(0.8em)
    #cmdbox[
      #text(1.3em)[#wer[Kowalski], #was[Analyse], #wie[kurz]!]
    ]

    #v(0.8em)
    - #wer[Wer?] -> Das Programm
    - #was[Was?] -> Die Aktion
    - #wie[Wie?] -> Der Modifikator / Schalter (Option / Flag)
  ]
)

== 2. Transfer auf Git: git status -s

#align(center)[
  #v(0.5em)
  #cmdbox[
    #text(1.4em)[
      #wer[Kowalski] #was[Analyse] #wie[\-\-kurz]
    ]
  ]

  #v(0.5em)
  #pause
  #text(1.5em)[$arrow.b$]
  #v(0.5em)

  #cmdbox[
    #text(1.4em)[
      #wer[git] #was[status] #wie[-s]
    ]
  ]

  #v(0.8em)
  - #wie[-s] ist die Kurzform für #wie[\-\-short]: Kompakte 1-Zeilen-Übersicht statt ausführlicher Diagnose.
  - *Prinzip:* Flags modifizieren das Verhalten jedes Git-Befehls nach Bedarf.
]

== 3. Wortdefinition: "...kurz, Quartalszahlen!" (Das "Worauf")

#grid(
  columns: (1fr, 1.1fr),
  gutter: 1.5em,
  align: horizon,
  [
    #image("assets/kowalski_analyse_quartalszahlen_kurz.jpg", width: 100%)
  ],
  [
    Aktionen benötigen oft ein *konkretes Ziel / Daten*:

    #v(0.8em)
    #cmdbox[
      #text(1.15em)[#wer[Kowalski], #was[Analyse], #wie[kurz], #worauf[Quartalszahlen]!]
    ]

    #v(0.8em)
    - #wer[Wer?] -> Das Programm
    - #was[Was?] -> Die Aktion
    - #wie[Wie?] -> Option / Schalter
    - #worauf[Worauf?] -> Argument / Zielparameter
  ]
)

== 3. Transfer auf Git: git add & git commit

#v(0.5em)

#cmdbox[
  #text(1.15em)[#wer[git] #was[add] #worauf[index.html]] \
  #text(0.9em, fill: luma(80))[Wer: #wer[git] | Was: #was[add] | Worauf: #worauf[index.html] (Konkrete Zieldatei)]
]

#v(0.6em)
#pause

#cmdbox[
  #text(1.15em)[#wer[git] #was[commit] #wie[-m] #worauf["feat: Login-Button für das Team hinzugefügt"]] \
  #text(0.9em, fill: luma(80))[Wer: #wer[git] | Was: #was[commit] | Wie: #wie[-m] (Message-Flag) | Worauf: #worauf["..."] (Dokumentation)]
]

#v(0.8em)
*Sinn:* Nicht alles unkontrolliert hochladen, sondern gezielte, verständlich beschriftete Bausteine schnüren.

= Workflow

== Die 3 Zustände

#align(center)[
  #v(0.8em)
  #grid(
    columns: (1fr, auto, 1.1fr, auto, 1fr),
    gutter: 0.8em,
    align: horizon,
    [
      #block(fill: rgb("#fee2e2"), inset: 10pt, radius: 6pt, stroke: 1pt + rgb("#fca5a5"))[
        *1. Working Directory* \
        #v(0.3em)
        #text(size: 0.8em)[Lokale Dateien auf der Festplatte (aktiv im Editor)]
      ]
    ],
    [
      #text(size: 0.8em, weight: "bold")[#wer[git] #was[add] $arrow$]
    ],
    [
      #block(fill: rgb("#fef3c7"), inset: 10pt, radius: 6pt, stroke: 1pt + rgb("#fcd34d"))[
        *2. Staging Area* \
        #v(0.3em)
        #text(size: 0.8em)[Der "Packtisch": Gezielt gesammelte Änderungen]
      ]
    ],
    [
      #text(size: 0.8em, weight: "bold")[#wer[git] #was[commit] $arrow$]
    ],
    [
      #block(fill: rgb("#dcfce7"), inset: 10pt, radius: 6pt, stroke: 1pt + rgb("#86efac"))[
        *3. Lokales Repository* \
        #v(0.3em)
        #text(size: 0.8em)[Der Tresor: Dauerhafter Schnappschuss (Commit)]
      ]
    ]
  )
]

#v(1em)
*Der lokale Rhythmus:* Ändern -> mit `git add` vormerken -> mit `git commit` festhalten.

== Remote

#grid(
  columns: (1fr, 1fr),
  gutter: 1.5em,
  [
    *Lokales Repository (Mein Rechner)*
    - Volle Unabhängigkeit: Committen funktioniert auch ohne Internet.
    - Experimentieren ohne Angst vor Fehlern.
  ],
  [
    *Zentrales Remote (GitHub / GitLab)*
    - Die gemeinsame Quelle der Wahrheit für das gesamte Team.
    - Synchronisationspunkt für alle Entwickler.
  ]
)

#v(1.2em)
#pause

*Der Austausch im Team:*
- #wer[git] #was[pull]: Änderungen der Teammitglieder vom Server herunterladen & einpflegen.
- #wer[git] #was[push]: Die eigenen Schnappschüsse auf den Server hochladen.

== Branching

#grid(
  columns: (1fr, 1.1fr),
  gutter: 1.5em,
  align: horizon,
  [
    #image("assets/gophers-branch.png", width: 95%)
  ],
  [
    - *Branches (Zweige)* trennen verschiedene Arbeitsstränge voneinander:
      - Alice entwickelt #worauf[feature/login]
      - Bob entwickelt #worauf[feature/dashboard]
    - Die Hauptlinie (#worauf[main]) bleibt stabil und jederzeit lauffähig.
    - Nach Fertigstellung & Review: Zusammenführen per *Merge*.
  ]
)

== Cheat sheet

#table(
  columns: (1.8fr, 1.2fr, 2.5fr),
  align: (left, left, left),
  stroke: (x, y) => if y == 0 { (bottom: 1.5pt + rgb("#0f172a")) } else { 0.5pt + rgb("#e2e8f0") },
  fill: (x, y) => if y == 0 { rgb("#f1f5f9") } else if calc.even(y) { rgb("#f8fafc") },
  [*Befehl*], [*Funktion*], [*Erklärung*],
  [#wer[git] #was[status] #wie[-s]], [Orientierung], [Welche Dateien wurden lokal geändert?],
  [#wer[git] #was[add] #worauf[\<datei\>]], [Vormerken], [Gezielte Änderung für den Commit auswählen],
  [#wer[git] #was[commit] #wie[-m] #worauf["..."]], [Speichern], [Schnappschuss dauerhaft dokumentieren],
  [#wer[git] #was[pull]], [Abholen], [Neueste Team-Änderungen synchronisieren],
  [#wer[git] #was[push]], [Teilen], [Eigene Commits für das Team bereitstellen],
  [#wer[git] #was[switch] #wie[-c] #worauf[\<branch\>]], [Isolieren], [Neuen Feature-Branch anlegen],
)

== Fragen?

#align(center + horizon)[
  #text(2em, weight: "bold")[Danke!]
]
