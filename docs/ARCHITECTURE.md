# Architecture

## Goals

Repo Scout is intentionally larger than a minimum two-screen demonstration. Its
architecture is designed to make network, persistence, state, and responsive UI
behavior independently replaceable and testable while keeping the application
domain free of framework details.

## Layer boundaries

| Layer | Owns | May depend on |
|---|---|---|
| `domain` | Entities, repository contracts, use cases | Dart and feature-neutral core values |
| `data` | GitHub DTOs, Drift schema, sources, mappers, implementations | Domain, core, Dio, Drift |
| `presentation` | BLoCs, pages, adaptive widgets | Domain, core, Flutter, BLoC |
| `app` | Routing, theme, shell, dependency composition | Every layer at the application edge |

The domain defines two small repository contracts:

- `RepositorySearchRepository` streams cache and network page results.
- `FavoriteRepositoriesRepository` watches and writes persistent favorites.

This separation applies Interface Segregation and keeps each use case dependent
only on the capability it needs.

## Search sequence

```mermaid
sequenceDiagram
  participant UI as Search page
  participant B as SearchBloc
  participant U as SearchRepositories
  participant R as Search repository
  participant D as Drift
  participant G as GitHub API
  UI->>B: QueryChanged / Submitted
  B->>U: normalized request
  U->>R: search(request)
  R->>D: read cached page
  D-->>R: cached page?
  R-->>B: cached success (when present)
  R->>G: fetch current page
  G-->>R: DTO response or failure
  R->>D: transactional cache update
  R-->>B: fresh success or cached warning
  B-->>UI: immutable SearchState
```

The repository returns a stream because a single search operation can produce
two meaningful values: an immediate cached page and a later network page. This
keeps stale-while-revalidate policy out of the BLoC without hiding intermediate
data behind callbacks.

## Search state

`SearchState` deliberately keeps orthogonal flags instead of collapsing every
combination into a large union. This is necessary because existing content may
remain visible while refresh or pagination is active.

| Field | Meaning |
|---|---|
| `status` | Initial, first-page loading, success, empty, or full failure |
| `repositories` | Deduplicated visible items |
| `currentPage`, `hasReachedEnd` | Pagination cursor and terminal state |
| `isRefreshing` | First page is being refreshed while content remains |
| `isLoadingNextPage` | A later page is loading |
| `isFromCache`, `isStale`, `fetchedAt` | Cache origin and age information |
| `failure` | Full-page failure with no usable content |
| `refreshFailure` | Background refresh warning with content preserved |
| `paginationFailure` | Inline next-page failure with retry |

Typing is debounced for 450 ms and processed with restartable concurrency.
Explicit submit and retry are immediate. A request identifier prevents late
stream values from a superseded query from updating the current screen.

## Persistence schema

| Table | Purpose |
|---|---|
| `cached_repositories` | Canonical repository snapshot keyed by GitHub ID |
| `search_pages` | Query/page metadata, age, and next-page status |
| `search_page_items` | Ordered many-to-many relation between pages and repositories |
| `favorite_repositories` | Persistent favorite relation and creation time |

A repository can occur in many queries without duplicating its snapshot.
Writing a search page upserts repositories and replaces ordered relationships
inside one transaction. Favorites reference the same canonical rows and are
exposed as a Drift stream.

The schema begins at version 1. Future versions must include explicit migrations
and preservation tests. Foreign keys are enabled when the database opens.

## Failure model

Technical failures are translated at the data boundary into Freezed domain
failures: network, rate limit, server, cache, validation, and unexpected. UI
receives actionable messages without importing transport or persistence types.

Rate-limit responses are distinguished from general server errors. Cached data
continues to be emitted when a refresh fails. If neither source can satisfy a
request, the BLoC exposes a full error state with retry.

## Dependency injection

`get_it` assembles the graph in `app/di/service_locator.dart`. It is a composition
tool, not an ambient service locator. Concrete classes use constructor injection,
and tests instantiate subjects directly. BLoCs are factories; the database and
stateless sources, repositories, and use cases are lazy singletons.

## SOLID mapping

- **SRP:** HTTP, cache queries, mapping, coordination, state, and rendering are
  separate responsibilities.
- **OCP:** A new remote source or cache strategy can implement the existing
  contracts without changing use cases or UI.
- **LSP:** Production repositories, fakes, and future cached implementations share
  result and failure semantics.
- **ISP:** Search and favorites use independent, capability-focused contracts.
- **DIP:** Use cases depend on domain contracts; outer data implementations depend
  inward on those contracts.

## Responsive design

The app has three layout bands:

- compact below 600 logical pixels;
- medium/tablet behavior from 840 logical pixels;
- expanded constraints from 1200 logical pixels.

The 600–839 range intentionally remains compact navigation with additional room
for content. At 840 the shell changes from bottom navigation to a rail. Shared
content-width widgets prevent duplication between phone and tablet screens.

## Security and privacy

Only public GitHub data is requested. No token, account, analytics SDK, or user
identifier is stored. External links are restricted to parsed repository URLs
and opened outside the application.
