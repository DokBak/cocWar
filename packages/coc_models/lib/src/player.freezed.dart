// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlayerItem {

 String? get name; int? get level; int? get maxLevel; String? get village; bool? get superTroopIsActive; List<PlayerItem> get equipment;
/// Create a copy of PlayerItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerItemCopyWith<PlayerItem> get copyWith => _$PlayerItemCopyWithImpl<PlayerItem>(this as PlayerItem, _$identity);

  /// Serializes this PlayerItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PlayerItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerItem&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.level, _this.level) || other.level == _this.level)&&(identical(other.maxLevel, _this.maxLevel) || other.maxLevel == _this.maxLevel)&&(identical(other.village, _this.village) || other.village == _this.village)&&(identical(other.superTroopIsActive, _this.superTroopIsActive) || other.superTroopIsActive == _this.superTroopIsActive)&&const DeepCollectionEquality().equals(other.equipment, _this.equipment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PlayerItem;
  return Object.hash(runtimeType,_this.name,_this.level,_this.maxLevel,_this.village,_this.superTroopIsActive,const DeepCollectionEquality().hash(_this.equipment));
}

@override
String toString() {
  final _this = this as PlayerItem;
  return 'PlayerItem(name: ${_this.name}, level: ${_this.level}, maxLevel: ${_this.maxLevel}, village: ${_this.village}, superTroopIsActive: ${_this.superTroopIsActive}, equipment: ${_this.equipment})';
}


}

/// @nodoc
abstract mixin class $PlayerItemCopyWith<$Res>  {
  factory $PlayerItemCopyWith(PlayerItem value, $Res Function(PlayerItem) _then) = _$PlayerItemCopyWithImpl;
@useResult
$Res call({
 String? name, int? level, int? maxLevel, String? village, bool? superTroopIsActive, List<PlayerItem> equipment
});




}
/// @nodoc
class _$PlayerItemCopyWithImpl<$Res>
    implements $PlayerItemCopyWith<$Res> {
  _$PlayerItemCopyWithImpl(this._self, this._then);

  final PlayerItem _self;
  final $Res Function(PlayerItem) _then;

/// Create a copy of PlayerItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? level = freezed,Object? maxLevel = freezed,Object? village = freezed,Object? superTroopIsActive = freezed,Object? equipment = null,}) {
  return _then(PlayerItem(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int?,maxLevel: freezed == maxLevel ? _self.maxLevel : maxLevel // ignore: cast_nullable_to_non_nullable
as int?,village: freezed == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as String?,superTroopIsActive: freezed == superTroopIsActive ? _self.superTroopIsActive : superTroopIsActive // ignore: cast_nullable_to_non_nullable
as bool?,equipment: null == equipment ? _self.equipment : equipment // ignore: cast_nullable_to_non_nullable
as List<PlayerItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [PlayerItem].
extension PlayerItemPatterns on PlayerItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayerItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayerItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayerItem value)  $default,){
final _that = this;
switch (_that) {
case _PlayerItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayerItem value)?  $default,){
final _that = this;
switch (_that) {
case _PlayerItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  int? level,  int? maxLevel,  String? village,  bool? superTroopIsActive,  List<PlayerItem> equipment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayerItem() when $default != null:
return $default(_that.name,_that.level,_that.maxLevel,_that.village,_that.superTroopIsActive,_that.equipment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  int? level,  int? maxLevel,  String? village,  bool? superTroopIsActive,  List<PlayerItem> equipment)  $default,) {final _that = this;
switch (_that) {
case _PlayerItem():
return $default(_that.name,_that.level,_that.maxLevel,_that.village,_that.superTroopIsActive,_that.equipment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  int? level,  int? maxLevel,  String? village,  bool? superTroopIsActive,  List<PlayerItem> equipment)?  $default,) {final _that = this;
switch (_that) {
case _PlayerItem() when $default != null:
return $default(_that.name,_that.level,_that.maxLevel,_that.village,_that.superTroopIsActive,_that.equipment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlayerItem implements PlayerItem {
  const _PlayerItem({this.name, this.level, this.maxLevel, this.village, this.superTroopIsActive,  List<PlayerItem> equipment = const <PlayerItem>[]}): _equipment = equipment;
  factory _PlayerItem.fromJson(Map<String, dynamic> json) => _$PlayerItemFromJson(json);

@override final  String? name;
@override final  int? level;
@override final  int? maxLevel;
@override final  String? village;
@override final  bool? superTroopIsActive;
 final  List<PlayerItem> _equipment;
@override@JsonKey() List<PlayerItem> get equipment {
  if (_equipment is EqualUnmodifiableListView) return _equipment;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_equipment);
}


/// Create a copy of PlayerItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerItemCopyWith<_PlayerItem> get copyWith => __$PlayerItemCopyWithImpl<_PlayerItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlayerItemToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerItem&&(identical(other.name, name) || other.name == name)&&(identical(other.level, level) || other.level == level)&&(identical(other.maxLevel, maxLevel) || other.maxLevel == maxLevel)&&(identical(other.village, village) || other.village == village)&&(identical(other.superTroopIsActive, superTroopIsActive) || other.superTroopIsActive == superTroopIsActive)&&const DeepCollectionEquality().equals(other.equipment, _equipment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,level,maxLevel,village,superTroopIsActive,const DeepCollectionEquality().hash(_equipment));
}

@override
String toString() {
    return 'PlayerItem(name: $name, level: $level, maxLevel: $maxLevel, village: $village, superTroopIsActive: $superTroopIsActive, equipment: $equipment)';
}


}

/// @nodoc
abstract mixin class _$PlayerItemCopyWith<$Res> implements $PlayerItemCopyWith<$Res> {
  factory _$PlayerItemCopyWith(_PlayerItem value, $Res Function(_PlayerItem) _then) = __$PlayerItemCopyWithImpl;
@override @useResult
$Res call({
 String? name, int? level, int? maxLevel, String? village, bool? superTroopIsActive, List<PlayerItem> equipment
});




}
/// @nodoc
class __$PlayerItemCopyWithImpl<$Res>
    implements _$PlayerItemCopyWith<$Res> {
  __$PlayerItemCopyWithImpl(this._self, this._then);

  final _PlayerItem _self;
  final $Res Function(_PlayerItem) _then;

/// Create a copy of PlayerItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? level = freezed,Object? maxLevel = freezed,Object? village = freezed,Object? superTroopIsActive = freezed,Object? equipment = null,}) {
  return _then(_PlayerItem(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int?,maxLevel: freezed == maxLevel ? _self.maxLevel : maxLevel // ignore: cast_nullable_to_non_nullable
as int?,village: freezed == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as String?,superTroopIsActive: freezed == superTroopIsActive ? _self.superTroopIsActive : superTroopIsActive // ignore: cast_nullable_to_non_nullable
as bool?,equipment: null == equipment ? _self._equipment : equipment // ignore: cast_nullable_to_non_nullable
as List<PlayerItem>,
  ));
}


}


/// @nodoc
mixin _$PlayerClan {

 String? get tag; String? get name; int? get clanLevel; BadgeUrls? get badgeUrls;
/// Create a copy of PlayerClan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerClanCopyWith<PlayerClan> get copyWith => _$PlayerClanCopyWithImpl<PlayerClan>(this as PlayerClan, _$identity);

  /// Serializes this PlayerClan to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PlayerClan;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerClan&&(identical(other.tag, _this.tag) || other.tag == _this.tag)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.clanLevel, _this.clanLevel) || other.clanLevel == _this.clanLevel)&&(identical(other.badgeUrls, _this.badgeUrls) || other.badgeUrls == _this.badgeUrls));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PlayerClan;
  return Object.hash(runtimeType,_this.tag,_this.name,_this.clanLevel,_this.badgeUrls);
}

@override
String toString() {
  final _this = this as PlayerClan;
  return 'PlayerClan(tag: ${_this.tag}, name: ${_this.name}, clanLevel: ${_this.clanLevel}, badgeUrls: ${_this.badgeUrls})';
}


}

/// @nodoc
abstract mixin class $PlayerClanCopyWith<$Res>  {
  factory $PlayerClanCopyWith(PlayerClan value, $Res Function(PlayerClan) _then) = _$PlayerClanCopyWithImpl;
@useResult
$Res call({
 String? tag, String? name, int? clanLevel, BadgeUrls? badgeUrls
});


$BadgeUrlsCopyWith<$Res>? get badgeUrls;

}
/// @nodoc
class _$PlayerClanCopyWithImpl<$Res>
    implements $PlayerClanCopyWith<$Res> {
  _$PlayerClanCopyWithImpl(this._self, this._then);

  final PlayerClan _self;
  final $Res Function(PlayerClan) _then;

/// Create a copy of PlayerClan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tag = freezed,Object? name = freezed,Object? clanLevel = freezed,Object? badgeUrls = freezed,}) {
  return _then(PlayerClan(
tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,clanLevel: freezed == clanLevel ? _self.clanLevel : clanLevel // ignore: cast_nullable_to_non_nullable
as int?,badgeUrls: freezed == badgeUrls ? _self.badgeUrls : badgeUrls // ignore: cast_nullable_to_non_nullable
as BadgeUrls?,
  ));
}
/// Create a copy of PlayerClan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BadgeUrlsCopyWith<$Res>? get badgeUrls {
    if (_self.badgeUrls == null) {
    return null;
  }

  return $BadgeUrlsCopyWith<$Res>(_self.badgeUrls!, (value) {
    return _then(_self.copyWith(badgeUrls: value));
  });
}
}


