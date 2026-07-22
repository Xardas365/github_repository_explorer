## Outcome

<!-- Describe the user-visible result. -->

## Architecture and persistence

- [ ] Domain boundaries remain framework-independent.
- [ ] `get_it` changes are restricted to the composition root.
- [ ] Schema changes include a version bump, migration, and preservation tests.
- [ ] Generated Freezed, JSON, and Drift sources are updated.

## Verification

- [ ] `dart format --output=none --set-exit-if-changed lib test integration_test`
- [ ] `flutter analyze`
- [ ] `flutter test`
- [ ] Relevant device/integration journey (or reason it was not run)

## Accessibility and responsive UI

- [ ] Phone and tablet layouts checked.
- [ ] Light and dark themes checked.
- [ ] Semantics, focus, text scaling, and non-color status cues checked.

## Notes

<!-- Record limitations, follow-up work, or intentionally skipped checks. -->
