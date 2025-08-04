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

## 📁 Repository Contents

| File | Description |
|------|-------------|
| `RASD.pdf` | *Requirements Analysis and Specification Document* — defines goals, use cases, functional & non-functional requirements, and Alloy specification. |
| `DD.pdf` | *Design Document* — describes system architecture, components, interfaces, deployment and runtime views, UI mockups, and implementation plan. |
| `uml_class_diagram.png` | UML Class Diagram for the entire CodeKataBattle system. Defines key entities like User, Tournament, Battle, Team, EvaluationSystem, Badge, etc. |
| `ckb_alloy_model.als` | Alloy model capturing the static constraints of the system (e.g. one team per battle, valid student-team memberships, badge assignment logic, etc.). |

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
