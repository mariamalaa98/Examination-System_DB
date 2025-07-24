# 🎓 Examination System – SQL Server Database

Welcome to the **Examination System Database**, a complete SQL Server-based relational database designed to support an end-to-end academic examination environment. This backend system forms the foundation of an exam platform for managing students, instructors, courses, questions, exams, and automatic correction—all with a focus on structure, integrity, and performance.

---

## ✨ Key Features

This database is designed to handle all essential aspects of an academic examination process:

### 👨‍🎓 Student & Instructor Management

- Structured storage for **students** and **instructors** with unique IDs.
- Tracks **instructor-course** relationships for multi-instructor scenarios.
- Includes **student enrollment** and **course registration**.

### 📚 Course & Topic Management

- Supports **multiple courses**, each with defined **topics**.
- Topic coverage tracking for **question classification**.
- Allows easy mapping between **courses**, **topics**, and **instructors**.

### ❓ Question Bank & Exam Engine

- Centralized question bank:
  - Supports **MCQ** and **True/False** question types.
  - Each question can be linked to a specific course and topic.
- Auto-generates exams by randomly selecting a set of questions from the course pool.
- Supports **manual or automated correction** logic.

### 📝 Student Exams & Answers

- Maps each student to their exam with **answers and grades**.
- Stores student responses with tracking for **answer correctness**.
- Supports **answer correction procedures** for auto-grading.

### ⚙️ Stored Procedures

- `GenerateExam`: Create randomized exams from a question pool.
- `CorrectExam`: Automatically correct exams and calculate student grades.

---

## 🏛️ Project Structure

```bash
📦 Examination-System_DB
 ┣ 📄 schema.sql             # Database schema (DDL)
 ┣ 📄 data-insert.sql        # Sample data for students, instructors, questions, etc.
 ┣ 📄 exam-generator.sql     # Procedure to create exams automatically
 ┣ 📄 exam-correction.sql    # Procedure to auto-grade student exams
 ┗ 📄 README.md              # Project documentation
