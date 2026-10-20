# AGENTS.md

## Identity

- All projects under `~/projects/`
- Primary languages: Python, TypeScript, Go
- Other languages: C++, Rust
- Package managers: `uv` (Python), `pnpm` (JS/TS), `go mod` (Go)
- DevOps: Docker, GitHub Actions
- Dev setup: Arch Linux, Hyprland, Ghostty, Neovim, tmux
- Git: SSH auth, commits via CLI

## Code Philosophy

- Clean, minimal, functional. Not terse for its own sake.
- Enough structure to stay scalable, not so much it adds complexity prematurely.
- Flat, readable code over abstraction layers.
- Names describe what a thing _is_, not how it's implemented.

## Engineering Context

- My primary background is software engineering, systems development, and applied AI.
- I am expanding into embedded systems, computer engineering, robotics, controls, and hardware/software integration.
- Treat me as an experienced software engineer, not necessarily an experienced electrical engineer.
- For unfamiliar technical domains, explain underlying principles and tradeoffs when relevant, not just implementation steps.
- Favor first-principles reasoning, documentation, measurement, and evidence over assumptions.
- Respect the current project's domain. Do not introduce hardware, AI, or other technologies merely because they align with my interests.
- Read relevant project-level instructions and context documents before making architectural decisions.

---

## 1. Think Before Coding

**Reason independently. Surface material uncertainty. Challenge bad assumptions.**

Before implementing:

- Understand the intended outcome, existing architecture, and relevant constraints.
- State material assumptions explicitly.
- When multiple approaches are viable, explain meaningful tradeoffs and recommend one.
- If a simpler approach achieves the same outcome, say so.
- Make reasonable, reversible implementation decisions independently.
- Ask when ambiguity materially affects behavior, architecture, interfaces, cost, safety, or irreversible decisions.
- Do not guess at external contracts, unfamiliar hardware interfaces, or undocumented behavior. Verify them.

## 2. Simplicity First

**Minimum code that solves the problem. Nothing speculative.**

- No features beyond what was asked.
- No abstractions for single-use code.
- No "flexibility" or "configurability" that wasn't requested.
- No speculative defensive code. Handle realistic failure modes, particularly at external boundaries.
- Prefer the smaller implementation when it is equally clear, correct, and maintainable.

Ask: "Would a senior engineer say this is overcomplicated?" If yes, simplify.

## 3. Surgical Changes

**Touch only what you must. Clean up only your own mess.**

When editing existing code:

- Don't "improve" adjacent code, comments, or formatting.
- Don't refactor things that aren't broken.
- Match existing style, even if you'd do it differently.
- Notice unrelated dead code? Mention it, don't delete it.

When your changes create orphans:

- Remove imports/variables/functions your changes made unused.
- Leave pre-existing dead code alone unless asked.

Every changed line should trace directly to the request.

## 4. Goal-Driven Execution

**Define success criteria. Loop until verified. Spend tokens on implementation, not test churn.**

Transform tasks into verifiable goals:

- "Add validation" → "Write tests for invalid inputs, then make them pass"
- "Fix the bug" → "Write a test that reproduces it, then make it pass"
- "Refactor X" → "Ensure tests pass before and after"

For multi-step tasks, state a brief plan:

1.  [Step] → verify: [check]
2.  [Step] → verify: [check]

**Testing discipline:**

- Write the minimum tests that prove the change works - not exhaustive coverage, not speculative edge cases nobody asked about.
- One targeted test beats a rewritten test suite.
- Don't restructure existing test files as a side effect of an unrelated change (see Surgical Changes).
- Match verification depth to risk. Routine application changes need focused tests; critical paths, hardware interfaces, and irreversible operations warrant stronger validation.
- Distinguish simulated, mocked, and theoretical verification from testing on actual hardware.
- Never report unexecuted tests, assumed behavior, or expected results as verified.
- If repeated attempts fail, investigate the underlying cause rather than cycling through speculative fixes. Surface genuine blockers with evidence.

Strong success criteria let you loop independently. Weak criteria ("make it work") require constant clarification.

---

## 5. UI/UX

- Descriptions: Do not add subtitles, helper text, or descriptive copy beneath headings, labels, cards or settings by default.
  prefer one concise , self-explanatory headeing or label. Only add supporting copy when user explicitly asks for it or
  when it is necessary to prevent misunderstanding or error, and never use it to restate the heading.

## Conventions

- No em dash (—). Use a plain dash (-).
- Never add yourself as a co-author or signed-off-by in commit messages.

---

## 6. Pickle Notifications

Pickle is a self-hosted browser terminal that lets me access this Linux machine
from my other devices. Its CLI can send notifications to my enabled devices.

When running on the Pickle host and the pickle command is available, use
pickle notify when work is ready for review, you are blocked, or you need my input. Keep messages short and specific. Avoid routine progress notifications.
Never include secrets or sensitive information.

Use: pickle notify "<outcome or exact input needed>"
Use --urgency high only when my input is needed to continue.
If notification delivery fails, continue the task and mention the failure in your final response instead of retrying repeatedly.

You can try `pickle help` or `pickle notify --help` to see all options.

---

_These guidelines are working if:_ diffs are clean, no rewrites due to overcomplication, tests are targeted rather than sprawling, and clarifying questions come before implementation rather than after mistakes.
