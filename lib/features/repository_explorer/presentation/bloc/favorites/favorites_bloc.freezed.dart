// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorites_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FavoritesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoritesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavoritesEvent()';
}


}

/// @nodoc
class $FavoritesEventCopyWith<$Res>  {
$FavoritesEventCopyWith(FavoritesEvent _, $Res Function(FavoritesEvent) __);
}


/// Adds pattern-matching-related methods to [FavoritesEvent].
extension FavoritesEventPatterns on FavoritesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FavoritesStarted value)?  started,TResult Function( FavoriteSetRequested value)?  setRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FavoritesStarted() when started != null:
return started(_that);case FavoriteSetRequested() when setRequested != null:
return setRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FavoritesStarted value)  started,required TResult Function( FavoriteSetRequested value)  setRequested,}){
final _that = this;
switch (_that) {
case FavoritesStarted():
return started(_that);case FavoriteSetRequested():
return setRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FavoritesStarted value)?  started,TResult? Function( FavoriteSetRequested value)?  setRequested,}){
final _that = this;
switch (_that) {
case FavoritesStarted() when started != null:
return started(_that);case FavoriteSetRequested() when setRequested != null:
return setRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( GithubRepository repository,  bool isFavorite)?  setRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FavoritesStarted() when started != null:
return started();case FavoriteSetRequested() when setRequested != null:
return setRequested(_that.repository,_that.isFavorite);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( GithubRepository repository,  bool isFavorite)  setRequested,}) {final _that = this;
switch (_that) {
case FavoritesStarted():
return started();case FavoriteSetRequested():
return setRequested(_that.repository,_that.isFavorite);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( GithubRepository repository,  bool isFavorite)?  setRequested,}) {final _that = this;
switch (_that) {
case FavoritesStarted() when started != null:
return started();case FavoriteSetRequested() when setRequested != null:
return setRequested(_that.repository,_that.isFavorite);case _:
  return null;

}
}

}

/// @nodoc


class FavoritesStarted implements FavoritesEvent {
  const FavoritesStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoritesStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavoritesEvent.started()';
}


}




/// @nodoc


class FavoriteSetRequested implements FavoritesEvent {
  const FavoriteSetRequested({required this.repository, required this.isFavorite});
  

 final  GithubRepository repository;
 final  bool isFavorite;

/// Create a copy of FavoritesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoriteSetRequestedCopyWith<FavoriteSetRequested> get copyWith => _$FavoriteSetRequestedCopyWithImpl<FavoriteSetRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteSetRequested&&(identical(other.repository, repository) || other.repository == repository)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}


@override
int get hashCode => Object.hash(runtimeType,repository,isFavorite);

@override
String toString() {
  return 'FavoritesEvent.setRequested(repository: $repository, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class $FavoriteSetRequestedCopyWith<$Res> implements $FavoritesEventCopyWith<$Res> {
  factory $FavoriteSetRequestedCopyWith(FavoriteSetRequested value, $Res Function(FavoriteSetRequested) _then) = _$FavoriteSetRequestedCopyWithImpl;
@useResult
$Res call({
 GithubRepository repository, bool isFavorite
});


$GithubRepositoryCopyWith<$Res> get repository;

}
/// @nodoc
class _$FavoriteSetRequestedCopyWithImpl<$Res>
    implements $FavoriteSetRequestedCopyWith<$Res> {
  _$FavoriteSetRequestedCopyWithImpl(this._self, this._then);

  final FavoriteSetRequested _self;
  final $Res Function(FavoriteSetRequested) _then;

/// Create a copy of FavoritesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? repository = null,Object? isFavorite = null,}) {
  return _then(FavoriteSetRequested(
repository: null == repository ? _self.repository : repository // ignore: cast_nullable_to_non_nullable
as GithubRepository,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of FavoritesEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GithubRepositoryCopyWith<$Res> get repository {
  
  return $GithubRepositoryCopyWith<$Res>(_self.repository, (value) {
    return _then(_self.copyWith(repository: value));
  });
}
}

/// @nodoc
mixin _$FavoritesState {

 FavoritesStatus get status; List<GithubRepository> get repositories; Set<int> get pendingRepositoryIds; Failure? get failure; Failure? get operationFailure;
/// Create a copy of FavoritesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoritesStateCopyWith<FavoritesState> get copyWith => _$FavoritesStateCopyWithImpl<FavoritesState>(this as FavoritesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoritesState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.repositories, repositories)&&const DeepCollectionEquality().equals(other.pendingRepositoryIds, pendingRepositoryIds)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.operationFailure, operationFailure) || other.operationFailure == operationFailure));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(repositories),const DeepCollectionEquality().hash(pendingRepositoryIds),failure,operationFailure);

@override
String toString() {
  return 'FavoritesState(status: $status, repositories: $repositories, pendingRepositoryIds: $pendingRepositoryIds, failure: $failure, operationFailure: $operationFailure)';
}


}

/// @nodoc
abstract mixin class $FavoritesStateCopyWith<$Res>  {
  factory $FavoritesStateCopyWith(FavoritesState value, $Res Function(FavoritesState) _then) = _$FavoritesStateCopyWithImpl;
@useResult
$Res call({
 FavoritesStatus status, List<GithubRepository> repositories, Set<int> pendingRepositoryIds, Failure? failure, Failure? operationFailure
});


$FailureCopyWith<$Res>? get failure;$FailureCopyWith<$Res>? get operationFailure;

}
/// @nodoc
class _$FavoritesStateCopyWithImpl<$Res>
    implements $FavoritesStateCopyWith<$Res> {
  _$FavoritesStateCopyWithImpl(this._self, this._then);

  final FavoritesState _self;
  final $Res Function(FavoritesState) _then;

/// Create a copy of FavoritesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? repositories = null,Object? pendingRepositoryIds = null,Object? failure = freezed,Object? operationFailure = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FavoritesStatus,repositories: null == repositories ? _self.repositories : repositories // ignore: cast_nullable_to_non_nullable
as List<GithubRepository>,pendingRepositoryIds: null == pendingRepositoryIds ? _self.pendingRepositoryIds : pendingRepositoryIds // ignore: cast_nullable_to_non_nullable
as Set<int>,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,operationFailure: freezed == operationFailure ? _self.operationFailure : operationFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}
/// Create a copy of FavoritesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get failure {
    if (_self.failure == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.failure!, (value) {
    return _then(_self.copyWith(failure: value));
  });
}/// Create a copy of FavoritesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get operationFailure {
    if (_self.operationFailure == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.operationFailure!, (value) {
    return _then(_self.copyWith(operationFailure: value));
  });
}
}


