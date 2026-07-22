// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'github_search_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GithubOwnerDto {

 String get login;
/// Create a copy of GithubOwnerDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GithubOwnerDtoCopyWith<GithubOwnerDto> get copyWith => _$GithubOwnerDtoCopyWithImpl<GithubOwnerDto>(this as GithubOwnerDto, _$identity);

  /// Serializes this GithubOwnerDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GithubOwnerDto&&(identical(other.login, login) || other.login == login));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,login);

@override
String toString() {
  return 'GithubOwnerDto(login: $login)';
}


}

/// @nodoc
abstract mixin class $GithubOwnerDtoCopyWith<$Res>  {
  factory $GithubOwnerDtoCopyWith(GithubOwnerDto value, $Res Function(GithubOwnerDto) _then) = _$GithubOwnerDtoCopyWithImpl;
@useResult
$Res call({
 String login
});




}
/// @nodoc
class _$GithubOwnerDtoCopyWithImpl<$Res>
    implements $GithubOwnerDtoCopyWith<$Res> {
  _$GithubOwnerDtoCopyWithImpl(this._self, this._then);

  final GithubOwnerDto _self;
  final $Res Function(GithubOwnerDto) _then;

/// Create a copy of GithubOwnerDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? login = null,}) {
  return _then(_self.copyWith(
login: null == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GithubOwnerDto].
extension GithubOwnerDtoPatterns on GithubOwnerDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GithubOwnerDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GithubOwnerDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GithubOwnerDto value)  $default,){
final _that = this;
switch (_that) {
case _GithubOwnerDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GithubOwnerDto value)?  $default,){
final _that = this;
switch (_that) {
case _GithubOwnerDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String login)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GithubOwnerDto() when $default != null:
return $default(_that.login);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String login)  $default,) {final _that = this;
switch (_that) {
case _GithubOwnerDto():
return $default(_that.login);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String login)?  $default,) {final _that = this;
switch (_that) {
case _GithubOwnerDto() when $default != null:
return $default(_that.login);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GithubOwnerDto implements GithubOwnerDto {
  const _GithubOwnerDto({required this.login});
  factory _GithubOwnerDto.fromJson(Map<String, dynamic> json) => _$GithubOwnerDtoFromJson(json);

@override final  String login;

/// Create a copy of GithubOwnerDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GithubOwnerDtoCopyWith<_GithubOwnerDto> get copyWith => __$GithubOwnerDtoCopyWithImpl<_GithubOwnerDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GithubOwnerDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GithubOwnerDto&&(identical(other.login, login) || other.login == login));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,login);

@override
String toString() {
  return 'GithubOwnerDto(login: $login)';
}


}

/// @nodoc
abstract mixin class _$GithubOwnerDtoCopyWith<$Res> implements $GithubOwnerDtoCopyWith<$Res> {
  factory _$GithubOwnerDtoCopyWith(_GithubOwnerDto value, $Res Function(_GithubOwnerDto) _then) = __$GithubOwnerDtoCopyWithImpl;
@override @useResult
$Res call({
 String login
});




}
/// @nodoc
class __$GithubOwnerDtoCopyWithImpl<$Res>
    implements _$GithubOwnerDtoCopyWith<$Res> {
  __$GithubOwnerDtoCopyWithImpl(this._self, this._then);

  final _GithubOwnerDto _self;
  final $Res Function(_GithubOwnerDto) _then;

/// Create a copy of GithubOwnerDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? login = null,}) {
  return _then(_GithubOwnerDto(
login: null == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$GithubRepositoryDto {

 int get id; String get name; GithubOwnerDto get owner;@JsonKey(name: 'stargazers_count') int get stars;@JsonKey(name: 'forks_count') int get forks;@JsonKey(name: 'open_issues_count') int get openIssues;@JsonKey(name: 'html_url') String get htmlUrl; String? get description; String? get language;
/// Create a copy of GithubRepositoryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GithubRepositoryDtoCopyWith<GithubRepositoryDto> get copyWith => _$GithubRepositoryDtoCopyWithImpl<GithubRepositoryDto>(this as GithubRepositoryDto, _$identity);

  /// Serializes this GithubRepositoryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GithubRepositoryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.forks, forks) || other.forks == forks)&&(identical(other.openIssues, openIssues) || other.openIssues == openIssues)&&(identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl)&&(identical(other.description, description) || other.description == description)&&(identical(other.language, language) || other.language == language));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,owner,stars,forks,openIssues,htmlUrl,description,language);

@override
String toString() {
  return 'GithubRepositoryDto(id: $id, name: $name, owner: $owner, stars: $stars, forks: $forks, openIssues: $openIssues, htmlUrl: $htmlUrl, description: $description, language: $language)';
}


}

/// @nodoc
abstract mixin class $GithubRepositoryDtoCopyWith<$Res>  {
  factory $GithubRepositoryDtoCopyWith(GithubRepositoryDto value, $Res Function(GithubRepositoryDto) _then) = _$GithubRepositoryDtoCopyWithImpl;
@useResult
$Res call({
 int id, String name, GithubOwnerDto owner,@JsonKey(name: 'stargazers_count') int stars,@JsonKey(name: 'forks_count') int forks,@JsonKey(name: 'open_issues_count') int openIssues,@JsonKey(name: 'html_url') String htmlUrl, String? description, String? language
});


$GithubOwnerDtoCopyWith<$Res> get owner;

}
/// @nodoc
class _$GithubRepositoryDtoCopyWithImpl<$Res>
    implements $GithubRepositoryDtoCopyWith<$Res> {
  _$GithubRepositoryDtoCopyWithImpl(this._self, this._then);

  final GithubRepositoryDto _self;
  final $Res Function(GithubRepositoryDto) _then;

/// Create a copy of GithubRepositoryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? owner = null,Object? stars = null,Object? forks = null,Object? openIssues = null,Object? htmlUrl = null,Object? description = freezed,Object? language = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as GithubOwnerDto,stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,forks: null == forks ? _self.forks : forks // ignore: cast_nullable_to_non_nullable
as int,openIssues: null == openIssues ? _self.openIssues : openIssues // ignore: cast_nullable_to_non_nullable
as int,htmlUrl: null == htmlUrl ? _self.htmlUrl : htmlUrl // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of GithubRepositoryDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GithubOwnerDtoCopyWith<$Res> get owner {
  
  return $GithubOwnerDtoCopyWith<$Res>(_self.owner, (value) {
    return _then(_self.copyWith(owner: value));
  });
}
}


/// Adds pattern-matching-related methods to [GithubRepositoryDto].
extension GithubRepositoryDtoPatterns on GithubRepositoryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GithubRepositoryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GithubRepositoryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GithubRepositoryDto value)  $default,){
final _that = this;
switch (_that) {
case _GithubRepositoryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GithubRepositoryDto value)?  $default,){
final _that = this;
switch (_that) {
case _GithubRepositoryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  GithubOwnerDto owner, @JsonKey(name: 'stargazers_count')  int stars, @JsonKey(name: 'forks_count')  int forks, @JsonKey(name: 'open_issues_count')  int openIssues, @JsonKey(name: 'html_url')  String htmlUrl,  String? description,  String? language)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GithubRepositoryDto() when $default != null:
return $default(_that.id,_that.name,_that.owner,_that.stars,_that.forks,_that.openIssues,_that.htmlUrl,_that.description,_that.language);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  GithubOwnerDto owner, @JsonKey(name: 'stargazers_count')  int stars, @JsonKey(name: 'forks_count')  int forks, @JsonKey(name: 'open_issues_count')  int openIssues, @JsonKey(name: 'html_url')  String htmlUrl,  String? description,  String? language)  $default,) {final _that = this;
switch (_that) {
case _GithubRepositoryDto():
return $default(_that.id,_that.name,_that.owner,_that.stars,_that.forks,_that.openIssues,_that.htmlUrl,_that.description,_that.language);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  GithubOwnerDto owner, @JsonKey(name: 'stargazers_count')  int stars, @JsonKey(name: 'forks_count')  int forks, @JsonKey(name: 'open_issues_count')  int openIssues, @JsonKey(name: 'html_url')  String htmlUrl,  String? description,  String? language)?  $default,) {final _that = this;
switch (_that) {
case _GithubRepositoryDto() when $default != null:
return $default(_that.id,_that.name,_that.owner,_that.stars,_that.forks,_that.openIssues,_that.htmlUrl,_that.description,_that.language);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GithubRepositoryDto implements GithubRepositoryDto {
  const _GithubRepositoryDto({required this.id, required this.name, required this.owner, @JsonKey(name: 'stargazers_count') required this.stars, @JsonKey(name: 'forks_count') required this.forks, @JsonKey(name: 'open_issues_count') required this.openIssues, @JsonKey(name: 'html_url') required this.htmlUrl, this.description, this.language});
  factory _GithubRepositoryDto.fromJson(Map<String, dynamic> json) => _$GithubRepositoryDtoFromJson(json);

@override final  int id;
@override final  String name;
@override final  GithubOwnerDto owner;
@override@JsonKey(name: 'stargazers_count') final  int stars;
@override@JsonKey(name: 'forks_count') final  int forks;
@override@JsonKey(name: 'open_issues_count') final  int openIssues;
@override@JsonKey(name: 'html_url') final  String htmlUrl;
@override final  String? description;
@override final  String? language;

/// Create a copy of GithubRepositoryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GithubRepositoryDtoCopyWith<_GithubRepositoryDto> get copyWith => __$GithubRepositoryDtoCopyWithImpl<_GithubRepositoryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GithubRepositoryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GithubRepositoryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.forks, forks) || other.forks == forks)&&(identical(other.openIssues, openIssues) || other.openIssues == openIssues)&&(identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl)&&(identical(other.description, description) || other.description == description)&&(identical(other.language, language) || other.language == language));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,owner,stars,forks,openIssues,htmlUrl,description,language);

@override
String toString() {
  return 'GithubRepositoryDto(id: $id, name: $name, owner: $owner, stars: $stars, forks: $forks, openIssues: $openIssues, htmlUrl: $htmlUrl, description: $description, language: $language)';
}


}

/// @nodoc
abstract mixin class _$GithubRepositoryDtoCopyWith<$Res> implements $GithubRepositoryDtoCopyWith<$Res> {
  factory _$GithubRepositoryDtoCopyWith(_GithubRepositoryDto value, $Res Function(_GithubRepositoryDto) _then) = __$GithubRepositoryDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, GithubOwnerDto owner,@JsonKey(name: 'stargazers_count') int stars,@JsonKey(name: 'forks_count') int forks,@JsonKey(name: 'open_issues_count') int openIssues,@JsonKey(name: 'html_url') String htmlUrl, String? description, String? language
});


@override $GithubOwnerDtoCopyWith<$Res> get owner;

}
/// @nodoc
class __$GithubRepositoryDtoCopyWithImpl<$Res>
    implements _$GithubRepositoryDtoCopyWith<$Res> {
  __$GithubRepositoryDtoCopyWithImpl(this._self, this._then);

  final _GithubRepositoryDto _self;
  final $Res Function(_GithubRepositoryDto) _then;

/// Create a copy of GithubRepositoryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? owner = null,Object? stars = null,Object? forks = null,Object? openIssues = null,Object? htmlUrl = null,Object? description = freezed,Object? language = freezed,}) {
  return _then(_GithubRepositoryDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as GithubOwnerDto,stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,forks: null == forks ? _self.forks : forks // ignore: cast_nullable_to_non_nullable
as int,openIssues: null == openIssues ? _self.openIssues : openIssues // ignore: cast_nullable_to_non_nullable
as int,htmlUrl: null == htmlUrl ? _self.htmlUrl : htmlUrl // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of GithubRepositoryDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GithubOwnerDtoCopyWith<$Res> get owner {
  
  return $GithubOwnerDtoCopyWith<$Res>(_self.owner, (value) {
    return _then(_self.copyWith(owner: value));
  });
}
}


/// @nodoc
mixin _$GithubSearchResponseDto {

@JsonKey(name: 'total_count') int get totalCount;@JsonKey(name: 'incomplete_results') bool get incompleteResults; List<GithubRepositoryDto> get items;
/// Create a copy of GithubSearchResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GithubSearchResponseDtoCopyWith<GithubSearchResponseDto> get copyWith => _$GithubSearchResponseDtoCopyWithImpl<GithubSearchResponseDto>(this as GithubSearchResponseDto, _$identity);

  /// Serializes this GithubSearchResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GithubSearchResponseDto&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.incompleteResults, incompleteResults) || other.incompleteResults == incompleteResults)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalCount,incompleteResults,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'GithubSearchResponseDto(totalCount: $totalCount, incompleteResults: $incompleteResults, items: $items)';
}


}

