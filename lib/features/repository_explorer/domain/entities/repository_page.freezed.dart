// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repository_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RepositoryPage {

 List<GithubRepository> get repositories; int get page; bool get hasNextPage; DataOrigin get origin; DateTime get fetchedAt; bool get isStale; Failure? get refreshFailure;
/// Create a copy of RepositoryPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RepositoryPageCopyWith<RepositoryPage> get copyWith => _$RepositoryPageCopyWithImpl<RepositoryPage>(this as RepositoryPage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RepositoryPage&&const DeepCollectionEquality().equals(other.repositories, repositories)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.fetchedAt, fetchedAt) || other.fetchedAt == fetchedAt)&&(identical(other.isStale, isStale) || other.isStale == isStale)&&(identical(other.refreshFailure, refreshFailure) || other.refreshFailure == refreshFailure));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(repositories),page,hasNextPage,origin,fetchedAt,isStale,refreshFailure);

@override
String toString() {
  return 'RepositoryPage(repositories: $repositories, page: $page, hasNextPage: $hasNextPage, origin: $origin, fetchedAt: $fetchedAt, isStale: $isStale, refreshFailure: $refreshFailure)';
}


}

/// @nodoc
abstract mixin class $RepositoryPageCopyWith<$Res>  {
  factory $RepositoryPageCopyWith(RepositoryPage value, $Res Function(RepositoryPage) _then) = _$RepositoryPageCopyWithImpl;
@useResult
$Res call({
 List<GithubRepository> repositories, int page, bool hasNextPage, DataOrigin origin, DateTime fetchedAt, bool isStale, Failure? refreshFailure
});


$FailureCopyWith<$Res>? get refreshFailure;

}
/// @nodoc
class _$RepositoryPageCopyWithImpl<$Res>
    implements $RepositoryPageCopyWith<$Res> {
  _$RepositoryPageCopyWithImpl(this._self, this._then);

  final RepositoryPage _self;
  final $Res Function(RepositoryPage) _then;

/// Create a copy of RepositoryPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? repositories = null,Object? page = null,Object? hasNextPage = null,Object? origin = null,Object? fetchedAt = null,Object? isStale = null,Object? refreshFailure = freezed,}) {
  return _then(_self.copyWith(
repositories: null == repositories ? _self.repositories : repositories // ignore: cast_nullable_to_non_nullable
as List<GithubRepository>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasNextPage: null == hasNextPage ? _self.hasNextPage : hasNextPage // ignore: cast_nullable_to_non_nullable
as bool,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as DataOrigin,fetchedAt: null == fetchedAt ? _self.fetchedAt : fetchedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isStale: null == isStale ? _self.isStale : isStale // ignore: cast_nullable_to_non_nullable
as bool,refreshFailure: freezed == refreshFailure ? _self.refreshFailure : refreshFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}
/// Create a copy of RepositoryPage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get refreshFailure {
    if (_self.refreshFailure == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.refreshFailure!, (value) {
    return _then(_self.copyWith(refreshFailure: value));
  });
}
}


