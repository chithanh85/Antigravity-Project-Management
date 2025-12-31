---
description: Phase 1: Create a Product Brief (Analysis)
---

# APM: Analysis (Brief)

This workflow corresponds to **Phase 1: Analysis**. It creates a high-level Product Brief to define the "Why" and "What" before technical planning.

## Usage
User provides: **Idea** or **Feature Name**.

## Steps

1.  **Context Gathering**
    - Ask identifying questions to categorize the request:
        - "Is this a bug fix, a new feature, or a system overhaul?"
    - Ask strategic questions:
        - "What problem does this solve?"
        - "Who is the target user?"

2.  **Drafting the Brief**
    - Create file: `.antigravity/0-analysis/<slug>.md`
    - Template:

    ```markdown
    ---
    name: <Title>
    type: Product Brief
    status: draft
    created: <datetime>
    track: <Quick/Feature/System>
    ---

    # Brief: <Title>

    ## 1. The Core Problem
    [One sentence description of the pain point]

    ## 2. The Solution (Value Prop)
    [What are we building and why is it better?]

    ## 3. Success Metrics
    [How do we know we won?]

    ## 4. Risks & Unknowns
    [What are we worried about?]
    ```

3.  **Completion**
    - Notify user: "Brief created at `.antigravity/0-analysis/<slug>.md`."
    - Suggest next step: "Ready to Plan? Run `apm-spec`."
