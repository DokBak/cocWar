// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'current_war.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WarAttack {

 String? get attackerTag; String? get defenderTag; int? get stars; double? get destructionPercentage;/// 전쟁 전체에서 몇 번째 공격이었는지.
 int? get order;/// 공격에 걸린 시간(초).
 int? get duration;
/// Create a copy of WarAttack
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WarAttackCopyWith<WarAttack> get copyWith => _$WarAttackCopyWithImpl<WarAttack>(this as WarAttack, _$identity);

  /// Serializes this WarAttack to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WarAttack;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarAttack&&(identical(other.attackerTag, _this.attackerTag) || other.attackerTag == _this.attackerTag)&&(identical(other.defenderTag, _this.defenderTag) || other.defenderTag == _this.defenderTag)&&(identical(other.stars, _this.stars) || other.stars == _this.stars)&&(identical(other.destructionPercentage, _this.destructionPercentage) || other.destructionPercentage == _this.destructionPercentage)&&(identical(other.order, _this.order) || other.order == _this.order)&&(identical(other.duration, _this.duration) || other.duration == _this.duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WarAttack;
  return Object.hash(runtimeType,_this.attackerTag,_this.defenderTag,_this.stars,_this.destructionPercentage,_this.order,_this.duration);
}

@override
String toString() {
  final _this = this as WarAttack;
  return 'WarAttack(attackerTag: ${_this.attackerTag}, defenderTag: ${_this.defenderTag}, stars: ${_this.stars}, destructionPercentage: ${_this.destructionPercentage}, order: ${_this.order}, duration: ${_this.duration})';
}


}

