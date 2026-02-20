# kint

## Greek Interlinear New Testament (NT)

A high-performance, cross-platform Greek Interlinear New Testament built with Flutter. This application provides a word-for-word breakdown of the Greek New Testament text, including Strong’s numbers, grammatical parsing (Functional), and lemmas.

### 🌟 Key Features

- Interlinear Display: Greek text aligned vertically with its transliteration/lemma, Strong's numbers, and grammatical parsing.

- Comprehensive Parsing: Includes a dedicated "Functional" row showing Case, Number, Gender, and Tense for every Greek word.

- Strong’s Integration: Instant pop-up definitions for any Strong’s number.

- Offline First: Powered by a local SQLite database (nt.sqlite) for lightning-fast, offline access.

- Cross-Platform: Optimized for Mobile (Android/iOS) and Web deployment.

- Modern UI: Features a sleek "Modern Selection Grid" for quick navigation through books, chapters, and verses.

- High-Quality Sharing: Generate and share "long screenshots" of entire verses, perfectly rendered for messaging apps.

### 🛠 Tech Stack

- Framework: Flutter

- Database: Drift (formerly Moor) for reactive SQLite persistence.

- State Management: Provider.

- Native Features: url_launcher for external links and share_plus with screenshot for image generation.

### 📊 Database Schema

The app utilizes a custom nt.sqlite file with the following core structure:

Content Table 

Column      Type    Description

book_name   TEXT    Name of the NT Book

chapter_nr  INTEGER Chapter Number

verse_nr    INTEGER Verse Number

word        TEXT    The Greek text

functional  TEXT    Grammatical parsing (e.g., N-NSM, V-PAI-3S)

strongs     TEXT    Strong's Greek Number

lemma       TEXT    The dictionary form of the word

### 🚀 Getting Started

Prerequisites
- Flutter SDK (Stable channel)
- Android Studio / Xcode / VS Code

Installation
- Clone the repository:
Bash 
`git clone https://github.com/peace-shillong/Greek-Interlinear-New-Testament-Android.git`

Install dependencies: Bash
`flutter pub get`

Prepare the Database:
Ensure your nt.sqlite is placed in the assets/ folder and listed in pubspec.yaml.

Run the App:Bash
`flutter run`

### 🤝 Contribution & Feedback

This project is open-source and part of a larger initiative to provide free digital tools for biblical languages.

Hebrew OT Version: Hebrew Interlinear OT

Feedback: Feel free to open an issue or submit a pull request on GitHub.

Built with assistance from Gemini AI.