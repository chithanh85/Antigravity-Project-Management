---
description: Sync APM tasks to GitHub Issues
---

# APM: Epic Sync

This workflow syncs local task files to GitHub Issues.

## Usage
User provides the **Feature Name** of the Epic to sync.

## Steps

1.  **Read Epic Tasks**
    - List files in `.antigravity/2-execution/<feature_name>/`.
    - Filter for task files (ignore `epic.md`).

2.  **Sync to GitHub**
    - For each task file:
        - Check if it already has a `github_issue_id` in frontmatter.
        - If NOT:
            - Use `mcp_github-mcp-server_issue_write` (method='create') to create a new issue.
            - Title: `[<feature_name>] <Task Title>`
            - Body: The content of the task markdown file.
            - Labels: `apm`, `<feature_name>`.
            - **Update the local file**: Add `github_issue_id: <id>` to the frontmatter so we don't duplicate it next time.

3.  **Completion**
    - Notify user of created issues.