/// @nodoc
abstract mixin class $WarAttackCopyWith<$Res>  {
  factory $WarAttackCopyWith(WarAttack value, $Res Function(WarAttack) _then) = _$WarAttackCopyWithImpl;
@useResult
$Res call({
 String? attackerTag, String? defenderTag, int? stars, double? destructionPercentage, int? order, int? duration
});




}
/// @nodoc
class _$WarAttackCopyWithImpl<$Res>
    implements $WarAttackCopyWith<$Res> {
  _$WarAttackCopyWithImpl(this._self, this._then);

  final WarAttack _self;
  final $Res Function(WarAttack) _then;

/// Create a copy of WarAttack
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? attackerTag = freezed,Object? defenderTag = freezed,Object? stars = freezed,Object? destructionPercentage = freezed,Object? order = freezed,Object? duration = freezed,}) {
  return _then(WarAttack(
attackerTag: freezed == attackerTag ? _self.attackerTag : attackerTag // ignore: cast_nullable_to_non_nullable
as String?,defenderTag: freezed == defenderTag ? _self.defenderTag : defenderTag // ignore: cast_nullable_to_non_nullable
as String?,stars: freezed == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int?,destructionPercentage: freezed == destructionPercentage ? _self.destructionPercentage : destructionPercentage // ignore: cast_nullable_to_non_nullable
as double?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [WarAttack].
extension WarAttackPatterns on WarAttack {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WarAttack value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WarAttack() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WarAttack value)  $default,){
final _that = this;
switch (_that) {
case _WarAttack():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WarAttack value)?  $default,){
final _that = this;
switch (_that) {
case _WarAttack() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? attackerTag,  String? defenderTag,  int? stars,  double? destructionPercentage,  int? order,  int? duration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WarAttack() when $default != null:
return $default(_that.attackerTag,_that.defenderTag,_that.stars,_that.destructionPercentage,_that.order,_that.duration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? attackerTag,  String? defenderTag,  int? stars,  double? destructionPercentage,  int? order,  int? duration)  $default,) {final _that = this;
switch (_that) {
case _WarAttack():
return $default(_that.attackerTag,_that.defenderTag,_that.stars,_that.destructionPercentage,_that.order,_that.duration);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? attackerTag,  String? defenderTag,  int? stars,  double? destructionPercentage,  int? order,  int? duration)?  $default,) {final _that = this;
switch (_that) {
case _WarAttack() when $default != null:
return $default(_that.attackerTag,_that.defenderTag,_that.stars,_that.destructionPercentage,_that.order,_that.duration);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WarAttack implements WarAttack {
  const _WarAttack({this.attackerTag, this.defenderTag, this.stars, this.destructionPercentage, this.order, this.duration});
  factory _WarAttack.fromJson(Map<String, dynamic> json) => _$WarAttackFromJson(json);

@override final  String? attackerTag;
@override final  String? defenderTag;
@override final  int? stars;
@override final  double? destructionPercentage;
/// 전쟁 전체에서 몇 번째 공격이었는지.
@override final  int? order;
/// 공격에 걸린 시간(초).
@override final  int? duration;

/// Create a copy of WarAttack
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WarAttackCopyWith<_WarAttack> get copyWith => __$WarAttackCopyWithImpl<_WarAttack>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WarAttackToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WarAttack&&(identical(other.attackerTag, attackerTag) || other.attackerTag == attackerTag)&&(identical(other.defenderTag, defenderTag) || other.defenderTag == defenderTag)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.destructionPercentage, destructionPercentage) || other.destructionPercentage == destructionPercentage)&&(identical(other.order, order) || other.order == order)&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,attackerTag,defenderTag,stars,destructionPercentage,order,duration);
}

@override
String toString() {
    return 'WarAttack(attackerTag: $attackerTag, defenderTag: $defenderTag, stars: $stars, destructionPercentage: $destructionPercentage, order: $order, duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$WarAttackCopyWith<$Res> implements $WarAttackCopyWith<$Res> {
  factory _$WarAttackCopyWith(_WarAttack value, $Res Function(_WarAttack) _then) = __$WarAttackCopyWithImpl;
@override @useResult
$Res call({
 String? attackerTag, String? defenderTag, int? stars, double? destructionPercentage, int? order, int? duration
});




}
/// @nodoc
class __$WarAttackCopyWithImpl<$Res>
    implements _$WarAttackCopyWith<$Res> {
  __$WarAttackCopyWithImpl(this._self, this._then);

  final _WarAttack _self;
  final $Res Function(_WarAttack) _then;

/// Create a copy of WarAttack
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? attackerTag = freezed,Object? defenderTag = freezed,Object? stars = freezed,Object? destructionPercentage = freezed,Object? order = freezed,Object? duration = freezed,}) {
  return _then(_WarAttack(
attackerTag: freezed == attackerTag ? _self.attackerTag : attackerTag // ignore: cast_nullable_to_non_nullable
as String?,defenderTag: freezed == defenderTag ? _self.defenderTag : defenderTag // ignore: cast_nullable_to_non_nullable
as String?,stars: freezed == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int?,destructionPercentage: freezed == destructionPercentage ? _self.destructionPercentage : destructionPercentage // ignore: cast_nullable_to_non_nullable
as double?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$WarMember {

 String? get tag; String? get name;@JsonKey(name: 'townhallLevel') int? get townHallLevel; int? get mapPosition;/// 이 멤버의 기지가 공격당한 횟수.
 int? get opponentAttacks; WarAttack? get bestOpponentAttack; List<WarAttack> get attacks;
/// Create a copy of WarMember
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WarMemberCopyWith<WarMember> get copyWith => _$WarMemberCopyWithImpl<WarMember>(this as WarMember, _$identity);

  /// Serializes this WarMember to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WarMember;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarMember&&(identical(other.tag, _this.tag) || other.tag == _this.tag)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.townHallLevel, _this.townHallLevel) || other.townHallLevel == _this.townHallLevel)&&(identical(other.mapPosition, _this.mapPosition) || other.mapPosition == _this.mapPosition)&&(identical(other.opponentAttacks, _this.opponentAttacks) || other.opponentAttacks == _this.opponentAttacks)&&(identical(other.bestOpponentAttack, _this.bestOpponentAttack) || other.bestOpponentAttack == _this.bestOpponentAttack)&&const DeepCollectionEquality().equals(other.attacks, _this.attacks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WarMember;
  return Object.hash(runtimeType,_this.tag,_this.name,_this.townHallLevel,_this.mapPosition,_this.opponentAttacks,_this.bestOpponentAttack,const DeepCollectionEquality().hash(_this.attacks));
}

@override
String toString() {
  final _this = this as WarMember;
  return 'WarMember(tag: ${_this.tag}, name: ${_this.name}, townHallLevel: ${_this.townHallLevel}, mapPosition: ${_this.mapPosition}, opponentAttacks: ${_this.opponentAttacks}, bestOpponentAttack: ${_this.bestOpponentAttack}, attacks: ${_this.attacks})';
}


}

/// @nodoc
abstract mixin class $WarMemberCopyWith<$Res>  {
  factory $WarMemberCopyWith(WarMember value, $Res Function(WarMember) _then) = _$WarMemberCopyWithImpl;
@useResult
$Res call({
 String? tag, String? name,@JsonKey(name: 'townhallLevel') int? townHallLevel, int? mapPosition, int? opponentAttacks, WarAttack? bestOpponentAttack, List<WarAttack> attacks
});


$WarAttackCopyWith<$Res>? get bestOpponentAttack;

}
/// @nodoc
class _$WarMemberCopyWithImpl<$Res>
    implements $WarMemberCopyWith<$Res> {
  _$WarMemberCopyWithImpl(this._self, this._then);

  final WarMember _self;
  final $Res Function(WarMember) _then;

/// Create a copy of WarMember
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tag = freezed,Object? name = freezed,Object? townHallLevel = freezed,Object? mapPosition = freezed,Object? opponentAttacks = freezed,Object? bestOpponentAttack = freezed,Object? attacks = null,}) {
  return _then(WarMember(
tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,townHallLevel: freezed == townHallLevel ? _self.townHallLevel : townHallLevel // ignore: cast_nullable_to_non_nullable
as int?,mapPosition: freezed == mapPosition ? _self.mapPosition : mapPosition // ignore: cast_nullable_to_non_nullable
as int?,opponentAttacks: freezed == opponentAttacks ? _self.opponentAttacks : opponentAttacks // ignore: cast_nullable_to_non_nullable
as int?,bestOpponentAttack: freezed == bestOpponentAttack ? _self.bestOpponentAttack : bestOpponentAttack // ignore: cast_nullable_to_non_nullable
as WarAttack?,attacks: null == attacks ? _self.attacks : attacks // ignore: cast_nullable_to_non_nullable
as List<WarAttack>,
  ));
}
/// Create a copy of WarMember
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WarAttackCopyWith<$Res>? get bestOpponentAttack {
    if (_self.bestOpponentAttack == null) {
    return null;
  }

  return $WarAttackCopyWith<$Res>(_self.bestOpponentAttack!, (value) {
    return _then(_self.copyWith(bestOpponentAttack: value));
  });
}
}


/// Adds pattern-matching-related methods to [WarMember].
extension WarMemberPatterns on WarMember {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WarMember value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WarMember() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WarMember value)  $default,){
final _that = this;
switch (_that) {
case _WarMember():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WarMember value)?  $default,){
final _that = this;
switch (_that) {
case _WarMember() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? tag,  String? name, @JsonKey(name: 'townhallLevel')  int? townHallLevel,  int? mapPosition,  int? opponentAttacks,  WarAttack? bestOpponentAttack,  List<WarAttack> attacks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WarMember() when $default != null:
return $default(_that.tag,_that.name,_that.townHallLevel,_that.mapPosition,_that.opponentAttacks,_that.bestOpponentAttack,_that.attacks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? tag,  String? name, @JsonKey(name: 'townhallLevel')  int? townHallLevel,  int? mapPosition,  int? opponentAttacks,  WarAttack? bestOpponentAttack,  List<WarAttack> attacks)  $default,) {final _that = this;
switch (_that) {
case _WarMember():
return $default(_that.tag,_that.name,_that.townHallLevel,_that.mapPosition,_that.opponentAttacks,_that.bestOpponentAttack,_that.attacks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? tag,  String? name, @JsonKey(name: 'townhallLevel')  int? townHallLevel,  int? mapPosition,  int? opponentAttacks,  WarAttack? bestOpponentAttack,  List<WarAttack> attacks)?  $default,) {final _that = this;
switch (_that) {
case _WarMember() when $default != null:
return $default(_that.tag,_that.name,_that.townHallLevel,_that.mapPosition,_that.opponentAttacks,_that.bestOpponentAttack,_that.attacks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WarMember implements WarMember {
  const _WarMember({this.tag, this.name, @JsonKey(name: 'townhallLevel') this.townHallLevel, this.mapPosition, this.opponentAttacks, this.bestOpponentAttack,  List<WarAttack> attacks = const <WarAttack>[]}): _attacks = attacks;
  factory _WarMember.fromJson(Map<String, dynamic> json) => _$WarMemberFromJson(json);

@override final  String? tag;
@override final  String? name;
@override@JsonKey(name: 'townhallLevel') final  int? townHallLevel;
@override final  int? mapPosition;
/// 이 멤버의 기지가 공격당한 횟수.
@override final  int? opponentAttacks;
@override final  WarAttack? bestOpponentAttack;
 final  List<WarAttack> _attacks;
@override@JsonKey() List<WarAttack> get attacks {
  if (_attacks is EqualUnmodifiableListView) return _attacks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attacks);
}


/// Create a copy of WarMember
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WarMemberCopyWith<_WarMember> get copyWith => __$WarMemberCopyWithImpl<_WarMember>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WarMemberToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WarMember&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.name, name) || other.name == name)&&(identical(other.townHallLevel, townHallLevel) || other.townHallLevel == townHallLevel)&&(identical(other.mapPosition, mapPosition) || other.mapPosition == mapPosition)&&(identical(other.opponentAttacks, opponentAttacks) || other.opponentAttacks == opponentAttacks)&&(identical(other.bestOpponentAttack, bestOpponentAttack) || other.bestOpponentAttack == bestOpponentAttack)&&const DeepCollectionEquality().equals(other.attacks, _attacks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,tag,name,townHallLevel,mapPosition,opponentAttacks,bestOpponentAttack,const DeepCollectionEquality().hash(_attacks));
}

@override
String toString() {
    return 'WarMember(tag: $tag, name: $name, townHallLevel: $townHallLevel, mapPosition: $mapPosition, opponentAttacks: $opponentAttacks, bestOpponentAttack: $bestOpponentAttack, attacks: $attacks)';
}


}

/// @nodoc
abstract mixin class _$WarMemberCopyWith<$Res> implements $WarMemberCopyWith<$Res> {
  factory _$WarMemberCopyWith(_WarMember value, $Res Function(_WarMember) _then) = __$WarMemberCopyWithImpl;
@override @useResult
$Res call({
 String? tag, String? name,@JsonKey(name: 'townhallLevel') int? townHallLevel, int? mapPosition, int? opponentAttacks, WarAttack? bestOpponentAttack, List<WarAttack> attacks
});


@override $WarAttackCopyWith<$Res>? get bestOpponentAttack;

}
/// @nodoc
class __$WarMemberCopyWithImpl<$Res>
    implements _$WarMemberCopyWith<$Res> {
  __$WarMemberCopyWithImpl(this._self, this._then);

  final _WarMember _self;
  final $Res Function(_WarMember) _then;

/// Create a copy of WarMember
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tag = freezed,Object? name = freezed,Object? townHallLevel = freezed,Object? mapPosition = freezed,Object? opponentAttacks = freezed,Object? bestOpponentAttack = freezed,Object? attacks = null,}) {
  return _then(_WarMember(
tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,townHallLevel: freezed == townHallLevel ? _self.townHallLevel : townHallLevel // ignore: cast_nullable_to_non_nullable
as int?,mapPosition: freezed == mapPosition ? _self.mapPosition : mapPosition // ignore: cast_nullable_to_non_nullable
as int?,opponentAttacks: freezed == opponentAttacks ? _self.opponentAttacks : opponentAttacks // ignore: cast_nullable_to_non_nullable
as int?,bestOpponentAttack: freezed == bestOpponentAttack ? _self.bestOpponentAttack : bestOpponentAttack // ignore: cast_nullable_to_non_nullable
as WarAttack?,attacks: null == attacks ? _self._attacks : attacks // ignore: cast_nullable_to_non_nullable
as List<WarAttack>,
  ));
}

