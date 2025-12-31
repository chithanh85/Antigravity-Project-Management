---
description: Phase 2: Create a Technical Spec/PRD (Planning)
---

# APM: Planning (Spec)

This workflow corresponds to **Phase 2: Planning**. It generates a comprehensive **Technical Specification** by merging product requirements with system architecture.

## Usage
User provides: **Feature Name** (must match an existing Brief if available).

## Steps

1.  **Read Context (Brief & Knowledge)**
    - Look for `.antigravity/0-analysis/<slug>.md` (The Goal).
    - Look for `docs/knowledge.md` (The Lessons).
    - **Crucial**: Apply any relevant constraints from `knowledge.md` to the spec.

2.  **Drafting the Spec**
    - Create file: `.antigravity/1-planning/<slug>.md`
    - Template:

    ```markdown
    ---
    name: <Title>
    type: Technical Spec
    status: draft
    based_on: [Link to Brief](../0-analysis/<slug>.md)
    ---

    # Spec: <Title>

    ## 1. Context
    - **Problem**: (From Brief)
    - **Goal**: (From Brief)

    ## 2. User Stories (Functional)
    - [ ] Story 1...
    - [ ] Story 2...

    ## 3. Architecture & Solutioning (Technical)
    - **Data Models**: [Schema changes]
    - **API Endpoints**: [New/Modified routes]
    - **Components**: [Frontend structure]
    - **Security**: [Auth/Permissions]

    ## 4. Implementation Plan
    - [ ] Step 1: ...
    - [ ] Step 2: ...
    ```

3.  **Completion**
    - Notify user: "Spec created at `.antigravity/1-planning/<slug>.md`."
    - Suggest next step: "Ready to Build? Run `apm-build`."
