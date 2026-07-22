# Agent Workflow

This workflow supplements the mandatory repository rules in `AGENTS.md`. It is
optimized for safe, reviewable changes by autonomous coding agents.

## 1. Orient

- Read the request, `AGENTS.md`, relevant architecture section, and current tests.
- Inspect the complete vertical slice before proposing a change.
- Check generated counterparts without editing them.
- Identify whether persistence, public contracts, or platform files are affected.

## 2. Plan the vertical slice

Define the smallest end-to-end outcome and list required changes by boundary:

1. domain behavior and contract;
2. data mapping/source/implementation;
3. presentation event, state, and UI;
4. dependency registration or route composition;
5. tests, generation, migration, and documentation.

Avoid parallel edits to shared generated files or the service locator. If several
agents collaborate, assign ownership by boundary and nominate one integrator for
composition, generation, formatting, and final verification.

## 3. Implement inward-out

Start with the domain vocabulary and contract, then data behavior, then BLoC, and
finally UI/composition. This makes framework-driven leakage visible early. Keep
the project analyzable at each meaningful checkpoint.

## 4. Verify behavior

- Add deterministic fakes or mocks; never rely on the live GitHub API in tests.
- Exercise success, empty, recoverable failure, and retry paths.
- For async search changes, cover superseded requests and retained content.
- For UI changes, check phone, tablet, text scaling, light/dark, and semantics.
- For storage changes, cover existing-data migration and favorites retention.

## 5. Generate and normalize

Run generators once after source edits are settled:

```bash
dart run build_runner build
dart format lib test integration_test
```

Review generated diffs. Unexpected generated churn usually indicates a dependency
or annotation change that needs explanation.

## 6. Gate the handoff

```bash
dart format --output=none --set-exit-if-changed lib test integration_test
flutter analyze
flutter test
```

Use a device integration run for routing, database, native, or critical journey
changes. Report environmental blockers exactly; do not substitute inference for
an unexecuted check.

## Handoff template

```text
Outcome:
Architecture/schema impact:
Generated files:
Checks passed:
Checks not run (reason):
Known limitations/follow-up:
```
