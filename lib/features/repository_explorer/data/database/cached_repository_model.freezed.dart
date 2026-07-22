// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cached_repository_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CachedRepositoryModel {

 int get id; String get name; String get owner; String get description; int get stars; int get forks; int get openIssues; String? get language; String get githubUrl; DateTime get updatedAt;
/// Create a copy of CachedRepositoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CachedRepositoryModelCopyWith<CachedRepositoryModel> get copyWith => _$CachedRepositoryModelCopyWithImpl<CachedRepositoryModel>(this as CachedRepositoryModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CachedRepositoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.description, description) || other.description == description)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.forks, forks) || other.forks == forks)&&(identical(other.openIssues, openIssues) || other.openIssues == openIssues)&&(identical(other.language, language) || other.language == language)&&(identical(other.githubUrl, githubUrl) || other.githubUrl == githubUrl)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,owner,description,stars,forks,openIssues,language,githubUrl,updatedAt);

@override
String toString() {
  return 'CachedRepositoryModel(id: $id, name: $name, owner: $owner, description: $description, stars: $stars, forks: $forks, openIssues: $openIssues, language: $language, githubUrl: $githubUrl, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CachedRepositoryModelCopyWith<$Res>  {
  factory $CachedRepositoryModelCopyWith(CachedRepositoryModel value, $Res Function(CachedRepositoryModel) _then) = _$CachedRepositoryModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String owner, String description, int stars, int forks, int openIssues, String? language, String githubUrl, DateTime updatedAt
});




}
/// @nodoc
class _$CachedRepositoryModelCopyWithImpl<$Res>
    implements $CachedRepositoryModelCopyWith<$Res> {
  _$CachedRepositoryModelCopyWithImpl(this._self, this._then);

  final CachedRepositoryModel _self;
  final $Res Function(CachedRepositoryModel) _then;

/// Create a copy of CachedRepositoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? owner = null,Object? description = null,Object? stars = null,Object? forks = null,Object? openIssues = null,Object? language = freezed,Object? githubUrl = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,forks: null == forks ? _self.forks : forks // ignore: cast_nullable_to_non_nullable
as int,openIssues: null == openIssues ? _self.openIssues : openIssues // ignore: cast_nullable_to_non_nullable
as int,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,githubUrl: null == githubUrl ? _self.githubUrl : githubUrl // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [CachedRepositoryModel].
extension CachedRepositoryModelPatterns on CachedRepositoryModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CachedRepositoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CachedRepositoryModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CachedRepositoryModel value)  $default,){
final _that = this;
switch (_that) {
case _CachedRepositoryModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CachedRepositoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _CachedRepositoryModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String owner,  String description,  int stars,  int forks,  int openIssues,  String? language,  String githubUrl,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CachedRepositoryModel() when $default != null:
return $default(_that.id,_that.name,_that.owner,_that.description,_that.stars,_that.forks,_that.openIssues,_that.language,_that.githubUrl,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String owner,  String description,  int stars,  int forks,  int openIssues,  String? language,  String githubUrl,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CachedRepositoryModel():
return $default(_that.id,_that.name,_that.owner,_that.description,_that.stars,_that.forks,_that.openIssues,_that.language,_that.githubUrl,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String owner,  String description,  int stars,  int forks,  int openIssues,  String? language,  String githubUrl,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CachedRepositoryModel() when $default != null:
return $default(_that.id,_that.name,_that.owner,_that.description,_that.stars,_that.forks,_that.openIssues,_that.language,_that.githubUrl,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _CachedRepositoryModel implements CachedRepositoryModel {
  const _CachedRepositoryModel({required this.id, required this.name, required this.owner, required this.description, required this.stars, required this.forks, required this.openIssues, required this.language, required this.githubUrl, required this.updatedAt});
  

@override final  int id;
@override final  String name;
@override final  String owner;
@override final  String description;
@override final  int stars;
@override final  int forks;
@override final  int openIssues;
@override final  String? language;
@override final  String githubUrl;
@override final  DateTime updatedAt;

/// Create a copy of CachedRepositoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CachedRepositoryModelCopyWith<_CachedRepositoryModel> get copyWith => __$CachedRepositoryModelCopyWithImpl<_CachedRepositoryModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CachedRepositoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.description, description) || other.description == description)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.forks, forks) || other.forks == forks)&&(identical(other.openIssues, openIssues) || other.openIssues == openIssues)&&(identical(other.language, language) || other.language == language)&&(identical(other.githubUrl, githubUrl) || other.githubUrl == githubUrl)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,owner,description,stars,forks,openIssues,language,githubUrl,updatedAt);

@override
String toString() {
  return 'CachedRepositoryModel(id: $id, name: $name, owner: $owner, description: $description, stars: $stars, forks: $forks, openIssues: $openIssues, language: $language, githubUrl: $githubUrl, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CachedRepositoryModelCopyWith<$Res> implements $CachedRepositoryModelCopyWith<$Res> {
  factory _$CachedRepositoryModelCopyWith(_CachedRepositoryModel value, $Res Function(_CachedRepositoryModel) _then) = __$CachedRepositoryModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String owner, String description, int stars, int forks, int openIssues, String? language, String githubUrl, DateTime updatedAt
});




}
/// @nodoc
class __$CachedRepositoryModelCopyWithImpl<$Res>
    implements _$CachedRepositoryModelCopyWith<$Res> {
  __$CachedRepositoryModelCopyWithImpl(this._self, this._then);

  final _CachedRepositoryModel _self;
  final $Res Function(_CachedRepositoryModel) _then;

/// Create a copy of CachedRepositoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? owner = null,Object? description = null,Object? stars = null,Object? forks = null,Object? openIssues = null,Object? language = freezed,Object? githubUrl = null,Object? updatedAt = null,}) {
  return _then(_CachedRepositoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,forks: null == forks ? _self.forks : forks // ignore: cast_nullable_to_non_nullable
as int,openIssues: null == openIssues ? _self.openIssues : openIssues // ignore: cast_nullable_to_non_nullable
as int,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,githubUrl: null == githubUrl ? _self.githubUrl : githubUrl // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$CachedRepositoryPage {

 List<CachedRepositoryModel> get repositories; int get page; bool get hasNextPage; DateTime get fetchedAt;
/// Create a copy of CachedRepositoryPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CachedRepositoryPageCopyWith<CachedRepositoryPage> get copyWith => _$CachedRepositoryPageCopyWithImpl<CachedRepositoryPage>(this as CachedRepositoryPage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CachedRepositoryPage&&const DeepCollectionEquality().equals(other.repositories, repositories)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage)&&(identical(other.fetchedAt, fetchedAt) || other.fetchedAt == fetchedAt));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(repositories),page,hasNextPage,fetchedAt);

@override
String toString() {
  return 'CachedRepositoryPage(repositories: $repositories, page: $page, hasNextPage: $hasNextPage, fetchedAt: $fetchedAt)';
}


}

/// @nodoc
abstract mixin class $CachedRepositoryPageCopyWith<$Res>  {
  factory $CachedRepositoryPageCopyWith(CachedRepositoryPage value, $Res Function(CachedRepositoryPage) _then) = _$CachedRepositoryPageCopyWithImpl;
@useResult
$Res call({
 List<CachedRepositoryModel> repositories, int page, bool hasNextPage, DateTime fetchedAt
});




}
/// @nodoc
class _$CachedRepositoryPageCopyWithImpl<$Res>
    implements $CachedRepositoryPageCopyWith<$Res> {
  _$CachedRepositoryPageCopyWithImpl(this._self, this._then);

  final CachedRepositoryPage _self;
  final $Res Function(CachedRepositoryPage) _then;

/// Create a copy of CachedRepositoryPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? repositories = null,Object? page = null,Object? hasNextPage = null,Object? fetchedAt = null,}) {
  return _then(_self.copyWith(
repositories: null == repositories ? _self.repositories : repositories // ignore: cast_nullable_to_non_nullable
as List<CachedRepositoryModel>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasNextPage: null == hasNextPage ? _self.hasNextPage : hasNextPage // ignore: cast_nullable_to_non_nullable
as bool,fetchedAt: null == fetchedAt ? _self.fetchedAt : fetchedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [CachedRepositoryPage].
extension CachedRepositoryPagePatterns on CachedRepositoryPage {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CachedRepositoryPage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CachedRepositoryPage() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CachedRepositoryPage value)  $default,){
final _that = this;
switch (_that) {
case _CachedRepositoryPage():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CachedRepositoryPage value)?  $default,){
final _that = this;
switch (_that) {
case _CachedRepositoryPage() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CachedRepositoryModel> repositories,  int page,  bool hasNextPage,  DateTime fetchedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CachedRepositoryPage() when $default != null:
return $default(_that.repositories,_that.page,_that.hasNextPage,_that.fetchedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CachedRepositoryModel> repositories,  int page,  bool hasNextPage,  DateTime fetchedAt)  $default,) {final _that = this;
switch (_that) {
case _CachedRepositoryPage():
return $default(_that.repositories,_that.page,_that.hasNextPage,_that.fetchedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CachedRepositoryModel> repositories,  int page,  bool hasNextPage,  DateTime fetchedAt)?  $default,) {final _that = this;
switch (_that) {
case _CachedRepositoryPage() when $default != null:
return $default(_that.repositories,_that.page,_that.hasNextPage,_that.fetchedAt);case _:
  return null;

}
}

}

/// @nodoc


class _CachedRepositoryPage implements CachedRepositoryPage {
  const _CachedRepositoryPage({required final  List<CachedRepositoryModel> repositories, required this.page, required this.hasNextPage, required this.fetchedAt}): _repositories = repositories;
  

 final  List<CachedRepositoryModel> _repositories;
@override List<CachedRepositoryModel> get repositories {
  if (_repositories is EqualUnmodifiableListView) return _repositories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_repositories);
}

@override final  int page;
@override final  bool hasNextPage;
@override final  DateTime fetchedAt;

/// Create a copy of CachedRepositoryPage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CachedRepositoryPageCopyWith<_CachedRepositoryPage> get copyWith => __$CachedRepositoryPageCopyWithImpl<_CachedRepositoryPage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CachedRepositoryPage&&const DeepCollectionEquality().equals(other._repositories, _repositories)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage)&&(identical(other.fetchedAt, fetchedAt) || other.fetchedAt == fetchedAt));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_repositories),page,hasNextPage,fetchedAt);

@override
String toString() {
  return 'CachedRepositoryPage(repositories: $repositories, page: $page, hasNextPage: $hasNextPage, fetchedAt: $fetchedAt)';
}


}

/// @nodoc
abstract mixin class _$CachedRepositoryPageCopyWith<$Res> implements $CachedRepositoryPageCopyWith<$Res> {
  factory _$CachedRepositoryPageCopyWith(_CachedRepositoryPage value, $Res Function(_CachedRepositoryPage) _then) = __$CachedRepositoryPageCopyWithImpl;
@override @useResult
$Res call({
 List<CachedRepositoryModel> repositories, int page, bool hasNextPage, DateTime fetchedAt
});




}
/// @nodoc
class __$CachedRepositoryPageCopyWithImpl<$Res>
    implements _$CachedRepositoryPageCopyWith<$Res> {
  __$CachedRepositoryPageCopyWithImpl(this._self, this._then);

  final _CachedRepositoryPage _self;
  final $Res Function(_CachedRepositoryPage) _then;

/// Create a copy of CachedRepositoryPage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? repositories = null,Object? page = null,Object? hasNextPage = null,Object? fetchedAt = null,}) {
  return _then(_CachedRepositoryPage(
repositories: null == repositories ? _self._repositories : repositories // ignore: cast_nullable_to_non_nullable
as List<CachedRepositoryModel>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasNextPage: null == hasNextPage ? _self.hasNextPage : hasNextPage // ignore: cast_nullable_to_non_nullable
as bool,fetchedAt: null == fetchedAt ? _self.fetchedAt : fetchedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