/// Adds pattern-matching-related methods to [PlayerClan].
extension PlayerClanPatterns on PlayerClan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayerClan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayerClan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayerClan value)  $default,){
final _that = this;
switch (_that) {
case _PlayerClan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayerClan value)?  $default,){
final _that = this;
switch (_that) {
case _PlayerClan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? tag,  String? name,  int? clanLevel,  BadgeUrls? badgeUrls)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayerClan() when $default != null:
return $default(_that.tag,_that.name,_that.clanLevel,_that.badgeUrls);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? tag,  String? name,  int? clanLevel,  BadgeUrls? badgeUrls)  $default,) {final _that = this;
switch (_that) {
case _PlayerClan():
return $default(_that.tag,_that.name,_that.clanLevel,_that.badgeUrls);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? tag,  String? name,  int? clanLevel,  BadgeUrls? badgeUrls)?  $default,) {final _that = this;
switch (_that) {
case _PlayerClan() when $default != null:
return $default(_that.tag,_that.name,_that.clanLevel,_that.badgeUrls);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlayerClan implements PlayerClan {
  const _PlayerClan({this.tag, this.name, this.clanLevel, this.badgeUrls});
  factory _PlayerClan.fromJson(Map<String, dynamic> json) => _$PlayerClanFromJson(json);

@override final  String? tag;
@override final  String? name;
@override final  int? clanLevel;
@override final  BadgeUrls? badgeUrls;

/// Create a copy of PlayerClan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerClanCopyWith<_PlayerClan> get copyWith => __$PlayerClanCopyWithImpl<_PlayerClan>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlayerClanToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerClan&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.name, name) || other.name == name)&&(identical(other.clanLevel, clanLevel) || other.clanLevel == clanLevel)&&(identical(other.badgeUrls, badgeUrls) || other.badgeUrls == badgeUrls));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,tag,name,clanLevel,badgeUrls);
}

@override
String toString() {
    return 'PlayerClan(tag: $tag, name: $name, clanLevel: $clanLevel, badgeUrls: $badgeUrls)';
}


}

/// @nodoc
abstract mixin class _$PlayerClanCopyWith<$Res> implements $PlayerClanCopyWith<$Res> {
  factory _$PlayerClanCopyWith(_PlayerClan value, $Res Function(_PlayerClan) _then) = __$PlayerClanCopyWithImpl;
@override @useResult
$Res call({
 String? tag, String? name, int? clanLevel, BadgeUrls? badgeUrls
});


@override $BadgeUrlsCopyWith<$Res>? get badgeUrls;

}
/// @nodoc
class __$PlayerClanCopyWithImpl<$Res>
    implements _$PlayerClanCopyWith<$Res> {
  __$PlayerClanCopyWithImpl(this._self, this._then);

  final _PlayerClan _self;
  final $Res Function(_PlayerClan) _then;

/// Create a copy of PlayerClan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tag = freezed,Object? name = freezed,Object? clanLevel = freezed,Object? badgeUrls = freezed,}) {
  return _then(_PlayerClan(
tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,clanLevel: freezed == clanLevel ? _self.clanLevel : clanLevel // ignore: cast_nullable_to_non_nullable
as int?,badgeUrls: freezed == badgeUrls ? _self.badgeUrls : badgeUrls // ignore: cast_nullable_to_non_nullable
as BadgeUrls?,
  ));
}

/// Create a copy of PlayerClan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BadgeUrlsCopyWith<$Res>? get badgeUrls {
    if (_self.badgeUrls == null) {
    return null;
  }

  return $BadgeUrlsCopyWith<$Res>(_self.badgeUrls!, (value) {
    return _then(_self.copyWith(badgeUrls: value));
  });
}
}