/// Adds pattern-matching-related methods to [RepositoryPage].
extension RepositoryPagePatterns on RepositoryPage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RepositoryPage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RepositoryPage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RepositoryPage value)  $default,){
final _that = this;
switch (_that) {
case _RepositoryPage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RepositoryPage value)?  $default,){
final _that = this;
switch (_that) {
case _RepositoryPage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<GithubRepository> repositories,  int page,  bool hasNextPage,  DataOrigin origin,  DateTime fetchedAt,  bool isStale,  Failure? refreshFailure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RepositoryPage() when $default != null:
return $default(_that.repositories,_that.page,_that.hasNextPage,_that.origin,_that.fetchedAt,_that.isStale,_that.refreshFailure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<GithubRepository> repositories,  int page,  bool hasNextPage,  DataOrigin origin,  DateTime fetchedAt,  bool isStale,  Failure? refreshFailure)  $default,) {final _that = this;
switch (_that) {
case _RepositoryPage():
return $default(_that.repositories,_that.page,_that.hasNextPage,_that.origin,_that.fetchedAt,_that.isStale,_that.refreshFailure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<GithubRepository> repositories,  int page,  bool hasNextPage,  DataOrigin origin,  DateTime fetchedAt,  bool isStale,  Failure? refreshFailure)?  $default,) {final _that = this;
switch (_that) {
case _RepositoryPage() when $default != null:
return $default(_that.repositories,_that.page,_that.hasNextPage,_that.origin,_that.fetchedAt,_that.isStale,_that.refreshFailure);case _:
  return null;

}
}

}

/// @nodoc


class _RepositoryPage implements RepositoryPage {
  const _RepositoryPage({required final  List<GithubRepository> repositories, required this.page, required this.hasNextPage, required this.origin, required this.fetchedAt, this.isStale = false, this.refreshFailure}): _repositories = repositories;
  

 final  List<GithubRepository> _repositories;
@override List<GithubRepository> get repositories {
  if (_repositories is EqualUnmodifiableListView) return _repositories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_repositories);
}

@override final  int page;
@override final  bool hasNextPage;
@override final  DataOrigin origin;
@override final  DateTime fetchedAt;
@override@JsonKey() final  bool isStale;
@override final  Failure? refreshFailure;

/// Create a copy of RepositoryPage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RepositoryPageCopyWith<_RepositoryPage> get copyWith => __$RepositoryPageCopyWithImpl<_RepositoryPage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RepositoryPage&&const DeepCollectionEquality().equals(other._repositories, _repositories)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.fetchedAt, fetchedAt) || other.fetchedAt == fetchedAt)&&(identical(other.isStale, isStale) || other.isStale == isStale)&&(identical(other.refreshFailure, refreshFailure) || other.refreshFailure == refreshFailure));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_repositories),page,hasNextPage,origin,fetchedAt,isStale,refreshFailure);

@override
String toString() {
  return 'RepositoryPage(repositories: $repositories, page: $page, hasNextPage: $hasNextPage, origin: $origin, fetchedAt: $fetchedAt, isStale: $isStale, refreshFailure: $refreshFailure)';
}


}

/// @nodoc
abstract mixin class _$RepositoryPageCopyWith<$Res> implements $RepositoryPageCopyWith<$Res> {
  factory _$RepositoryPageCopyWith(_RepositoryPage value, $Res Function(_RepositoryPage) _then) = __$RepositoryPageCopyWithImpl;
@override @useResult
$Res call({
 List<GithubRepository> repositories, int page, bool hasNextPage, DataOrigin origin, DateTime fetchedAt, bool isStale, Failure? refreshFailure
});


@override $FailureCopyWith<$Res>? get refreshFailure;

}
/// @nodoc
class __$RepositoryPageCopyWithImpl<$Res>
    implements _$RepositoryPageCopyWith<$Res> {
  __$RepositoryPageCopyWithImpl(this._self, this._then);

  final _RepositoryPage _self;
  final $Res Function(_RepositoryPage) _then;

/// Create a copy of RepositoryPage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? repositories = null,Object? page = null,Object? hasNextPage = null,Object? origin = null,Object? fetchedAt = null,Object? isStale = null,Object? refreshFailure = freezed,}) {
  return _then(_RepositoryPage(
repositories: null == repositories ? _self._repositories : repositories // ignore: cast_nullable_to_non_nullable
as List<GithubRepository>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasNextPage: null == hasNextPage ? _self.hasNextPage : hasNextPage // ignore: cast_nullable_to_non_nullable
as bool,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as DataOrigin,fetchedAt: null == fetchedAt ? _self.fetchedAt : fetchedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isStale: null == isStale ? _self.isStale : isStale // ignore: cast_nullable_to_non_nullable
as bool,refreshFailure: freezed == refreshFailure ? _self.refreshFailure : refreshFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of RepositoryPage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get refreshFailure {
    if (_self.refreshFailure == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.refreshFailure!, (value) {
    return _then(_self.copyWith(refreshFailure: value));
  });
}
}

// dart format on
