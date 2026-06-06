// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CheckoutState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoutState()';
}


}

/// @nodoc
class $CheckoutStateCopyWith<$Res>  {
$CheckoutStateCopyWith(CheckoutState _, $Res Function(CheckoutState) __);
}


/// Adds pattern-matching-related methods to [CheckoutState].
extension CheckoutStatePatterns on CheckoutState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _QuantityUpdated value)?  quantityUpdated,TResult Function( _PlaceOrderLoading value)?  placeOrderLoading,TResult Function( _PlaceOrderSuccess value)?  placeOrderSuccess,TResult Function( _PlaceOrderError value)?  placeOrderError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _QuantityUpdated() when quantityUpdated != null:
return quantityUpdated(_that);case _PlaceOrderLoading() when placeOrderLoading != null:
return placeOrderLoading(_that);case _PlaceOrderSuccess() when placeOrderSuccess != null:
return placeOrderSuccess(_that);case _PlaceOrderError() when placeOrderError != null:
return placeOrderError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _QuantityUpdated value)  quantityUpdated,required TResult Function( _PlaceOrderLoading value)  placeOrderLoading,required TResult Function( _PlaceOrderSuccess value)  placeOrderSuccess,required TResult Function( _PlaceOrderError value)  placeOrderError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _QuantityUpdated():
return quantityUpdated(_that);case _PlaceOrderLoading():
return placeOrderLoading(_that);case _PlaceOrderSuccess():
return placeOrderSuccess(_that);case _PlaceOrderError():
return placeOrderError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _QuantityUpdated value)?  quantityUpdated,TResult? Function( _PlaceOrderLoading value)?  placeOrderLoading,TResult? Function( _PlaceOrderSuccess value)?  placeOrderSuccess,TResult? Function( _PlaceOrderError value)?  placeOrderError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _QuantityUpdated() when quantityUpdated != null:
return quantityUpdated(_that);case _PlaceOrderLoading() when placeOrderLoading != null:
return placeOrderLoading(_that);case _PlaceOrderSuccess() when placeOrderSuccess != null:
return placeOrderSuccess(_that);case _PlaceOrderError() when placeOrderError != null:
return placeOrderError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( int quantity,  int totalPrice)?  quantityUpdated,TResult Function()?  placeOrderLoading,TResult Function()?  placeOrderSuccess,TResult Function( String message)?  placeOrderError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _QuantityUpdated() when quantityUpdated != null:
return quantityUpdated(_that.quantity,_that.totalPrice);case _PlaceOrderLoading() when placeOrderLoading != null:
return placeOrderLoading();case _PlaceOrderSuccess() when placeOrderSuccess != null:
return placeOrderSuccess();case _PlaceOrderError() when placeOrderError != null:
return placeOrderError(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( int quantity,  int totalPrice)  quantityUpdated,required TResult Function()  placeOrderLoading,required TResult Function()  placeOrderSuccess,required TResult Function( String message)  placeOrderError,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _QuantityUpdated():
return quantityUpdated(_that.quantity,_that.totalPrice);case _PlaceOrderLoading():
return placeOrderLoading();case _PlaceOrderSuccess():
return placeOrderSuccess();case _PlaceOrderError():
return placeOrderError(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( int quantity,  int totalPrice)?  quantityUpdated,TResult? Function()?  placeOrderLoading,TResult? Function()?  placeOrderSuccess,TResult? Function( String message)?  placeOrderError,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _QuantityUpdated() when quantityUpdated != null:
return quantityUpdated(_that.quantity,_that.totalPrice);case _PlaceOrderLoading() when placeOrderLoading != null:
return placeOrderLoading();case _PlaceOrderSuccess() when placeOrderSuccess != null:
return placeOrderSuccess();case _PlaceOrderError() when placeOrderError != null:
return placeOrderError(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CheckoutState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoutState.initial()';
}


}




/// @nodoc


class _QuantityUpdated implements CheckoutState {
  const _QuantityUpdated({required this.quantity, required this.totalPrice});
  

 final  int quantity;
 final  int totalPrice;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuantityUpdatedCopyWith<_QuantityUpdated> get copyWith => __$QuantityUpdatedCopyWithImpl<_QuantityUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuantityUpdated&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice));
}


@override
int get hashCode => Object.hash(runtimeType,quantity,totalPrice);

@override
String toString() {
  return 'CheckoutState.quantityUpdated(quantity: $quantity, totalPrice: $totalPrice)';
}


}

/// @nodoc
abstract mixin class _$QuantityUpdatedCopyWith<$Res> implements $CheckoutStateCopyWith<$Res> {
  factory _$QuantityUpdatedCopyWith(_QuantityUpdated value, $Res Function(_QuantityUpdated) _then) = __$QuantityUpdatedCopyWithImpl;
@useResult
$Res call({
 int quantity, int totalPrice
});




}
/// @nodoc
class __$QuantityUpdatedCopyWithImpl<$Res>
    implements _$QuantityUpdatedCopyWith<$Res> {
  __$QuantityUpdatedCopyWithImpl(this._self, this._then);

  final _QuantityUpdated _self;
  final $Res Function(_QuantityUpdated) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? quantity = null,Object? totalPrice = null,}) {
  return _then(_QuantityUpdated(
quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _PlaceOrderLoading implements CheckoutState {
  const _PlaceOrderLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaceOrderLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoutState.placeOrderLoading()';
}


}




/// @nodoc


class _PlaceOrderSuccess implements CheckoutState {
  const _PlaceOrderSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaceOrderSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoutState.placeOrderSuccess()';
}


}




/// @nodoc


class _PlaceOrderError implements CheckoutState {
  const _PlaceOrderError({required this.message});
  

 final  String message;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaceOrderErrorCopyWith<_PlaceOrderError> get copyWith => __$PlaceOrderErrorCopyWithImpl<_PlaceOrderError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaceOrderError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CheckoutState.placeOrderError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$PlaceOrderErrorCopyWith<$Res> implements $CheckoutStateCopyWith<$Res> {
  factory _$PlaceOrderErrorCopyWith(_PlaceOrderError value, $Res Function(_PlaceOrderError) _then) = __$PlaceOrderErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$PlaceOrderErrorCopyWithImpl<$Res>
    implements _$PlaceOrderErrorCopyWith<$Res> {
  __$PlaceOrderErrorCopyWithImpl(this._self, this._then);

  final _PlaceOrderError _self;
  final $Res Function(_PlaceOrderError) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_PlaceOrderError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