/// Create a copy of WarMember
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WarAttackCopyWith<$Res>? get bestOpponentAttack {
    if (_self.bestOpponentAttack == null) {
    return null;
  }

  return $WarAttackCopyWith<$Res>(_self.bestOpponentAttack!, (value) {
    return _then(_self.copyWith(bestOpponentAttack: value));
  });
}
}


/// @nodoc
mixin _$CurrentWarClan {

 String? get tag; String? get name; BadgeUrls? get badgeUrls; int? get clanLevel; int? get attacks; int? get stars; double? get destructionPercentage; List<WarMember> get members;
/// Create a copy of CurrentWarClan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentWarClanCopyWith<CurrentWarClan> get copyWith => _$CurrentWarClanCopyWithImpl<CurrentWarClan>(this as CurrentWarClan, _$identity);

  /// Serializes this CurrentWarClan to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CurrentWarClan;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentWarClan&&(identical(other.tag, _this.tag) || other.tag == _this.tag)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.badgeUrls, _this.badgeUrls) || other.badgeUrls == _this.badgeUrls)&&(identical(other.clanLevel, _this.clanLevel) || other.clanLevel == _this.clanLevel)&&(identical(other.attacks, _this.attacks) || other.attacks == _this.attacks)&&(identical(other.stars, _this.stars) || other.stars == _this.stars)&&(identical(other.destructionPercentage, _this.destructionPercentage) || other.destructionPercentage == _this.destructionPercentage)&&const DeepCollectionEquality().equals(other.members, _this.members));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CurrentWarClan;
  return Object.hash(runtimeType,_this.tag,_this.name,_this.badgeUrls,_this.clanLevel,_this.attacks,_this.stars,_this.destructionPercentage,const DeepCollectionEquality().hash(_this.members));
}

