# Präsentationskonzept: Terminal & Git im Team
Framework: Typst mit Touying (`@preview/touying:0.6.1`)

---

## Feedback-Vorgaben
1. **Kollaboratives im Vordergrund**: Teamarbeit (Alice & Bob, Synchronisation, parallele Features) als primäre Motivation und Kern des Workflows.
2. **Didaktischer Wechsel-Rhythmus**: Immer streng **Wortdefinition (Kowalski)** abwechselnd mit **Inhalt (Git)**.
3. **Keine Screenshots in den Erklär-Zwischenschritten**: Die Konzepte und Befehle werden auf den Erklärfolien klar strukturiert und syntaktisch vermittelt; CLI-Screenshots werden erst später eingesetzt.

---

## Farbcodierung (Konsistente CLI-Grammatik)
- **Rot** (`#wer`): **Wer macht es?** -> Das Tool / Programm (`kowalski`, `git`)
- **Blau** (`#was`): **Was wird getan?** -> Die Aktion / Subcommand (`analyse`, `status`, `commit`)
- **Gelb/Orange** (`#wie`): **Wie wird es getan?** -> Modifikator / Flag (`--kurz`, `-s`, `-m`)
- **Grün** (`#worauf`): **Worauf / Womit?** -> Argument / Parameter (`quartalszahlen`, `index.html`)

---

## Gliederung & Ablauf

### 1. Motivation: Kollaboration im Vordergrund
- **Slide: Das Problem: Kollaboration ohne Versionskontrolle**
  - Szenario: Alice und Bob arbeiten gemeinsam am selben Softwareprojekt.
  - Schmerzpunkte:
    - Wie teilen wir Code ohne endlose ZIP-Dateien per Mail oder Chat?
    - "Wer editiert gerade welche Datei?" – Gegenseitiges Überschreiben von Änderungen.
    - Wer hat wann welchen Bug eingebaut?
- **Slide: Die Lösung: Git als Kollaborationsplattform**
  - Bild: `assets/linus-torvalds.jpg`
  - 2005 von Linus Torvalds für die weltweite Zusammenarbeit am Linux-Kernel erfunden.
  - Dezentral & verteilt: Jeder Entwickler hat die volle Historie lokal.
  - Nicht-destruktiv: Änderungen werden nachvollziehbar zusammengeführt (Merge).
- **Slide: Das Werkzeug: Warum Terminal?**
  - Prompt (Arbeitsverzeichnis/Kontext) -> Befehl (Aktion) -> Enter (Ausführung).
  - Universell, reproduzierbar und skriptbar.

---

### 2. Der Wechsel-Rhythmus: Wortdefinition <-> Git-Inhalt

#### Zyklus 1: Wer & Was?
- **Slide (Wortdefinition 1): "Kowalski, Analyse!"**
  - Bild: `assets/kowalski_analyse.jpg`
  - Formel: `#wer[Kowalski], #was[Analyse]!`
  - Rot = Wer (Programm), Blau = Was (Aktion)
- **Slide (Git-Inhalt 1): `git status`**
  - Formel: `#wer[git] #was[status]`
  - Übertragung: `#wer[git]` (Akteur) + `#was[status]` (Aktion: "Zeige mir den aktuellen Zustand im Projekt")
  - Nutzen für das Team: Erste Orientierung – welche Dateien wurden geändert?

#### Zyklus 2: Das "Wie" (Optionen / Flags)
- **Slide (Wortdefinition 2): "Kowalski, Analyse, kurz!"**
  - Bild: `assets/kowalski_analyse_kurz.jpg`
  - Formel: `#wer[Kowalski], #was[Analyse], #wie[kurz]!`
  - Gelb = Wie (Option / Flag / Modifikator)
- **Slide (Git-Inhalt 2): `git status -s`**
  - Formel: `#wer[git] #was[status] #wie[-s]`
  - Übertragung: `-s` steht für `--short`.
  - Ausführlicher Bericht wird zur schnellen Übersicht gekürzt. Schalter modifizieren das Verhalten von Befehlen.

#### Zyklus 3: Das "Worauf" (Argumente & Zieldaten)
- **Slide (Wortdefinition 3): "Kowalski, Analyse, kurz, Quartalszahlen!"**
  - Bild: `assets/kowalski_analyse_quartalszahlen_kurz.jpg`
  - Formel: `#wer[Kowalski], #was[Analyse], #wie[kurz], #worauf[Quartalszahlen]!`
  - Grün = Worauf (Argument / Zielparameter / Wert)
- **Slide (Git-Inhalt 3): Gezielte Aktionen: `git add` & `git commit`**
  - Formeln:
    - `#wer[git] #was[add] #worauf[index.html]` (Wer + Was + Zieldatei)
    - `#wer[git] #was[commit] #wie[-m] #worauf["Login-Feature für das Team"]` (Wer + Was + Flag + Botschaft)
  - Sinn im Team: Nur sinnvolle, zusammengehörige Änderungen bündeln und mit verständlicher Dokumentation versehen.

---

### 3. Der kollaborative Team-Workflow

- **Slide: Das mentale Modell: Die 3 lokalen Zustände**
  - Working Directory (aktiv im Editor) -> `git add` -> Staging Area (Packtisch) -> `git commit` -> Lokales Repository (Tresor).
- **Slide: Kollaboration im Team: Lokal vs. GitHub / Remote**
  - Der Fluss: Lokale Commits vorbereiten -> Abgleich mit dem Team-Repository im Web (GitHub/GitLab).
  - `#wer[git] #was[pull]`: Änderungen der Teammitglieder abholen & einpflegen.
  - `#wer[git] #was[push]`: Eigene Commits für das Team bereitstellen.
- **Slide: Paralleles Arbeiten: Branching im Team**
  - Bild: `assets/gophers-branch.png`
  - Feature-Branches: Alice arbeitet an `feature/login`, Bob an `feature/dashboard`.
  - Der Hauptzweig (`main`) bleibt stets stabil und release-bereit.

---

### 4. Cheat Sheet & Abschluss
- **Slide: Cheat Sheet: Der kollaborative Git-Werkzeugkasten**
  - Strukturierte Tabelle mit Farbcodierung.
- **Slide: Abschluss & Fragen**
