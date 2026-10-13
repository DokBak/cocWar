// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BadgeUrls {

 String? get small; String? get medium; String? get large;
/// Create a copy of BadgeUrls
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BadgeUrlsCopyWith<BadgeUrls> get copyWith => _$BadgeUrlsCopyWithImpl<BadgeUrls>(this as BadgeUrls, _$identity);

  /// Serializes this BadgeUrls to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BadgeUrls;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BadgeUrls&&(identical(other.small, _this.small) || other.small == _this.small)&&(identical(other.medium, _this.medium) || other.medium == _this.medium)&&(identical(other.large, _this.large) || other.large == _this.large));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BadgeUrls;
  return Object.hash(runtimeType,_this.small,_this.medium,_this.large);
}

@override
String toString() {
  final _this = this as BadgeUrls;
  return 'BadgeUrls(small: ${_this.small}, medium: ${_this.medium}, large: ${_this.large})';
}


}

/// @nodoc
abstract mixin class $BadgeUrlsCopyWith<$Res>  {
  factory $BadgeUrlsCopyWith(BadgeUrls value, $Res Function(BadgeUrls) _then) = _$BadgeUrlsCopyWithImpl;
@useResult
$Res call({
 String? small, String? medium, String? large
});




}
/// @nodoc
class _$BadgeUrlsCopyWithImpl<$Res>
    implements $BadgeUrlsCopyWith<$Res> {
  _$BadgeUrlsCopyWithImpl(this._self, this._then);

  final BadgeUrls _self;
  final $Res Function(BadgeUrls) _then;

/// Create a copy of BadgeUrls
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? small = freezed,Object? medium = freezed,Object? large = freezed,}) {
  return _then(BadgeUrls(
small: freezed == small ? _self.small : small // ignore: cast_nullable_to_non_nullable
as String?,medium: freezed == medium ? _self.medium : medium // ignore: cast_nullable_to_non_nullable
as String?,large: freezed == large ? _self.large : large // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BadgeUrls].
extension BadgeUrlsPatterns on BadgeUrls {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BadgeUrls value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BadgeUrls() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BadgeUrls value)  $default,){
final _that = this;
switch (_that) {
case _BadgeUrls():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BadgeUrls value)?  $default,){
final _that = this;
switch (_that) {
case _BadgeUrls() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? small,  String? medium,  String? large)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BadgeUrls() when $default != null:
return $default(_that.small,_that.medium,_that.large);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? small,  String? medium,  String? large)  $default,) {final _that = this;
switch (_that) {
case _BadgeUrls():
return $default(_that.small,_that.medium,_that.large);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? small,  String? medium,  String? large)?  $default,) {final _that = this;
switch (_that) {
case _BadgeUrls() when $default != null:
return $default(_that.small,_that.medium,_that.large);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BadgeUrls implements BadgeUrls {
  const _BadgeUrls({this.small, this.medium, this.large});
  factory _BadgeUrls.fromJson(Map<String, dynamic> json) => _$BadgeUrlsFromJson(json);

@override final  String? small;
@override final  String? medium;
@override final  String? large;

/// Create a copy of BadgeUrls
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BadgeUrlsCopyWith<_BadgeUrls> get copyWith => __$BadgeUrlsCopyWithImpl<_BadgeUrls>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BadgeUrlsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BadgeUrls&&(identical(other.small, small) || other.small == small)&&(identical(other.medium, medium) || other.medium == medium)&&(identical(other.large, large) || other.large == large));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,small,medium,large);
}

@override
String toString() {
    return 'BadgeUrls(small: $small, medium: $medium, large: $large)';
}


}

