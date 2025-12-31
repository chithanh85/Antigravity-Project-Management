---
description: Phase 3: Decompose into Tasks & Sync (Execution)
---

# APM: Execution (Build)

This workflow corresponds to **Phase 3: Execution**. It takes the Technical Spec and creates actionable Epics and Tasks for development.

## Usage
User provides: **Feature Name**.

## Steps

1.  **Read Context (Spec & Knowledge)**
    - Read `.antigravity/1-planning/<slug>.md`.
    - Read `docs/knowledge.md`.
    - If spec missing, ERROR: "Please run `apm-spec` first."

2.  **Create Execution Structure**
    - Create dir: `.antigravity/2-execution/<slug>/`
    - Create `epic.md` summary.

3.  **Task Decomposition**
    - Based on the "Implementation Plan" in the Spec.
    - Create individual task files: `001-<task>.md`, `002-<task>.md`.
    - Format:
        ```markdown
        ---
        name: Task Title
        status: open
        ---
        # Task: Title
        [Details from Spec]
        ```

4.  **GitHub Sync (Optional)**
    - Ask user: "Sync to GitHub?"
    - If YES: Create issues and update local files with Issue IDs.

5.  **Completion**
    - Notify user: "Build plan ready at `.antigravity/2-execution/<slug>/`."
    - "Select a task to start coding!"