/// @nodoc
mixin _$Achievement {

 String? get name; int? get stars; int? get value; int? get target; String? get info; String? get completionInfo; String? get village;
/// Create a copy of Achievement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AchievementCopyWith<Achievement> get copyWith => _$AchievementCopyWithImpl<Achievement>(this as Achievement, _$identity);

  /// Serializes this Achievement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Achievement;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Achievement&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.stars, _this.stars) || other.stars == _this.stars)&&(identical(other.value, _this.value) || other.value == _this.value)&&(identical(other.target, _this.target) || other.target == _this.target)&&(identical(other.info, _this.info) || other.info == _this.info)&&(identical(other.completionInfo, _this.completionInfo) || other.completionInfo == _this.completionInfo)&&(identical(other.village, _this.village) || other.village == _this.village));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Achievement;
  return Object.hash(runtimeType,_this.name,_this.stars,_this.value,_this.target,_this.info,_this.completionInfo,_this.village);
}

@override
String toString() {
  final _this = this as Achievement;
  return 'Achievement(name: ${_this.name}, stars: ${_this.stars}, value: ${_this.value}, target: ${_this.target}, info: ${_this.info}, completionInfo: ${_this.completionInfo}, village: ${_this.village})';
}


}

/// @nodoc
abstract mixin class $AchievementCopyWith<$Res>  {
  factory $AchievementCopyWith(Achievement value, $Res Function(Achievement) _then) = _$AchievementCopyWithImpl;
@useResult
$Res call({
 String? name, int? stars, int? value, int? target, String? info, String? completionInfo, String? village
});




}
/// @nodoc
class _$AchievementCopyWithImpl<$Res>
    implements $AchievementCopyWith<$Res> {
  _$AchievementCopyWithImpl(this._self, this._then);

  final Achievement _self;
  final $Res Function(Achievement) _then;

/// Create a copy of Achievement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? stars = freezed,Object? value = freezed,Object? target = freezed,Object? info = freezed,Object? completionInfo = freezed,Object? village = freezed,}) {
  return _then(Achievement(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,stars: freezed == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int?,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int?,target: freezed == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as int?,info: freezed == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as String?,completionInfo: freezed == completionInfo ? _self.completionInfo : completionInfo // ignore: cast_nullable_to_non_nullable
as String?,village: freezed == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Achievement].
extension AchievementPatterns on Achievement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Achievement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Achievement() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Achievement value)  $default,){
final _that = this;
switch (_that) {
case _Achievement():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Achievement value)?  $default,){
final _that = this;
switch (_that) {
case _Achievement() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  int? stars,  int? value,  int? target,  String? info,  String? completionInfo,  String? village)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Achievement() when $default != null:
return $default(_that.name,_that.stars,_that.value,_that.target,_that.info,_that.completionInfo,_that.village);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  int? stars,  int? value,  int? target,  String? info,  String? completionInfo,  String? village)  $default,) {final _that = this;
switch (_that) {
case _Achievement():
return $default(_that.name,_that.stars,_that.value,_that.target,_that.info,_that.completionInfo,_that.village);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  int? stars,  int? value,  int? target,  String? info,  String? completionInfo,  String? village)?  $default,) {final _that = this;
switch (_that) {
case _Achievement() when $default != null:
return $default(_that.name,_that.stars,_that.value,_that.target,_that.info,_that.completionInfo,_that.village);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Achievement implements Achievement {
  const _Achievement({this.name, this.stars, this.value, this.target, this.info, this.completionInfo, this.village});
  factory _Achievement.fromJson(Map<String, dynamic> json) => _$AchievementFromJson(json);

@override final  String? name;
@override final  int? stars;
@override final  int? value;
@override final  int? target;
@override final  String? info;
@override final  String? completionInfo;
@override final  String? village;

/// Create a copy of Achievement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AchievementCopyWith<_Achievement> get copyWith => __$AchievementCopyWithImpl<_Achievement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AchievementToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Achievement&&(identical(other.name, name) || other.name == name)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.value, value) || other.value == value)&&(identical(other.target, target) || other.target == target)&&(identical(other.info, info) || other.info == info)&&(identical(other.completionInfo, completionInfo) || other.completionInfo == completionInfo)&&(identical(other.village, village) || other.village == village));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,stars,value,target,info,completionInfo,village);
}

@override
String toString() {
    return 'Achievement(name: $name, stars: $stars, value: $value, target: $target, info: $info, completionInfo: $completionInfo, village: $village)';
}


}

/// @nodoc
abstract mixin class _$AchievementCopyWith<$Res> implements $AchievementCopyWith<$Res> {
  factory _$AchievementCopyWith(_Achievement value, $Res Function(_Achievement) _then) = __$AchievementCopyWithImpl;
@override @useResult
$Res call({
 String? name, int? stars, int? value, int? target, String? info, String? completionInfo, String? village
});




}
/// @nodoc
class __$AchievementCopyWithImpl<$Res>
    implements _$AchievementCopyWith<$Res> {
  __$AchievementCopyWithImpl(this._self, this._then);

  final _Achievement _self;
  final $Res Function(_Achievement) _then;

/// Create a copy of Achievement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? stars = freezed,Object? value = freezed,Object? target = freezed,Object? info = freezed,Object? completionInfo = freezed,Object? village = freezed,}) {
  return _then(_Achievement(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,stars: freezed == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int?,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int?,target: freezed == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as int?,info: freezed == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as String?,completionInfo: freezed == completionInfo ? _self.completionInfo : completionInfo // ignore: cast_nullable_to_non_nullable
as String?,village: freezed == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Player {

 String get tag; String? get name; int? get townHallLevel; int? get townHallWeaponLevel; int? get expLevel; int? get trophies; int? get bestTrophies; int? get warStars; int? get attackWins; int? get defenseWins; int? get builderHallLevel; int? get builderBaseTrophies; int? get bestBuilderBaseTrophies; String? get role; String? get warPreference; int? get donations; int? get donationsReceived; int? get clanCapitalContributions; PlayerClan? get clan; League? get league; League? get builderBaseLeague; List<Label> get labels; List<Achievement> get achievements; List<PlayerItem> get troops; List<PlayerItem> get heroes; List<PlayerItem> get heroEquipment; List<PlayerItem> get spells;
/// Create a copy of Player
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerCopyWith<Player> get copyWith => _$PlayerCopyWithImpl<Player>(this as Player, _$identity);

  /// Serializes this Player to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Player;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Player&&(identical(other.tag, _this.tag) || other.tag == _this.tag)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.townHallLevel, _this.townHallLevel) || other.townHallLevel == _this.townHallLevel)&&(identical(other.townHallWeaponLevel, _this.townHallWeaponLevel) || other.townHallWeaponLevel == _this.townHallWeaponLevel)&&(identical(other.expLevel, _this.expLevel) || other.expLevel == _this.expLevel)&&(identical(other.trophies, _this.trophies) || other.trophies == _this.trophies)&&(identical(other.bestTrophies, _this.bestTrophies) || other.bestTrophies == _this.bestTrophies)&&(identical(other.warStars, _this.warStars) || other.warStars == _this.warStars)&&(identical(other.attackWins, _this.attackWins) || other.attackWins == _this.attackWins)&&(identical(other.defenseWins, _this.defenseWins) || other.defenseWins == _this.defenseWins)&&(identical(other.builderHallLevel, _this.builderHallLevel) || other.builderHallLevel == _this.builderHallLevel)&&(identical(other.builderBaseTrophies, _this.builderBaseTrophies) || other.builderBaseTrophies == _this.builderBaseTrophies)&&(identical(other.bestBuilderBaseTrophies, _this.bestBuilderBaseTrophies) || other.bestBuilderBaseTrophies == _this.bestBuilderBaseTrophies)&&(identical(other.role, _this.role) || other.role == _this.role)&&(identical(other.warPreference, _this.warPreference) || other.warPreference == _this.warPreference)&&(identical(other.donations, _this.donations) || other.donations == _this.donations)&&(identical(other.donationsReceived, _this.donationsReceived) || other.donationsReceived == _this.donationsReceived)&&(identical(other.clanCapitalContributions, _this.clanCapitalContributions) || other.clanCapitalContributions == _this.clanCapitalContributions)&&(identical(other.clan, _this.clan) || other.clan == _this.clan)&&(identical(other.league, _this.league) || other.league == _this.league)&&(identical(other.builderBaseLeague, _this.builderBaseLeague) || other.builderBaseLeague == _this.builderBaseLeague)&&const DeepCollectionEquality().equals(other.labels, _this.labels)&&const DeepCollectionEquality().equals(other.achievements, _this.achievements)&&const DeepCollectionEquality().equals(other.troops, _this.troops)&&const DeepCollectionEquality().equals(other.heroes, _this.heroes)&&const DeepCollectionEquality().equals(other.heroEquipment, _this.heroEquipment)&&const DeepCollectionEquality().equals(other.spells, _this.spells));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Player;
  return Object.hashAll([runtimeType,_this.tag,_this.name,_this.townHallLevel,_this.townHallWeaponLevel,_this.expLevel,_this.trophies,_this.bestTrophies,_this.warStars,_this.attackWins,_this.defenseWins,_this.builderHallLevel,_this.builderBaseTrophies,_this.bestBuilderBaseTrophies,_this.role,_this.warPreference,_this.donations,_this.donationsReceived,_this.clanCapitalContributions,_this.clan,_this.league,_this.builderBaseLeague,const DeepCollectionEquality().hash(_this.labels),const DeepCollectionEquality().hash(_this.achievements),const DeepCollectionEquality().hash(_this.troops),const DeepCollectionEquality().hash(_this.heroes),const DeepCollectionEquality().hash(_this.heroEquipment),const DeepCollectionEquality().hash(_this.spells)]);
}

@override
String toString() {
  final _this = this as Player;
  return 'Player(tag: ${_this.tag}, name: ${_this.name}, townHallLevel: ${_this.townHallLevel}, townHallWeaponLevel: ${_this.townHallWeaponLevel}, expLevel: ${_this.expLevel}, trophies: ${_this.trophies}, bestTrophies: ${_this.bestTrophies}, warStars: ${_this.warStars}, attackWins: ${_this.attackWins}, defenseWins: ${_this.defenseWins}, builderHallLevel: ${_this.builderHallLevel}, builderBaseTrophies: ${_this.builderBaseTrophies}, bestBuilderBaseTrophies: ${_this.bestBuilderBaseTrophies}, role: ${_this.role}, warPreference: ${_this.warPreference}, donations: ${_this.donations}, donationsReceived: ${_this.donationsReceived}, clanCapitalContributions: ${_this.clanCapitalContributions}, clan: ${_this.clan}, league: ${_this.league}, builderBaseLeague: ${_this.builderBaseLeague}, labels: ${_this.labels}, achievements: ${_this.achievements}, troops: ${_this.troops}, heroes: ${_this.heroes}, heroEquipment: ${_this.heroEquipment}, spells: ${_this.spells})';
}


}

/// @nodoc
abstract mixin class $PlayerCopyWith<$Res>  {
  factory $PlayerCopyWith(Player value, $Res Function(Player) _then) = _$PlayerCopyWithImpl;
@useResult
$Res call({
 String tag, String? name, int? townHallLevel, int? townHallWeaponLevel, int? expLevel, int? trophies, int? bestTrophies, int? warStars, int? attackWins, int? defenseWins, int? builderHallLevel, int? builderBaseTrophies, int? bestBuilderBaseTrophies, String? role, String? warPreference, int? donations, int? donationsReceived, int? clanCapitalContributions, PlayerClan? clan, League? league, League? builderBaseLeague, List<Label> labels, List<Achievement> achievements, List<PlayerItem> troops, List<PlayerItem> heroes, List<PlayerItem> heroEquipment, List<PlayerItem> spells
});


$PlayerClanCopyWith<$Res>? get clan;$LeagueCopyWith<$Res>? get league;$LeagueCopyWith<$Res>? get builderBaseLeague;

}
/// @nodoc
class _$PlayerCopyWithImpl<$Res>
    implements $PlayerCopyWith<$Res> {
  _$PlayerCopyWithImpl(this._self, this._then);

  final Player _self;
  final $Res Function(Player) _then;

/// Create a copy of Player
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tag = null,Object? name = freezed,Object? townHallLevel = freezed,Object? townHallWeaponLevel = freezed,Object? expLevel = freezed,Object? trophies = freezed,Object? bestTrophies = freezed,Object? warStars = freezed,Object? attackWins = freezed,Object? defenseWins = freezed,Object? builderHallLevel = freezed,Object? builderBaseTrophies = freezed,Object? bestBuilderBaseTrophies = freezed,Object? role = freezed,Object? warPreference = freezed,Object? donations = freezed,Object? donationsReceived = freezed,Object? clanCapitalContributions = freezed,Object? clan = freezed,Object? league = freezed,Object? builderBaseLeague = freezed,Object? labels = null,Object? achievements = null,Object? troops = null,Object? heroes = null,Object? heroEquipment = null,Object? spells = null,}) {
  return _then(Player(
tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,townHallLevel: freezed == townHallLevel ? _self.townHallLevel : townHallLevel // ignore: cast_nullable_to_non_nullable
as int?,townHallWeaponLevel: freezed == townHallWeaponLevel ? _self.townHallWeaponLevel : townHallWeaponLevel // ignore: cast_nullable_to_non_nullable
as int?,expLevel: freezed == expLevel ? _self.expLevel : expLevel // ignore: cast_nullable_to_non_nullable
as int?,trophies: freezed == trophies ? _self.trophies : trophies // ignore: cast_nullable_to_non_nullable
as int?,bestTrophies: freezed == bestTrophies ? _self.bestTrophies : bestTrophies // ignore: cast_nullable_to_non_nullable
as int?,warStars: freezed == warStars ? _self.warStars : warStars // ignore: cast_nullable_to_non_nullable
as int?,attackWins: freezed == attackWins ? _self.attackWins : attackWins // ignore: cast_nullable_to_non_nullable
as int?,defenseWins: freezed == defenseWins ? _self.defenseWins : defenseWins // ignore: cast_nullable_to_non_nullable
as int?,builderHallLevel: freezed == builderHallLevel ? _self.builderHallLevel : builderHallLevel // ignore: cast_nullable_to_non_nullable
as int?,builderBaseTrophies: freezed == builderBaseTrophies ? _self.builderBaseTrophies : builderBaseTrophies // ignore: cast_nullable_to_non_nullable
as int?,bestBuilderBaseTrophies: freezed == bestBuilderBaseTrophies ? _self.bestBuilderBaseTrophies : bestBuilderBaseTrophies // ignore: cast_nullable_to_non_nullable
as int?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,warPreference: freezed == warPreference ? _self.warPreference : warPreference // ignore: cast_nullable_to_non_nullable
as String?,donations: freezed == donations ? _self.donations : donations // ignore: cast_nullable_to_non_nullable
as int?,donationsReceived: freezed == donationsReceived ? _self.donationsReceived : donationsReceived // ignore: cast_nullable_to_non_nullable
as int?,clanCapitalContributions: freezed == clanCapitalContributions ? _self.clanCapitalContributions : clanCapitalContributions // ignore: cast_nullable_to_non_nullable
as int?,clan: freezed == clan ? _self.clan : clan // ignore: cast_nullable_to_non_nullable
as PlayerClan?,league: freezed == league ? _self.league : league // ignore: cast_nullable_to_non_nullable
as League?,builderBaseLeague: freezed == builderBaseLeague ? _self.builderBaseLeague : builderBaseLeague // ignore: cast_nullable_to_non_nullable
as League?,labels: null == labels ? _self.labels : labels // ignore: cast_nullable_to_non_nullable
as List<Label>,achievements: null == achievements ? _self.achievements : achievements // ignore: cast_nullable_to_non_nullable
as List<Achievement>,troops: null == troops ? _self.troops : troops // ignore: cast_nullable_to_non_nullable
as List<PlayerItem>,heroes: null == heroes ? _self.heroes : heroes // ignore: cast_nullable_to_non_nullable
as List<PlayerItem>,heroEquipment: null == heroEquipment ? _self.heroEquipment : heroEquipment // ignore: cast_nullable_to_non_nullable
as List<PlayerItem>,spells: null == spells ? _self.spells : spells // ignore: cast_nullable_to_non_nullable
as List<PlayerItem>,
  ));
}
/// Create a copy of Player
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerClanCopyWith<$Res>? get clan {
    if (_self.clan == null) {
    return null;
  }

  return $PlayerClanCopyWith<$Res>(_self.clan!, (value) {
    return _then(_self.copyWith(clan: value));
  });
}/// Create a copy of Player
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LeagueCopyWith<$Res>? get league {
    if (_self.league == null) {
    return null;
  }

  return $LeagueCopyWith<$Res>(_self.league!, (value) {
    return _then(_self.copyWith(league: value));
  });
}/// Create a copy of Player
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LeagueCopyWith<$Res>? get builderBaseLeague {
    if (_self.builderBaseLeague == null) {
    return null;
  }

  return $LeagueCopyWith<$Res>(_self.builderBaseLeague!, (value) {
    return _then(_self.copyWith(builderBaseLeague: value));
  });
}
}


/// Adds pattern-matching-related methods to [Player].
extension PlayerPatterns on Player {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Player value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Player() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Player value)  $default,){
final _that = this;
switch (_that) {
case _Player():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Player value)?  $default,){
final _that = this;
switch (_that) {
case _Player() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tag,  String? name,  int? townHallLevel,  int? townHallWeaponLevel,  int? expLevel,  int? trophies,  int? bestTrophies,  int? warStars,  int? attackWins,  int? defenseWins,  int? builderHallLevel,  int? builderBaseTrophies,  int? bestBuilderBaseTrophies,  String? role,  String? warPreference,  int? donations,  int? donationsReceived,  int? clanCapitalContributions,  PlayerClan? clan,  League? league,  League? builderBaseLeague,  List<Label> labels,  List<Achievement> achievements,  List<PlayerItem> troops,  List<PlayerItem> heroes,  List<PlayerItem> heroEquipment,  List<PlayerItem> spells)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Player() when $default != null:
return $default(_that.tag,_that.name,_that.townHallLevel,_that.townHallWeaponLevel,_that.expLevel,_that.trophies,_that.bestTrophies,_that.warStars,_that.attackWins,_that.defenseWins,_that.builderHallLevel,_that.builderBaseTrophies,_that.bestBuilderBaseTrophies,_that.role,_that.warPreference,_that.donations,_that.donationsReceived,_that.clanCapitalContributions,_that.clan,_that.league,_that.builderBaseLeague,_that.labels,_that.achievements,_that.troops,_that.heroes,_that.heroEquipment,_that.spells);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tag,  String? name,  int? townHallLevel,  int? townHallWeaponLevel,  int? expLevel,  int? trophies,  int? bestTrophies,  int? warStars,  int? attackWins,  int? defenseWins,  int? builderHallLevel,  int? builderBaseTrophies,  int? bestBuilderBaseTrophies,  String? role,  String? warPreference,  int? donations,  int? donationsReceived,  int? clanCapitalContributions,  PlayerClan? clan,  League? league,  League? builderBaseLeague,  List<Label> labels,  List<Achievement> achievements,  List<PlayerItem> troops,  List<PlayerItem> heroes,  List<PlayerItem> heroEquipment,  List<PlayerItem> spells)  $default,) {final _that = this;
switch (_that) {
case _Player():
return $default(_that.tag,_that.name,_that.townHallLevel,_that.townHallWeaponLevel,_that.expLevel,_that.trophies,_that.bestTrophies,_that.warStars,_that.attackWins,_that.defenseWins,_that.builderHallLevel,_that.builderBaseTrophies,_that.bestBuilderBaseTrophies,_that.role,_that.warPreference,_that.donations,_that.donationsReceived,_that.clanCapitalContributions,_that.clan,_that.league,_that.builderBaseLeague,_that.labels,_that.achievements,_that.troops,_that.heroes,_that.heroEquipment,_that.spells);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tag,  String? name,  int? townHallLevel,  int? townHallWeaponLevel,  int? expLevel,  int? trophies,  int? bestTrophies,  int? warStars,  int? attackWins,  int? defenseWins,  int? builderHallLevel,  int? builderBaseTrophies,  int? bestBuilderBaseTrophies,  String? role,  String? warPreference,  int? donations,  int? donationsReceived,  int? clanCapitalContributions,  PlayerClan? clan,  League? league,  League? builderBaseLeague,  List<Label> labels,  List<Achievement> achievements,  List<PlayerItem> troops,  List<PlayerItem> heroes,  List<PlayerItem> heroEquipment,  List<PlayerItem> spells)?  $default,) {final _that = this;
switch (_that) {
case _Player() when $default != null:
return $default(_that.tag,_that.name,_that.townHallLevel,_that.townHallWeaponLevel,_that.expLevel,_that.trophies,_that.bestTrophies,_that.warStars,_that.attackWins,_that.defenseWins,_that.builderHallLevel,_that.builderBaseTrophies,_that.bestBuilderBaseTrophies,_that.role,_that.warPreference,_that.donations,_that.donationsReceived,_that.clanCapitalContributions,_that.clan,_that.league,_that.builderBaseLeague,_that.labels,_that.achievements,_that.troops,_that.heroes,_that.heroEquipment,_that.spells);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Player implements Player {
  const _Player({required this.tag, this.name, this.townHallLevel, this.townHallWeaponLevel, this.expLevel, this.trophies, this.bestTrophies, this.warStars, this.attackWins, this.defenseWins, this.builderHallLevel, this.builderBaseTrophies, this.bestBuilderBaseTrophies, this.role, this.warPreference, this.donations, this.donationsReceived, this.clanCapitalContributions, this.clan, this.league, this.builderBaseLeague,  List<Label> labels = const <Label>[],  List<Achievement> achievements = const <Achievement>[],  List<PlayerItem> troops = const <PlayerItem>[],  List<PlayerItem> heroes = const <PlayerItem>[],  List<PlayerItem> heroEquipment = const <PlayerItem>[],  List<PlayerItem> spells = const <PlayerItem>[]}): _labels = labels,_achievements = achievements,_troops = troops,_heroes = heroes,_heroEquipment = heroEquipment,_spells = spells;
  factory _Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

@override final  String tag;
@override final  String? name;
@override final  int? townHallLevel;
@override final  int? townHallWeaponLevel;
@override final  int? expLevel;
@override final  int? trophies;
@override final  int? bestTrophies;
@override final  int? warStars;
@override final  int? attackWins;
@override final  int? defenseWins;
@override final  int? builderHallLevel;
@override final  int? builderBaseTrophies;
@override final  int? bestBuilderBaseTrophies;
@override final  String? role;
@override final  String? warPreference;
@override final  int? donations;
@override final  int? donationsReceived;
@override final  int? clanCapitalContributions;
@override final  PlayerClan? clan;
@override final  League? league;
@override final  League? builderBaseLeague;
 final  List<Label> _labels;
@override@JsonKey() List<Label> get labels {
  if (_labels is EqualUnmodifiableListView) return _labels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_labels);
}

 final  List<Achievement> _achievements;
@override@JsonKey() List<Achievement> get achievements {
  if (_achievements is EqualUnmodifiableListView) return _achievements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_achievements);
}

 final  List<PlayerItem> _troops;
@override@JsonKey() List<PlayerItem> get troops {
  if (_troops is EqualUnmodifiableListView) return _troops;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_troops);
}

 final  List<PlayerItem> _heroes;
