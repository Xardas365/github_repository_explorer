// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchEvent()';
}


}

/// @nodoc
class $SearchEventCopyWith<$Res>  {
$SearchEventCopyWith(SearchEvent _, $Res Function(SearchEvent) __);
}


/// Adds pattern-matching-related methods to [SearchEvent].
extension SearchEventPatterns on SearchEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SearchQueryChanged value)?  queryChanged,TResult Function( SearchSubmitted value)?  submitted,TResult Function( SearchLoadNextPage value)?  loadNextPage,TResult Function( SearchRetried value)?  retried,TResult Function( SearchRefreshed value)?  refreshed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SearchQueryChanged() when queryChanged != null:
return queryChanged(_that);case SearchSubmitted() when submitted != null:
return submitted(_that);case SearchLoadNextPage() when loadNextPage != null:
return loadNextPage(_that);case SearchRetried() when retried != null:
return retried(_that);case SearchRefreshed() when refreshed != null:
return refreshed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SearchQueryChanged value)  queryChanged,required TResult Function( SearchSubmitted value)  submitted,required TResult Function( SearchLoadNextPage value)  loadNextPage,required TResult Function( SearchRetried value)  retried,required TResult Function( SearchRefreshed value)  refreshed,}){
final _that = this;
switch (_that) {
case SearchQueryChanged():
return queryChanged(_that);case SearchSubmitted():
return submitted(_that);case SearchLoadNextPage():
return loadNextPage(_that);case SearchRetried():
return retried(_that);case SearchRefreshed():
return refreshed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SearchQueryChanged value)?  queryChanged,TResult? Function( SearchSubmitted value)?  submitted,TResult? Function( SearchLoadNextPage value)?  loadNextPage,TResult? Function( SearchRetried value)?  retried,TResult? Function( SearchRefreshed value)?  refreshed,}){
final _that = this;
switch (_that) {
case SearchQueryChanged() when queryChanged != null:
return queryChanged(_that);case SearchSubmitted() when submitted != null:
return submitted(_that);case SearchLoadNextPage() when loadNextPage != null:
return loadNextPage(_that);case SearchRetried() when retried != null:
return retried(_that);case SearchRefreshed() when refreshed != null:
return refreshed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String query)?  queryChanged,TResult Function( String query)?  submitted,TResult Function()?  loadNextPage,TResult Function()?  retried,TResult Function()?  refreshed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SearchQueryChanged() when queryChanged != null:
return queryChanged(_that.query);case SearchSubmitted() when submitted != null:
return submitted(_that.query);case SearchLoadNextPage() when loadNextPage != null:
return loadNextPage();case SearchRetried() when retried != null:
return retried();case SearchRefreshed() when refreshed != null:
return refreshed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String query)  queryChanged,required TResult Function( String query)  submitted,required TResult Function()  loadNextPage,required TResult Function()  retried,required TResult Function()  refreshed,}) {final _that = this;
switch (_that) {
case SearchQueryChanged():
return queryChanged(_that.query);case SearchSubmitted():
return submitted(_that.query);case SearchLoadNextPage():
return loadNextPage();case SearchRetried():
return retried();case SearchRefreshed():
return refreshed();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String query)?  queryChanged,TResult? Function( String query)?  submitted,TResult? Function()?  loadNextPage,TResult? Function()?  retried,TResult? Function()?  refreshed,}) {final _that = this;
switch (_that) {
case SearchQueryChanged() when queryChanged != null:
return queryChanged(_that.query);case SearchSubmitted() when submitted != null:
return submitted(_that.query);case SearchLoadNextPage() when loadNextPage != null:
return loadNextPage();case SearchRetried() when retried != null:
return retried();case SearchRefreshed() when refreshed != null:
return refreshed();case _:
  return null;

}
}

}

/// @nodoc


class SearchQueryChanged implements SearchEvent {
  const SearchQueryChanged(this.query);
  

 final  String query;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchQueryChangedCopyWith<SearchQueryChanged> get copyWith => _$SearchQueryChangedCopyWithImpl<SearchQueryChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchQueryChanged&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'SearchEvent.queryChanged(query: $query)';
}


}

