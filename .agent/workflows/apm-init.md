---
description: Initialize Unified APM structure (Analysis -> Planning -> Execution)
---

# APM: Initialize

This workflow initializes the **APM (Antigravity Project Management)** structure.

## Structure
The system is organized into three sequential phases:

1.  **0-analysis**: For high-level Product Briefs and Research.
2.  **1-planning**: For detailed Technical Specs and PRDs.
3.  **2-execution**: For actionable Epics and Tasks.

## Steps

1.  **Detect Environment**
    - Runs a check to identify if running on Windows or WSL.
    - Creates `.antigravity/env.info` with `EXECUTION_ENV=WSL` or `EXECUTION_ENV=WINDOWS`.
    - Command:
        ```bash
        bash scripts/detect-env.sh
        ```

2.  **Create Directories**
    - Checks and creates:
        - `.antigravity/0-analysis`
        - `.antigravity/1-planning`
        - `.antigravity/2-execution`
        - `docs/`

2.  **Knowledge Base**
    - Creates `docs/knowledge.md`.
    - (Optional) Generates a README in `docs/README.md` explaining the flow.

3.  **Completion**
    - Notify user: "APM Initialized. Start with `apm-brief` to define your idea."