@override
String toString() {
  final _this = this as CurrentWarClan;
  return 'CurrentWarClan(tag: ${_this.tag}, name: ${_this.name}, badgeUrls: ${_this.badgeUrls}, clanLevel: ${_this.clanLevel}, attacks: ${_this.attacks}, stars: ${_this.stars}, destructionPercentage: ${_this.destructionPercentage}, members: ${_this.members})';
}


}

/// @nodoc
abstract mixin class $CurrentWarClanCopyWith<$Res>  {
  factory $CurrentWarClanCopyWith(CurrentWarClan value, $Res Function(CurrentWarClan) _then) = _$CurrentWarClanCopyWithImpl;
@useResult
$Res call({
 String? tag, String? name, BadgeUrls? badgeUrls, int? clanLevel, int? attacks, int? stars, double? destructionPercentage, List<WarMember> members
});


$BadgeUrlsCopyWith<$Res>? get badgeUrls;

}
/// @nodoc
class _$CurrentWarClanCopyWithImpl<$Res>
    implements $CurrentWarClanCopyWith<$Res> {
  _$CurrentWarClanCopyWithImpl(this._self, this._then);

  final CurrentWarClan _self;
  final $Res Function(CurrentWarClan) _then;

/// Create a copy of CurrentWarClan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tag = freezed,Object? name = freezed,Object? badgeUrls = freezed,Object? clanLevel = freezed,Object? attacks = freezed,Object? stars = freezed,Object? destructionPercentage = freezed,Object? members = null,}) {
  return _then(CurrentWarClan(
tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,badgeUrls: freezed == badgeUrls ? _self.badgeUrls : badgeUrls // ignore: cast_nullable_to_non_nullable
as BadgeUrls?,clanLevel: freezed == clanLevel ? _self.clanLevel : clanLevel // ignore: cast_nullable_to_non_nullable
as int?,attacks: freezed == attacks ? _self.attacks : attacks // ignore: cast_nullable_to_non_nullable
as int?,stars: freezed == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int?,destructionPercentage: freezed == destructionPercentage ? _self.destructionPercentage : destructionPercentage // ignore: cast_nullable_to_non_nullable
as double?,members: null == members ? _self.members : members // ignore: cast_nullable_to_non_nullable
as List<WarMember>,
  ));
}
/// Create a copy of CurrentWarClan
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


