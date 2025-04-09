# Tournament Planner

**Developer:** Johan Nel  
**Grade:** 11-5  
**School:** Hoërskool Secunda  
**Year:** 2022  
**Project Type:** IT PAT (Practical Assessment Task)  
**Language:** Delphi 2010  
**Database:** Microsoft Access

---

## Overview

The **Tournament Planner** is a desktop application designed to help schools manage their **eisteddfod tournaments** more efficiently. Developed as part of the Grade 11 I.T. PAT, it provides an all-in-one system for registering participants, scheduling rounds, recording scores, and displaying results.

---

## Purpose

This application aims to:
- Replace manual tournament planning with a digital system.
- Allow participants to enter items and track their own scores.
- Help organisers schedule rounds and eliminate participants based on criteria.
- Maintain accurate digital records of tournament progress and outcomes.

---

## Users & Roles

### Organiser
- Create schedules and scoresheets
- Record scores and judge comments
- Eliminate participants based on score criteria
- View and print tournament results
- Delete completed items

### Participant
- Sign up and log in
- Enter one eisteddfod item
- View their score, comments, and participation status
- See when and if they will perform next

### Admin
- Technically the same as organisers, but familiar with file/database structures
- No special GUI — relies on deeper knowledge of program logic and files

---

## Database Design

- **tblUsers**: Stores personal details of each user and their login credentials.
- **tblScores**: Contains participant event entries, scores, participation status, round data, and judge comments.

### Key Relationships:
- `Username` is the **primary key** in `tblUsers` and a **foreign key** in `tblScores`.
- `ItemCode` is the **primary key** in `tblScores`.

---

## Key Features

- Unique username generation (Name + Surname + Age)
- Encrypted passwords using a custom ASCII manipulation function
- Schedule builder with break time options
- Score management and automatic participant elimination
- Printed results and schedule reports
- Input validation with detailed error messages
- GUI with Help functionality using `.txt` files

---

## File Structure

- `Teachers.txt` – Admin recognition file
- `Items.txt` – List of eisteddfod item categories
- `Items\[ItemName].txt` – Tracks item code progression
- `Scores\[Username].txt` – Archive of user scores and feedback
- `Help\[FormName].txt` – Help system text files
- `Schedules\[Item][Round].txt` – Printed schedule records
- `Results\[Item][Round].txt` – Printed results records
- `Current.txt` – Stores the currently logged in user
- `Enter.txt` – Controls whether users can still enter new items

---

## Validation Highlights

- All inputs (e.g., names, passwords, item names) are validated
- Prevents duplicate usernames or event entries
- GUI reacts to validation with error messages and styling
- Schedule creation checks for conflicts and non-participating users

---

## GUI Forms

- `frmLogin`: Sign Up & Log In
- `frmView`: View participant details and progress
- `frmManage`: Organiser functions:
  - Schedule creator
  - Score entry
  - Results viewer
  - Participant eliminator
  - Item deleter

---

## Resources & References

- [Delphi Basics](https://www.delphibasics.co.uk/)
- [Password Encryption techinique](https://edn.embarcadero.com/article/28325)
- [Program demo video](https://youtu.be/EJMGtWttWfw)

---