/// @nodoc
abstract mixin class _$BadgeUrlsCopyWith<$Res> implements $BadgeUrlsCopyWith<$Res> {
  factory _$BadgeUrlsCopyWith(_BadgeUrls value, $Res Function(_BadgeUrls) _then) = __$BadgeUrlsCopyWithImpl;
@override @useResult
$Res call({
 String? small, String? medium, String? large
});




}
/// @nodoc
class __$BadgeUrlsCopyWithImpl<$Res>
    implements _$BadgeUrlsCopyWith<$Res> {
  __$BadgeUrlsCopyWithImpl(this._self, this._then);

  final _BadgeUrls _self;
  final $Res Function(_BadgeUrls) _then;

/// Create a copy of BadgeUrls
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? small = freezed,Object? medium = freezed,Object? large = freezed,}) {
  return _then(_BadgeUrls(
small: freezed == small ? _self.small : small // ignore: cast_nullable_to_non_nullable
as String?,medium: freezed == medium ? _self.medium : medium // ignore: cast_nullable_to_non_nullable
as String?,large: freezed == large ? _self.large : large // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$IconUrls {

 String? get tiny; String? get small; String? get medium; String? get large;
/// Create a copy of IconUrls
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IconUrlsCopyWith<IconUrls> get copyWith => _$IconUrlsCopyWithImpl<IconUrls>(this as IconUrls, _$identity);

  /// Serializes this IconUrls to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as IconUrls;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IconUrls&&(identical(other.tiny, _this.tiny) || other.tiny == _this.tiny)&&(identical(other.small, _this.small) || other.small == _this.small)&&(identical(other.medium, _this.medium) || other.medium == _this.medium)&&(identical(other.large, _this.large) || other.large == _this.large));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as IconUrls;
  return Object.hash(runtimeType,_this.tiny,_this.small,_this.medium,_this.large);
}

@override
String toString() {
  final _this = this as IconUrls;
  return 'IconUrls(tiny: ${_this.tiny}, small: ${_this.small}, medium: ${_this.medium}, large: ${_this.large})';
}


}

/// @nodoc
abstract mixin class $IconUrlsCopyWith<$Res>  {
  factory $IconUrlsCopyWith(IconUrls value, $Res Function(IconUrls) _then) = _$IconUrlsCopyWithImpl;
@useResult
$Res call({
 String? tiny, String? small, String? medium, String? large
});




}
/// @nodoc
class _$IconUrlsCopyWithImpl<$Res>
    implements $IconUrlsCopyWith<$Res> {
  _$IconUrlsCopyWithImpl(this._self, this._then);

  final IconUrls _self;
  final $Res Function(IconUrls) _then;

/// Create a copy of IconUrls
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tiny = freezed,Object? small = freezed,Object? medium = freezed,Object? large = freezed,}) {
  return _then(IconUrls(
tiny: freezed == tiny ? _self.tiny : tiny // ignore: cast_nullable_to_non_nullable
as String?,small: freezed == small ? _self.small : small // ignore: cast_nullable_to_non_nullable
as String?,medium: freezed == medium ? _self.medium : medium // ignore: cast_nullable_to_non_nullable
as String?,large: freezed == large ? _self.large : large // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [IconUrls].
extension IconUrlsPatterns on IconUrls {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IconUrls value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IconUrls() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IconUrls value)  $default,){
final _that = this;
switch (_that) {
case _IconUrls():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IconUrls value)?  $default,){
final _that = this;
switch (_that) {
case _IconUrls() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? tiny,  String? small,  String? medium,  String? large)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IconUrls() when $default != null:
return $default(_that.tiny,_that.small,_that.medium,_that.large);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? tiny,  String? small,  String? medium,  String? large)  $default,) {final _that = this;
switch (_that) {
case _IconUrls():
return $default(_that.tiny,_that.small,_that.medium,_that.large);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? tiny,  String? small,  String? medium,  String? large)?  $default,) {final _that = this;
switch (_that) {
case _IconUrls() when $default != null:
return $default(_that.tiny,_that.small,_that.medium,_that.large);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IconUrls implements IconUrls {
  const _IconUrls({this.tiny, this.small, this.medium, this.large});
  factory _IconUrls.fromJson(Map<String, dynamic> json) => _$IconUrlsFromJson(json);

@override final  String? tiny;
@override final  String? small;
@override final  String? medium;
@override final  String? large;

/// Create a copy of IconUrls
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IconUrlsCopyWith<_IconUrls> get copyWith => __$IconUrlsCopyWithImpl<_IconUrls>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IconUrlsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _IconUrls&&(identical(other.tiny, tiny) || other.tiny == tiny)&&(identical(other.small, small) || other.small == small)&&(identical(other.medium, medium) || other.medium == medium)&&(identical(other.large, large) || other.large == large));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,tiny,small,medium,large);
}

@override
String toString() {
    return 'IconUrls(tiny: $tiny, small: $small, medium: $medium, large: $large)';
}


}

