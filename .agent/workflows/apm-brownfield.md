---
description: Onboard an existing/legacy project using the BMAD Brownfield Method
---

# APM: Brownfield / Legacy Project Onboarding

This workflow guides the agent to onboard an existing codebase ("Brownfield") into the APM system.

## Phase 1: Documentation & Analysis (Critical)

1.  **Assess & Create Core Documentation**
    - **Goal**: Create a "Master Entry Point" for AI.
    - **Check**: Does `docs/index.md` exist?
    - **Action**:
        1.  **Analyze Project**: Use `list_dir` (recursive) and `view_file_outline` on key files to build a mental model.
        2.  **Create/Update `docs/project-overview.md`**: High-level summary, goals, tech stack.
        3.  **Create/Update `docs/source-tree-analysis.md`**: A mapped structure of the project (annotated directory tree).
        4.  **Create/Update `docs/architecture.md`**: Diagram (mermaid) or text explaining data flow and core components.
        5.  **Create/Update `docs/index.md`**: Must link to the above 3 files and serve as the central Table of Contents.

2.  **Shard Large Documents** (Manual Process)
    - **Check**: Look for markdown files > 500 lines or containing multiple distinct topics.
    - **Action**:
        - Create sub-documents (e.g., `docs/auth-module.md`, `docs/database-schema.md`).
        - Move content from the large file to these new files.
        - Replace the moved content in the original file with links to the new files.
        - Ensure `docs/index.md` links to all these new documents.

## Phase 2: Knowledge Integration

3.  **Update Knowledge Base**
    - **Action**: Add insights about the legacy code to `docs/knowledge.md`.
    - **Focus**: Note specific patterns, anti-patterns, potential refactoring candidates, or "gotchas" discovered during analysis.

## Phase 3: Track Selection & Initialization

4.  **Confirm Project Track**
    - **Action**: Ask the user to choose a track:
        - **Quick Flow** (Bug fixes, small features) -> Updates `docs/tech-spec.md`.
        - **BMad Method** (Feature sets, robust dev) -> Updates `.antigravity/0-analysis` & `.antigravity/1-planning`.

5.  **Initialize APM Structure**
    - **Action**: Run `/apm-init` (if not already done) to ensure the `.antigravity/` folder structure exists.

## Phase 4: Sync & Status

6.  **Status Update**
    - **Action**: Create/Update `docs/apm-workflow-status.yaml` to track the current phase.
    - **Notify**: Inform the user: "legacy project onboarded. Core documentation generated. Ready for Planning/Execution."