/// Adds pattern-matching-related methods to [CurrentWarClan].
extension CurrentWarClanPatterns on CurrentWarClan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CurrentWarClan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CurrentWarClan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CurrentWarClan value)  $default,){
final _that = this;
switch (_that) {
case _CurrentWarClan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CurrentWarClan value)?  $default,){
final _that = this;
switch (_that) {
case _CurrentWarClan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? tag,  String? name,  BadgeUrls? badgeUrls,  int? clanLevel,  int? attacks,  int? stars,  double? destructionPercentage,  List<WarMember> members)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CurrentWarClan() when $default != null:
return $default(_that.tag,_that.name,_that.badgeUrls,_that.clanLevel,_that.attacks,_that.stars,_that.destructionPercentage,_that.members);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? tag,  String? name,  BadgeUrls? badgeUrls,  int? clanLevel,  int? attacks,  int? stars,  double? destructionPercentage,  List<WarMember> members)  $default,) {final _that = this;
switch (_that) {
case _CurrentWarClan():
return $default(_that.tag,_that.name,_that.badgeUrls,_that.clanLevel,_that.attacks,_that.stars,_that.destructionPercentage,_that.members);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? tag,  String? name,  BadgeUrls? badgeUrls,  int? clanLevel,  int? attacks,  int? stars,  double? destructionPercentage,  List<WarMember> members)?  $default,) {final _that = this;
switch (_that) {
case _CurrentWarClan() when $default != null:
return $default(_that.tag,_that.name,_that.badgeUrls,_that.clanLevel,_that.attacks,_that.stars,_that.destructionPercentage,_that.members);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CurrentWarClan implements CurrentWarClan {
  const _CurrentWarClan({this.tag, this.name, this.badgeUrls, this.clanLevel, this.attacks, this.stars, this.destructionPercentage,  List<WarMember> members = const <WarMember>[]}): _members = members;
  factory _CurrentWarClan.fromJson(Map<String, dynamic> json) => _$CurrentWarClanFromJson(json);

@override final  String? tag;
@override final  String? name;
@override final  BadgeUrls? badgeUrls;
@override final  int? clanLevel;
@override final  int? attacks;
@override final  int? stars;
@override final  double? destructionPercentage;
 final  List<WarMember> _members;
@override@JsonKey() List<WarMember> get members {
  if (_members is EqualUnmodifiableListView) return _members;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_members);
}


/// Create a copy of CurrentWarClan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrentWarClanCopyWith<_CurrentWarClan> get copyWith => __$CurrentWarClanCopyWithImpl<_CurrentWarClan>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CurrentWarClanToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrentWarClan&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.name, name) || other.name == name)&&(identical(other.badgeUrls, badgeUrls) || other.badgeUrls == badgeUrls)&&(identical(other.clanLevel, clanLevel) || other.clanLevel == clanLevel)&&(identical(other.attacks, attacks) || other.attacks == attacks)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.destructionPercentage, destructionPercentage) || other.destructionPercentage == destructionPercentage)&&const DeepCollectionEquality().equals(other.members, _members));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,tag,name,badgeUrls,clanLevel,attacks,stars,destructionPercentage,const DeepCollectionEquality().hash(_members));
}

@override
String toString() {
    return 'CurrentWarClan(tag: $tag, name: $name, badgeUrls: $badgeUrls, clanLevel: $clanLevel, attacks: $attacks, stars: $stars, destructionPercentage: $destructionPercentage, members: $members)';
}


}

