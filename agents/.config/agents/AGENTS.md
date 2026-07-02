# AGENTS.md

## Identity
- All projects under `~/projects/`
- Primary languages: Python, TypeScript/React, Go
- Package management: `uv` (Python), `npm` (JS/TS)

## Code Philosophy
- Clean, minimal, functional. Not terse for its own sake.
- Enough structure to stay scalable, not so much it adds complexity prematurely.
- Flat, readable code over abstraction layers.
- Names describe what a thing *is*, not how it's implemented.

---

## 1. Think Before Coding
**Don't assume. Don't hide confusion. Surface tradeoffs.**

Before implementing:
- State assumptions explicitly. If uncertain, ask.
- If multiple interpretations exist, present them - don't pick silently.
- If a simpler approach exists, say so. Push back when warranted.
- If something is unclear, stop and ask.

## 2. Simplicity First
**Minimum code that solves the problem. Nothing speculative.**
- No features beyond what was asked.
- No abstractions for single-use code.
- No "flexibility" or "configurability" that wasn't requested.
- No error handling for impossible scenarios.
- If it could be 50 lines instead of 200, rewrite it.

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

 1. [Step] → verify: [check]
 2. [Step] → verify: [check]

**Testing discipline:**
- Write the minimum tests that prove the change works - not exhaustive coverage, not speculative edge cases nobody asked about.
- One targeted test beats a rewritten test suite.
- If a test won't pass after 2-3 attempts, stop and surface it - don't keep burning cycles rewriting it.
- Don't restructure existing test files as a side effect of an unrelated change (see Surgical Changes).

Strong success criteria let you loop independently. Weak criteria ("make it work") require constant clarification.

---

## Conventions
- No em dash (—). Use a plain dash (-).
- Never add yourself as a co-author or signed-off-by in commit messages.

---

*These guidelines are working if:* diffs are clean, no rewrites due to overcomplication, tests are targeted rather than sprawling, and clarifying questions come before implementation rather than after mistakes.
