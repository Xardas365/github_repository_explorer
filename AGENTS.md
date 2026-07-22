# Agent Development Rules

These rules apply to every human or automated contributor in this repository.
They are architectural constraints, not suggestions. More specific instructions
may be added in a nested `AGENTS.md`, but they must not weaken the dependency
rule, security requirements, or required quality checks defined here.

## 1. Start with evidence

Before editing:

1. Read the relevant domain contract, use case, BLoC, and tests.
2. Trace the complete path from UI event to data source and back.
3. Check the working tree and preserve unrelated changes.
4. State assumptions when a requirement is ambiguous.
5. Prefer the smallest complete vertical change over speculative frameworks.

## 2. Preserve the dependency rule

- `domain` must not import Flutter, Dio, Drift, `get_it`, or presentation code.
- `data` may depend on domain and core, never on presentation.
- `presentation` may depend on domain and core, never on concrete data classes.
- `app` is the composition edge and may connect all layers.
- Core must remain feature-neutral. Feature behavior belongs inside the feature.
- Do not move technical types across boundaries. Map DTOs, database rows,
  exceptions, and responses before returning from data implementations.

## 3. Apply SOLID deliberately

- Give each class one reason to change.
- Add abstractions at layer or volatility boundaries, not around every function.
- Keep search and favorite contracts segregated.
- All repository implementations and fakes must honor identical result semantics.
- Depend on domain contracts and inject implementations through constructors.
- Prefer deterministic commands such as `setFavorite(value)` over ambiguous
  state-changing toggles below the presentation layer.

## 4. Restrict service location

- Register dependencies only in `lib/app/di/service_locator.dart`.
- Resolve BLoCs only at provider/router composition boundaries.
- Never call `getIt()` inside a BLoC, use case, repository, data source, mapper,
  widget, or test subject.
- Use `registerFactory` for BLoCs and lazy singletons for stateless services and
  the database. Close disposable singletons explicitly.
- Tests must construct subjects directly with fakes or mocks.

## 5. Model and generation rules

- Use Freezed for domain value types, failures, results, BLoC events, and states.
- Keep `fromJson`, `toJson`, `JsonKey`, and API field names in `data/dtos` only.
- Domain entities must express application language, not GitHub wire format.
- Do not edit `*.freezed.dart` or `*.g.dart` by hand.
- After changing annotated types or Drift tables, run:

  ```bash
  dart run build_runner build
  ```

- Commit generated source with the change that produced it.

## 6. Network, cache, and failure semantics

- Do not embed tokens, credentials, private endpoints, or user data.
- Keep the public GitHub API client time-bounded and map failures centrally.
- Never expose `DioException`, Drift exceptions, or raw status codes to UI.
- Preserve stale-while-revalidate: cached data may be shown immediately, network
  data refreshes it, and refresh failures must not erase usable cached content.
- A cache write failure must not hide a valid network response.
- Do not infer internet availability from connection type; trust the request.
- Keep cache age and retention values injectable through `CachePolicy`/`Clock`.

## 7. Drift schema changes

- Increment `schemaVersion` for every persistent schema change.
- Provide an explicit migration; never rely on destructive recreation.
- Keep writes that update a page and its ordered items in one transaction.
- Preserve favorites during cleanup and migration.
- Add migration and repository tests before merging schema version changes.

## 8. BLoC and concurrency rules

- BLoCs translate user events into immutable view state; they do not parse JSON,
  query Drift, or construct HTTP requests directly.
- Every async path must define loading, empty, success, and recoverable failure.
- Preserve successful items during refresh and next-page loading.
- Ignore late responses from superseded queries.
- Debounce passive typing; explicit submit and retry must remain immediate.
- Keep full-page, refresh, and pagination failures distinct.

## 9. Adaptive and accessible UI

- Test compact (<600), medium/tablet (>=840), and expanded (>=1200) widths.
- Use `NavigationBar` on compact layouts and `NavigationRail` on tablets.
- Constrain readable content width; do not simply stretch phone cards.
- Support system light and dark themes.
- Add semantics to icon-only controls, meaningful tooltips, live status regions,
  logical focus order, scalable text, and at least 48x48 logical-pixel targets.
- Do not encode status using color alone.

## 10. Testing expectations

Every behavior change requires the lowest practical test:

- DTO/mapper or data-source tests for serialization and boundary translation.
- Use-case tests for validation and domain policy.
- BLoC tests for event-to-state transitions, concurrency, retry, and pagination.
- Widget tests for user-visible state and adaptive behavior.
- Integration tests for critical navigation and persistence journeys.

Do not test business behavior against the live GitHub API. Use fakes or mocks.

## 11. Required completion checks

Run from the repository root:

```bash
dart run build_runner build
dart format --output=none --set-exit-if-changed lib test integration_test
flutter analyze
flutter test
```

For changes to routing, persistence, native configuration, or a critical user
journey, also run the integration smoke test on at least one target device.

## 12. Handoff standard

A completed handoff states:

- the user-visible outcome;
- changed architectural boundaries or schema versions;
- generated files refreshed;
- checks run and their results;
- checks not run and the concrete reason;
- remaining limitations or follow-up work.

Never claim a test, build, emulator run, or platform validation that was not
actually completed.
