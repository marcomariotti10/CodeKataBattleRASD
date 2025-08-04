# CodeKataBattle – Software Specification and Design

This repository documents the **requirements**, **architectural design**, **formal models**, and **UML artifacts** of a fictional educational platform called **CodeKataBattle** (CKB). It is the outcome of a Software Engineering 2 project and includes:

- RASD (Requirements Analysis and Specification Document)
- DD (Design Document)
- UML diagrams
- Alloy formal specification

⚠️ **This project does not implement CodeKataBattle — it only describes it.**

---

## 📖 Project Summary

**CodeKataBattle (CKB)** is a fictional web platform designed to help students improve their programming skills through collaborative, test-driven exercises called *Code Katas*. Educators can create tournaments and coding battles, which students join in teams. The system integrates GitHub repositories and provides real-time scoring, feedback, and gamification through badges.

CKB is imagined as a modern, competitive alternative to traditional CS education.

---

## 📁 Contents of This Repository

| File | Description |
|------|-------------|
| `RASD.pdf` | Requirements Analysis and Specification Document. Describes goals, functional and non-functional requirements, scenarios, and Alloy formal models. |
| `DD.pdf` | Design Document. Describes architectural decisions, runtime views, deployment models, UI mockups, and component diagrams. |

---

## 📌 Key Features (Specified in the Documents)

### Functional Highlights
- Students can register, join tournaments, and form teams.
- Educators can create/manage tournaments and battles.
- GitHub integration for commit-triggered scoring.
- Automated and manual code evaluation.
- Badges awarded based on customizable rules.
- Real-time leaderboards for battles and tournaments.

### Design Highlights
- 3-Tier Architecture (Presentation, Logic, Data).
- MVC and Observer patterns.
- Alloy specification to validate structural constraints.
- RESTful architecture implied in diagrams and flows.

### UML & Modeling
- Class Diagrams
- Use Case Diagrams
- Sequence Diagrams (e.g., for team creation, badge assignment)
- State Diagrams (e.g., user registration, scoring updates)
- Alloy Formal Model with Tournament–Battle–Student consistency checks

## 📄 License

This repository is provided for academic and illustrative purposes only.
