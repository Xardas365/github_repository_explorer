// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CachedRepositoriesTable extends CachedRepositories
    with TableInfo<$CachedRepositoriesTable, CachedRepository> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedRepositoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ownerMeta = const VerificationMeta('owner');
  @override
  late final GeneratedColumn<String> owner = GeneratedColumn<String>(
    'owner',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _starsMeta = const VerificationMeta('stars');
  @override
  late final GeneratedColumn<int> stars = GeneratedColumn<int>(
    'stars',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _forksMeta = const VerificationMeta('forks');
  @override
  late final GeneratedColumn<int> forks = GeneratedColumn<int>(
    'forks',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _openIssuesMeta = const VerificationMeta(
    'openIssues',
  );
  @override
  late final GeneratedColumn<int> openIssues = GeneratedColumn<int>(
    'open_issues',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _languageMeta = const VerificationMeta(
    'language',
  );
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
    'language',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _githubUrlMeta = const VerificationMeta(
    'githubUrl',
  );
  @override
  late final GeneratedColumn<String> githubUrl = GeneratedColumn<String>(
    'github_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    owner,
    description,
    stars,
    forks,
    openIssues,
    language,
    githubUrl,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_repositories';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedRepository> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('owner')) {
      context.handle(
        _ownerMeta,
        owner.isAcceptableOrUnknown(data['owner']!, _ownerMeta),
      );
    } else if (isInserting) {
      context.missing(_ownerMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('stars')) {
      context.handle(
        _starsMeta,
        stars.isAcceptableOrUnknown(data['stars']!, _starsMeta),
      );
    } else if (isInserting) {
      context.missing(_starsMeta);
    }
    if (data.containsKey('forks')) {
      context.handle(
        _forksMeta,
        forks.isAcceptableOrUnknown(data['forks']!, _forksMeta),
      );
    } else if (isInserting) {
      context.missing(_forksMeta);
    }
    if (data.containsKey('open_issues')) {
      context.handle(
        _openIssuesMeta,
        openIssues.isAcceptableOrUnknown(data['open_issues']!, _openIssuesMeta),
      );
    } else if (isInserting) {
      context.missing(_openIssuesMeta);
    }
    if (data.containsKey('language')) {
      context.handle(
        _languageMeta,
        language.isAcceptableOrUnknown(data['language']!, _languageMeta),
      );
    }
    if (data.containsKey('github_url')) {
      context.handle(
        _githubUrlMeta,
        githubUrl.isAcceptableOrUnknown(data['github_url']!, _githubUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_githubUrlMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedRepository map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedRepository(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      owner: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      stars: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stars'],
      )!,
      forks: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}forks'],
      )!,
      openIssues: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}open_issues'],
      )!,
      language: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language'],
      ),
      githubUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}github_url'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $CachedRepositoriesTable createAlias(String alias) {
    return $CachedRepositoriesTable(attachedDatabase, alias);
  }
}