/// @nodoc
abstract mixin class _$CurrentWarClanCopyWith<$Res> implements $CurrentWarClanCopyWith<$Res> {
  factory _$CurrentWarClanCopyWith(_CurrentWarClan value, $Res Function(_CurrentWarClan) _then) = __$CurrentWarClanCopyWithImpl;
@override @useResult
$Res call({
 String? tag, String? name, BadgeUrls? badgeUrls, int? clanLevel, int? attacks, int? stars, double? destructionPercentage, List<WarMember> members
});


@override $BadgeUrlsCopyWith<$Res>? get badgeUrls;

}
/// @nodoc
class __$CurrentWarClanCopyWithImpl<$Res>
    implements _$CurrentWarClanCopyWith<$Res> {
  __$CurrentWarClanCopyWithImpl(this._self, this._then);

  final _CurrentWarClan _self;
  final $Res Function(_CurrentWarClan) _then;

/// Create a copy of CurrentWarClan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tag = freezed,Object? name = freezed,Object? badgeUrls = freezed,Object? clanLevel = freezed,Object? attacks = freezed,Object? stars = freezed,Object? destructionPercentage = freezed,Object? members = null,}) {
  return _then(_CurrentWarClan(
tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,badgeUrls: freezed == badgeUrls ? _self.badgeUrls : badgeUrls // ignore: cast_nullable_to_non_nullable
as BadgeUrls?,clanLevel: freezed == clanLevel ? _self.clanLevel : clanLevel // ignore: cast_nullable_to_non_nullable
as int?,attacks: freezed == attacks ? _self.attacks : attacks // ignore: cast_nullable_to_non_nullable
as int?,stars: freezed == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int?,destructionPercentage: freezed == destructionPercentage ? _self.destructionPercentage : destructionPercentage // ignore: cast_nullable_to_non_nullable
as double?,members: null == members ? _self._members : members // ignore: cast_nullable_to_non_nullable
as List<WarMember>,
  ));
}

/// Create a copy of CurrentWarClan
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
mixin _$CurrentWar {

@JsonKey(unknownEnumValue: WarState.unknown) WarState? get state; int? get teamSize; int? get attacksPerMember; String? get battleModifier;@CocDateTimeConverter() DateTime? get preparationStartTime;@CocDateTimeConverter() DateTime? get startTime;@CocDateTimeConverter() DateTime? get endTime; CurrentWarClan? get clan; CurrentWarClan? get opponent;
/// Create a copy of CurrentWar
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentWarCopyWith<CurrentWar> get copyWith => _$CurrentWarCopyWithImpl<CurrentWar>(this as CurrentWar, _$identity);

  /// Serializes this CurrentWar to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CurrentWar;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentWar&&(identical(other.state, _this.state) || other.state == _this.state)&&(identical(other.teamSize, _this.teamSize) || other.teamSize == _this.teamSize)&&(identical(other.attacksPerMember, _this.attacksPerMember) || other.attacksPerMember == _this.attacksPerMember)&&(identical(other.battleModifier, _this.battleModifier) || other.battleModifier == _this.battleModifier)&&(identical(other.preparationStartTime, _this.preparationStartTime) || other.preparationStartTime == _this.preparationStartTime)&&(identical(other.startTime, _this.startTime) || other.startTime == _this.startTime)&&(identical(other.endTime, _this.endTime) || other.endTime == _this.endTime)&&(identical(other.clan, _this.clan) || other.clan == _this.clan)&&(identical(other.opponent, _this.opponent) || other.opponent == _this.opponent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CurrentWar;
  return Object.hash(runtimeType,_this.state,_this.teamSize,_this.attacksPerMember,_this.battleModifier,_this.preparationStartTime,_this.startTime,_this.endTime,_this.clan,_this.opponent);
}

@override
String toString() {
  final _this = this as CurrentWar;
  return 'CurrentWar(state: ${_this.state}, teamSize: ${_this.teamSize}, attacksPerMember: ${_this.attacksPerMember}, battleModifier: ${_this.battleModifier}, preparationStartTime: ${_this.preparationStartTime}, startTime: ${_this.startTime}, endTime: ${_this.endTime}, clan: ${_this.clan}, opponent: ${_this.opponent})';
}


}

