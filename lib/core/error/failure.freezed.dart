// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Failure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure()';
}


}

/// @nodoc
class $FailureCopyWith<$Res>  {
$FailureCopyWith(Failure _, $Res Function(Failure) __);
}


/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NetworkFailure value)?  network,TResult Function( RateLimitedFailure value)?  rateLimited,TResult Function( ServerFailure value)?  server,TResult Function( RequestRejectedFailure value)?  requestRejected,TResult Function( CacheFailure value)?  cache,TResult Function( ValidationFailure value)?  validation,TResult Function( UnexpectedFailure value)?  unexpected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NetworkFailure() when network != null:
return network(_that);case RateLimitedFailure() when rateLimited != null:
return rateLimited(_that);case ServerFailure() when server != null:
return server(_that);case RequestRejectedFailure() when requestRejected != null:
return requestRejected(_that);case CacheFailure() when cache != null:
return cache(_that);case ValidationFailure() when validation != null:
return validation(_that);case UnexpectedFailure() when unexpected != null:
return unexpected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NetworkFailure value)  network,required TResult Function( RateLimitedFailure value)  rateLimited,required TResult Function( ServerFailure value)  server,required TResult Function( RequestRejectedFailure value)  requestRejected,required TResult Function( CacheFailure value)  cache,required TResult Function( ValidationFailure value)  validation,required TResult Function( UnexpectedFailure value)  unexpected,}){
final _that = this;
switch (_that) {
case NetworkFailure():
return network(_that);case RateLimitedFailure():
return rateLimited(_that);case ServerFailure():
return server(_that);case RequestRejectedFailure():
return requestRejected(_that);case CacheFailure():
return cache(_that);case ValidationFailure():
return validation(_that);case UnexpectedFailure():
return unexpected(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NetworkFailure value)?  network,TResult? Function( RateLimitedFailure value)?  rateLimited,TResult? Function( ServerFailure value)?  server,TResult? Function( RequestRejectedFailure value)?  requestRejected,TResult? Function( CacheFailure value)?  cache,TResult? Function( ValidationFailure value)?  validation,TResult? Function( UnexpectedFailure value)?  unexpected,}){
final _that = this;
switch (_that) {
case NetworkFailure() when network != null:
return network(_that);case RateLimitedFailure() when rateLimited != null:
return rateLimited(_that);case ServerFailure() when server != null:
return server(_that);case RequestRejectedFailure() when requestRejected != null:
return requestRejected(_that);case CacheFailure() when cache != null:
return cache(_that);case ValidationFailure() when validation != null:
return validation(_that);case UnexpectedFailure() when unexpected != null:
return unexpected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  network,TResult Function( DateTime? retryAt)?  rateLimited,TResult Function()?  server,TResult Function()?  requestRejected,TResult Function()?  cache,TResult Function( ValidationFailureCode code,  int? minimumLength)?  validation,TResult Function()?  unexpected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NetworkFailure() when network != null:
return network();case RateLimitedFailure() when rateLimited != null:
return rateLimited(_that.retryAt);case ServerFailure() when server != null:
return server();case RequestRejectedFailure() when requestRejected != null:
return requestRejected();case CacheFailure() when cache != null:
return cache();case ValidationFailure() when validation != null:
return validation(_that.code,_that.minimumLength);case UnexpectedFailure() when unexpected != null:
return unexpected();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  network,required TResult Function( DateTime? retryAt)  rateLimited,required TResult Function()  server,required TResult Function()  requestRejected,required TResult Function()  cache,required TResult Function( ValidationFailureCode code,  int? minimumLength)  validation,required TResult Function()  unexpected,}) {final _that = this;
switch (_that) {
case NetworkFailure():
return network();case RateLimitedFailure():
return rateLimited(_that.retryAt);case ServerFailure():
return server();case RequestRejectedFailure():
return requestRejected();case CacheFailure():
return cache();case ValidationFailure():
return validation(_that.code,_that.minimumLength);case UnexpectedFailure():
return unexpected();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  network,TResult? Function( DateTime? retryAt)?  rateLimited,TResult? Function()?  server,TResult? Function()?  requestRejected,TResult? Function()?  cache,TResult? Function( ValidationFailureCode code,  int? minimumLength)?  validation,TResult? Function()?  unexpected,}) {final _that = this;
switch (_that) {
case NetworkFailure() when network != null:
return network();case RateLimitedFailure() when rateLimited != null:
return rateLimited(_that.retryAt);case ServerFailure() when server != null:
return server();case RequestRejectedFailure() when requestRejected != null:
return requestRejected();case CacheFailure() when cache != null:
return cache();case ValidationFailure() when validation != null:
return validation(_that.code,_that.minimumLength);case UnexpectedFailure() when unexpected != null:
return unexpected();case _:
  return null;

}
}

}