/// @nodoc
abstract mixin class _$IconUrlsCopyWith<$Res> implements $IconUrlsCopyWith<$Res> {
  factory _$IconUrlsCopyWith(_IconUrls value, $Res Function(_IconUrls) _then) = __$IconUrlsCopyWithImpl;
@override @useResult
$Res call({
 String? tiny, String? small, String? medium, String? large
});




}
/// @nodoc
class __$IconUrlsCopyWithImpl<$Res>
    implements _$IconUrlsCopyWith<$Res> {
  __$IconUrlsCopyWithImpl(this._self, this._then);

  final _IconUrls _self;
  final $Res Function(_IconUrls) _then;

/// Create a copy of IconUrls
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tiny = freezed,Object? small = freezed,Object? medium = freezed,Object? large = freezed,}) {
  return _then(_IconUrls(
tiny: freezed == tiny ? _self.tiny : tiny // ignore: cast_nullable_to_non_nullable
as String?,small: freezed == small ? _self.small : small // ignore: cast_nullable_to_non_nullable
as String?,medium: freezed == medium ? _self.medium : medium // ignore: cast_nullable_to_non_nullable
as String?,large: freezed == large ? _self.large : large // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Label {

 int? get id; String? get name; IconUrls? get iconUrls;
/// Create a copy of Label
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LabelCopyWith<Label> get copyWith => _$LabelCopyWithImpl<Label>(this as Label, _$identity);

  /// Serializes this Label to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Label;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Label&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.iconUrls, _this.iconUrls) || other.iconUrls == _this.iconUrls));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Label;
  return Object.hash(runtimeType,_this.id,_this.name,_this.iconUrls);
}

@override
String toString() {
  final _this = this as Label;
  return 'Label(id: ${_this.id}, name: ${_this.name}, iconUrls: ${_this.iconUrls})';
}


}

/// @nodoc
abstract mixin class $LabelCopyWith<$Res>  {
  factory $LabelCopyWith(Label value, $Res Function(Label) _then) = _$LabelCopyWithImpl;
@useResult
$Res call({
 int? id, String? name, IconUrls? iconUrls
});


$IconUrlsCopyWith<$Res>? get iconUrls;

}
/// @nodoc
class _$LabelCopyWithImpl<$Res>
    implements $LabelCopyWith<$Res> {
  _$LabelCopyWithImpl(this._self, this._then);

  final Label _self;
  final $Res Function(Label) _then;

/// Create a copy of Label
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? iconUrls = freezed,}) {
  return _then(Label(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,iconUrls: freezed == iconUrls ? _self.iconUrls : iconUrls // ignore: cast_nullable_to_non_nullable
as IconUrls?,
  ));
}
/// Create a copy of Label
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IconUrlsCopyWith<$Res>? get iconUrls {
    if (_self.iconUrls == null) {
    return null;
  }

  return $IconUrlsCopyWith<$Res>(_self.iconUrls!, (value) {
    return _then(_self.copyWith(iconUrls: value));
  });
}
}


/// Adds pattern-matching-related methods to [Label].
extension LabelPatterns on Label {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Label value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Label() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Label value)  $default,){
final _that = this;
switch (_that) {
case _Label():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Label value)?  $default,){
final _that = this;
switch (_that) {
case _Label() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? name,  IconUrls? iconUrls)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Label() when $default != null:
return $default(_that.id,_that.name,_that.iconUrls);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? name,  IconUrls? iconUrls)  $default,) {final _that = this;
switch (_that) {
case _Label():
return $default(_that.id,_that.name,_that.iconUrls);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? name,  IconUrls? iconUrls)?  $default,) {final _that = this;
switch (_that) {
case _Label() when $default != null:
return $default(_that.id,_that.name,_that.iconUrls);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Label implements Label {
  const _Label({this.id, this.name, this.iconUrls});
  factory _Label.fromJson(Map<String, dynamic> json) => _$LabelFromJson(json);

@override final  int? id;
@override final  String? name;
@override final  IconUrls? iconUrls;

/// Create a copy of Label
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LabelCopyWith<_Label> get copyWith => __$LabelCopyWithImpl<_Label>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LabelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Label&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.iconUrls, iconUrls) || other.iconUrls == iconUrls));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,iconUrls);
}

@override
String toString() {
    return 'Label(id: $id, name: $name, iconUrls: $iconUrls)';
}


}

/// @nodoc
abstract mixin class _$LabelCopyWith<$Res> implements $LabelCopyWith<$Res> {
  factory _$LabelCopyWith(_Label value, $Res Function(_Label) _then) = __$LabelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? name, IconUrls? iconUrls
});