/// @nodoc
abstract mixin class $CurrentWarCopyWith<$Res>  {
  factory $CurrentWarCopyWith(CurrentWar value, $Res Function(CurrentWar) _then) = _$CurrentWarCopyWithImpl;
@useResult
$Res call({
@JsonKey(unknownEnumValue: WarState.unknown) WarState? state, int? teamSize, int? attacksPerMember, String? battleModifier,@CocDateTimeConverter() DateTime? preparationStartTime,@CocDateTimeConverter() DateTime? startTime,@CocDateTimeConverter() DateTime? endTime, CurrentWarClan? clan, CurrentWarClan? opponent
});


$CurrentWarClanCopyWith<$Res>? get clan;$CurrentWarClanCopyWith<$Res>? get opponent;

}
/// @nodoc
class _$CurrentWarCopyWithImpl<$Res>
    implements $CurrentWarCopyWith<$Res> {
  _$CurrentWarCopyWithImpl(this._self, this._then);

  final CurrentWar _self;
  final $Res Function(CurrentWar) _then;

/// Create a copy of CurrentWar
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? state = freezed,Object? teamSize = freezed,Object? attacksPerMember = freezed,Object? battleModifier = freezed,Object? preparationStartTime = freezed,Object? startTime = freezed,Object? endTime = freezed,Object? clan = freezed,Object? opponent = freezed,}) {
  return _then(CurrentWar(
state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as WarState?,teamSize: freezed == teamSize ? _self.teamSize : teamSize // ignore: cast_nullable_to_non_nullable
as int?,attacksPerMember: freezed == attacksPerMember ? _self.attacksPerMember : attacksPerMember // ignore: cast_nullable_to_non_nullable
as int?,battleModifier: freezed == battleModifier ? _self.battleModifier : battleModifier // ignore: cast_nullable_to_non_nullable
as String?,preparationStartTime: freezed == preparationStartTime ? _self.preparationStartTime : preparationStartTime // ignore: cast_nullable_to_non_nullable
as DateTime?,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,clan: freezed == clan ? _self.clan : clan // ignore: cast_nullable_to_non_nullable
as CurrentWarClan?,opponent: freezed == opponent ? _self.opponent : opponent // ignore: cast_nullable_to_non_nullable
as CurrentWarClan?,
  ));
}
/// Create a copy of CurrentWar
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrentWarClanCopyWith<$Res>? get clan {
    if (_self.clan == null) {
    return null;
  }

  return $CurrentWarClanCopyWith<$Res>(_self.clan!, (value) {
    return _then(_self.copyWith(clan: value));
  });
}/// Create a copy of CurrentWar
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrentWarClanCopyWith<$Res>? get opponent {
    if (_self.opponent == null) {
    return null;
  }

  return $CurrentWarClanCopyWith<$Res>(_self.opponent!, (value) {
    return _then(_self.copyWith(opponent: value));
  });
}
}