/// @nodoc
abstract mixin class $GithubSearchResponseDtoCopyWith<$Res>  {
  factory $GithubSearchResponseDtoCopyWith(GithubSearchResponseDto value, $Res Function(GithubSearchResponseDto) _then) = _$GithubSearchResponseDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_count') int totalCount,@JsonKey(name: 'incomplete_results') bool incompleteResults, List<GithubRepositoryDto> items
});




}
/// @nodoc
class _$GithubSearchResponseDtoCopyWithImpl<$Res>
    implements $GithubSearchResponseDtoCopyWith<$Res> {
  _$GithubSearchResponseDtoCopyWithImpl(this._self, this._then);

  final GithubSearchResponseDto _self;
  final $Res Function(GithubSearchResponseDto) _then;

/// Create a copy of GithubSearchResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalCount = null,Object? incompleteResults = null,Object? items = null,}) {
  return _then(_self.copyWith(
totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,incompleteResults: null == incompleteResults ? _self.incompleteResults : incompleteResults // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<GithubRepositoryDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [GithubSearchResponseDto].
extension GithubSearchResponseDtoPatterns on GithubSearchResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GithubSearchResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GithubSearchResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GithubSearchResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _GithubSearchResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GithubSearchResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _GithubSearchResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_count')  int totalCount, @JsonKey(name: 'incomplete_results')  bool incompleteResults,  List<GithubRepositoryDto> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GithubSearchResponseDto() when $default != null:
return $default(_that.totalCount,_that.incompleteResults,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_count')  int totalCount, @JsonKey(name: 'incomplete_results')  bool incompleteResults,  List<GithubRepositoryDto> items)  $default,) {final _that = this;
switch (_that) {
case _GithubSearchResponseDto():
return $default(_that.totalCount,_that.incompleteResults,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total_count')  int totalCount, @JsonKey(name: 'incomplete_results')  bool incompleteResults,  List<GithubRepositoryDto> items)?  $default,) {final _that = this;
switch (_that) {
case _GithubSearchResponseDto() when $default != null:
return $default(_that.totalCount,_that.incompleteResults,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GithubSearchResponseDto implements GithubSearchResponseDto {
  const _GithubSearchResponseDto({@JsonKey(name: 'total_count') required this.totalCount, @JsonKey(name: 'incomplete_results') required this.incompleteResults, required final  List<GithubRepositoryDto> items}): _items = items;
  factory _GithubSearchResponseDto.fromJson(Map<String, dynamic> json) => _$GithubSearchResponseDtoFromJson(json);

@override@JsonKey(name: 'total_count') final  int totalCount;
@override@JsonKey(name: 'incomplete_results') final  bool incompleteResults;
 final  List<GithubRepositoryDto> _items;
@override List<GithubRepositoryDto> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of GithubSearchResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GithubSearchResponseDtoCopyWith<_GithubSearchResponseDto> get copyWith => __$GithubSearchResponseDtoCopyWithImpl<_GithubSearchResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GithubSearchResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GithubSearchResponseDto&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.incompleteResults, incompleteResults) || other.incompleteResults == incompleteResults)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalCount,incompleteResults,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'GithubSearchResponseDto(totalCount: $totalCount, incompleteResults: $incompleteResults, items: $items)';
}


}

/// @nodoc
abstract mixin class _$GithubSearchResponseDtoCopyWith<$Res> implements $GithubSearchResponseDtoCopyWith<$Res> {
  factory _$GithubSearchResponseDtoCopyWith(_GithubSearchResponseDto value, $Res Function(_GithubSearchResponseDto) _then) = __$GithubSearchResponseDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_count') int totalCount,@JsonKey(name: 'incomplete_results') bool incompleteResults, List<GithubRepositoryDto> items
});




}
/// @nodoc
class __$GithubSearchResponseDtoCopyWithImpl<$Res>
    implements _$GithubSearchResponseDtoCopyWith<$Res> {
  __$GithubSearchResponseDtoCopyWithImpl(this._self, this._then);

  final _GithubSearchResponseDto _self;
  final $Res Function(_GithubSearchResponseDto) _then;

/// Create a copy of GithubSearchResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalCount = null,Object? incompleteResults = null,Object? items = null,}) {
  return _then(_GithubSearchResponseDto(
totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,incompleteResults: null == incompleteResults ? _self.incompleteResults : incompleteResults // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<GithubRepositoryDto>,
  ));
}


}

// dart format on
