---
description: Phase 3b: Orchestrator (Master Agent Loop)
---

# APM: Orchestrator (Master Agent)

This workflow is the **Runtime Engine** for Phase 3. It acts as the Project Manager / Tech Lead who delegates work to the "Worker Agent" and ensures quality.

## Usage
User provides: **Execution Path** (e.g., `.antigravity/2-execution/my-feature/`).

## The Loop (State Machine)

1.  **State Check**
    - Read `epic.md` and list all task files in the directory.
    - Identify current status of each task: `open`, `in-progress`, `completed`, `failed`.

2.  **Dispatch (The "Worker" Handoff)**
    - Find the next PRIORITY task (usually the first `open` one).
    - **Instructions to Self**:
        - "I am now switching hats. I am the **Worker Agent**."
        - "My goal is to complete Task: [Task Name]."
        - "I will read the task file, modify the necessary code, and verify it."
    - *Execute the task logic here*.

3.  **Review (The "Manager" Check)**
    - **Instructions to Self**:
        - "I am switching hats back to **Orchestrator**."
        - "I am reviewing the work done for [Task Name]."
    - Verify:
        - Did the code change?
        - Do tests pass (if applicable)?
    - **Action**:
        - If GOOD: Update task status to `completed` in the markdown file.
        - If BAD: Update task status to `failed` and Log the error in `issue_log.md`.
    - **Learning (Self-Correction)**:
        - "Did I fail because of a missing rule?"
        - "Did I discover a new trick?"
        - If YES: Append a concise rule to `docs/knowledge.md`.

4.  **Recursion**
    - If there are still `open` tasks, **RETURN TO STEP 1**.
    - If all tasks are `completed`, **EXIT** with Success.

## Completion
- Notify user that the entire Epic is complete.
