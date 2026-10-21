---
name: project-handoff
description: Maintain docs/PROJECT_CONTEXT.md as a concise snapshot of the project's current state for the next development session.
disable-model-invocation: true
---

# Project handoff

Optimize for what the next development session needs to know, not what happened in the last one. Maintain `docs/PROJECT_CONTEXT.md` relative to the project root as an evolving snapshot, not a session log.

## Review and synthesize

- Review the available conversation, applicable `AGENTS.md` instructions, existing project context, relevant code, and Git status and diffs, including staged and unstaged changes. Inspect relevant untracked files when needed.
- Reconcile existing context with current evidence. Distinguish implemented behavior from plans, and verified results from assumptions or untested changes. Preserve useful decisions and their rationale; do not invent missing history or mark unresolved work complete.
- Capture current architecture and useful code entry points, key decisions and constraints, meaningful progress, unresolved issues, and concrete next steps. Include only details that help the next session resume work.
- Evolve the document: rewrite, consolidate, or remove stale and duplicate material. Preserve useful information already present. Avoid chronological entries, conversation transcripts, trivial edits, repeated background, and unnecessary history.
- Keep the result concise and information-dense. Adapt the existing structure or use short sections where useful; omit empty sections. Use project-relative paths and actionable descriptions. Keep secrets and credentials out of the document.

## Propose before writing

1. If no meaningful update is needed, say so and leave the document unchanged. Do not rewrite it for cosmetic differences.
2. Show the proposed changes as a readable diff against the current document. If it does not exist, show the complete proposed document.
3. Request approval of that proposal and wait. Explicit invocation of this skill or a general request to update context does not approve an unseen proposal. Do not write the document, or create its directory, before approval.
4. After approval, re-read the document to ensure it has not changed since the proposal. If it changed, reconcile the new content and request approval of a revised proposal. Otherwise, apply only the approved changes to `docs/PROJECT_CONTEXT.md`.
5. Verify the resulting document matches the approved proposal and briefly report the outcome.

## Scope

This is an instruction-only workflow. Modify only `docs/PROJECT_CONTEXT.md`; reading other files does not authorize changing them. Never modify `AGENTS.md`, commit, or push. Leave unrelated code and Git changes untouched.
