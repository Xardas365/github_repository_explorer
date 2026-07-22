import 'package:drift/drift.dart';

part 'app_database.g.dart';

class CachedRepositories extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get owner => text()();
  TextColumn get description => text()();
  IntColumn get stars => integer()();
  IntColumn get forks => integer()();
  IntColumn get openIssues => integer()();
  TextColumn get language => text().nullable()();
  TextColumn get githubUrl => text()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class SearchPages extends Table {
  TextColumn get query => text()();
  IntColumn get page => integer()();
  BoolColumn get hasNextPage => boolean()();
  DateTimeColumn get fetchedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {query, page};
}

class SearchPageItems extends Table {
  TextColumn get query => text()();
  IntColumn get page => integer()();
  IntColumn get repositoryId => integer().references(
    CachedRepositories,
    #id,
    onDelete: KeyAction.cascade,
  )();
  IntColumn get position => integer()();

  @override
  Set<Column<Object>> get primaryKey => {query, page, repositoryId};
}

class FavoriteRepositories extends Table {
  IntColumn get repositoryId => integer().references(
    CachedRepositories,
    #id,
    onDelete: KeyAction.cascade,
  )();
  DateTimeColumn get favoritedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {repositoryId};
}

@DriftDatabase(
  tables: [
    CachedRepositories,
    SearchPages,
    SearchPageItems,
    FavoriteRepositories,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (migrator) => migrator.createAll(),
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}
