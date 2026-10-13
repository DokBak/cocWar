// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paging.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Cursors {

 String? get after; String? get before;
/// Create a copy of Cursors
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CursorsCopyWith<Cursors> get copyWith => _$CursorsCopyWithImpl<Cursors>(this as Cursors, _$identity);

  /// Serializes this Cursors to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Cursors;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Cursors&&(identical(other.after, _this.after) || other.after == _this.after)&&(identical(other.before, _this.before) || other.before == _this.before));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Cursors;
  return Object.hash(runtimeType,_this.after,_this.before);
}

@override
String toString() {
  final _this = this as Cursors;
  return 'Cursors(after: ${_this.after}, before: ${_this.before})';
}


}

/// @nodoc
abstract mixin class $CursorsCopyWith<$Res>  {
  factory $CursorsCopyWith(Cursors value, $Res Function(Cursors) _then) = _$CursorsCopyWithImpl;
@useResult
$Res call({
 String? after, String? before
});




}
/// @nodoc
class _$CursorsCopyWithImpl<$Res>
    implements $CursorsCopyWith<$Res> {
  _$CursorsCopyWithImpl(this._self, this._then);

  final Cursors _self;
  final $Res Function(Cursors) _then;

/// Create a copy of Cursors
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? after = freezed,Object? before = freezed,}) {
  return _then(Cursors(
after: freezed == after ? _self.after : after // ignore: cast_nullable_to_non_nullable
as String?,before: freezed == before ? _self.before : before // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Cursors].
extension CursorsPatterns on Cursors {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Cursors value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Cursors() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Cursors value)  $default,){
final _that = this;
switch (_that) {
case _Cursors():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Cursors value)?  $default,){
final _that = this;
switch (_that) {
case _Cursors() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? after,  String? before)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Cursors() when $default != null:
return $default(_that.after,_that.before);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? after,  String? before)  $default,) {final _that = this;
switch (_that) {
case _Cursors():
return $default(_that.after,_that.before);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? after,  String? before)?  $default,) {final _that = this;
switch (_that) {
case _Cursors() when $default != null:
return $default(_that.after,_that.before);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Cursors implements Cursors {
  const _Cursors({this.after, this.before});
  factory _Cursors.fromJson(Map<String, dynamic> json) => _$CursorsFromJson(json);

@override final  String? after;
@override final  String? before;

/// Create a copy of Cursors
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CursorsCopyWith<_Cursors> get copyWith => __$CursorsCopyWithImpl<_Cursors>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CursorsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Cursors&&(identical(other.after, after) || other.after == after)&&(identical(other.before, before) || other.before == before));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,after,before);
}

@override
String toString() {
    return 'Cursors(after: $after, before: $before)';
}


}

/// @nodoc
abstract mixin class _$CursorsCopyWith<$Res> implements $CursorsCopyWith<$Res> {
  factory _$CursorsCopyWith(_Cursors value, $Res Function(_Cursors) _then) = __$CursorsCopyWithImpl;
@override @useResult
$Res call({
 String? after, String? before
});




}
/// @nodoc
class __$CursorsCopyWithImpl<$Res>
    implements _$CursorsCopyWith<$Res> {
  __$CursorsCopyWithImpl(this._self, this._then);

  final _Cursors _self;
  final $Res Function(_Cursors) _then;

/// Create a copy of Cursors
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? after = freezed,Object? before = freezed,}) {
  return _then(_Cursors(
after: freezed == after ? _self.after : after // ignore: cast_nullable_to_non_nullable
as String?,before: freezed == before ? _self.before : before // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Paging {

 Cursors? get cursors;
/// Create a copy of Paging
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PagingCopyWith<Paging> get copyWith => _$PagingCopyWithImpl<Paging>(this as Paging, _$identity);

  /// Serializes this Paging to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Paging;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Paging&&(identical(other.cursors, _this.cursors) || other.cursors == _this.cursors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Paging;
  return Object.hash(runtimeType,_this.cursors);
}

@override
String toString() {
  final _this = this as Paging;
  return 'Paging(cursors: ${_this.cursors})';
}


}

/// @nodoc
abstract mixin class $PagingCopyWith<$Res>  {
  factory $PagingCopyWith(Paging value, $Res Function(Paging) _then) = _$PagingCopyWithImpl;
@useResult
$Res call({
 Cursors? cursors
});


$CursorsCopyWith<$Res>? get cursors;

}
/// @nodoc
class _$PagingCopyWithImpl<$Res>
    implements $PagingCopyWith<$Res> {
  _$PagingCopyWithImpl(this._self, this._then);

  final Paging _self;
  final $Res Function(Paging) _then;

/// Create a copy of Paging
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cursors = freezed,}) {
  return _then(Paging(
cursors: freezed == cursors ? _self.cursors : cursors // ignore: cast_nullable_to_non_nullable
as Cursors?,
  ));
}
/// Create a copy of Paging
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CursorsCopyWith<$Res>? get cursors {
    if (_self.cursors == null) {
    return null;
  }

  return $CursorsCopyWith<$Res>(_self.cursors!, (value) {
    return _then(_self.copyWith(cursors: value));
  });
}
}


/// Adds pattern-matching-related methods to [Paging].
extension PagingPatterns on Paging {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Paging value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Paging() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Paging value)  $default,){
final _that = this;
switch (_that) {
case _Paging():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Paging value)?  $default,){
final _that = this;
switch (_that) {
case _Paging() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Cursors? cursors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Paging() when $default != null:
return $default(_that.cursors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Cursors? cursors)  $default,) {final _that = this;
switch (_that) {
case _Paging():
return $default(_that.cursors);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Cursors? cursors)?  $default,) {final _that = this;
switch (_that) {
case _Paging() when $default != null:
return $default(_that.cursors);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Paging implements Paging {
  const _Paging({this.cursors});
  factory _Paging.fromJson(Map<String, dynamic> json) => _$PagingFromJson(json);

@override final  Cursors? cursors;

/// Create a copy of Paging
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PagingCopyWith<_Paging> get copyWith => __$PagingCopyWithImpl<_Paging>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PagingToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Paging&&(identical(other.cursors, cursors) || other.cursors == cursors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,cursors);
}

@override
String toString() {
    return 'Paging(cursors: $cursors)';
}


}

/// @nodoc
abstract mixin class _$PagingCopyWith<$Res> implements $PagingCopyWith<$Res> {
  factory _$PagingCopyWith(_Paging value, $Res Function(_Paging) _then) = __$PagingCopyWithImpl;
@override @useResult
$Res call({
 Cursors? cursors
});


@override $CursorsCopyWith<$Res>? get cursors;

}
/// @nodoc
class __$PagingCopyWithImpl<$Res>
    implements _$PagingCopyWith<$Res> {
  __$PagingCopyWithImpl(this._self, this._then);

  final _Paging _self;
  final $Res Function(_Paging) _then;

/// Create a copy of Paging
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cursors = freezed,}) {
  return _then(_Paging(
cursors: freezed == cursors ? _self.cursors : cursors // ignore: cast_nullable_to_non_nullable
as Cursors?,
  ));
}

/// Create a copy of Paging
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CursorsCopyWith<$Res>? get cursors {
    if (_self.cursors == null) {
    return null;
  }

  return $CursorsCopyWith<$Res>(_self.cursors!, (value) {
    return _then(_self.copyWith(cursors: value));
  });
}
}

// dart format on
