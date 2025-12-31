# Antigravity Project Management (APM)

**APM** is an AI-native project management methodology designed for high-velocity software development. It automates the lifecycle of a feature from raw idea to shipping code using specialized agent flows.

## �️ Installation & Setup

### Prerequisites
*   **Antigravity IDE**: Ensure you are running the latest version of Antigravity.
*   **Agentic Mode**: Enable Agentic Mode to allow the agent to read workflows and execute commands.

### Step 1: Install Workflows
Ensure the following files are present in your `.agent/workflows/` directory:
*   `apm-init.md`
*   `apm-brief.md`
*   `apm-spec.md`
*   `apm-build.md`
*   `apm-orchestrator.md`
*   `apm-flow.md`
*   `apm-brownfield.md`
*   `apm-epic-sync.md`

### Step 2: Initialize
Run the initialization command to set up the storage structure:
> "Run apm-init"

This will create the persistent `.antigravity/` directory.

---

## 📂 Directory Structure

All project artifacts are stored persistently in `.antigravity/`:

```
.antigravity/
├── 0-analysis/         # Product Briefs & Research
│   └── <feature>.md
├── 1-planning/         # Technical Specifications (PRDs)
│   └── <feature>.md
├── 2-execution/        # Epics, Task Lists, and Logs
│   └── <feature>/
│       ├── epic.md     # High-level summary
│       ├── 001-task.md # Actionable task
│       └── ...
└── docs/               # Documentation & Knowledge
    ├── README.md       # This file
    └── knowledge.md    # Self-learning rules
```

---

## 🚀 The 3-Phase Pipeline

### Phase 1: Analysis (`apm-brief`)
Stop building the wrong thing. This phase focues purely on the "Why" and "What".
*   **Input**: A raw idea (e.g., "Add a dark mode").
*   **Agent Persona**: Product Manager.
*   **Output**: A **Product Brief** defining the core problem, user value, and success metrics.
*   **Command**: `Run apm-brief`

### Phase 2: Planning (`apm-spec`)
Don't code without a plan. This phase merges Product Requirements with Technical Architecture.
*   **Input**: A Product Brief.
*   **Agent Persona**: Chief Architect.
*   **Output**: A **Technical Specification** containing:
    *   User Stories
    *   Data Schema Changes
    *   API Endpoints
    *   Step-by-step Implementation Plan
*   **Command**: `Run apm-spec`

### Phase 3: Execution (`apm-build`)
Divide and conquer. This phase breaks the spec into atomic tasks.
*   **Input**: A Technical Spec.
*   **Agent Persona**: Engineering Lead.
*   **Output**: A folder of **Task Files** (`001-setup.md`, `002-api.md`, etc.) ready for agents.
*   **Command**: `Run apm-build`

---

## 🤖 The Orchestrator (Master Agent)

The **Orchestrator** is the runtime engine that manages the actual coding work.
*   **Role**: Project Manager & QA.
*   **Behavior**:
    1.  Reads the Task Board in `2-execution`.
    2.  **Dispatches** a "Worker Agent" to code the current task.
    3.  **Reviews** the Worker's changes and tests.
    4.  **Updates State**: Marks tasks as `completed` or `failed`.
    5.  **Loops** until the feature is done.

---

## 🧠 Self-Learning (Knowledge Base)

APM gets smarter over time. It features a closed-loop learning system:
1.  **Memory**: Lessons are stored in `docs/knowledge.md`.
2.  **Learning**: The **Orchestrator** writes new rules to this file when it encounters failures or discovers best practices.
3.  **Application**: The **Architect** (`apm-spec`) and **Engineer** (`apm-build`) READ this file before starting work, ensuring they never repeat mistakes.

---

---
 
 ## 🏚️ Brownfield Onboarding (`apm-brownfield`)
 
 For existing or legacy projects, use the **Brownfield Workflow**.
 
 *   **Use Case**: Onboarding an existing codebase into APM.
 *   **Goal**: Generate AI-optimized documentation and initialize APM structure.
 *   **Command**: `Run apm-brownfield`
 *   **Process**:
     1.  Scans the codebase.
     2.  Generates `docs/index.md` (Master Entry Point).
     3.  Shards large documentation files.
     4.  Integrates with `apm-init`.
 
 ---
 
 ## ⚡ Auto-Pilot (`apm-flow`)

Want to go from Idea to Code in one shot? Use the Auto-Pilot.

**Command**: `Run apm-flow for "[Your Idea]"`

**What happens:**
1.  Agent runs **Analysis** -> Generates Brief.
2.  Agent runs **Planning** -> Generates Spec.
3.  Agent runs **Execution** -> Generates Tasks.
4.  Agent boots **Orchestrator** -> **Writes and Verifies Code**.

---

## 💡 Example Usage

**Scenario**: You want to add a "Login with Google" feature.

1.  **Manual Mode (Step-by-Step)**
    *   "I want to add Google Login. Run `apm-brief`." -> *Agent asks strategic questions.*
    *   "Okay, plan it. Run `apm-spec`." -> *Agent designs the User table tables.*
    *   "Build it. Run `apm-build`." -> *Agent creates tasks.*
    *   "Execute task 1." -> *Agent writes code.*

2.  **God Mode (Fast)**
    *   "Run `apm-flow` for Google Login system."
    *   *Agent does EVERYTHING and notifies you when the code is ready for review.*