@override $IconUrlsCopyWith<$Res>? get iconUrls;

}
/// @nodoc
class __$LabelCopyWithImpl<$Res>
    implements _$LabelCopyWith<$Res> {
  __$LabelCopyWithImpl(this._self, this._then);

  final _Label _self;
  final $Res Function(_Label) _then;

/// Create a copy of Label
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? iconUrls = freezed,}) {
  return _then(_Label(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,iconUrls: freezed == iconUrls ? _self.iconUrls : iconUrls // ignore: cast_nullable_to_non_nullable
as IconUrls?,
  ));
}

/// Create a copy of Label
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IconUrlsCopyWith<$Res>? get iconUrls {
    if (_self.iconUrls == null) {
    return null;
  }

  return $IconUrlsCopyWith<$Res>(_self.iconUrls!, (value) {
    return _then(_self.copyWith(iconUrls: value));
  });
}
}


/// @nodoc
mixin _$League {

 int? get id; String? get name; IconUrls? get iconUrls;
/// Create a copy of League
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeagueCopyWith<League> get copyWith => _$LeagueCopyWithImpl<League>(this as League, _$identity);

  /// Serializes this League to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as League;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is League&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.iconUrls, _this.iconUrls) || other.iconUrls == _this.iconUrls));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as League;
  return Object.hash(runtimeType,_this.id,_this.name,_this.iconUrls);
}

@override
String toString() {
  final _this = this as League;
  return 'League(id: ${_this.id}, name: ${_this.name}, iconUrls: ${_this.iconUrls})';
}


}

/// @nodoc
abstract mixin class $LeagueCopyWith<$Res>  {
  factory $LeagueCopyWith(League value, $Res Function(League) _then) = _$LeagueCopyWithImpl;
@useResult
$Res call({
 int? id, String? name, IconUrls? iconUrls
});


$IconUrlsCopyWith<$Res>? get iconUrls;

}
/// @nodoc
class _$LeagueCopyWithImpl<$Res>
    implements $LeagueCopyWith<$Res> {
  _$LeagueCopyWithImpl(this._self, this._then);

  final League _self;
  final $Res Function(League) _then;

/// Create a copy of League
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? iconUrls = freezed,}) {
  return _then(League(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,iconUrls: freezed == iconUrls ? _self.iconUrls : iconUrls // ignore: cast_nullable_to_non_nullable
as IconUrls?,
  ));
}
/// Create a copy of League
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IconUrlsCopyWith<$Res>? get iconUrls {
    if (_self.iconUrls == null) {
    return null;
  }

  return $IconUrlsCopyWith<$Res>(_self.iconUrls!, (value) {
    return _then(_self.copyWith(iconUrls: value));
  });
}
}


/// Adds pattern-matching-related methods to [League].
extension LeaguePatterns on League {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _League value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _League() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _League value)  $default,){
final _that = this;
switch (_that) {
case _League():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _League value)?  $default,){
final _that = this;
switch (_that) {
case _League() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? name,  IconUrls? iconUrls)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _League() when $default != null:
return $default(_that.id,_that.name,_that.iconUrls);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? name,  IconUrls? iconUrls)  $default,) {final _that = this;
switch (_that) {
case _League():
return $default(_that.id,_that.name,_that.iconUrls);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? name,  IconUrls? iconUrls)?  $default,) {final _that = this;
switch (_that) {
case _League() when $default != null:
return $default(_that.id,_that.name,_that.iconUrls);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _League implements League {
  const _League({this.id, this.name, this.iconUrls});
  factory _League.fromJson(Map<String, dynamic> json) => _$LeagueFromJson(json);

@override final  int? id;
@override final  String? name;
@override final  IconUrls? iconUrls;

/// Create a copy of League
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeagueCopyWith<_League> get copyWith => __$LeagueCopyWithImpl<_League>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeagueToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _League&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.iconUrls, iconUrls) || other.iconUrls == iconUrls));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,iconUrls);
}

@override
String toString() {
    return 'League(id: $id, name: $name, iconUrls: $iconUrls)';
}


}

/// @nodoc
abstract mixin class _$LeagueCopyWith<$Res> implements $LeagueCopyWith<$Res> {
  factory _$LeagueCopyWith(_League value, $Res Function(_League) _then) = __$LeagueCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? name, IconUrls? iconUrls
});