/// @nodoc
abstract mixin class $SearchQueryChangedCopyWith<$Res> implements $SearchEventCopyWith<$Res> {
  factory $SearchQueryChangedCopyWith(SearchQueryChanged value, $Res Function(SearchQueryChanged) _then) = _$SearchQueryChangedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$SearchQueryChangedCopyWithImpl<$Res>
    implements $SearchQueryChangedCopyWith<$Res> {
  _$SearchQueryChangedCopyWithImpl(this._self, this._then);

  final SearchQueryChanged _self;
  final $Res Function(SearchQueryChanged) _then;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(SearchQueryChanged(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SearchSubmitted implements SearchEvent {
  const SearchSubmitted(this.query);
  

 final  String query;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchSubmittedCopyWith<SearchSubmitted> get copyWith => _$SearchSubmittedCopyWithImpl<SearchSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchSubmitted&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'SearchEvent.submitted(query: $query)';
}


}

/// @nodoc
abstract mixin class $SearchSubmittedCopyWith<$Res> implements $SearchEventCopyWith<$Res> {
  factory $SearchSubmittedCopyWith(SearchSubmitted value, $Res Function(SearchSubmitted) _then) = _$SearchSubmittedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$SearchSubmittedCopyWithImpl<$Res>
    implements $SearchSubmittedCopyWith<$Res> {
  _$SearchSubmittedCopyWithImpl(this._self, this._then);

  final SearchSubmitted _self;
  final $Res Function(SearchSubmitted) _then;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(SearchSubmitted(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SearchLoadNextPage implements SearchEvent {
  const SearchLoadNextPage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchLoadNextPage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchEvent.loadNextPage()';
}


}




/// @nodoc


class SearchRetried implements SearchEvent {
  const SearchRetried();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchRetried);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchEvent.retried()';
}


}




/// @nodoc


class SearchRefreshed implements SearchEvent {
  const SearchRefreshed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchRefreshed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchEvent.refreshed()';
}


}




/// @nodoc
mixin _$SearchState {

 SearchStatus get status; String get query; List<GithubRepository> get repositories; int get currentPage; bool get hasReachedEnd; bool get isLoadingNextPage; bool get isRefreshing; bool get isFromCache; bool get isStale; DateTime? get fetchedAt; Failure? get failure; Failure? get refreshFailure; Failure? get paginationFailure;
/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchStateCopyWith<SearchState> get copyWith => _$SearchStateCopyWithImpl<SearchState>(this as SearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchState&&(identical(other.status, status) || other.status == status)&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other.repositories, repositories)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasReachedEnd, hasReachedEnd) || other.hasReachedEnd == hasReachedEnd)&&(identical(other.isLoadingNextPage, isLoadingNextPage) || other.isLoadingNextPage == isLoadingNextPage)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.isFromCache, isFromCache) || other.isFromCache == isFromCache)&&(identical(other.isStale, isStale) || other.isStale == isStale)&&(identical(other.fetchedAt, fetchedAt) || other.fetchedAt == fetchedAt)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.refreshFailure, refreshFailure) || other.refreshFailure == refreshFailure)&&(identical(other.paginationFailure, paginationFailure) || other.paginationFailure == paginationFailure));
}


@override
int get hashCode => Object.hash(runtimeType,status,query,const DeepCollectionEquality().hash(repositories),currentPage,hasReachedEnd,isLoadingNextPage,isRefreshing,isFromCache,isStale,fetchedAt,failure,refreshFailure,paginationFailure);

@override
String toString() {
  return 'SearchState(status: $status, query: $query, repositories: $repositories, currentPage: $currentPage, hasReachedEnd: $hasReachedEnd, isLoadingNextPage: $isLoadingNextPage, isRefreshing: $isRefreshing, isFromCache: $isFromCache, isStale: $isStale, fetchedAt: $fetchedAt, failure: $failure, refreshFailure: $refreshFailure, paginationFailure: $paginationFailure)';
}


}

