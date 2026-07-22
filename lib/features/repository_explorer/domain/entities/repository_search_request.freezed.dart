// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repository_search_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RepositorySearchRequest {

 String get query; int get page; int get pageSize; bool get forceRefresh;
/// Create a copy of RepositorySearchRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RepositorySearchRequestCopyWith<RepositorySearchRequest> get copyWith => _$RepositorySearchRequestCopyWithImpl<RepositorySearchRequest>(this as RepositorySearchRequest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RepositorySearchRequest&&(identical(other.query, query) || other.query == query)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.forceRefresh, forceRefresh) || other.forceRefresh == forceRefresh));
}


@override
int get hashCode => Object.hash(runtimeType,query,page,pageSize,forceRefresh);

@override
String toString() {
  return 'RepositorySearchRequest(query: $query, page: $page, pageSize: $pageSize, forceRefresh: $forceRefresh)';
}


}

/// @nodoc
abstract mixin class $RepositorySearchRequestCopyWith<$Res>  {
  factory $RepositorySearchRequestCopyWith(RepositorySearchRequest value, $Res Function(RepositorySearchRequest) _then) = _$RepositorySearchRequestCopyWithImpl;
@useResult
$Res call({
 String query, int page, int pageSize, bool forceRefresh
});




}
/// @nodoc
class _$RepositorySearchRequestCopyWithImpl<$Res>
    implements $RepositorySearchRequestCopyWith<$Res> {
  _$RepositorySearchRequestCopyWithImpl(this._self, this._then);

  final RepositorySearchRequest _self;
  final $Res Function(RepositorySearchRequest) _then;

/// Create a copy of RepositorySearchRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,Object? page = null,Object? pageSize = null,Object? forceRefresh = null,}) {
  return _then(_self.copyWith(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,forceRefresh: null == forceRefresh ? _self.forceRefresh : forceRefresh // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RepositorySearchRequest].
extension RepositorySearchRequestPatterns on RepositorySearchRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RepositorySearchRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RepositorySearchRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RepositorySearchRequest value)  $default,){
final _that = this;
switch (_that) {
case _RepositorySearchRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RepositorySearchRequest value)?  $default,){
final _that = this;
switch (_that) {
case _RepositorySearchRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String query,  int page,  int pageSize,  bool forceRefresh)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RepositorySearchRequest() when $default != null:
return $default(_that.query,_that.page,_that.pageSize,_that.forceRefresh);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String query,  int page,  int pageSize,  bool forceRefresh)  $default,) {final _that = this;
switch (_that) {
case _RepositorySearchRequest():
return $default(_that.query,_that.page,_that.pageSize,_that.forceRefresh);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String query,  int page,  int pageSize,  bool forceRefresh)?  $default,) {final _that = this;
switch (_that) {
case _RepositorySearchRequest() when $default != null:
return $default(_that.query,_that.page,_that.pageSize,_that.forceRefresh);case _:
  return null;

}
}

}

/// @nodoc


class _RepositorySearchRequest implements RepositorySearchRequest {
  const _RepositorySearchRequest({required this.query, this.page = 1, this.pageSize = 30, this.forceRefresh = false});
  

@override final  String query;
@override@JsonKey() final  int page;
@override@JsonKey() final  int pageSize;
@override@JsonKey() final  bool forceRefresh;

/// Create a copy of RepositorySearchRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RepositorySearchRequestCopyWith<_RepositorySearchRequest> get copyWith => __$RepositorySearchRequestCopyWithImpl<_RepositorySearchRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RepositorySearchRequest&&(identical(other.query, query) || other.query == query)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.forceRefresh, forceRefresh) || other.forceRefresh == forceRefresh));
}


@override
int get hashCode => Object.hash(runtimeType,query,page,pageSize,forceRefresh);

@override
String toString() {
  return 'RepositorySearchRequest(query: $query, page: $page, pageSize: $pageSize, forceRefresh: $forceRefresh)';
}


}

/// @nodoc
abstract mixin class _$RepositorySearchRequestCopyWith<$Res> implements $RepositorySearchRequestCopyWith<$Res> {
  factory _$RepositorySearchRequestCopyWith(_RepositorySearchRequest value, $Res Function(_RepositorySearchRequest) _then) = __$RepositorySearchRequestCopyWithImpl;
@override @useResult
$Res call({
 String query, int page, int pageSize, bool forceRefresh
});




}
/// @nodoc
class __$RepositorySearchRequestCopyWithImpl<$Res>
    implements _$RepositorySearchRequestCopyWith<$Res> {
  __$RepositorySearchRequestCopyWithImpl(this._self, this._then);

  final _RepositorySearchRequest _self;
  final $Res Function(_RepositorySearchRequest) _then;

/// Create a copy of RepositorySearchRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,Object? page = null,Object? pageSize = null,Object? forceRefresh = null,}) {
  return _then(_RepositorySearchRequest(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,forceRefresh: null == forceRefresh ? _self.forceRefresh : forceRefresh // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