class CachedRepository extends DataClass
    implements Insertable<CachedRepository> {
  final int id;
  final String name;
  final String owner;
  final String description;
  final int stars;
  final int forks;
  final int openIssues;
  final String? language;
  final String githubUrl;
  final DateTime updatedAt;
  const CachedRepository({
    required this.id,
    required this.name,
    required this.owner,
    required this.description,
    required this.stars,
    required this.forks,
    required this.openIssues,
    this.language,
    required this.githubUrl,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['owner'] = Variable<String>(owner);
    map['description'] = Variable<String>(description);
    map['stars'] = Variable<int>(stars);
    map['forks'] = Variable<int>(forks);
    map['open_issues'] = Variable<int>(openIssues);
    if (!nullToAbsent || language != null) {
      map['language'] = Variable<String>(language);
    }
    map['github_url'] = Variable<String>(githubUrl);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CachedRepositoriesCompanion toCompanion(bool nullToAbsent) {
    return CachedRepositoriesCompanion(
      id: Value(id),
      name: Value(name),
      owner: Value(owner),
      description: Value(description),
      stars: Value(stars),
      forks: Value(forks),
      openIssues: Value(openIssues),
      language: language == null && nullToAbsent
          ? const Value.absent()
          : Value(language),
      githubUrl: Value(githubUrl),
      updatedAt: Value(updatedAt),
    );
  }

  factory CachedRepository.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedRepository(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      owner: serializer.fromJson<String>(json['owner']),
      description: serializer.fromJson<String>(json['description']),
      stars: serializer.fromJson<int>(json['stars']),
      forks: serializer.fromJson<int>(json['forks']),
      openIssues: serializer.fromJson<int>(json['openIssues']),
      language: serializer.fromJson<String?>(json['language']),
      githubUrl: serializer.fromJson<String>(json['githubUrl']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'owner': serializer.toJson<String>(owner),
      'description': serializer.toJson<String>(description),
      'stars': serializer.toJson<int>(stars),
      'forks': serializer.toJson<int>(forks),
      'openIssues': serializer.toJson<int>(openIssues),
      'language': serializer.toJson<String?>(language),
      'githubUrl': serializer.toJson<String>(githubUrl),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CachedRepository copyWith({
    int? id,
    String? name,
    String? owner,
    String? description,
    int? stars,
    int? forks,
    int? openIssues,
    Value<String?> language = const Value.absent(),
    String? githubUrl,
    DateTime? updatedAt,
  }) => CachedRepository(
    id: id ?? this.id,
    name: name ?? this.name,
    owner: owner ?? this.owner,
    description: description ?? this.description,
    stars: stars ?? this.stars,
    forks: forks ?? this.forks,
    openIssues: openIssues ?? this.openIssues,
    language: language.present ? language.value : this.language,
    githubUrl: githubUrl ?? this.githubUrl,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  CachedRepository copyWithCompanion(CachedRepositoriesCompanion data) {
    return CachedRepository(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      owner: data.owner.present ? data.owner.value : this.owner,
      description: data.description.present
          ? data.description.value
          : this.description,
      stars: data.stars.present ? data.stars.value : this.stars,
      forks: data.forks.present ? data.forks.value : this.forks,
      openIssues: data.openIssues.present
          ? data.openIssues.value
          : this.openIssues,
      language: data.language.present ? data.language.value : this.language,
      githubUrl: data.githubUrl.present ? data.githubUrl.value : this.githubUrl,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedRepository(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('owner: $owner, ')
          ..write('description: $description, ')
          ..write('stars: $stars, ')
          ..write('forks: $forks, ')
          ..write('openIssues: $openIssues, ')
          ..write('language: $language, ')
          ..write('githubUrl: $githubUrl, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    owner,
    description,
    stars,
    forks,
    openIssues,
    language,
    githubUrl,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedRepository &&
          other.id == this.id &&
          other.name == this.name &&
          other.owner == this.owner &&
          other.description == this.description &&
          other.stars == this.stars &&
          other.forks == this.forks &&
          other.openIssues == this.openIssues &&
          other.language == this.language &&
          other.githubUrl == this.githubUrl &&
          other.updatedAt == this.updatedAt);
}

class CachedRepositoriesCompanion extends UpdateCompanion<CachedRepository> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> owner;
  final Value<String> description;
  final Value<int> stars;
  final Value<int> forks;
  final Value<int> openIssues;
  final Value<String?> language;
  final Value<String> githubUrl;
  final Value<DateTime> updatedAt;
  const CachedRepositoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.owner = const Value.absent(),
    this.description = const Value.absent(),
    this.stars = const Value.absent(),
    this.forks = const Value.absent(),
    this.openIssues = const Value.absent(),
    this.language = const Value.absent(),
    this.githubUrl = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  CachedRepositoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String owner,
    required String description,
    required int stars,
    required int forks,
    required int openIssues,
    this.language = const Value.absent(),
    required String githubUrl,
    required DateTime updatedAt,
  }) : name = Value(name),
       owner = Value(owner),
       description = Value(description),
       stars = Value(stars),
       forks = Value(forks),
       openIssues = Value(openIssues),
       githubUrl = Value(githubUrl),
       updatedAt = Value(updatedAt);
  static Insertable<CachedRepository> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? owner,
    Expression<String>? description,
    Expression<int>? stars,
    Expression<int>? forks,
    Expression<int>? openIssues,
    Expression<String>? language,
    Expression<String>? githubUrl,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (owner != null) 'owner': owner,
      if (description != null) 'description': description,
      if (stars != null) 'stars': stars,
      if (forks != null) 'forks': forks,
      if (openIssues != null) 'open_issues': openIssues,
      if (language != null) 'language': language,
      if (githubUrl != null) 'github_url': githubUrl,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  CachedRepositoriesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? owner,
    Value<String>? description,
    Value<int>? stars,
    Value<int>? forks,
    Value<int>? openIssues,
    Value<String?>? language,
    Value<String>? githubUrl,
    Value<DateTime>? updatedAt,
  }) {
    return CachedRepositoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      owner: owner ?? this.owner,
      description: description ?? this.description,
      stars: stars ?? this.stars,
      forks: forks ?? this.forks,
      openIssues: openIssues ?? this.openIssues,
      language: language ?? this.language,
      githubUrl: githubUrl ?? this.githubUrl,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (owner.present) {
      map['owner'] = Variable<String>(owner.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (stars.present) {
      map['stars'] = Variable<int>(stars.value);
    }
    if (forks.present) {
      map['forks'] = Variable<int>(forks.value);
    }
    if (openIssues.present) {
      map['open_issues'] = Variable<int>(openIssues.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (githubUrl.present) {
      map['github_url'] = Variable<String>(githubUrl.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedRepositoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('owner: $owner, ')
          ..write('description: $description, ')
          ..write('stars: $stars, ')
          ..write('forks: $forks, ')
          ..write('openIssues: $openIssues, ')
          ..write('language: $language, ')
          ..write('githubUrl: $githubUrl, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $SearchPagesTable extends SearchPages
    with TableInfo<$SearchPagesTable, SearchPage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SearchPagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _queryMeta = const VerificationMeta('query');
  @override
  late final GeneratedColumn<String> query = GeneratedColumn<String>(
    'query',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pageMeta = const VerificationMeta('page');
  @override
  late final GeneratedColumn<int> page = GeneratedColumn<int>(
    'page',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hasNextPageMeta = const VerificationMeta(
    'hasNextPage',
  );
  @override
  late final GeneratedColumn<bool> hasNextPage = GeneratedColumn<bool>(
    'has_next_page',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("has_next_page" IN (0, 1))',
    ),
  );
  static const VerificationMeta _fetchedAtMeta = const VerificationMeta(
    'fetchedAt',
  );
  @override
  late final GeneratedColumn<DateTime> fetchedAt = GeneratedColumn<DateTime>(
    'fetched_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [query, page, hasNextPage, fetchedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'search_pages';
  @override
  VerificationContext validateIntegrity(
    Insertable<SearchPage> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('query')) {
      context.handle(
        _queryMeta,
        query.isAcceptableOrUnknown(data['query']!, _queryMeta),
      );
    } else if (isInserting) {
      context.missing(_queryMeta);
    }
    if (data.containsKey('page')) {
      context.handle(
        _pageMeta,
        page.isAcceptableOrUnknown(data['page']!, _pageMeta),
      );
    } else if (isInserting) {
      context.missing(_pageMeta);
    }
    if (data.containsKey('has_next_page')) {
      context.handle(
        _hasNextPageMeta,
        hasNextPage.isAcceptableOrUnknown(
          data['has_next_page']!,
          _hasNextPageMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_hasNextPageMeta);
    }
    if (data.containsKey('fetched_at')) {
      context.handle(
        _fetchedAtMeta,
        fetchedAt.isAcceptableOrUnknown(data['fetched_at']!, _fetchedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_fetchedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {query, page};
  @override
  SearchPage map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SearchPage(
      query: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}query'],
      )!,
      page: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}page'],
      )!,
      hasNextPage: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}has_next_page'],
      )!,
      fetchedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fetched_at'],
      )!,
    );
  }

  @override
  $SearchPagesTable createAlias(String alias) {
    return $SearchPagesTable(attachedDatabase, alias);
  }
}

class SearchPage extends DataClass implements Insertable<SearchPage> {
  final String query;
  final int page;
  final bool hasNextPage;
  final DateTime fetchedAt;
  const SearchPage({
    required this.query,
    required this.page,
    required this.hasNextPage,
    required this.fetchedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['query'] = Variable<String>(query);
    map['page'] = Variable<int>(page);
    map['has_next_page'] = Variable<bool>(hasNextPage);
    map['fetched_at'] = Variable<DateTime>(fetchedAt);
    return map;
  }

  SearchPagesCompanion toCompanion(bool nullToAbsent) {
    return SearchPagesCompanion(
      query: Value(query),
      page: Value(page),
      hasNextPage: Value(hasNextPage),
      fetchedAt: Value(fetchedAt),
    );
  }

  factory SearchPage.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SearchPage(
      query: serializer.fromJson<String>(json['query']),
      page: serializer.fromJson<int>(json['page']),
      hasNextPage: serializer.fromJson<bool>(json['hasNextPage']),
      fetchedAt: serializer.fromJson<DateTime>(json['fetchedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'query': serializer.toJson<String>(query),
      'page': serializer.toJson<int>(page),
      'hasNextPage': serializer.toJson<bool>(hasNextPage),
      'fetchedAt': serializer.toJson<DateTime>(fetchedAt),
    };
  }

  SearchPage copyWith({
    String? query,
    int? page,
    bool? hasNextPage,
    DateTime? fetchedAt,
  }) => SearchPage(
    query: query ?? this.query,
    page: page ?? this.page,
    hasNextPage: hasNextPage ?? this.hasNextPage,
    fetchedAt: fetchedAt ?? this.fetchedAt,
  );
  SearchPage copyWithCompanion(SearchPagesCompanion data) {
    return SearchPage(
      query: data.query.present ? data.query.value : this.query,
      page: data.page.present ? data.page.value : this.page,
      hasNextPage: data.hasNextPage.present
          ? data.hasNextPage.value
          : this.hasNextPage,
      fetchedAt: data.fetchedAt.present ? data.fetchedAt.value : this.fetchedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SearchPage(')
          ..write('query: $query, ')
          ..write('page: $page, ')
          ..write('hasNextPage: $hasNextPage, ')
          ..write('fetchedAt: $fetchedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(query, page, hasNextPage, fetchedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SearchPage &&
          other.query == this.query &&
          other.page == this.page &&
          other.hasNextPage == this.hasNextPage &&
          other.fetchedAt == this.fetchedAt);
}

class SearchPagesCompanion extends UpdateCompanion<SearchPage> {
  final Value<String> query;
  final Value<int> page;
  final Value<bool> hasNextPage;
  final Value<DateTime> fetchedAt;
  final Value<int> rowid;
  const SearchPagesCompanion({
    this.query = const Value.absent(),
    this.page = const Value.absent(),
    this.hasNextPage = const Value.absent(),
    this.fetchedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SearchPagesCompanion.insert({
    required String query,
    required int page,
    required bool hasNextPage,
    required DateTime fetchedAt,
    this.rowid = const Value.absent(),
  }) : query = Value(query),
       page = Value(page),
       hasNextPage = Value(hasNextPage),
       fetchedAt = Value(fetchedAt);
  static Insertable<SearchPage> custom({
    Expression<String>? query,
    Expression<int>? page,
    Expression<bool>? hasNextPage,
    Expression<DateTime>? fetchedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (query != null) 'query': query,
      if (page != null) 'page': page,
      if (hasNextPage != null) 'has_next_page': hasNextPage,
      if (fetchedAt != null) 'fetched_at': fetchedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SearchPagesCompanion copyWith({
    Value<String>? query,
    Value<int>? page,
    Value<bool>? hasNextPage,
    Value<DateTime>? fetchedAt,
    Value<int>? rowid,
  }) {
    return SearchPagesCompanion(
      query: query ?? this.query,
      page: page ?? this.page,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      fetchedAt: fetchedAt ?? this.fetchedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (query.present) {
      map['query'] = Variable<String>(query.value);
    }
    if (page.present) {
      map['page'] = Variable<int>(page.value);
    }
    if (hasNextPage.present) {
      map['has_next_page'] = Variable<bool>(hasNextPage.value);
    }
    if (fetchedAt.present) {
      map['fetched_at'] = Variable<DateTime>(fetchedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SearchPagesCompanion(')
          ..write('query: $query, ')
          ..write('page: $page, ')
          ..write('hasNextPage: $hasNextPage, ')
          ..write('fetchedAt: $fetchedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SearchPageItemsTable extends SearchPageItems
    with TableInfo<$SearchPageItemsTable, SearchPageItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SearchPageItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _queryMeta = const VerificationMeta('query');
  @override
  late final GeneratedColumn<String> query = GeneratedColumn<String>(
    'query',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pageMeta = const VerificationMeta('page');
  @override
  late final GeneratedColumn<int> page = GeneratedColumn<int>(
    'page',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _repositoryIdMeta = const VerificationMeta(
    'repositoryId',
  );
  @override
  late final GeneratedColumn<int> repositoryId = GeneratedColumn<int>(
    'repository_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cached_repositories (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
    'position',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [query, page, repositoryId, position];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'search_page_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<SearchPageItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('query')) {
      context.handle(
        _queryMeta,
        query.isAcceptableOrUnknown(data['query']!, _queryMeta),
      );
    } else if (isInserting) {
      context.missing(_queryMeta);
    }
    if (data.containsKey('page')) {
      context.handle(
        _pageMeta,
        page.isAcceptableOrUnknown(data['page']!, _pageMeta),
      );
    } else if (isInserting) {
      context.missing(_pageMeta);
    }
    if (data.containsKey('repository_id')) {
      context.handle(
        _repositoryIdMeta,
        repositoryId.isAcceptableOrUnknown(
          data['repository_id']!,
          _repositoryIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_repositoryIdMeta);
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {query, page, repositoryId};
  @override
  SearchPageItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SearchPageItem(
      query: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}query'],
      )!,
      page: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}page'],
      )!,
      repositoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}repository_id'],
      )!,
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}position'],
      )!,
    );
  }

  @override
  $SearchPageItemsTable createAlias(String alias) {
    return $SearchPageItemsTable(attachedDatabase, alias);
  }
}

class SearchPageItem extends DataClass implements Insertable<SearchPageItem> {
  final String query;
  final int page;
  final int repositoryId;
  final int position;
  const SearchPageItem({
    required this.query,
    required this.page,
    required this.repositoryId,
    required this.position,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['query'] = Variable<String>(query);
    map['page'] = Variable<int>(page);
    map['repository_id'] = Variable<int>(repositoryId);
    map['position'] = Variable<int>(position);
    return map;
  }

  SearchPageItemsCompanion toCompanion(bool nullToAbsent) {
    return SearchPageItemsCompanion(
      query: Value(query),
      page: Value(page),
      repositoryId: Value(repositoryId),
      position: Value(position),
    );
  }

  factory SearchPageItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SearchPageItem(
      query: serializer.fromJson<String>(json['query']),
      page: serializer.fromJson<int>(json['page']),
      repositoryId: serializer.fromJson<int>(json['repositoryId']),
      position: serializer.fromJson<int>(json['position']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'query': serializer.toJson<String>(query),
      'page': serializer.toJson<int>(page),
      'repositoryId': serializer.toJson<int>(repositoryId),
      'position': serializer.toJson<int>(position),
    };
  }

  SearchPageItem copyWith({
    String? query,
    int? page,
    int? repositoryId,
    int? position,
  }) => SearchPageItem(
    query: query ?? this.query,
    page: page ?? this.page,
    repositoryId: repositoryId ?? this.repositoryId,
    position: position ?? this.position,
  );
  SearchPageItem copyWithCompanion(SearchPageItemsCompanion data) {
    return SearchPageItem(
      query: data.query.present ? data.query.value : this.query,
      page: data.page.present ? data.page.value : this.page,
      repositoryId: data.repositoryId.present
          ? data.repositoryId.value
          : this.repositoryId,
      position: data.position.present ? data.position.value : this.position,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SearchPageItem(')
          ..write('query: $query, ')
          ..write('page: $page, ')
          ..write('repositoryId: $repositoryId, ')
          ..write('position: $position')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(query, page, repositoryId, position);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SearchPageItem &&
          other.query == this.query &&
          other.page == this.page &&
          other.repositoryId == this.repositoryId &&
          other.position == this.position);
}

class SearchPageItemsCompanion extends UpdateCompanion<SearchPageItem> {
  final Value<String> query;
  final Value<int> page;
  final Value<int> repositoryId;
  final Value<int> position;
  final Value<int> rowid;
  const SearchPageItemsCompanion({
    this.query = const Value.absent(),
    this.page = const Value.absent(),
    this.repositoryId = const Value.absent(),
    this.position = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SearchPageItemsCompanion.insert({
    required String query,
    required int page,
    required int repositoryId,
    required int position,
    this.rowid = const Value.absent(),
  }) : query = Value(query),
       page = Value(page),
       repositoryId = Value(repositoryId),
       position = Value(position);
  static Insertable<SearchPageItem> custom({
    Expression<String>? query,
    Expression<int>? page,
    Expression<int>? repositoryId,
    Expression<int>? position,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (query != null) 'query': query,
      if (page != null) 'page': page,
      if (repositoryId != null) 'repository_id': repositoryId,
      if (position != null) 'position': position,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SearchPageItemsCompanion copyWith({
    Value<String>? query,
    Value<int>? page,
    Value<int>? repositoryId,
    Value<int>? position,
    Value<int>? rowid,
  }) {
    return SearchPageItemsCompanion(
      query: query ?? this.query,
      page: page ?? this.page,
      repositoryId: repositoryId ?? this.repositoryId,
      position: position ?? this.position,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (query.present) {
      map['query'] = Variable<String>(query.value);
    }
    if (page.present) {
      map['page'] = Variable<int>(page.value);
    }
    if (repositoryId.present) {
      map['repository_id'] = Variable<int>(repositoryId.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SearchPageItemsCompanion(')
          ..write('query: $query, ')
          ..write('page: $page, ')
          ..write('repositoryId: $repositoryId, ')
          ..write('position: $position, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FavoriteRepositoriesTable extends FavoriteRepositories
    with TableInfo<$FavoriteRepositoriesTable, FavoriteRepository> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteRepositoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _repositoryIdMeta = const VerificationMeta(
    'repositoryId',
  );
  @override
  late final GeneratedColumn<int> repositoryId = GeneratedColumn<int>(
    'repository_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cached_repositories (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _favoritedAtMeta = const VerificationMeta(
    'favoritedAt',
  );
  @override
  late final GeneratedColumn<DateTime> favoritedAt = GeneratedColumn<DateTime>(
    'favorited_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [repositoryId, favoritedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_repositories';
  @override
  VerificationContext validateIntegrity(
    Insertable<FavoriteRepository> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('repository_id')) {
      context.handle(
        _repositoryIdMeta,
        repositoryId.isAcceptableOrUnknown(
          data['repository_id']!,
          _repositoryIdMeta,
        ),
      );
    }
    if (data.containsKey('favorited_at')) {
      context.handle(
        _favoritedAtMeta,
        favoritedAt.isAcceptableOrUnknown(
          data['favorited_at']!,
          _favoritedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_favoritedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {repositoryId};
  @override
  FavoriteRepository map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteRepository(
      repositoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}repository_id'],
      )!,
      favoritedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}favorited_at'],
      )!,
    );
  }

  @override
  $FavoriteRepositoriesTable createAlias(String alias) {
    return $FavoriteRepositoriesTable(attachedDatabase, alias);
  }
}

class FavoriteRepository extends DataClass
    implements Insertable<FavoriteRepository> {
  final int repositoryId;
  final DateTime favoritedAt;
  const FavoriteRepository({
    required this.repositoryId,
    required this.favoritedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['repository_id'] = Variable<int>(repositoryId);
    map['favorited_at'] = Variable<DateTime>(favoritedAt);
    return map;
  }

  FavoriteRepositoriesCompanion toCompanion(bool nullToAbsent) {
    return FavoriteRepositoriesCompanion(
      repositoryId: Value(repositoryId),
      favoritedAt: Value(favoritedAt),
    );
  }

  factory FavoriteRepository.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteRepository(
      repositoryId: serializer.fromJson<int>(json['repositoryId']),
      favoritedAt: serializer.fromJson<DateTime>(json['favoritedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'repositoryId': serializer.toJson<int>(repositoryId),
      'favoritedAt': serializer.toJson<DateTime>(favoritedAt),
    };
  }

  FavoriteRepository copyWith({int? repositoryId, DateTime? favoritedAt}) =>
      FavoriteRepository(
        repositoryId: repositoryId ?? this.repositoryId,
        favoritedAt: favoritedAt ?? this.favoritedAt,
      );
  FavoriteRepository copyWithCompanion(FavoriteRepositoriesCompanion data) {
    return FavoriteRepository(
      repositoryId: data.repositoryId.present
          ? data.repositoryId.value
          : this.repositoryId,
      favoritedAt: data.favoritedAt.present
          ? data.favoritedAt.value
          : this.favoritedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteRepository(')
          ..write('repositoryId: $repositoryId, ')
          ..write('favoritedAt: $favoritedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(repositoryId, favoritedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteRepository &&
          other.repositoryId == this.repositoryId &&
          other.favoritedAt == this.favoritedAt);
}

class FavoriteRepositoriesCompanion
    extends UpdateCompanion<FavoriteRepository> {
  final Value<int> repositoryId;
  final Value<DateTime> favoritedAt;
  const FavoriteRepositoriesCompanion({
    this.repositoryId = const Value.absent(),
    this.favoritedAt = const Value.absent(),
  });
  FavoriteRepositoriesCompanion.insert({
    this.repositoryId = const Value.absent(),
    required DateTime favoritedAt,
  }) : favoritedAt = Value(favoritedAt);
  static Insertable<FavoriteRepository> custom({
    Expression<int>? repositoryId,
    Expression<DateTime>? favoritedAt,
  }) {
    return RawValuesInsertable({
      if (repositoryId != null) 'repository_id': repositoryId,
      if (favoritedAt != null) 'favorited_at': favoritedAt,
    });
  }

  FavoriteRepositoriesCompanion copyWith({
    Value<int>? repositoryId,
    Value<DateTime>? favoritedAt,
  }) {
    return FavoriteRepositoriesCompanion(
      repositoryId: repositoryId ?? this.repositoryId,
      favoritedAt: favoritedAt ?? this.favoritedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (repositoryId.present) {
      map['repository_id'] = Variable<int>(repositoryId.value);
    }
    if (favoritedAt.present) {
      map['favorited_at'] = Variable<DateTime>(favoritedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteRepositoriesCompanion(')
          ..write('repositoryId: $repositoryId, ')
          ..write('favoritedAt: $favoritedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CachedRepositoriesTable cachedRepositories =
      $CachedRepositoriesTable(this);
  late final $SearchPagesTable searchPages = $SearchPagesTable(this);
  late final $SearchPageItemsTable searchPageItems = $SearchPageItemsTable(
    this,
  );
  late final $FavoriteRepositoriesTable favoriteRepositories =
      $FavoriteRepositoriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    cachedRepositories,
    searchPages,
    searchPageItems,
    favoriteRepositories,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'cached_repositories',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('search_page_items', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'cached_repositories',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('favorite_repositories', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$CachedRepositoriesTableCreateCompanionBuilder =
    CachedRepositoriesCompanion Function({
      Value<int> id,
      required String name,
      required String owner,
      required String description,
      required int stars,
      required int forks,
      required int openIssues,
      Value<String?> language,
      required String githubUrl,
      required DateTime updatedAt,
    });
typedef $$CachedRepositoriesTableUpdateCompanionBuilder =
    CachedRepositoriesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> owner,
      Value<String> description,
      Value<int> stars,
      Value<int> forks,
      Value<int> openIssues,
      Value<String?> language,
      Value<String> githubUrl,
      Value<DateTime> updatedAt,
    });

final class $$CachedRepositoriesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CachedRepositoriesTable,
          CachedRepository
        > {
  $$CachedRepositoriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$SearchPageItemsTable, List<SearchPageItem>>
  _searchPageItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.searchPageItems,
    aliasName: 'cached_repositories__id__search_page_items__repository_id',
  );

  $$SearchPageItemsTableProcessedTableManager get searchPageItemsRefs {
    final manager = $$SearchPageItemsTableTableManager(
      $_db,
      $_db.searchPageItems,
    ).filter((f) => f.repositoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _searchPageItemsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $FavoriteRepositoriesTable,
    List<FavoriteRepository>
  >
  _favoriteRepositoriesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.favoriteRepositories,
        aliasName:
            'cached_repositories__id__favorite_repositories__repository_id',
      );

  $$FavoriteRepositoriesTableProcessedTableManager
  get favoriteRepositoriesRefs {
    final manager = $$FavoriteRepositoriesTableTableManager(
      $_db,
      $_db.favoriteRepositories,
    ).filter((f) => f.repositoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _favoriteRepositoriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CachedRepositoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CachedRepositoriesTable> {
  $$CachedRepositoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get owner => $composableBuilder(
    column: $table.owner,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stars => $composableBuilder(
    column: $table.stars,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get forks => $composableBuilder(
    column: $table.forks,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get openIssues => $composableBuilder(
    column: $table.openIssues,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get githubUrl => $composableBuilder(
    column: $table.githubUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> searchPageItemsRefs(
    Expression<bool> Function($$SearchPageItemsTableFilterComposer f) f,
  ) {
    final $$SearchPageItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.searchPageItems,
      getReferencedColumn: (t) => t.repositoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SearchPageItemsTableFilterComposer(
            $db: $db,
            $table: $db.searchPageItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> favoriteRepositoriesRefs(
    Expression<bool> Function($$FavoriteRepositoriesTableFilterComposer f) f,
  ) {
    final $$FavoriteRepositoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.favoriteRepositories,
      getReferencedColumn: (t) => t.repositoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FavoriteRepositoriesTableFilterComposer(
            $db: $db,
            $table: $db.favoriteRepositories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CachedRepositoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedRepositoriesTable> {
  $$CachedRepositoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get owner => $composableBuilder(
    column: $table.owner,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stars => $composableBuilder(
    column: $table.stars,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get forks => $composableBuilder(
    column: $table.forks,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get openIssues => $composableBuilder(
    column: $table.openIssues,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get githubUrl => $composableBuilder(
    column: $table.githubUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedRepositoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedRepositoriesTable> {
  $$CachedRepositoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get owner =>
      $composableBuilder(column: $table.owner, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get stars =>
      $composableBuilder(column: $table.stars, builder: (column) => column);

  GeneratedColumn<int> get forks =>
      $composableBuilder(column: $table.forks, builder: (column) => column);

  GeneratedColumn<int> get openIssues => $composableBuilder(
    column: $table.openIssues,
    builder: (column) => column,
  );

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<String> get githubUrl =>
      $composableBuilder(column: $table.githubUrl, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> searchPageItemsRefs<T extends Object>(
    Expression<T> Function($$SearchPageItemsTableAnnotationComposer a) f,
  ) {
    final $$SearchPageItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.searchPageItems,
      getReferencedColumn: (t) => t.repositoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SearchPageItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.searchPageItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> favoriteRepositoriesRefs<T extends Object>(
    Expression<T> Function($$FavoriteRepositoriesTableAnnotationComposer a) f,
  ) {
    final $$FavoriteRepositoriesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.favoriteRepositories,
          getReferencedColumn: (t) => t.repositoryId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$FavoriteRepositoriesTableAnnotationComposer(
                $db: $db,
                $table: $db.favoriteRepositories,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$CachedRepositoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedRepositoriesTable,
          CachedRepository,
          $$CachedRepositoriesTableFilterComposer,
          $$CachedRepositoriesTableOrderingComposer,
          $$CachedRepositoriesTableAnnotationComposer,
          $$CachedRepositoriesTableCreateCompanionBuilder,
          $$CachedRepositoriesTableUpdateCompanionBuilder,
          (CachedRepository, $$CachedRepositoriesTableReferences),
          CachedRepository,
          PrefetchHooks Function({
            bool searchPageItemsRefs,
            bool favoriteRepositoriesRefs,
          })
        > {
  $$CachedRepositoriesTableTableManager(
    _$AppDatabase db,
    $CachedRepositoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedRepositoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedRepositoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedRepositoriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> owner = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int> stars = const Value.absent(),
                Value<int> forks = const Value.absent(),
                Value<int> openIssues = const Value.absent(),
                Value<String?> language = const Value.absent(),
                Value<String> githubUrl = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => CachedRepositoriesCompanion(
                id: id,
                name: name,
                owner: owner,
                description: description,
                stars: stars,
                forks: forks,
                openIssues: openIssues,
                language: language,
                githubUrl: githubUrl,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String owner,
                required String description,
                required int stars,
                required int forks,
                required int openIssues,
                Value<String?> language = const Value.absent(),
                required String githubUrl,
                required DateTime updatedAt,
              }) => CachedRepositoriesCompanion.insert(
                id: id,
                name: name,
                owner: owner,
                description: description,
                stars: stars,
                forks: forks,
                openIssues: openIssues,
                language: language,
                githubUrl: githubUrl,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CachedRepositoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                searchPageItemsRefs = false,
                favoriteRepositoriesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (searchPageItemsRefs) db.searchPageItems,
                    if (favoriteRepositoriesRefs) db.favoriteRepositories,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (searchPageItemsRefs)
                        await $_getPrefetchedData<
                          CachedRepository,
                          $CachedRepositoriesTable,
                          SearchPageItem
                        >(
                          currentTable: table,
                          referencedTable: $$CachedRepositoriesTableReferences
                              ._searchPageItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CachedRepositoriesTableReferences(
                                db,
                                table,
                                p0,
                              ).searchPageItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.repositoryId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (favoriteRepositoriesRefs)
                        await $_getPrefetchedData<
                          CachedRepository,
                          $CachedRepositoriesTable,
                          FavoriteRepository
                        >(
                          currentTable: table,
                          referencedTable: $$CachedRepositoriesTableReferences
                              ._favoriteRepositoriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CachedRepositoriesTableReferences(
                                db,
                                table,
                                p0,
                              ).favoriteRepositoriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.repositoryId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CachedRepositoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedRepositoriesTable,
      CachedRepository,
      $$CachedRepositoriesTableFilterComposer,
      $$CachedRepositoriesTableOrderingComposer,
      $$CachedRepositoriesTableAnnotationComposer,
      $$CachedRepositoriesTableCreateCompanionBuilder,
      $$CachedRepositoriesTableUpdateCompanionBuilder,
      (CachedRepository, $$CachedRepositoriesTableReferences),
      CachedRepository,
      PrefetchHooks Function({
        bool searchPageItemsRefs,
        bool favoriteRepositoriesRefs,
      })
    >;
typedef $$SearchPagesTableCreateCompanionBuilder =
    SearchPagesCompanion Function({
      required String query,
      required int page,
      required bool hasNextPage,
      required DateTime fetchedAt,
      Value<int> rowid,
    });
typedef $$SearchPagesTableUpdateCompanionBuilder =
    SearchPagesCompanion Function({
      Value<String> query,
      Value<int> page,
      Value<bool> hasNextPage,
      Value<DateTime> fetchedAt,
      Value<int> rowid,
    });

class $$SearchPagesTableFilterComposer
    extends Composer<_$AppDatabase, $SearchPagesTable> {
  $$SearchPagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get query => $composableBuilder(
    column: $table.query,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get page => $composableBuilder(
    column: $table.page,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hasNextPage => $composableBuilder(
    column: $table.hasNextPage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fetchedAt => $composableBuilder(
    column: $table.fetchedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SearchPagesTableOrderingComposer
    extends Composer<_$AppDatabase, $SearchPagesTable> {
  $$SearchPagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get query => $composableBuilder(
    column: $table.query,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get page => $composableBuilder(
    column: $table.page,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hasNextPage => $composableBuilder(
    column: $table.hasNextPage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fetchedAt => $composableBuilder(
    column: $table.fetchedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SearchPagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SearchPagesTable> {
  $$SearchPagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get query =>
      $composableBuilder(column: $table.query, builder: (column) => column);

  GeneratedColumn<int> get page =>
      $composableBuilder(column: $table.page, builder: (column) => column);

  GeneratedColumn<bool> get hasNextPage => $composableBuilder(
    column: $table.hasNextPage,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get fetchedAt =>
      $composableBuilder(column: $table.fetchedAt, builder: (column) => column);
}

class $$SearchPagesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SearchPagesTable,
          SearchPage,
          $$SearchPagesTableFilterComposer,
          $$SearchPagesTableOrderingComposer,
          $$SearchPagesTableAnnotationComposer,
          $$SearchPagesTableCreateCompanionBuilder,
          $$SearchPagesTableUpdateCompanionBuilder,
          (
            SearchPage,
            BaseReferences<_$AppDatabase, $SearchPagesTable, SearchPage>,
          ),
          SearchPage,
          PrefetchHooks Function()
        > {
  $$SearchPagesTableTableManager(_$AppDatabase db, $SearchPagesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SearchPagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SearchPagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SearchPagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> query = const Value.absent(),
                Value<int> page = const Value.absent(),
                Value<bool> hasNextPage = const Value.absent(),
                Value<DateTime> fetchedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SearchPagesCompanion(
                query: query,
                page: page,
                hasNextPage: hasNextPage,
                fetchedAt: fetchedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String query,
                required int page,
                required bool hasNextPage,
                required DateTime fetchedAt,
                Value<int> rowid = const Value.absent(),
              }) => SearchPagesCompanion.insert(
                query: query,
                page: page,
                hasNextPage: hasNextPage,
                fetchedAt: fetchedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SearchPagesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SearchPagesTable,
      SearchPage,
      $$SearchPagesTableFilterComposer,
      $$SearchPagesTableOrderingComposer,
      $$SearchPagesTableAnnotationComposer,
      $$SearchPagesTableCreateCompanionBuilder,
      $$SearchPagesTableUpdateCompanionBuilder,
      (
        SearchPage,
        BaseReferences<_$AppDatabase, $SearchPagesTable, SearchPage>,
      ),
      SearchPage,
      PrefetchHooks Function()
    >;
typedef $$SearchPageItemsTableCreateCompanionBuilder =
    SearchPageItemsCompanion Function({
      required String query,
      required int page,
      required int repositoryId,
      required int position,
      Value<int> rowid,
    });
typedef $$SearchPageItemsTableUpdateCompanionBuilder =
    SearchPageItemsCompanion Function({
      Value<String> query,
      Value<int> page,
      Value<int> repositoryId,
      Value<int> position,
      Value<int> rowid,
    });

final class $$SearchPageItemsTableReferences
    extends
        BaseReferences<_$AppDatabase, $SearchPageItemsTable, SearchPageItem> {
  $$SearchPageItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CachedRepositoriesTable _repositoryIdTable(_$AppDatabase db) => db
      .cachedRepositories
      .createAlias('search_page_items__repository_id__cached_repositories__id');

  $$CachedRepositoriesTableProcessedTableManager get repositoryId {
    final $_column = $_itemColumn<int>('repository_id')!;

    final manager = $$CachedRepositoriesTableTableManager(
      $_db,
      $_db.cachedRepositories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_repositoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SearchPageItemsTableFilterComposer
    extends Composer<_$AppDatabase, $SearchPageItemsTable> {
  $$SearchPageItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get query => $composableBuilder(
    column: $table.query,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get page => $composableBuilder(
    column: $table.page,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );

  $$CachedRepositoriesTableFilterComposer get repositoryId {
    final $$CachedRepositoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.repositoryId,
      referencedTable: $db.cachedRepositories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedRepositoriesTableFilterComposer(
            $db: $db,
            $table: $db.cachedRepositories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SearchPageItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $SearchPageItemsTable> {
  $$SearchPageItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get query => $composableBuilder(
    column: $table.query,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get page => $composableBuilder(
    column: $table.page,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );

  $$CachedRepositoriesTableOrderingComposer get repositoryId {
    final $$CachedRepositoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.repositoryId,
      referencedTable: $db.cachedRepositories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedRepositoriesTableOrderingComposer(
            $db: $db,
            $table: $db.cachedRepositories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SearchPageItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SearchPageItemsTable> {
  $$SearchPageItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get query =>
      $composableBuilder(column: $table.query, builder: (column) => column);

  GeneratedColumn<int> get page =>
      $composableBuilder(column: $table.page, builder: (column) => column);

  GeneratedColumn<int> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  $$CachedRepositoriesTableAnnotationComposer get repositoryId {
    final $$CachedRepositoriesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.repositoryId,
          referencedTable: $db.cachedRepositories,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CachedRepositoriesTableAnnotationComposer(
                $db: $db,
                $table: $db.cachedRepositories,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$SearchPageItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SearchPageItemsTable,
          SearchPageItem,
          $$SearchPageItemsTableFilterComposer,
          $$SearchPageItemsTableOrderingComposer,
          $$SearchPageItemsTableAnnotationComposer,
          $$SearchPageItemsTableCreateCompanionBuilder,
          $$SearchPageItemsTableUpdateCompanionBuilder,
          (SearchPageItem, $$SearchPageItemsTableReferences),
          SearchPageItem,
          PrefetchHooks Function({bool repositoryId})
        > {
  $$SearchPageItemsTableTableManager(
    _$AppDatabase db,
    $SearchPageItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SearchPageItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SearchPageItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SearchPageItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> query = const Value.absent(),
                Value<int> page = const Value.absent(),
                Value<int> repositoryId = const Value.absent(),
                Value<int> position = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SearchPageItemsCompanion(
                query: query,
                page: page,
                repositoryId: repositoryId,
                position: position,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String query,
                required int page,
                required int repositoryId,
                required int position,
                Value<int> rowid = const Value.absent(),
              }) => SearchPageItemsCompanion.insert(
                query: query,
                page: page,
                repositoryId: repositoryId,
                position: position,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SearchPageItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({repositoryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (repositoryId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.repositoryId,
                                referencedTable:
                                    $$SearchPageItemsTableReferences
                                        ._repositoryIdTable(db),
                                referencedColumn:
                                    $$SearchPageItemsTableReferences
                                        ._repositoryIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SearchPageItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SearchPageItemsTable,
      SearchPageItem,
      $$SearchPageItemsTableFilterComposer,
      $$SearchPageItemsTableOrderingComposer,
      $$SearchPageItemsTableAnnotationComposer,
      $$SearchPageItemsTableCreateCompanionBuilder,
      $$SearchPageItemsTableUpdateCompanionBuilder,
      (SearchPageItem, $$SearchPageItemsTableReferences),
      SearchPageItem,
      PrefetchHooks Function({bool repositoryId})
    >;
typedef $$FavoriteRepositoriesTableCreateCompanionBuilder =
    FavoriteRepositoriesCompanion Function({
      Value<int> repositoryId,
      required DateTime favoritedAt,
    });
typedef $$FavoriteRepositoriesTableUpdateCompanionBuilder =
    FavoriteRepositoriesCompanion Function({
      Value<int> repositoryId,
      Value<DateTime> favoritedAt,
    });

final class $$FavoriteRepositoriesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $FavoriteRepositoriesTable,
          FavoriteRepository
        > {
  $$FavoriteRepositoriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CachedRepositoriesTable _repositoryIdTable(_$AppDatabase db) =>
      db.cachedRepositories.createAlias(
        'favorite_repositories__repository_id__cached_repositories__id',
      );

  $$CachedRepositoriesTableProcessedTableManager get repositoryId {
    final $_column = $_itemColumn<int>('repository_id')!;

    final manager = $$CachedRepositoriesTableTableManager(
      $_db,
      $_db.cachedRepositories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_repositoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$FavoriteRepositoriesTableFilterComposer
    extends Composer<_$AppDatabase, $FavoriteRepositoriesTable> {
  $$FavoriteRepositoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get favoritedAt => $composableBuilder(
    column: $table.favoritedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CachedRepositoriesTableFilterComposer get repositoryId {
    final $$CachedRepositoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.repositoryId,
      referencedTable: $db.cachedRepositories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedRepositoriesTableFilterComposer(
            $db: $db,
            $table: $db.cachedRepositories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FavoriteRepositoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoriteRepositoriesTable> {
  $$FavoriteRepositoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get favoritedAt => $composableBuilder(
    column: $table.favoritedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CachedRepositoriesTableOrderingComposer get repositoryId {
    final $$CachedRepositoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.repositoryId,
      referencedTable: $db.cachedRepositories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedRepositoriesTableOrderingComposer(
            $db: $db,
            $table: $db.cachedRepositories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FavoriteRepositoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoriteRepositoriesTable> {
  $$FavoriteRepositoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get favoritedAt => $composableBuilder(
    column: $table.favoritedAt,
    builder: (column) => column,
  );

  $$CachedRepositoriesTableAnnotationComposer get repositoryId {
    final $$CachedRepositoriesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.repositoryId,
          referencedTable: $db.cachedRepositories,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CachedRepositoriesTableAnnotationComposer(
                $db: $db,
                $table: $db.cachedRepositories,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$FavoriteRepositoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoriteRepositoriesTable,
          FavoriteRepository,
          $$FavoriteRepositoriesTableFilterComposer,
          $$FavoriteRepositoriesTableOrderingComposer,
          $$FavoriteRepositoriesTableAnnotationComposer,
          $$FavoriteRepositoriesTableCreateCompanionBuilder,
          $$FavoriteRepositoriesTableUpdateCompanionBuilder,
          (FavoriteRepository, $$FavoriteRepositoriesTableReferences),
          FavoriteRepository,
          PrefetchHooks Function({bool repositoryId})
        > {
  $$FavoriteRepositoriesTableTableManager(
    _$AppDatabase db,
    $FavoriteRepositoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoriteRepositoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoriteRepositoriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$FavoriteRepositoriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> repositoryId = const Value.absent(),
                Value<DateTime> favoritedAt = const Value.absent(),
              }) => FavoriteRepositoriesCompanion(
                repositoryId: repositoryId,
                favoritedAt: favoritedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> repositoryId = const Value.absent(),
                required DateTime favoritedAt,
              }) => FavoriteRepositoriesCompanion.insert(
                repositoryId: repositoryId,
                favoritedAt: favoritedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FavoriteRepositoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({repositoryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (repositoryId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.repositoryId,
                                referencedTable:
                                    $$FavoriteRepositoriesTableReferences
                                        ._repositoryIdTable(db),
                                referencedColumn:
                                    $$FavoriteRepositoriesTableReferences
                                        ._repositoryIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$FavoriteRepositoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoriteRepositoriesTable,
      FavoriteRepository,
      $$FavoriteRepositoriesTableFilterComposer,
      $$FavoriteRepositoriesTableOrderingComposer,
      $$FavoriteRepositoriesTableAnnotationComposer,
      $$FavoriteRepositoriesTableCreateCompanionBuilder,
      $$FavoriteRepositoriesTableUpdateCompanionBuilder,
      (FavoriteRepository, $$FavoriteRepositoriesTableReferences),
      FavoriteRepository,
      PrefetchHooks Function({bool repositoryId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CachedRepositoriesTableTableManager get cachedRepositories =>
      $$CachedRepositoriesTableTableManager(_db, _db.cachedRepositories);
  $$SearchPagesTableTableManager get searchPages =>
      $$SearchPagesTableTableManager(_db, _db.searchPages);
  $$SearchPageItemsTableTableManager get searchPageItems =>
      $$SearchPageItemsTableTableManager(_db, _db.searchPageItems);
  $$FavoriteRepositoriesTableTableManager get favoriteRepositories =>
      $$FavoriteRepositoriesTableTableManager(_db, _db.favoriteRepositories);
}