/// @nodoc
abstract mixin class $SearchStateCopyWith<$Res>  {
  factory $SearchStateCopyWith(SearchState value, $Res Function(SearchState) _then) = _$SearchStateCopyWithImpl;
@useResult
$Res call({
 SearchStatus status, String query, List<GithubRepository> repositories, int currentPage, bool hasReachedEnd, bool isLoadingNextPage, bool isRefreshing, bool isFromCache, bool isStale, DateTime? fetchedAt, Failure? failure, Failure? refreshFailure, Failure? paginationFailure
});


$FailureCopyWith<$Res>? get failure;$FailureCopyWith<$Res>? get refreshFailure;$FailureCopyWith<$Res>? get paginationFailure;

}
/// @nodoc
class _$SearchStateCopyWithImpl<$Res>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._self, this._then);

  final SearchState _self;
  final $Res Function(SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? query = null,Object? repositories = null,Object? currentPage = null,Object? hasReachedEnd = null,Object? isLoadingNextPage = null,Object? isRefreshing = null,Object? isFromCache = null,Object? isStale = null,Object? fetchedAt = freezed,Object? failure = freezed,Object? refreshFailure = freezed,Object? paginationFailure = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SearchStatus,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,repositories: null == repositories ? _self.repositories : repositories // ignore: cast_nullable_to_non_nullable
as List<GithubRepository>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasReachedEnd: null == hasReachedEnd ? _self.hasReachedEnd : hasReachedEnd // ignore: cast_nullable_to_non_nullable
as bool,isLoadingNextPage: null == isLoadingNextPage ? _self.isLoadingNextPage : isLoadingNextPage // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,isFromCache: null == isFromCache ? _self.isFromCache : isFromCache // ignore: cast_nullable_to_non_nullable
as bool,isStale: null == isStale ? _self.isStale : isStale // ignore: cast_nullable_to_non_nullable
as bool,fetchedAt: freezed == fetchedAt ? _self.fetchedAt : fetchedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,refreshFailure: freezed == refreshFailure ? _self.refreshFailure : refreshFailure // ignore: cast_nullable_to_non_nullable
as Failure?,paginationFailure: freezed == paginationFailure ? _self.paginationFailure : paginationFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}
/// Create a copy of SearchState
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
}/// Create a copy of SearchState
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
}/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get paginationFailure {
    if (_self.paginationFailure == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.paginationFailure!, (value) {
    return _then(_self.copyWith(paginationFailure: value));
  });
}
}


/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns on SearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchState value)  $default,){
final _that = this;
switch (_that) {
case _SearchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchState value)?  $default,){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SearchStatus status,  String query,  List<GithubRepository> repositories,  int currentPage,  bool hasReachedEnd,  bool isLoadingNextPage,  bool isRefreshing,  bool isFromCache,  bool isStale,  DateTime? fetchedAt,  Failure? failure,  Failure? refreshFailure,  Failure? paginationFailure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.status,_that.query,_that.repositories,_that.currentPage,_that.hasReachedEnd,_that.isLoadingNextPage,_that.isRefreshing,_that.isFromCache,_that.isStale,_that.fetchedAt,_that.failure,_that.refreshFailure,_that.paginationFailure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SearchStatus status,  String query,  List<GithubRepository> repositories,  int currentPage,  bool hasReachedEnd,  bool isLoadingNextPage,  bool isRefreshing,  bool isFromCache,  bool isStale,  DateTime? fetchedAt,  Failure? failure,  Failure? refreshFailure,  Failure? paginationFailure)  $default,) {final _that = this;
switch (_that) {
case _SearchState():
return $default(_that.status,_that.query,_that.repositories,_that.currentPage,_that.hasReachedEnd,_that.isLoadingNextPage,_that.isRefreshing,_that.isFromCache,_that.isStale,_that.fetchedAt,_that.failure,_that.refreshFailure,_that.paginationFailure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SearchStatus status,  String query,  List<GithubRepository> repositories,  int currentPage,  bool hasReachedEnd,  bool isLoadingNextPage,  bool isRefreshing,  bool isFromCache,  bool isStale,  DateTime? fetchedAt,  Failure? failure,  Failure? refreshFailure,  Failure? paginationFailure)?  $default,) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.status,_that.query,_that.repositories,_that.currentPage,_that.hasReachedEnd,_that.isLoadingNextPage,_that.isRefreshing,_that.isFromCache,_that.isStale,_that.fetchedAt,_that.failure,_that.refreshFailure,_that.paginationFailure);case _:
  return null;

}
}

}

/// @nodoc


class _SearchState implements SearchState {
  const _SearchState({this.status = SearchStatus.initial, this.query = '', final  List<GithubRepository> repositories = const <GithubRepository>[], this.currentPage = 0, this.hasReachedEnd = false, this.isLoadingNextPage = false, this.isRefreshing = false, this.isFromCache = false, this.isStale = false, this.fetchedAt, this.failure, this.refreshFailure, this.paginationFailure}): _repositories = repositories;
  

@override@JsonKey() final  SearchStatus status;
@override@JsonKey() final  String query;
 final  List<GithubRepository> _repositories;
@override@JsonKey() List<GithubRepository> get repositories {
  if (_repositories is EqualUnmodifiableListView) return _repositories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_repositories);
}

