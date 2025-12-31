---
description: Auto-Pilot: Execute the full Idea -> Code pipeline
---

# APM: Flow (Auto-Pilot)

This is the **Master Workflow** that orchestrates the entire APM pipeline. It takes a raw idea and drives it through Analysis, Planning, and Execution, finally mobilizing agents to implement the code.

## Usage
User provides: **The Idea**.

## Steps

1.  **Phase 1: Analysis (The "Why")**
    *   **Action**: Execute the logic of `apm-brief`.
    *   **Goal**: Create a Product Brief in `.antigravity/0-analysis/`.
    *   **Prompt**: "Act as a Product Manager. Analyze the user's idea: '[User Idea]'. Create a Product Brief that defines the core problem, solution, and success metrics."

2.  **Phase 2: Planning (The "How")**
    *   **Action**: Execute the logic of `apm-spec`.
    *   **Goal**: Create a Technical Spec in `.antigravity/1-planning/`.
    *   **Prompt**: "Act as a Chief Architect. Read the Product Brief we just created. Create a comprehensive Technical Specification (PRD + Architecture) that solves this problem. Define the Data Models, API, and UI components."

3.  **Phase 3: Decomposition (The "What")**
    *   **Action**: Execute the logic of `apm-build`.
    *   **Goal**: Create Task files in `.antigravity/2-execution/`.
    *   **Prompt**: "Act as an Engineering Lead. Read the Technical Spec. Break it down into small, sequential implementation tasks. Create a task file for each step in `.antigravity/2-execution/<slug>/`."

4.  **Phase 4: Mobilization (The Orchestrator)**
    *   **Action**: **HANDOFF** to `apm-orchestrator`.
    *   **Instructions**:
        - "Now that the Plan is built, I will initialize the **Orchestrator**."
        - "Run `apm-orchestrator` targeting the directory: `.antigravity/2-execution/<slug>/`."
    *   The Orchestrator will now enter its loop: Dispatch -> Work -> Review -> Repeat.

5.  **Completion**
    - Notify user: "🚀 **Mission Complete**. I have analyzed, planned, and built your idea. The **Orchestrator** reports all tasks green."