/// @nodoc


class NetworkFailure implements Failure {
  const NetworkFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.network()';
}


}




/// @nodoc


class RateLimitedFailure implements Failure {
  const RateLimitedFailure({this.retryAt});
  

 final  DateTime? retryAt;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RateLimitedFailureCopyWith<RateLimitedFailure> get copyWith => _$RateLimitedFailureCopyWithImpl<RateLimitedFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RateLimitedFailure&&(identical(other.retryAt, retryAt) || other.retryAt == retryAt));
}


@override
int get hashCode => Object.hash(runtimeType,retryAt);

@override
String toString() {
  return 'Failure.rateLimited(retryAt: $retryAt)';
}


}

/// @nodoc
abstract mixin class $RateLimitedFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $RateLimitedFailureCopyWith(RateLimitedFailure value, $Res Function(RateLimitedFailure) _then) = _$RateLimitedFailureCopyWithImpl;
@useResult
$Res call({
 DateTime? retryAt
});




}
/// @nodoc
class _$RateLimitedFailureCopyWithImpl<$Res>
    implements $RateLimitedFailureCopyWith<$Res> {
  _$RateLimitedFailureCopyWithImpl(this._self, this._then);

  final RateLimitedFailure _self;
  final $Res Function(RateLimitedFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? retryAt = freezed,}) {
  return _then(RateLimitedFailure(
retryAt: freezed == retryAt ? _self.retryAt : retryAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc


class ServerFailure implements Failure {
  const ServerFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.server()';
}


}




/// @nodoc


class RequestRejectedFailure implements Failure {
  const RequestRejectedFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestRejectedFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.requestRejected()';
}


}




/// @nodoc


class CacheFailure implements Failure {
  const CacheFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CacheFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.cache()';
}


}




/// @nodoc


class ValidationFailure implements Failure {
  const ValidationFailure({required this.code, this.minimumLength});
  

 final  ValidationFailureCode code;
 final  int? minimumLength;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValidationFailureCopyWith<ValidationFailure> get copyWith => _$ValidationFailureCopyWithImpl<ValidationFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValidationFailure&&(identical(other.code, code) || other.code == code)&&(identical(other.minimumLength, minimumLength) || other.minimumLength == minimumLength));
}


@override
int get hashCode => Object.hash(runtimeType,code,minimumLength);

@override
String toString() {
  return 'Failure.validation(code: $code, minimumLength: $minimumLength)';
}


}

/// @nodoc
abstract mixin class $ValidationFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $ValidationFailureCopyWith(ValidationFailure value, $Res Function(ValidationFailure) _then) = _$ValidationFailureCopyWithImpl;
@useResult
$Res call({
 ValidationFailureCode code, int? minimumLength
});




}
/// @nodoc
class _$ValidationFailureCopyWithImpl<$Res>
    implements $ValidationFailureCopyWith<$Res> {
  _$ValidationFailureCopyWithImpl(this._self, this._then);

  final ValidationFailure _self;
  final $Res Function(ValidationFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? code = null,Object? minimumLength = freezed,}) {
  return _then(ValidationFailure(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as ValidationFailureCode,minimumLength: freezed == minimumLength ? _self.minimumLength : minimumLength // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class UnexpectedFailure implements Failure {
  const UnexpectedFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnexpectedFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.unexpected()';
}


}




// dart format on