@override@JsonKey() final  int currentPage;
@override@JsonKey() final  bool hasReachedEnd;
@override@JsonKey() final  bool isLoadingNextPage;
@override@JsonKey() final  bool isRefreshing;
@override@JsonKey() final  bool isFromCache;
@override@JsonKey() final  bool isStale;
@override final  DateTime? fetchedAt;
@override final  Failure? failure;
@override final  Failure? refreshFailure;
@override final  Failure? paginationFailure;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchStateCopyWith<_SearchState> get copyWith => __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchState&&(identical(other.status, status) || other.status == status)&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other._repositories, _repositories)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasReachedEnd, hasReachedEnd) || other.hasReachedEnd == hasReachedEnd)&&(identical(other.isLoadingNextPage, isLoadingNextPage) || other.isLoadingNextPage == isLoadingNextPage)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.isFromCache, isFromCache) || other.isFromCache == isFromCache)&&(identical(other.isStale, isStale) || other.isStale == isStale)&&(identical(other.fetchedAt, fetchedAt) || other.fetchedAt == fetchedAt)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.refreshFailure, refreshFailure) || other.refreshFailure == refreshFailure)&&(identical(other.paginationFailure, paginationFailure) || other.paginationFailure == paginationFailure));
}


@override
int get hashCode => Object.hash(runtimeType,status,query,const DeepCollectionEquality().hash(_repositories),currentPage,hasReachedEnd,isLoadingNextPage,isRefreshing,isFromCache,isStale,fetchedAt,failure,refreshFailure,paginationFailure);

@override
String toString() {
  return 'SearchState(status: $status, query: $query, repositories: $repositories, currentPage: $currentPage, hasReachedEnd: $hasReachedEnd, isLoadingNextPage: $isLoadingNextPage, isRefreshing: $isRefreshing, isFromCache: $isFromCache, isStale: $isStale, fetchedAt: $fetchedAt, failure: $failure, refreshFailure: $refreshFailure, paginationFailure: $paginationFailure)';
}


}

/// @nodoc
abstract mixin class _$SearchStateCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(_SearchState value, $Res Function(_SearchState) _then) = __$SearchStateCopyWithImpl;
@override @useResult
$Res call({
 SearchStatus status, String query, List<GithubRepository> repositories, int currentPage, bool hasReachedEnd, bool isLoadingNextPage, bool isRefreshing, bool isFromCache, bool isStale, DateTime? fetchedAt, Failure? failure, Failure? refreshFailure, Failure? paginationFailure
});


@override $FailureCopyWith<$Res>? get failure;@override $FailureCopyWith<$Res>? get refreshFailure;@override $FailureCopyWith<$Res>? get paginationFailure;

}
/// @nodoc
class __$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(this._self, this._then);

  final _SearchState _self;
  final $Res Function(_SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? query = null,Object? repositories = null,Object? currentPage = null,Object? hasReachedEnd = null,Object? isLoadingNextPage = null,Object? isRefreshing = null,Object? isFromCache = null,Object? isStale = null,Object? fetchedAt = freezed,Object? failure = freezed,Object? refreshFailure = freezed,Object? paginationFailure = freezed,}) {
  return _then(_SearchState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SearchStatus,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,repositories: null == repositories ? _self._repositories : repositories // ignore: cast_nullable_to_non_nullable
as List<GithubRepository>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasReachedEnd: null == hasReachedEnd ? _self.hasReachedEnd : hasReachedEnd // ignore: cast_nullable_to_non_nullable
as bool,isLoadingNextPage: null == isLoadingNextPage ? _self.isLoadingNextPage : isLoadingNextPage // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,isFromCache: null == isFromCache ? _self.isFromCache : isFromCache // ignore: cast_nullable_to_non_nullable
as bool,isStale: null == isStale ? _self.isStale : isStale // ignore: cast_nullable_to_non_nullable
as bool,fetchedAt: freezed == fetchedAt ? _self.fetchedAt : fetchedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,refreshFailure: freezed == refreshFailure ? _self.refreshFailure : refreshFailure // ignore: cast_nullable_to_non_nullable
as Failure?,paginationFailure: freezed == paginationFailure ? _self.paginationFailure : paginationFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of SearchState
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
}/// Create a copy of SearchState
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
}/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get paginationFailure {
    if (_self.paginationFailure == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.paginationFailure!, (value) {
    return _then(_self.copyWith(paginationFailure: value));
  });
}
}

// dart format on
