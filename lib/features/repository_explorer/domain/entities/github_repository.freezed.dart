// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'github_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GithubRepository {

 int get id; String get name; String get owner; String get description; int get stars; int get forks; int get openIssues; String? get language; Uri get githubUrl; DateTime get observedAt;
/// Create a copy of GithubRepository
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GithubRepositoryCopyWith<GithubRepository> get copyWith => _$GithubRepositoryCopyWithImpl<GithubRepository>(this as GithubRepository, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GithubRepository&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.description, description) || other.description == description)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.forks, forks) || other.forks == forks)&&(identical(other.openIssues, openIssues) || other.openIssues == openIssues)&&(identical(other.language, language) || other.language == language)&&(identical(other.githubUrl, githubUrl) || other.githubUrl == githubUrl)&&(identical(other.observedAt, observedAt) || other.observedAt == observedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,owner,description,stars,forks,openIssues,language,githubUrl,observedAt);

@override
String toString() {
  return 'GithubRepository(id: $id, name: $name, owner: $owner, description: $description, stars: $stars, forks: $forks, openIssues: $openIssues, language: $language, githubUrl: $githubUrl, observedAt: $observedAt)';
}


}

/// @nodoc
abstract mixin class $GithubRepositoryCopyWith<$Res>  {
  factory $GithubRepositoryCopyWith(GithubRepository value, $Res Function(GithubRepository) _then) = _$GithubRepositoryCopyWithImpl;
@useResult
$Res call({
 int id, String name, String owner, String description, int stars, int forks, int openIssues, String? language, Uri githubUrl, DateTime observedAt
});




}
/// @nodoc
class _$GithubRepositoryCopyWithImpl<$Res>
    implements $GithubRepositoryCopyWith<$Res> {
  _$GithubRepositoryCopyWithImpl(this._self, this._then);

  final GithubRepository _self;
  final $Res Function(GithubRepository) _then;

/// Create a copy of GithubRepository
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? owner = null,Object? description = null,Object? stars = null,Object? forks = null,Object? openIssues = null,Object? language = freezed,Object? githubUrl = null,Object? observedAt = null,}) {
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
as Uri,observedAt: null == observedAt ? _self.observedAt : observedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [GithubRepository].
extension GithubRepositoryPatterns on GithubRepository {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GithubRepository value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GithubRepository() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GithubRepository value)  $default,){
final _that = this;
switch (_that) {
case _GithubRepository():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GithubRepository value)?  $default,){
final _that = this;
switch (_that) {
case _GithubRepository() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String owner,  String description,  int stars,  int forks,  int openIssues,  String? language,  Uri githubUrl,  DateTime observedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GithubRepository() when $default != null:
return $default(_that.id,_that.name,_that.owner,_that.description,_that.stars,_that.forks,_that.openIssues,_that.language,_that.githubUrl,_that.observedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String owner,  String description,  int stars,  int forks,  int openIssues,  String? language,  Uri githubUrl,  DateTime observedAt)  $default,) {final _that = this;
switch (_that) {
case _GithubRepository():
return $default(_that.id,_that.name,_that.owner,_that.description,_that.stars,_that.forks,_that.openIssues,_that.language,_that.githubUrl,_that.observedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String owner,  String description,  int stars,  int forks,  int openIssues,  String? language,  Uri githubUrl,  DateTime observedAt)?  $default,) {final _that = this;
switch (_that) {
case _GithubRepository() when $default != null:
return $default(_that.id,_that.name,_that.owner,_that.description,_that.stars,_that.forks,_that.openIssues,_that.language,_that.githubUrl,_that.observedAt);case _:
  return null;

}
}

}

/// @nodoc


class _GithubRepository implements GithubRepository {
  const _GithubRepository({required this.id, required this.name, required this.owner, required this.description, required this.stars, required this.forks, required this.openIssues, required this.language, required this.githubUrl, required this.observedAt});
  

@override final  int id;
@override final  String name;
@override final  String owner;
@override final  String description;
@override final  int stars;
@override final  int forks;
@override final  int openIssues;
@override final  String? language;
@override final  Uri githubUrl;
@override final  DateTime observedAt;

/// Create a copy of GithubRepository
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GithubRepositoryCopyWith<_GithubRepository> get copyWith => __$GithubRepositoryCopyWithImpl<_GithubRepository>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GithubRepository&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.description, description) || other.description == description)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.forks, forks) || other.forks == forks)&&(identical(other.openIssues, openIssues) || other.openIssues == openIssues)&&(identical(other.language, language) || other.language == language)&&(identical(other.githubUrl, githubUrl) || other.githubUrl == githubUrl)&&(identical(other.observedAt, observedAt) || other.observedAt == observedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,owner,description,stars,forks,openIssues,language,githubUrl,observedAt);

@override
String toString() {
  return 'GithubRepository(id: $id, name: $name, owner: $owner, description: $description, stars: $stars, forks: $forks, openIssues: $openIssues, language: $language, githubUrl: $githubUrl, observedAt: $observedAt)';
}


}

/// @nodoc
abstract mixin class _$GithubRepositoryCopyWith<$Res> implements $GithubRepositoryCopyWith<$Res> {
  factory _$GithubRepositoryCopyWith(_GithubRepository value, $Res Function(_GithubRepository) _then) = __$GithubRepositoryCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String owner, String description, int stars, int forks, int openIssues, String? language, Uri githubUrl, DateTime observedAt
});




}
/// @nodoc
class __$GithubRepositoryCopyWithImpl<$Res>
    implements _$GithubRepositoryCopyWith<$Res> {
  __$GithubRepositoryCopyWithImpl(this._self, this._then);

  final _GithubRepository _self;
  final $Res Function(_GithubRepository) _then;

/// Create a copy of GithubRepository
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? owner = null,Object? description = null,Object? stars = null,Object? forks = null,Object? openIssues = null,Object? language = freezed,Object? githubUrl = null,Object? observedAt = null,}) {
  return _then(_GithubRepository(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,forks: null == forks ? _self.forks : forks // ignore: cast_nullable_to_non_nullable
as int,openIssues: null == openIssues ? _self.openIssues : openIssues // ignore: cast_nullable_to_non_nullable
as int,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,githubUrl: null == githubUrl ? _self.githubUrl : githubUrl // ignore: cast_nullable_to_non_nullable
as Uri,observedAt: null == observedAt ? _self.observedAt : observedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