@override@JsonKey() List<PlayerItem> get heroes {
  if (_heroes is EqualUnmodifiableListView) return _heroes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_heroes);
}

 final  List<PlayerItem> _heroEquipment;
@override@JsonKey() List<PlayerItem> get heroEquipment {
  if (_heroEquipment is EqualUnmodifiableListView) return _heroEquipment;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_heroEquipment);
}

 final  List<PlayerItem> _spells;
@override@JsonKey() List<PlayerItem> get spells {
  if (_spells is EqualUnmodifiableListView) return _spells;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_spells);
}


/// Create a copy of Player
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerCopyWith<_Player> get copyWith => __$PlayerCopyWithImpl<_Player>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlayerToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Player&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.name, name) || other.name == name)&&(identical(other.townHallLevel, townHallLevel) || other.townHallLevel == townHallLevel)&&(identical(other.townHallWeaponLevel, townHallWeaponLevel) || other.townHallWeaponLevel == townHallWeaponLevel)&&(identical(other.expLevel, expLevel) || other.expLevel == expLevel)&&(identical(other.trophies, trophies) || other.trophies == trophies)&&(identical(other.bestTrophies, bestTrophies) || other.bestTrophies == bestTrophies)&&(identical(other.warStars, warStars) || other.warStars == warStars)&&(identical(other.attackWins, attackWins) || other.attackWins == attackWins)&&(identical(other.defenseWins, defenseWins) || other.defenseWins == defenseWins)&&(identical(other.builderHallLevel, builderHallLevel) || other.builderHallLevel == builderHallLevel)&&(identical(other.builderBaseTrophies, builderBaseTrophies) || other.builderBaseTrophies == builderBaseTrophies)&&(identical(other.bestBuilderBaseTrophies, bestBuilderBaseTrophies) || other.bestBuilderBaseTrophies == bestBuilderBaseTrophies)&&(identical(other.role, role) || other.role == role)&&(identical(other.warPreference, warPreference) || other.warPreference == warPreference)&&(identical(other.donations, donations) || other.donations == donations)&&(identical(other.donationsReceived, donationsReceived) || other.donationsReceived == donationsReceived)&&(identical(other.clanCapitalContributions, clanCapitalContributions) || other.clanCapitalContributions == clanCapitalContributions)&&(identical(other.clan, clan) || other.clan == clan)&&(identical(other.league, league) || other.league == league)&&(identical(other.builderBaseLeague, builderBaseLeague) || other.builderBaseLeague == builderBaseLeague)&&const DeepCollectionEquality().equals(other.labels, _labels)&&const DeepCollectionEquality().equals(other.achievements, _achievements)&&const DeepCollectionEquality().equals(other.troops, _troops)&&const DeepCollectionEquality().equals(other.heroes, _heroes)&&const DeepCollectionEquality().equals(other.heroEquipment, _heroEquipment)&&const DeepCollectionEquality().equals(other.spells, _spells));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,tag,name,townHallLevel,townHallWeaponLevel,expLevel,trophies,bestTrophies,warStars,attackWins,defenseWins,builderHallLevel,builderBaseTrophies,bestBuilderBaseTrophies,role,warPreference,donations,donationsReceived,clanCapitalContributions,clan,league,builderBaseLeague,const DeepCollectionEquality().hash(_labels),const DeepCollectionEquality().hash(_achievements),const DeepCollectionEquality().hash(_troops),const DeepCollectionEquality().hash(_heroes),const DeepCollectionEquality().hash(_heroEquipment),const DeepCollectionEquality().hash(_spells)]);
}

