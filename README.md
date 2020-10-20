

# SQL Readme. To do:

> Lernfeld 05 

> This is a repo for our DB called: krautundrueben 

> mySQL, SQL Server, Datenschutz, SQL queries, HeidiSQL,  



[![INSERT YOUR GRAPHIC HERE](https://images-na.ssl-images-amazon.com/images/I/5139pIyHweL._AC_.jpg)]()


---

## Table of Contents (Optional)

> If your `README` has a lot of info, section headers might be nice.

- [Introduction](#introduction)
- [Features](#features)
- [Contributing](#contributing)
- [Team](#team)
- [FAQ](#faq)
- [License](#license)


---

---

## Introduction

- Speicherung von Rezepten bestehend aus mehreren Zutaten -check
- Speicherung von Ernährungskategorien -check
- Speicherung von Beschränkungen/ Allergenen -check
- Zusammenstellung von Zutaten entsprechend eines Rezepts
- Auswahl von Rezepten entsprechend vorgegebener Ernährungskategorien
- Auswahl bzw. Ausschluss von Rezepten auf Basis von Beschränkungen
- Zugriffskontrolle personenbezogener Daten


### Privacy Declaration / Datenschutz

- Erläutern Sie in Bezug auf die angepasste Datenbank die geltenden rechtlichen Vorgaben des Datenschutzes und machen Sie einen Vorschlag für ein rechtskonformes Datenschutzkonzept.
- Machen Sie sich mit den rechtlichen Vorgaben des Datenschutzes vertraut und definieren Sie, welche personenbezogenen Daten wie verwendet werden.
- Erstellen Sie anschließend eine Datenschutzerklärung für Ihren Kunden.
- Entwickeln Sie erste Ideen, wie die geltenden Datenschutzbestimmungen im Sinne der Datensicherheit umgesetzt werden könnten und unterbreiten Sie diese dem Datenschutzbeauftragten.

### Allergene als Beispiel
https://www.nestleprofessional.de/news/ernaehrung/allergenliste-die-14-hauptallergengruppen-im-ueberblick
-> Die 14 Hauptallergene, müssen genannt werden (EU-Richtlinie)

- Laktose           ID 1
- Gluten            ID 2
- Ei                ID 3
- Erdnuss           ID 4
- Fisch             ID 5
- Schalentiere      ID 6  
- Lupinen           ID 7   
- Schalenfrüchte    ID 8
- Schwefeldioxid    ID 9
- Sellerie          ID 10
- Senf              ID 11
- Soja              ID 12
- Weichtiere        ID 13
- Sesam             ID 14

Allergene darüber hinaus: (Notwendig wegen vorgegebenen Rezepten aus LF5)

- Weizen            ID 15
- Stärke            ID 16
- Karotte           ID 17

### Kategorien als Beispiel

- Vegetarisch   ID 1
- Vegan         ID 2
- Frutarisch    ID 3
- Laktosefrei   ID 4
- Glutenfrei    ID 5   
- Ketonisch     ID 6


### WICHTIGER HINWEIS ###
Nährwertangaben sind pro 100 Gramm.... und bleiben sie auch.
Für Rezepte Kalorien per Hand berechnen und in rezepte.r_kcal eintragen!
~~Für Kalorien Queries in der Berechnung die Grundeinheit des Bestands beachten. Das kann zb Stück oder KG sein.~~
~~-> Will be fixed in an upcoming version of the DB. Calories etc will be stated in the same unit as the ingredients themselves. (e.g. Calories per KG) -F.~~

### Anforderung an die SQL Queries:

> Queries in Human Speech

```shell
$ Auswahl eines Rezeptes nach Rezeptname
$ Auswahl aller Rezepte einer bestimmten Ernährungskategorie
$ Auswahl aller Rezepte, die eine gewisse Zutat enthalten
$ Berechnung der durchschnittlichen Nährwerte aller Bestellungen eines Kunden
$ Auswahl aller Zutaten, die bisher keinem Rezept zugeordnet sind
```

> Optional Queries in Human speech

```shell
$ Auswahl aller Rezepte, die eine bestimmte Kalorienmenge nicht überschreiten 
$ Auswahl aller Rezepte, die weniger als fünf Zutaten enthalten
$ Auswahl aller Rezepte, die weniger als fünf Zutaten enthalten und eine bestimmte Ernährungskategorie erfüllen
```
> THIS IS WHAT WE ALSO NEED TO DO REALLY IMPORTANT DO NOT FORGET !!!

```shell
$ WE NEED THREE ADDITIONAL TASKS!!
$ Stellen Sie sicher, dass Sie insgesamt mindestens je eine Abfrage mit inner join, left join/ right join sowie Subselects und Aggregatfunktionen erstellen
```

- 1: Finde ein Team
- 2: Klarheit schaffen
- 3: Vorbereitung (Scrum, GitHub), IDE (?)
- 4: Backlog (Fachliche Aufgaben bestimmen, Recherche bestimmen)
- 5: Sprint 1) Grooming Session, Entwicklung, Product Demo, Team Retroperspective
- 6: Sprint 2) Grooming Session, Enwticklung, Product Demo, Team Retroperspective

### Details

- Sie können selber festlegen, ob Sie alleine, mit einer/m Partner/in oder in einem Dreier-Team arbeiten möchten. Damit sich alle voll in das Projekt einbringen können, raten wir stark von Teams mit mehr als drei Mitgliedern ab. Bilden Sie am besten interdisziplinäre Teams, mit Auszubildenden aus den verschiedenen Fachrichtungen. Wenn Sie in Dreier-Teams arbeiten, vergeben Sie die Scrum Rollen Scrum-Master, Tech-Lead und Product Owner. Legen Sie auch Teamregeln fest und schreiben Sie diese auf. Nach welchen Regeln treffen Sie z. B. Entscheidungen, welche Kommunikationswege legen Sie fest und welche Regeln formulieren Sie für Konflikte. Lernen Sie miteinander und voneinander. Unterstützen Sie sich im Team und auch über die Teams hinaus.
- Ihr Lehrerteam wird bzw. hat Ihnen bereits eine Einführung in das Modul geben. Sichten Sie die Kursmaterialien. Besprechen Sie im Team, wie Sie den Projektauftrag verstehen. Haben Sie alle das gleiche Verständnis? Schreiben Sie alle Unklarheiten auf und klären Sie diese mit Ihrem Lehrerteam ab. Einigen Sie sich auf einen Kompetenznachweis, den Sie in diesem Lernfeld erbringen möchten und der bewertet werden soll. Sie können dem Lehrerteam auch gerne einen alternativen Kompetenznachweis vorschlagen.
- Bevor Sie loslegen, richten Sie sich Ihre Arbeitsumgebung ein. Für dieses Lernfeld erwarten wir, dass Sie ein digitales Scrum-Board nutzen. Digitale Scrum-Boards gibt es online und kostenlos. Sie können zum Beispiel Trello oder Meistertask für Ihr digitales Scrum-Board nutzen. Sprechen Sie sich mit dem Lehrerteam ab, wie diese Ihr Scrum-Board einsehen können. Darüber hinaus wird die Nutzung von GitLab zur Speicherung und Versionierung Ihrer Dateien empfohlen bzw. von FIAE erwartet. Eine kurze Einführung zur Arbeit mit GitLab finden Sie hier.
- Tragen Sie in Ihr Projekt-Backlog alle Aufgaben ein, die Sie zum jetzigen Zeitpunkt für das gesamte Projekt erkennen können. Das Backlog ist keine statische "Aufgabenliste". Es ist erlaubt, dass im Laufe des Projekts noch weitere Aufgaben dazu kommen oder wegfallen. Wichtig, nehmen Sie neben den technischen Aufgaben auch alle Aufgaben aus dem Bereich Recherche, Information und Austausch auf.


---

## Features

### Sprint 1:
Sprint 1 "Discovery Track"
Im ersten Sprint geht es rein darum, sich über die verschiedenen Themen zu informieren. Aufgaben in diesem Sprint umfassen z. B. Selbsstudium, Lesen, Zusammenfassen, sich gegenseitig erklären, an (Lehrer-) Vorträgen teilnehmen, Fragen aufschreiben und diese klären. Das Produkt des Discovery Tracks könnte z. B. ein Dokument sein, welches die wesentlichen Erkenntnisse stichwortartig zusammenfasst. Das kann beispielsweise eine Liste der wichtigsten SQL-Befehle sein, eine Beschreibung der Teamrollen und Teamregeln oder Ihr ausformuliertes Ziel für dieses Projekt. Solche Dokumente können Sie ebenfalls in GitLab speichern. (DAS HEIßT FLEIßIG HOCHLADEN)

### Sprint 2:
Sprint 2 "Building a minimal viable product"
Wenn Sie sich mit agilem Projektmanagement und SCRUM auseinander gesetzt haben, wissen Sie, dass am Ende eines jeden Sprints eine funktionierende Version des Produktes steht. Im ersten Sprint wird eine Art "Minimal-Produkt" entwickelt, dass so genannte  minimal viable product. Der Product Owner steuert den Prozess um zu bestimmen, was in einem minimal viable product enthalten ist und was in späteren Versionen enthalten sein wird. Diese Entscheidung ist der Ausgangspunkt jeder Sprintplanung. Wenn Sie wissen, wie das Produkt am Ende eines Sprints aussehen soll, starten Sie eine "Grooming Session". Sie wählen aus dem Projekt Backlog die zur Umsetzung notwendigen Aufgaben heraus und ziehen diese in Ihr Sprint Backlog.

- 1: Entwurf des ERD
- 2: Anpassung der Datenbank
- 3: Generieren der entsprechenden SQL-Abfragen
- 4: Testen der Funktionalität
- 5: Anlegen weiterer Nutzdaten

### Sprint 3 + 4 

- 1: -Zielbestimmung: Wie soll die Produktversion am Ende des Sprints aussehen?
- 2: -Grooming Session: Welche Aufgaben sind zur Umsetzung dafür zu bearbeiten (Aufgaben werden aus dem Projekt Backlog in das Sprint Backlog gezogen)
- 3:Entwicklungsarbeit (DB - inklusive Erweiterung des ERD)
- 4:Generieren weiterer SQL Abfragen
- 5: Testen der Funktionalität
- 6: Product Demo
- 7: Team Retro

### Sprint 5:

Brauchen wir eher nicht: Nur für die FIAE und FIDP. Als FIFI eventuell zu komplex und unnötig für uns. 

## Project Backlog:

- 1: Was wird genau gemacht?
- 2: Wer bearbeitet die Aufgabe?
- 3: Bis wann bearbeitet er die Aufgaben.

## Documentation (Optional)
 
---


## License

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

- **[MIT license](http://opensource.org/licenses/mit-license.php)**
- Copyright 2015 © <a href="http://fvcproductions.com" target="_blank">FVCproductions</a>.