@override $IconUrlsCopyWith<$Res>? get iconUrls;

}
/// @nodoc
class __$LeagueCopyWithImpl<$Res>
    implements _$LeagueCopyWith<$Res> {
  __$LeagueCopyWithImpl(this._self, this._then);

  final _League _self;
  final $Res Function(_League) _then;

/// Create a copy of League
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? iconUrls = freezed,}) {
  return _then(_League(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,iconUrls: freezed == iconUrls ? _self.iconUrls : iconUrls // ignore: cast_nullable_to_non_nullable
as IconUrls?,
  ));
}

/// Create a copy of League
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IconUrlsCopyWith<$Res>? get iconUrls {
    if (_self.iconUrls == null) {
    return null;
  }

  return $IconUrlsCopyWith<$Res>(_self.iconUrls!, (value) {
    return _then(_self.copyWith(iconUrls: value));
  });
}
}


/// @nodoc
mixin _$Location {

 int? get id; String? get name; bool? get isCountry; String? get countryCode;
/// Create a copy of Location
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationCopyWith<Location> get copyWith => _$LocationCopyWithImpl<Location>(this as Location, _$identity);

  /// Serializes this Location to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Location;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Location&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.isCountry, _this.isCountry) || other.isCountry == _this.isCountry)&&(identical(other.countryCode, _this.countryCode) || other.countryCode == _this.countryCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Location;
  return Object.hash(runtimeType,_this.id,_this.name,_this.isCountry,_this.countryCode);
}

@override
String toString() {
  final _this = this as Location;
  return 'Location(id: ${_this.id}, name: ${_this.name}, isCountry: ${_this.isCountry}, countryCode: ${_this.countryCode})';
}


}

/// @nodoc
abstract mixin class $LocationCopyWith<$Res>  {
  factory $LocationCopyWith(Location value, $Res Function(Location) _then) = _$LocationCopyWithImpl;
@useResult
$Res call({
 int? id, String? name, bool? isCountry, String? countryCode
});




}
/// @nodoc
class _$LocationCopyWithImpl<$Res>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._self, this._then);

  final Location _self;
  final $Res Function(Location) _then;

/// Create a copy of Location
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? isCountry = freezed,Object? countryCode = freezed,}) {
  return _then(Location(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,isCountry: freezed == isCountry ? _self.isCountry : isCountry // ignore: cast_nullable_to_non_nullable
as bool?,countryCode: freezed == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Location].
extension LocationPatterns on Location {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Location value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Location() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Location value)  $default,){
final _that = this;
switch (_that) {
case _Location():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Location value)?  $default,){
final _that = this;
switch (_that) {
case _Location() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? name,  bool? isCountry,  String? countryCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Location() when $default != null:
return $default(_that.id,_that.name,_that.isCountry,_that.countryCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? name,  bool? isCountry,  String? countryCode)  $default,) {final _that = this;
switch (_that) {
case _Location():
return $default(_that.id,_that.name,_that.isCountry,_that.countryCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? name,  bool? isCountry,  String? countryCode)?  $default,) {final _that = this;
switch (_that) {
case _Location() when $default != null:
return $default(_that.id,_that.name,_that.isCountry,_that.countryCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Location implements Location {
  const _Location({this.id, this.name, this.isCountry, this.countryCode});
  factory _Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

@override final  int? id;
@override final  String? name;
@override final  bool? isCountry;
@override final  String? countryCode;

/// Create a copy of Location
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationCopyWith<_Location> get copyWith => __$LocationCopyWithImpl<_Location>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Location&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.isCountry, isCountry) || other.isCountry == isCountry)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,isCountry,countryCode);
}

@override
String toString() {
    return 'Location(id: $id, name: $name, isCountry: $isCountry, countryCode: $countryCode)';
}


}

/// @nodoc
abstract mixin class _$LocationCopyWith<$Res> implements $LocationCopyWith<$Res> {
  factory _$LocationCopyWith(_Location value, $Res Function(_Location) _then) = __$LocationCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? name, bool? isCountry, String? countryCode
});




}
/// @nodoc
class __$LocationCopyWithImpl<$Res>
    implements _$LocationCopyWith<$Res> {
  __$LocationCopyWithImpl(this._self, this._then);

  final _Location _self;
  final $Res Function(_Location) _then;

/// Create a copy of Location
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? isCountry = freezed,Object? countryCode = freezed,}) {
  return _then(_Location(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,isCountry: freezed == isCountry ? _self.isCountry : isCountry // ignore: cast_nullable_to_non_nullable
as bool?,countryCode: freezed == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