@override
String toString() {
    return 'Player(tag: $tag, name: $name, townHallLevel: $townHallLevel, townHallWeaponLevel: $townHallWeaponLevel, expLevel: $expLevel, trophies: $trophies, bestTrophies: $bestTrophies, warStars: $warStars, attackWins: $attackWins, defenseWins: $defenseWins, builderHallLevel: $builderHallLevel, builderBaseTrophies: $builderBaseTrophies, bestBuilderBaseTrophies: $bestBuilderBaseTrophies, role: $role, warPreference: $warPreference, donations: $donations, donationsReceived: $donationsReceived, clanCapitalContributions: $clanCapitalContributions, clan: $clan, league: $league, builderBaseLeague: $builderBaseLeague, labels: $labels, achievements: $achievements, troops: $troops, heroes: $heroes, heroEquipment: $heroEquipment, spells: $spells)';
}


}

/// @nodoc
abstract mixin class _$PlayerCopyWith<$Res> implements $PlayerCopyWith<$Res> {
  factory _$PlayerCopyWith(_Player value, $Res Function(_Player) _then) = __$PlayerCopyWithImpl;
@override @useResult
$Res call({
 String tag, String? name, int? townHallLevel, int? townHallWeaponLevel, int? expLevel, int? trophies, int? bestTrophies, int? warStars, int? attackWins, int? defenseWins, int? builderHallLevel, int? builderBaseTrophies, int? bestBuilderBaseTrophies, String? role, String? warPreference, int? donations, int? donationsReceived, int? clanCapitalContributions, PlayerClan? clan, League? league, League? builderBaseLeague, List<Label> labels, List<Achievement> achievements, List<PlayerItem> troops, List<PlayerItem> heroes, List<PlayerItem> heroEquipment, List<PlayerItem> spells
});


@override $PlayerClanCopyWith<$Res>? get clan;@override $LeagueCopyWith<$Res>? get league;@override $LeagueCopyWith<$Res>? get builderBaseLeague;

}
/// @nodoc
class __$PlayerCopyWithImpl<$Res>
    implements _$PlayerCopyWith<$Res> {
  __$PlayerCopyWithImpl(this._self, this._then);

  final _Player _self;
  final $Res Function(_Player) _then;

/// Create a copy of Player
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tag = null,Object? name = freezed,Object? townHallLevel = freezed,Object? townHallWeaponLevel = freezed,Object? expLevel = freezed,Object? trophies = freezed,Object? bestTrophies = freezed,Object? warStars = freezed,Object? attackWins = freezed,Object? defenseWins = freezed,Object? builderHallLevel = freezed,Object? builderBaseTrophies = freezed,Object? bestBuilderBaseTrophies = freezed,Object? role = freezed,Object? warPreference = freezed,Object? donations = freezed,Object? donationsReceived = freezed,Object? clanCapitalContributions = freezed,Object? clan = freezed,Object? league = freezed,Object? builderBaseLeague = freezed,Object? labels = null,Object? achievements = null,Object? troops = null,Object? heroes = null,Object? heroEquipment = null,Object? spells = null,}) {
  return _then(_Player(
tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,townHallLevel: freezed == townHallLevel ? _self.townHallLevel : townHallLevel // ignore: cast_nullable_to_non_nullable
as int?,townHallWeaponLevel: freezed == townHallWeaponLevel ? _self.townHallWeaponLevel : townHallWeaponLevel // ignore: cast_nullable_to_non_nullable
as int?,expLevel: freezed == expLevel ? _self.expLevel : expLevel // ignore: cast_nullable_to_non_nullable
as int?,trophies: freezed == trophies ? _self.trophies : trophies // ignore: cast_nullable_to_non_nullable
as int?,bestTrophies: freezed == bestTrophies ? _self.bestTrophies : bestTrophies // ignore: cast_nullable_to_non_nullable
as int?,warStars: freezed == warStars ? _self.warStars : warStars // ignore: cast_nullable_to_non_nullable
as int?,attackWins: freezed == attackWins ? _self.attackWins : attackWins // ignore: cast_nullable_to_non_nullable
as int?,defenseWins: freezed == defenseWins ? _self.defenseWins : defenseWins // ignore: cast_nullable_to_non_nullable
as int?,builderHallLevel: freezed == builderHallLevel ? _self.builderHallLevel : builderHallLevel // ignore: cast_nullable_to_non_nullable
as int?,builderBaseTrophies: freezed == builderBaseTrophies ? _self.builderBaseTrophies : builderBaseTrophies // ignore: cast_nullable_to_non_nullable
as int?,bestBuilderBaseTrophies: freezed == bestBuilderBaseTrophies ? _self.bestBuilderBaseTrophies : bestBuilderBaseTrophies // ignore: cast_nullable_to_non_nullable
as int?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,warPreference: freezed == warPreference ? _self.warPreference : warPreference // ignore: cast_nullable_to_non_nullable
as String?,donations: freezed == donations ? _self.donations : donations // ignore: cast_nullable_to_non_nullable
as int?,donationsReceived: freezed == donationsReceived ? _self.donationsReceived : donationsReceived // ignore: cast_nullable_to_non_nullable
as int?,clanCapitalContributions: freezed == clanCapitalContributions ? _self.clanCapitalContributions : clanCapitalContributions // ignore: cast_nullable_to_non_nullable
as int?,clan: freezed == clan ? _self.clan : clan // ignore: cast_nullable_to_non_nullable
as PlayerClan?,league: freezed == league ? _self.league : league // ignore: cast_nullable_to_non_nullable
as League?,builderBaseLeague: freezed == builderBaseLeague ? _self.builderBaseLeague : builderBaseLeague // ignore: cast_nullable_to_non_nullable
as League?,labels: null == labels ? _self._labels : labels // ignore: cast_nullable_to_non_nullable
as List<Label>,achievements: null == achievements ? _self._achievements : achievements // ignore: cast_nullable_to_non_nullable
as List<Achievement>,troops: null == troops ? _self._troops : troops // ignore: cast_nullable_to_non_nullable
as List<PlayerItem>,heroes: null == heroes ? _self._heroes : heroes // ignore: cast_nullable_to_non_nullable
as List<PlayerItem>,heroEquipment: null == heroEquipment ? _self._heroEquipment : heroEquipment // ignore: cast_nullable_to_non_nullable
as List<PlayerItem>,spells: null == spells ? _self._spells : spells // ignore: cast_nullable_to_non_nullable
as List<PlayerItem>,
  ));
}

/// Create a copy of Player
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerClanCopyWith<$Res>? get clan {
    if (_self.clan == null) {
    return null;
  }

  return $PlayerClanCopyWith<$Res>(_self.clan!, (value) {
    return _then(_self.copyWith(clan: value));
  });
}/// Create a copy of Player
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LeagueCopyWith<$Res>? get league {
    if (_self.league == null) {
    return null;
  }

  return $LeagueCopyWith<$Res>(_self.league!, (value) {
    return _then(_self.copyWith(league: value));
  });
}/// Create a copy of Player
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LeagueCopyWith<$Res>? get builderBaseLeague {
    if (_self.builderBaseLeague == null) {
    return null;
  }

  return $LeagueCopyWith<$Res>(_self.builderBaseLeague!, (value) {
    return _then(_self.copyWith(builderBaseLeague: value));
  });
}
}

// dart format on