/// Adds pattern-matching-related methods to [CurrentWar].
extension CurrentWarPatterns on CurrentWar {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CurrentWar value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CurrentWar() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CurrentWar value)  $default,){
final _that = this;
switch (_that) {
case _CurrentWar():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CurrentWar value)?  $default,){
final _that = this;
switch (_that) {
case _CurrentWar() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: WarState.unknown)  WarState? state,  int? teamSize,  int? attacksPerMember,  String? battleModifier, @CocDateTimeConverter()  DateTime? preparationStartTime, @CocDateTimeConverter()  DateTime? startTime, @CocDateTimeConverter()  DateTime? endTime,  CurrentWarClan? clan,  CurrentWarClan? opponent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CurrentWar() when $default != null:
return $default(_that.state,_that.teamSize,_that.attacksPerMember,_that.battleModifier,_that.preparationStartTime,_that.startTime,_that.endTime,_that.clan,_that.opponent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: WarState.unknown)  WarState? state,  int? teamSize,  int? attacksPerMember,  String? battleModifier, @CocDateTimeConverter()  DateTime? preparationStartTime, @CocDateTimeConverter()  DateTime? startTime, @CocDateTimeConverter()  DateTime? endTime,  CurrentWarClan? clan,  CurrentWarClan? opponent)  $default,) {final _that = this;
switch (_that) {
case _CurrentWar():
return $default(_that.state,_that.teamSize,_that.attacksPerMember,_that.battleModifier,_that.preparationStartTime,_that.startTime,_that.endTime,_that.clan,_that.opponent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(unknownEnumValue: WarState.unknown)  WarState? state,  int? teamSize,  int? attacksPerMember,  String? battleModifier, @CocDateTimeConverter()  DateTime? preparationStartTime, @CocDateTimeConverter()  DateTime? startTime, @CocDateTimeConverter()  DateTime? endTime,  CurrentWarClan? clan,  CurrentWarClan? opponent)?  $default,) {final _that = this;
switch (_that) {
case _CurrentWar() when $default != null:
return $default(_that.state,_that.teamSize,_that.attacksPerMember,_that.battleModifier,_that.preparationStartTime,_that.startTime,_that.endTime,_that.clan,_that.opponent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CurrentWar implements CurrentWar {
  const _CurrentWar({@JsonKey(unknownEnumValue: WarState.unknown) this.state, this.teamSize, this.attacksPerMember, this.battleModifier, @CocDateTimeConverter() this.preparationStartTime, @CocDateTimeConverter() this.startTime, @CocDateTimeConverter() this.endTime, this.clan, this.opponent});
  factory _CurrentWar.fromJson(Map<String, dynamic> json) => _$CurrentWarFromJson(json);

@override@JsonKey(unknownEnumValue: WarState.unknown) final  WarState? state;
@override final  int? teamSize;
@override final  int? attacksPerMember;
@override final  String? battleModifier;
@override@CocDateTimeConverter() final  DateTime? preparationStartTime;
@override@CocDateTimeConverter() final  DateTime? startTime;
@override@CocDateTimeConverter() final  DateTime? endTime;
@override final  CurrentWarClan? clan;
@override final  CurrentWarClan? opponent;

/// Create a copy of CurrentWar
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrentWarCopyWith<_CurrentWar> get copyWith => __$CurrentWarCopyWithImpl<_CurrentWar>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CurrentWarToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrentWar&&(identical(other.state, state) || other.state == state)&&(identical(other.teamSize, teamSize) || other.teamSize == teamSize)&&(identical(other.attacksPerMember, attacksPerMember) || other.attacksPerMember == attacksPerMember)&&(identical(other.battleModifier, battleModifier) || other.battleModifier == battleModifier)&&(identical(other.preparationStartTime, preparationStartTime) || other.preparationStartTime == preparationStartTime)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.clan, clan) || other.clan == clan)&&(identical(other.opponent, opponent) || other.opponent == opponent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,state,teamSize,attacksPerMember,battleModifier,preparationStartTime,startTime,endTime,clan,opponent);
}

@override
String toString() {
    return 'CurrentWar(state: $state, teamSize: $teamSize, attacksPerMember: $attacksPerMember, battleModifier: $battleModifier, preparationStartTime: $preparationStartTime, startTime: $startTime, endTime: $endTime, clan: $clan, opponent: $opponent)';
}


}

/// @nodoc
abstract mixin class _$CurrentWarCopyWith<$Res> implements $CurrentWarCopyWith<$Res> {
  factory _$CurrentWarCopyWith(_CurrentWar value, $Res Function(_CurrentWar) _then) = __$CurrentWarCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(unknownEnumValue: WarState.unknown) WarState? state, int? teamSize, int? attacksPerMember, String? battleModifier,@CocDateTimeConverter() DateTime? preparationStartTime,@CocDateTimeConverter() DateTime? startTime,@CocDateTimeConverter() DateTime? endTime, CurrentWarClan? clan, CurrentWarClan? opponent
});


@override $CurrentWarClanCopyWith<$Res>? get clan;@override $CurrentWarClanCopyWith<$Res>? get opponent;

}
/// @nodoc
class __$CurrentWarCopyWithImpl<$Res>
    implements _$CurrentWarCopyWith<$Res> {
  __$CurrentWarCopyWithImpl(this._self, this._then);

  final _CurrentWar _self;
  final $Res Function(_CurrentWar) _then;

/// Create a copy of CurrentWar
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? state = freezed,Object? teamSize = freezed,Object? attacksPerMember = freezed,Object? battleModifier = freezed,Object? preparationStartTime = freezed,Object? startTime = freezed,Object? endTime = freezed,Object? clan = freezed,Object? opponent = freezed,}) {
  return _then(_CurrentWar(
state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as WarState?,teamSize: freezed == teamSize ? _self.teamSize : teamSize // ignore: cast_nullable_to_non_nullable
as int?,attacksPerMember: freezed == attacksPerMember ? _self.attacksPerMember : attacksPerMember // ignore: cast_nullable_to_non_nullable
as int?,battleModifier: freezed == battleModifier ? _self.battleModifier : battleModifier // ignore: cast_nullable_to_non_nullable
as String?,preparationStartTime: freezed == preparationStartTime ? _self.preparationStartTime : preparationStartTime // ignore: cast_nullable_to_non_nullable
as DateTime?,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,clan: freezed == clan ? _self.clan : clan // ignore: cast_nullable_to_non_nullable
as CurrentWarClan?,opponent: freezed == opponent ? _self.opponent : opponent // ignore: cast_nullable_to_non_nullable
as CurrentWarClan?,
  ));
}

/// Create a copy of CurrentWar
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrentWarClanCopyWith<$Res>? get clan {
    if (_self.clan == null) {
    return null;
  }

  return $CurrentWarClanCopyWith<$Res>(_self.clan!, (value) {
    return _then(_self.copyWith(clan: value));
  });
}/// Create a copy of CurrentWar
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrentWarClanCopyWith<$Res>? get opponent {
    if (_self.opponent == null) {
    return null;
  }

  return $CurrentWarClanCopyWith<$Res>(_self.opponent!, (value) {
    return _then(_self.copyWith(opponent: value));
  });
}
}

// dart format on
