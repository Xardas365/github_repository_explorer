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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SearchQueryChanged value)?  queryChanged,TResult Function( SearchSubmitted value)?  submitted,TResult Function( SearchLoadNextPage value)?  loadNextPage,TResult Function( SearchPageRetried value)?  retryPage,TResult Function( SearchRefreshed value)?  refreshed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SearchQueryChanged() when queryChanged != null:
return queryChanged(_that);case SearchSubmitted() when submitted != null:
return submitted(_that);case SearchLoadNextPage() when loadNextPage != null:
return loadNextPage(_that);case SearchPageRetried() when retryPage != null:
return retryPage(_that);case SearchRefreshed() when refreshed != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SearchQueryChanged value)  queryChanged,required TResult Function( SearchSubmitted value)  submitted,required TResult Function( SearchLoadNextPage value)  loadNextPage,required TResult Function( SearchPageRetried value)  retryPage,required TResult Function( SearchRefreshed value)  refreshed,}){
final _that = this;
switch (_that) {
case SearchQueryChanged():
return queryChanged(_that);case SearchSubmitted():
return submitted(_that);case SearchLoadNextPage():
return loadNextPage(_that);case SearchPageRetried():
return retryPage(_that);case SearchRefreshed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SearchQueryChanged value)?  queryChanged,TResult? Function( SearchSubmitted value)?  submitted,TResult? Function( SearchLoadNextPage value)?  loadNextPage,TResult? Function( SearchPageRetried value)?  retryPage,TResult? Function( SearchRefreshed value)?  refreshed,}){
final _that = this;
switch (_that) {
case SearchQueryChanged() when queryChanged != null:
return queryChanged(_that);case SearchSubmitted() when submitted != null:
return submitted(_that);case SearchLoadNextPage() when loadNextPage != null:
return loadNextPage(_that);case SearchPageRetried() when retryPage != null:
return retryPage(_that);case SearchRefreshed() when refreshed != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String query)?  queryChanged,TResult Function( String query)?  submitted,TResult Function()?  loadNextPage,TResult Function( int page)?  retryPage,TResult Function()?  refreshed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SearchQueryChanged() when queryChanged != null:
return queryChanged(_that.query);case SearchSubmitted() when submitted != null:
return submitted(_that.query);case SearchLoadNextPage() when loadNextPage != null:
return loadNextPage();case SearchPageRetried() when retryPage != null:
return retryPage(_that.page);case SearchRefreshed() when refreshed != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String query)  queryChanged,required TResult Function( String query)  submitted,required TResult Function()  loadNextPage,required TResult Function( int page)  retryPage,required TResult Function()  refreshed,}) {final _that = this;
switch (_that) {
case SearchQueryChanged():
return queryChanged(_that.query);case SearchSubmitted():
return submitted(_that.query);case SearchLoadNextPage():
return loadNextPage();case SearchPageRetried():
return retryPage(_that.page);case SearchRefreshed():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String query)?  queryChanged,TResult? Function( String query)?  submitted,TResult? Function()?  loadNextPage,TResult? Function( int page)?  retryPage,TResult? Function()?  refreshed,}) {final _that = this;
switch (_that) {
case SearchQueryChanged() when queryChanged != null:
return queryChanged(_that.query);case SearchSubmitted() when submitted != null:
return submitted(_that.query);case SearchLoadNextPage() when loadNextPage != null:
return loadNextPage();case SearchPageRetried() when retryPage != null:
return retryPage(_that.page);case SearchRefreshed() when refreshed != null:
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


class SearchPageRetried implements SearchEvent {
  const SearchPageRetried(this.page);
  

 final  int page;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchPageRetriedCopyWith<SearchPageRetried> get copyWith => _$SearchPageRetriedCopyWithImpl<SearchPageRetried>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchPageRetried&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,page);

@override
String toString() {
  return 'SearchEvent.retryPage(page: $page)';
}


}

/// @nodoc
abstract mixin class $SearchPageRetriedCopyWith<$Res> implements $SearchEventCopyWith<$Res> {
  factory $SearchPageRetriedCopyWith(SearchPageRetried value, $Res Function(SearchPageRetried) _then) = _$SearchPageRetriedCopyWithImpl;
@useResult
$Res call({
 int page
});




}
/// @nodoc
class _$SearchPageRetriedCopyWithImpl<$Res>
    implements $SearchPageRetriedCopyWith<$Res> {
  _$SearchPageRetriedCopyWithImpl(this._self, this._then);

  final SearchPageRetried _self;
  final $Res Function(SearchPageRetried) _then;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? page = null,}) {
  return _then(SearchPageRetried(
null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
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
mixin _$SearchPageFailure {

 int get page; Failure get failure;
/// Create a copy of SearchPageFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchPageFailureCopyWith<SearchPageFailure> get copyWith => _$SearchPageFailureCopyWithImpl<SearchPageFailure>(this as SearchPageFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchPageFailure&&(identical(other.page, page) || other.page == page)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,page,failure);

@override
String toString() {
  return 'SearchPageFailure(page: $page, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $SearchPageFailureCopyWith<$Res>  {
  factory $SearchPageFailureCopyWith(SearchPageFailure value, $Res Function(SearchPageFailure) _then) = _$SearchPageFailureCopyWithImpl;
@useResult
$Res call({
 int page, Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$SearchPageFailureCopyWithImpl<$Res>
    implements $SearchPageFailureCopyWith<$Res> {
  _$SearchPageFailureCopyWithImpl(this._self, this._then);

  final SearchPageFailure _self;
  final $Res Function(SearchPageFailure) _then;

/// Create a copy of SearchPageFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? failure = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}
/// Create a copy of SearchPageFailure
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res> get failure {
  
  return $FailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}


/// Adds pattern-matching-related methods to [SearchPageFailure].
extension SearchPageFailurePatterns on SearchPageFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchPageFailure value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchPageFailure() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchPageFailure value)  $default,){
final _that = this;
switch (_that) {
case _SearchPageFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchPageFailure value)?  $default,){
final _that = this;
switch (_that) {
case _SearchPageFailure() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int page,  Failure failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchPageFailure() when $default != null:
return $default(_that.page,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int page,  Failure failure)  $default,) {final _that = this;
switch (_that) {
case _SearchPageFailure():
return $default(_that.page,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int page,  Failure failure)?  $default,) {final _that = this;
switch (_that) {
case _SearchPageFailure() when $default != null:
return $default(_that.page,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _SearchPageFailure implements SearchPageFailure {
  const _SearchPageFailure({required this.page, required this.failure});
  

@override final  int page;
@override final  Failure failure;

/// Create a copy of SearchPageFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchPageFailureCopyWith<_SearchPageFailure> get copyWith => __$SearchPageFailureCopyWithImpl<_SearchPageFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchPageFailure&&(identical(other.page, page) || other.page == page)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,page,failure);

@override
String toString() {
  return 'SearchPageFailure(page: $page, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$SearchPageFailureCopyWith<$Res> implements $SearchPageFailureCopyWith<$Res> {
  factory _$SearchPageFailureCopyWith(_SearchPageFailure value, $Res Function(_SearchPageFailure) _then) = __$SearchPageFailureCopyWithImpl;
@override @useResult
$Res call({
 int page, Failure failure
});


@override $FailureCopyWith<$Res> get failure;

}
/// @nodoc
class __$SearchPageFailureCopyWithImpl<$Res>
    implements _$SearchPageFailureCopyWith<$Res> {
  __$SearchPageFailureCopyWithImpl(this._self, this._then);

  final _SearchPageFailure _self;
  final $Res Function(_SearchPageFailure) _then;

/// Create a copy of SearchPageFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? failure = null,}) {
  return _then(_SearchPageFailure(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of SearchPageFailure
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res> get failure {
  
  return $FailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

/// @nodoc
mixin _$SearchState {

 SearchStatus get status; String get query; Map<int, RepositoryPage> get pages; int? get loadingPage; bool get isRefreshing; Failure? get failure; SearchPageFailure? get pageFailure;
/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchStateCopyWith<SearchState> get copyWith => _$SearchStateCopyWithImpl<SearchState>(this as SearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchState&&(identical(other.status, status) || other.status == status)&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other.pages, pages)&&(identical(other.loadingPage, loadingPage) || other.loadingPage == loadingPage)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.pageFailure, pageFailure) || other.pageFailure == pageFailure));
}


@override
int get hashCode => Object.hash(runtimeType,status,query,const DeepCollectionEquality().hash(pages),loadingPage,isRefreshing,failure,pageFailure);

@override
String toString() {
  return 'SearchState(status: $status, query: $query, pages: $pages, loadingPage: $loadingPage, isRefreshing: $isRefreshing, failure: $failure, pageFailure: $pageFailure)';
}


}

/// @nodoc
abstract mixin class $SearchStateCopyWith<$Res>  {
  factory $SearchStateCopyWith(SearchState value, $Res Function(SearchState) _then) = _$SearchStateCopyWithImpl;
@useResult
$Res call({
 SearchStatus status, String query, Map<int, RepositoryPage> pages, int? loadingPage, bool isRefreshing, Failure? failure, SearchPageFailure? pageFailure
});


$FailureCopyWith<$Res>? get failure;$SearchPageFailureCopyWith<$Res>? get pageFailure;

}
/// @nodoc
class _$SearchStateCopyWithImpl<$Res>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._self, this._then);

  final SearchState _self;
  final $Res Function(SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? query = null,Object? pages = null,Object? loadingPage = freezed,Object? isRefreshing = null,Object? failure = freezed,Object? pageFailure = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SearchStatus,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as Map<int, RepositoryPage>,loadingPage: freezed == loadingPage ? _self.loadingPage : loadingPage // ignore: cast_nullable_to_non_nullable
as int?,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,pageFailure: freezed == pageFailure ? _self.pageFailure : pageFailure // ignore: cast_nullable_to_non_nullable
as SearchPageFailure?,
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
$SearchPageFailureCopyWith<$Res>? get pageFailure {
    if (_self.pageFailure == null) {
    return null;
  }

  return $SearchPageFailureCopyWith<$Res>(_self.pageFailure!, (value) {
    return _then(_self.copyWith(pageFailure: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SearchStatus status,  String query,  Map<int, RepositoryPage> pages,  int? loadingPage,  bool isRefreshing,  Failure? failure,  SearchPageFailure? pageFailure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.status,_that.query,_that.pages,_that.loadingPage,_that.isRefreshing,_that.failure,_that.pageFailure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SearchStatus status,  String query,  Map<int, RepositoryPage> pages,  int? loadingPage,  bool isRefreshing,  Failure? failure,  SearchPageFailure? pageFailure)  $default,) {final _that = this;
switch (_that) {
case _SearchState():
return $default(_that.status,_that.query,_that.pages,_that.loadingPage,_that.isRefreshing,_that.failure,_that.pageFailure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SearchStatus status,  String query,  Map<int, RepositoryPage> pages,  int? loadingPage,  bool isRefreshing,  Failure? failure,  SearchPageFailure? pageFailure)?  $default,) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.status,_that.query,_that.pages,_that.loadingPage,_that.isRefreshing,_that.failure,_that.pageFailure);case _:
  return null;

}
}

}

/// @nodoc


class _SearchState implements SearchState {
  const _SearchState({this.status = SearchStatus.initial, this.query = '', final  Map<int, RepositoryPage> pages = const <int, RepositoryPage>{}, this.loadingPage, this.isRefreshing = false, this.failure, this.pageFailure}): _pages = pages;
  

@override@JsonKey() final  SearchStatus status;
@override@JsonKey() final  String query;
 final  Map<int, RepositoryPage> _pages;
@override@JsonKey() Map<int, RepositoryPage> get pages {
  if (_pages is EqualUnmodifiableMapView) return _pages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_pages);
}

@override final  int? loadingPage;
@override@JsonKey() final  bool isRefreshing;
@override final  Failure? failure;
@override final  SearchPageFailure? pageFailure;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchStateCopyWith<_SearchState> get copyWith => __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchState&&(identical(other.status, status) || other.status == status)&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other._pages, _pages)&&(identical(other.loadingPage, loadingPage) || other.loadingPage == loadingPage)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.pageFailure, pageFailure) || other.pageFailure == pageFailure));
}


@override
int get hashCode => Object.hash(runtimeType,status,query,const DeepCollectionEquality().hash(_pages),loadingPage,isRefreshing,failure,pageFailure);

@override
String toString() {
  return 'SearchState(status: $status, query: $query, pages: $pages, loadingPage: $loadingPage, isRefreshing: $isRefreshing, failure: $failure, pageFailure: $pageFailure)';
}


}

/// @nodoc
abstract mixin class _$SearchStateCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(_SearchState value, $Res Function(_SearchState) _then) = __$SearchStateCopyWithImpl;
@override @useResult
$Res call({
 SearchStatus status, String query, Map<int, RepositoryPage> pages, int? loadingPage, bool isRefreshing, Failure? failure, SearchPageFailure? pageFailure
});


@override $FailureCopyWith<$Res>? get failure;@override $SearchPageFailureCopyWith<$Res>? get pageFailure;

}
/// @nodoc
class __$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(this._self, this._then);

  final _SearchState _self;
  final $Res Function(_SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? query = null,Object? pages = null,Object? loadingPage = freezed,Object? isRefreshing = null,Object? failure = freezed,Object? pageFailure = freezed,}) {
  return _then(_SearchState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SearchStatus,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,pages: null == pages ? _self._pages : pages // ignore: cast_nullable_to_non_nullable
as Map<int, RepositoryPage>,loadingPage: freezed == loadingPage ? _self.loadingPage : loadingPage // ignore: cast_nullable_to_non_nullable
as int?,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,pageFailure: freezed == pageFailure ? _self.pageFailure : pageFailure // ignore: cast_nullable_to_non_nullable
as SearchPageFailure?,
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
$SearchPageFailureCopyWith<$Res>? get pageFailure {
    if (_self.pageFailure == null) {
    return null;
  }

  return $SearchPageFailureCopyWith<$Res>(_self.pageFailure!, (value) {
    return _then(_self.copyWith(pageFailure: value));
  });
}
}

// dart format on