/// Adds pattern-matching-related methods to [FavoritesState].
extension FavoritesStatePatterns on FavoritesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FavoritesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FavoritesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FavoritesState value)  $default,){
final _that = this;
switch (_that) {
case _FavoritesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FavoritesState value)?  $default,){
final _that = this;
switch (_that) {
case _FavoritesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FavoritesStatus status,  List<GithubRepository> repositories,  Set<int> pendingRepositoryIds,  Failure? failure,  Failure? operationFailure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FavoritesState() when $default != null:
return $default(_that.status,_that.repositories,_that.pendingRepositoryIds,_that.failure,_that.operationFailure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FavoritesStatus status,  List<GithubRepository> repositories,  Set<int> pendingRepositoryIds,  Failure? failure,  Failure? operationFailure)  $default,) {final _that = this;
switch (_that) {
case _FavoritesState():
return $default(_that.status,_that.repositories,_that.pendingRepositoryIds,_that.failure,_that.operationFailure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FavoritesStatus status,  List<GithubRepository> repositories,  Set<int> pendingRepositoryIds,  Failure? failure,  Failure? operationFailure)?  $default,) {final _that = this;
switch (_that) {
case _FavoritesState() when $default != null:
return $default(_that.status,_that.repositories,_that.pendingRepositoryIds,_that.failure,_that.operationFailure);case _:
  return null;

}
}

}

/// @nodoc


class _FavoritesState implements FavoritesState {
  const _FavoritesState({this.status = FavoritesStatus.initial, final  List<GithubRepository> repositories = const <GithubRepository>[], final  Set<int> pendingRepositoryIds = const <int>{}, this.failure, this.operationFailure}): _repositories = repositories,_pendingRepositoryIds = pendingRepositoryIds;
  

@override@JsonKey() final  FavoritesStatus status;
 final  List<GithubRepository> _repositories;
@override@JsonKey() List<GithubRepository> get repositories {
  if (_repositories is EqualUnmodifiableListView) return _repositories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_repositories);
}

 final  Set<int> _pendingRepositoryIds;
@override@JsonKey() Set<int> get pendingRepositoryIds {
  if (_pendingRepositoryIds is EqualUnmodifiableSetView) return _pendingRepositoryIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_pendingRepositoryIds);
}

@override final  Failure? failure;
@override final  Failure? operationFailure;

/// Create a copy of FavoritesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoritesStateCopyWith<_FavoritesState> get copyWith => __$FavoritesStateCopyWithImpl<_FavoritesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavoritesState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._repositories, _repositories)&&const DeepCollectionEquality().equals(other._pendingRepositoryIds, _pendingRepositoryIds)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.operationFailure, operationFailure) || other.operationFailure == operationFailure));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_repositories),const DeepCollectionEquality().hash(_pendingRepositoryIds),failure,operationFailure);

@override
String toString() {
  return 'FavoritesState(status: $status, repositories: $repositories, pendingRepositoryIds: $pendingRepositoryIds, failure: $failure, operationFailure: $operationFailure)';
}


}

/// @nodoc
abstract mixin class _$FavoritesStateCopyWith<$Res> implements $FavoritesStateCopyWith<$Res> {
  factory _$FavoritesStateCopyWith(_FavoritesState value, $Res Function(_FavoritesState) _then) = __$FavoritesStateCopyWithImpl;
@override @useResult
$Res call({
 FavoritesStatus status, List<GithubRepository> repositories, Set<int> pendingRepositoryIds, Failure? failure, Failure? operationFailure
});


@override $FailureCopyWith<$Res>? get failure;@override $FailureCopyWith<$Res>? get operationFailure;

}
/// @nodoc
class __$FavoritesStateCopyWithImpl<$Res>
    implements _$FavoritesStateCopyWith<$Res> {
  __$FavoritesStateCopyWithImpl(this._self, this._then);

  final _FavoritesState _self;
  final $Res Function(_FavoritesState) _then;

/// Create a copy of FavoritesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? repositories = null,Object? pendingRepositoryIds = null,Object? failure = freezed,Object? operationFailure = freezed,}) {
  return _then(_FavoritesState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FavoritesStatus,repositories: null == repositories ? _self._repositories : repositories // ignore: cast_nullable_to_non_nullable
as List<GithubRepository>,pendingRepositoryIds: null == pendingRepositoryIds ? _self._pendingRepositoryIds : pendingRepositoryIds // ignore: cast_nullable_to_non_nullable
as Set<int>,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,operationFailure: freezed == operationFailure ? _self.operationFailure : operationFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of FavoritesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get failure {
    if (_self.failure == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.failure!, (value) {
    return _then(_self.copyWith(failure: value));
  });
}/// Create a copy of FavoritesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get operationFailure {
    if (_self.operationFailure == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.operationFailure!, (value) {
    return _then(_self.copyWith(operationFailure: value));
  });
}
}

// dart format on
