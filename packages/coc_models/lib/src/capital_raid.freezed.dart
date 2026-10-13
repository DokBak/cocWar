// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'capital_raid.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CapitalRaidMember {

 String? get tag; String? get name;/// 사용한 공격 수.
 int? get attacks;/// 기본 공격 한도.
 int? get attackLimit;/// 추가로 얻은 공격 한도. 전체 공격권은 `attackLimit + bonusAttackLimit`.
 int? get bonusAttackLimit; int? get capitalResourcesLooted;
/// Create a copy of CapitalRaidMember
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CapitalRaidMemberCopyWith<CapitalRaidMember> get copyWith => _$CapitalRaidMemberCopyWithImpl<CapitalRaidMember>(this as CapitalRaidMember, _$identity);

  /// Serializes this CapitalRaidMember to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CapitalRaidMember;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CapitalRaidMember&&(identical(other.tag, _this.tag) || other.tag == _this.tag)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.attacks, _this.attacks) || other.attacks == _this.attacks)&&(identical(other.attackLimit, _this.attackLimit) || other.attackLimit == _this.attackLimit)&&(identical(other.bonusAttackLimit, _this.bonusAttackLimit) || other.bonusAttackLimit == _this.bonusAttackLimit)&&(identical(other.capitalResourcesLooted, _this.capitalResourcesLooted) || other.capitalResourcesLooted == _this.capitalResourcesLooted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CapitalRaidMember;
  return Object.hash(runtimeType,_this.tag,_this.name,_this.attacks,_this.attackLimit,_this.bonusAttackLimit,_this.capitalResourcesLooted);
}

@override
String toString() {
  final _this = this as CapitalRaidMember;
  return 'CapitalRaidMember(tag: ${_this.tag}, name: ${_this.name}, attacks: ${_this.attacks}, attackLimit: ${_this.attackLimit}, bonusAttackLimit: ${_this.bonusAttackLimit}, capitalResourcesLooted: ${_this.capitalResourcesLooted})';
}


}

/// @nodoc
abstract mixin class $CapitalRaidMemberCopyWith<$Res>  {
  factory $CapitalRaidMemberCopyWith(CapitalRaidMember value, $Res Function(CapitalRaidMember) _then) = _$CapitalRaidMemberCopyWithImpl;
@useResult
$Res call({
 String? tag, String? name, int? attacks, int? attackLimit, int? bonusAttackLimit, int? capitalResourcesLooted
});




}
/// @nodoc
class _$CapitalRaidMemberCopyWithImpl<$Res>
    implements $CapitalRaidMemberCopyWith<$Res> {
  _$CapitalRaidMemberCopyWithImpl(this._self, this._then);

  final CapitalRaidMember _self;
  final $Res Function(CapitalRaidMember) _then;

/// Create a copy of CapitalRaidMember
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tag = freezed,Object? name = freezed,Object? attacks = freezed,Object? attackLimit = freezed,Object? bonusAttackLimit = freezed,Object? capitalResourcesLooted = freezed,}) {
  return _then(CapitalRaidMember(
tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,attacks: freezed == attacks ? _self.attacks : attacks // ignore: cast_nullable_to_non_nullable
as int?,attackLimit: freezed == attackLimit ? _self.attackLimit : attackLimit // ignore: cast_nullable_to_non_nullable
as int?,bonusAttackLimit: freezed == bonusAttackLimit ? _self.bonusAttackLimit : bonusAttackLimit // ignore: cast_nullable_to_non_nullable
as int?,capitalResourcesLooted: freezed == capitalResourcesLooted ? _self.capitalResourcesLooted : capitalResourcesLooted // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CapitalRaidMember].
extension CapitalRaidMemberPatterns on CapitalRaidMember {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CapitalRaidMember value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CapitalRaidMember() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CapitalRaidMember value)  $default,){
final _that = this;
switch (_that) {
case _CapitalRaidMember():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CapitalRaidMember value)?  $default,){
final _that = this;
switch (_that) {
case _CapitalRaidMember() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? tag,  String? name,  int? attacks,  int? attackLimit,  int? bonusAttackLimit,  int? capitalResourcesLooted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CapitalRaidMember() when $default != null:
return $default(_that.tag,_that.name,_that.attacks,_that.attackLimit,_that.bonusAttackLimit,_that.capitalResourcesLooted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? tag,  String? name,  int? attacks,  int? attackLimit,  int? bonusAttackLimit,  int? capitalResourcesLooted)  $default,) {final _that = this;
switch (_that) {
case _CapitalRaidMember():
return $default(_that.tag,_that.name,_that.attacks,_that.attackLimit,_that.bonusAttackLimit,_that.capitalResourcesLooted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? tag,  String? name,  int? attacks,  int? attackLimit,  int? bonusAttackLimit,  int? capitalResourcesLooted)?  $default,) {final _that = this;
switch (_that) {
case _CapitalRaidMember() when $default != null:
return $default(_that.tag,_that.name,_that.attacks,_that.attackLimit,_that.bonusAttackLimit,_that.capitalResourcesLooted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CapitalRaidMember implements CapitalRaidMember {
  const _CapitalRaidMember({this.tag, this.name, this.attacks, this.attackLimit, this.bonusAttackLimit, this.capitalResourcesLooted});
  factory _CapitalRaidMember.fromJson(Map<String, dynamic> json) => _$CapitalRaidMemberFromJson(json);

@override final  String? tag;
@override final  String? name;
/// 사용한 공격 수.
@override final  int? attacks;
/// 기본 공격 한도.
@override final  int? attackLimit;
/// 추가로 얻은 공격 한도. 전체 공격권은 `attackLimit + bonusAttackLimit`.
@override final  int? bonusAttackLimit;
@override final  int? capitalResourcesLooted;

/// Create a copy of CapitalRaidMember
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CapitalRaidMemberCopyWith<_CapitalRaidMember> get copyWith => __$CapitalRaidMemberCopyWithImpl<_CapitalRaidMember>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CapitalRaidMemberToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CapitalRaidMember&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.name, name) || other.name == name)&&(identical(other.attacks, attacks) || other.attacks == attacks)&&(identical(other.attackLimit, attackLimit) || other.attackLimit == attackLimit)&&(identical(other.bonusAttackLimit, bonusAttackLimit) || other.bonusAttackLimit == bonusAttackLimit)&&(identical(other.capitalResourcesLooted, capitalResourcesLooted) || other.capitalResourcesLooted == capitalResourcesLooted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,tag,name,attacks,attackLimit,bonusAttackLimit,capitalResourcesLooted);
}

@override
String toString() {
    return 'CapitalRaidMember(tag: $tag, name: $name, attacks: $attacks, attackLimit: $attackLimit, bonusAttackLimit: $bonusAttackLimit, capitalResourcesLooted: $capitalResourcesLooted)';
}


}

/// @nodoc
abstract mixin class _$CapitalRaidMemberCopyWith<$Res> implements $CapitalRaidMemberCopyWith<$Res> {
  factory _$CapitalRaidMemberCopyWith(_CapitalRaidMember value, $Res Function(_CapitalRaidMember) _then) = __$CapitalRaidMemberCopyWithImpl;
@override @useResult
$Res call({
 String? tag, String? name, int? attacks, int? attackLimit, int? bonusAttackLimit, int? capitalResourcesLooted
});




}
/// @nodoc
class __$CapitalRaidMemberCopyWithImpl<$Res>
    implements _$CapitalRaidMemberCopyWith<$Res> {
  __$CapitalRaidMemberCopyWithImpl(this._self, this._then);

  final _CapitalRaidMember _self;
  final $Res Function(_CapitalRaidMember) _then;

/// Create a copy of CapitalRaidMember
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tag = freezed,Object? name = freezed,Object? attacks = freezed,Object? attackLimit = freezed,Object? bonusAttackLimit = freezed,Object? capitalResourcesLooted = freezed,}) {
  return _then(_CapitalRaidMember(
tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,attacks: freezed == attacks ? _self.attacks : attacks // ignore: cast_nullable_to_non_nullable
as int?,attackLimit: freezed == attackLimit ? _self.attackLimit : attackLimit // ignore: cast_nullable_to_non_nullable
as int?,bonusAttackLimit: freezed == bonusAttackLimit ? _self.bonusAttackLimit : bonusAttackLimit // ignore: cast_nullable_to_non_nullable
as int?,capitalResourcesLooted: freezed == capitalResourcesLooted ? _self.capitalResourcesLooted : capitalResourcesLooted // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$CapitalRaidSeason {

@JsonKey(unknownEnumValue: RaidState.unknown) RaidState? get state;@CocDateTimeConverter() DateTime? get startTime;@CocDateTimeConverter() DateTime? get endTime; int? get capitalTotalLoot; int? get raidsCompleted; int? get totalAttacks; int? get enemyDistrictsDestroyed; int? get offensiveReward; int? get defensiveReward;/// 최근 시즌에만 채워져 있다. 과거 시즌은 비어 있다.
 List<CapitalRaidMember> get members;
/// Create a copy of CapitalRaidSeason
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CapitalRaidSeasonCopyWith<CapitalRaidSeason> get copyWith => _$CapitalRaidSeasonCopyWithImpl<CapitalRaidSeason>(this as CapitalRaidSeason, _$identity);

  /// Serializes this CapitalRaidSeason to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CapitalRaidSeason;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CapitalRaidSeason&&(identical(other.state, _this.state) || other.state == _this.state)&&(identical(other.startTime, _this.startTime) || other.startTime == _this.startTime)&&(identical(other.endTime, _this.endTime) || other.endTime == _this.endTime)&&(identical(other.capitalTotalLoot, _this.capitalTotalLoot) || other.capitalTotalLoot == _this.capitalTotalLoot)&&(identical(other.raidsCompleted, _this.raidsCompleted) || other.raidsCompleted == _this.raidsCompleted)&&(identical(other.totalAttacks, _this.totalAttacks) || other.totalAttacks == _this.totalAttacks)&&(identical(other.enemyDistrictsDestroyed, _this.enemyDistrictsDestroyed) || other.enemyDistrictsDestroyed == _this.enemyDistrictsDestroyed)&&(identical(other.offensiveReward, _this.offensiveReward) || other.offensiveReward == _this.offensiveReward)&&(identical(other.defensiveReward, _this.defensiveReward) || other.defensiveReward == _this.defensiveReward)&&const DeepCollectionEquality().equals(other.members, _this.members));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CapitalRaidSeason;
  return Object.hash(runtimeType,_this.state,_this.startTime,_this.endTime,_this.capitalTotalLoot,_this.raidsCompleted,_this.totalAttacks,_this.enemyDistrictsDestroyed,_this.offensiveReward,_this.defensiveReward,const DeepCollectionEquality().hash(_this.members));
}

@override
String toString() {
  final _this = this as CapitalRaidSeason;
  return 'CapitalRaidSeason(state: ${_this.state}, startTime: ${_this.startTime}, endTime: ${_this.endTime}, capitalTotalLoot: ${_this.capitalTotalLoot}, raidsCompleted: ${_this.raidsCompleted}, totalAttacks: ${_this.totalAttacks}, enemyDistrictsDestroyed: ${_this.enemyDistrictsDestroyed}, offensiveReward: ${_this.offensiveReward}, defensiveReward: ${_this.defensiveReward}, members: ${_this.members})';
}


}

/// @nodoc
abstract mixin class $CapitalRaidSeasonCopyWith<$Res>  {
  factory $CapitalRaidSeasonCopyWith(CapitalRaidSeason value, $Res Function(CapitalRaidSeason) _then) = _$CapitalRaidSeasonCopyWithImpl;
@useResult
$Res call({
@JsonKey(unknownEnumValue: RaidState.unknown) RaidState? state,@CocDateTimeConverter() DateTime? startTime,@CocDateTimeConverter() DateTime? endTime, int? capitalTotalLoot, int? raidsCompleted, int? totalAttacks, int? enemyDistrictsDestroyed, int? offensiveReward, int? defensiveReward, List<CapitalRaidMember> members
});




}
/// @nodoc
class _$CapitalRaidSeasonCopyWithImpl<$Res>
    implements $CapitalRaidSeasonCopyWith<$Res> {
  _$CapitalRaidSeasonCopyWithImpl(this._self, this._then);

  final CapitalRaidSeason _self;
  final $Res Function(CapitalRaidSeason) _then;

/// Create a copy of CapitalRaidSeason
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? state = freezed,Object? startTime = freezed,Object? endTime = freezed,Object? capitalTotalLoot = freezed,Object? raidsCompleted = freezed,Object? totalAttacks = freezed,Object? enemyDistrictsDestroyed = freezed,Object? offensiveReward = freezed,Object? defensiveReward = freezed,Object? members = null,}) {
  return _then(CapitalRaidSeason(
state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as RaidState?,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,capitalTotalLoot: freezed == capitalTotalLoot ? _self.capitalTotalLoot : capitalTotalLoot // ignore: cast_nullable_to_non_nullable
as int?,raidsCompleted: freezed == raidsCompleted ? _self.raidsCompleted : raidsCompleted // ignore: cast_nullable_to_non_nullable
as int?,totalAttacks: freezed == totalAttacks ? _self.totalAttacks : totalAttacks // ignore: cast_nullable_to_non_nullable
as int?,enemyDistrictsDestroyed: freezed == enemyDistrictsDestroyed ? _self.enemyDistrictsDestroyed : enemyDistrictsDestroyed // ignore: cast_nullable_to_non_nullable
as int?,offensiveReward: freezed == offensiveReward ? _self.offensiveReward : offensiveReward // ignore: cast_nullable_to_non_nullable
as int?,defensiveReward: freezed == defensiveReward ? _self.defensiveReward : defensiveReward // ignore: cast_nullable_to_non_nullable
as int?,members: null == members ? _self.members : members // ignore: cast_nullable_to_non_nullable
as List<CapitalRaidMember>,
  ));
}

}


/// Adds pattern-matching-related methods to [CapitalRaidSeason].
extension CapitalRaidSeasonPatterns on CapitalRaidSeason {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CapitalRaidSeason value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CapitalRaidSeason() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CapitalRaidSeason value)  $default,){
final _that = this;
switch (_that) {
case _CapitalRaidSeason():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CapitalRaidSeason value)?  $default,){
final _that = this;
switch (_that) {
case _CapitalRaidSeason() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: RaidState.unknown)  RaidState? state, @CocDateTimeConverter()  DateTime? startTime, @CocDateTimeConverter()  DateTime? endTime,  int? capitalTotalLoot,  int? raidsCompleted,  int? totalAttacks,  int? enemyDistrictsDestroyed,  int? offensiveReward,  int? defensiveReward,  List<CapitalRaidMember> members)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CapitalRaidSeason() when $default != null:
return $default(_that.state,_that.startTime,_that.endTime,_that.capitalTotalLoot,_that.raidsCompleted,_that.totalAttacks,_that.enemyDistrictsDestroyed,_that.offensiveReward,_that.defensiveReward,_that.members);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: RaidState.unknown)  RaidState? state, @CocDateTimeConverter()  DateTime? startTime, @CocDateTimeConverter()  DateTime? endTime,  int? capitalTotalLoot,  int? raidsCompleted,  int? totalAttacks,  int? enemyDistrictsDestroyed,  int? offensiveReward,  int? defensiveReward,  List<CapitalRaidMember> members)  $default,) {final _that = this;
switch (_that) {
case _CapitalRaidSeason():
return $default(_that.state,_that.startTime,_that.endTime,_that.capitalTotalLoot,_that.raidsCompleted,_that.totalAttacks,_that.enemyDistrictsDestroyed,_that.offensiveReward,_that.defensiveReward,_that.members);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(unknownEnumValue: RaidState.unknown)  RaidState? state, @CocDateTimeConverter()  DateTime? startTime, @CocDateTimeConverter()  DateTime? endTime,  int? capitalTotalLoot,  int? raidsCompleted,  int? totalAttacks,  int? enemyDistrictsDestroyed,  int? offensiveReward,  int? defensiveReward,  List<CapitalRaidMember> members)?  $default,) {final _that = this;
switch (_that) {
case _CapitalRaidSeason() when $default != null:
return $default(_that.state,_that.startTime,_that.endTime,_that.capitalTotalLoot,_that.raidsCompleted,_that.totalAttacks,_that.enemyDistrictsDestroyed,_that.offensiveReward,_that.defensiveReward,_that.members);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CapitalRaidSeason implements CapitalRaidSeason {
  const _CapitalRaidSeason({@JsonKey(unknownEnumValue: RaidState.unknown) this.state, @CocDateTimeConverter() this.startTime, @CocDateTimeConverter() this.endTime, this.capitalTotalLoot, this.raidsCompleted, this.totalAttacks, this.enemyDistrictsDestroyed, this.offensiveReward, this.defensiveReward,  List<CapitalRaidMember> members = const <CapitalRaidMember>[]}): _members = members;
  factory _CapitalRaidSeason.fromJson(Map<String, dynamic> json) => _$CapitalRaidSeasonFromJson(json);

@override@JsonKey(unknownEnumValue: RaidState.unknown) final  RaidState? state;
@override@CocDateTimeConverter() final  DateTime? startTime;
@override@CocDateTimeConverter() final  DateTime? endTime;
@override final  int? capitalTotalLoot;
@override final  int? raidsCompleted;
@override final  int? totalAttacks;
@override final  int? enemyDistrictsDestroyed;
@override final  int? offensiveReward;
@override final  int? defensiveReward;
/// 최근 시즌에만 채워져 있다. 과거 시즌은 비어 있다.
 final  List<CapitalRaidMember> _members;
/// 최근 시즌에만 채워져 있다. 과거 시즌은 비어 있다.
@override@JsonKey() List<CapitalRaidMember> get members {
  if (_members is EqualUnmodifiableListView) return _members;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_members);
}


/// Create a copy of CapitalRaidSeason
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CapitalRaidSeasonCopyWith<_CapitalRaidSeason> get copyWith => __$CapitalRaidSeasonCopyWithImpl<_CapitalRaidSeason>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CapitalRaidSeasonToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CapitalRaidSeason&&(identical(other.state, state) || other.state == state)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.capitalTotalLoot, capitalTotalLoot) || other.capitalTotalLoot == capitalTotalLoot)&&(identical(other.raidsCompleted, raidsCompleted) || other.raidsCompleted == raidsCompleted)&&(identical(other.totalAttacks, totalAttacks) || other.totalAttacks == totalAttacks)&&(identical(other.enemyDistrictsDestroyed, enemyDistrictsDestroyed) || other.enemyDistrictsDestroyed == enemyDistrictsDestroyed)&&(identical(other.offensiveReward, offensiveReward) || other.offensiveReward == offensiveReward)&&(identical(other.defensiveReward, defensiveReward) || other.defensiveReward == defensiveReward)&&const DeepCollectionEquality().equals(other.members, _members));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,state,startTime,endTime,capitalTotalLoot,raidsCompleted,totalAttacks,enemyDistrictsDestroyed,offensiveReward,defensiveReward,const DeepCollectionEquality().hash(_members));
}

@override
String toString() {
    return 'CapitalRaidSeason(state: $state, startTime: $startTime, endTime: $endTime, capitalTotalLoot: $capitalTotalLoot, raidsCompleted: $raidsCompleted, totalAttacks: $totalAttacks, enemyDistrictsDestroyed: $enemyDistrictsDestroyed, offensiveReward: $offensiveReward, defensiveReward: $defensiveReward, members: $members)';
}


}

/// @nodoc
abstract mixin class _$CapitalRaidSeasonCopyWith<$Res> implements $CapitalRaidSeasonCopyWith<$Res> {
  factory _$CapitalRaidSeasonCopyWith(_CapitalRaidSeason value, $Res Function(_CapitalRaidSeason) _then) = __$CapitalRaidSeasonCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(unknownEnumValue: RaidState.unknown) RaidState? state,@CocDateTimeConverter() DateTime? startTime,@CocDateTimeConverter() DateTime? endTime, int? capitalTotalLoot, int? raidsCompleted, int? totalAttacks, int? enemyDistrictsDestroyed, int? offensiveReward, int? defensiveReward, List<CapitalRaidMember> members
});




}
/// @nodoc
class __$CapitalRaidSeasonCopyWithImpl<$Res>
    implements _$CapitalRaidSeasonCopyWith<$Res> {
  __$CapitalRaidSeasonCopyWithImpl(this._self, this._then);

  final _CapitalRaidSeason _self;
  final $Res Function(_CapitalRaidSeason) _then;

/// Create a copy of CapitalRaidSeason
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? state = freezed,Object? startTime = freezed,Object? endTime = freezed,Object? capitalTotalLoot = freezed,Object? raidsCompleted = freezed,Object? totalAttacks = freezed,Object? enemyDistrictsDestroyed = freezed,Object? offensiveReward = freezed,Object? defensiveReward = freezed,Object? members = null,}) {
  return _then(_CapitalRaidSeason(
state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as RaidState?,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,capitalTotalLoot: freezed == capitalTotalLoot ? _self.capitalTotalLoot : capitalTotalLoot // ignore: cast_nullable_to_non_nullable
as int?,raidsCompleted: freezed == raidsCompleted ? _self.raidsCompleted : raidsCompleted // ignore: cast_nullable_to_non_nullable
as int?,totalAttacks: freezed == totalAttacks ? _self.totalAttacks : totalAttacks // ignore: cast_nullable_to_non_nullable
as int?,enemyDistrictsDestroyed: freezed == enemyDistrictsDestroyed ? _self.enemyDistrictsDestroyed : enemyDistrictsDestroyed // ignore: cast_nullable_to_non_nullable
as int?,offensiveReward: freezed == offensiveReward ? _self.offensiveReward : offensiveReward // ignore: cast_nullable_to_non_nullable
as int?,defensiveReward: freezed == defensiveReward ? _self.defensiveReward : defensiveReward // ignore: cast_nullable_to_non_nullable
as int?,members: null == members ? _self._members : members // ignore: cast_nullable_to_non_nullable
as List<CapitalRaidMember>,
  ));
}


}


/// @nodoc
mixin _$CapitalRaidSeasons {

 List<CapitalRaidSeason> get items; Paging? get paging;
/// Create a copy of CapitalRaidSeasons
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CapitalRaidSeasonsCopyWith<CapitalRaidSeasons> get copyWith => _$CapitalRaidSeasonsCopyWithImpl<CapitalRaidSeasons>(this as CapitalRaidSeasons, _$identity);

  /// Serializes this CapitalRaidSeasons to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CapitalRaidSeasons;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CapitalRaidSeasons&&const DeepCollectionEquality().equals(other.items, _this.items)&&(identical(other.paging, _this.paging) || other.paging == _this.paging));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CapitalRaidSeasons;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.items),_this.paging);
}

@override
String toString() {
  final _this = this as CapitalRaidSeasons;
  return 'CapitalRaidSeasons(items: ${_this.items}, paging: ${_this.paging})';
}


}

/// @nodoc
abstract mixin class $CapitalRaidSeasonsCopyWith<$Res>  {
  factory $CapitalRaidSeasonsCopyWith(CapitalRaidSeasons value, $Res Function(CapitalRaidSeasons) _then) = _$CapitalRaidSeasonsCopyWithImpl;
@useResult
$Res call({
 List<CapitalRaidSeason> items, Paging? paging
});


$PagingCopyWith<$Res>? get paging;

}
/// @nodoc
class _$CapitalRaidSeasonsCopyWithImpl<$Res>
    implements $CapitalRaidSeasonsCopyWith<$Res> {
  _$CapitalRaidSeasonsCopyWithImpl(this._self, this._then);

  final CapitalRaidSeasons _self;
  final $Res Function(CapitalRaidSeasons) _then;

/// Create a copy of CapitalRaidSeasons
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? paging = freezed,}) {
  return _then(CapitalRaidSeasons(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CapitalRaidSeason>,paging: freezed == paging ? _self.paging : paging // ignore: cast_nullable_to_non_nullable
as Paging?,
  ));
}
/// Create a copy of CapitalRaidSeasons
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PagingCopyWith<$Res>? get paging {
    if (_self.paging == null) {
    return null;
  }

  return $PagingCopyWith<$Res>(_self.paging!, (value) {
    return _then(_self.copyWith(paging: value));
  });
}
}


/// Adds pattern-matching-related methods to [CapitalRaidSeasons].
extension CapitalRaidSeasonsPatterns on CapitalRaidSeasons {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CapitalRaidSeasons value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CapitalRaidSeasons() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CapitalRaidSeasons value)  $default,){
final _that = this;
switch (_that) {
case _CapitalRaidSeasons():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CapitalRaidSeasons value)?  $default,){
final _that = this;
switch (_that) {
case _CapitalRaidSeasons() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CapitalRaidSeason> items,  Paging? paging)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CapitalRaidSeasons() when $default != null:
return $default(_that.items,_that.paging);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CapitalRaidSeason> items,  Paging? paging)  $default,) {final _that = this;
switch (_that) {
case _CapitalRaidSeasons():
return $default(_that.items,_that.paging);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CapitalRaidSeason> items,  Paging? paging)?  $default,) {final _that = this;
switch (_that) {
case _CapitalRaidSeasons() when $default != null:
return $default(_that.items,_that.paging);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CapitalRaidSeasons implements CapitalRaidSeasons {
  const _CapitalRaidSeasons({ List<CapitalRaidSeason> items = const <CapitalRaidSeason>[], this.paging}): _items = items;
  factory _CapitalRaidSeasons.fromJson(Map<String, dynamic> json) => _$CapitalRaidSeasonsFromJson(json);

 final  List<CapitalRaidSeason> _items;
@override@JsonKey() List<CapitalRaidSeason> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  Paging? paging;

/// Create a copy of CapitalRaidSeasons
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CapitalRaidSeasonsCopyWith<_CapitalRaidSeasons> get copyWith => __$CapitalRaidSeasonsCopyWithImpl<_CapitalRaidSeasons>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CapitalRaidSeasonsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CapitalRaidSeasons&&const DeepCollectionEquality().equals(other.items, _items)&&(identical(other.paging, paging) || other.paging == paging));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),paging);
}

@override
String toString() {
    return 'CapitalRaidSeasons(items: $items, paging: $paging)';
}


}

/// @nodoc
abstract mixin class _$CapitalRaidSeasonsCopyWith<$Res> implements $CapitalRaidSeasonsCopyWith<$Res> {
  factory _$CapitalRaidSeasonsCopyWith(_CapitalRaidSeasons value, $Res Function(_CapitalRaidSeasons) _then) = __$CapitalRaidSeasonsCopyWithImpl;
@override @useResult
$Res call({
 List<CapitalRaidSeason> items, Paging? paging
});


@override $PagingCopyWith<$Res>? get paging;

}
/// @nodoc
class __$CapitalRaidSeasonsCopyWithImpl<$Res>
    implements _$CapitalRaidSeasonsCopyWith<$Res> {
  __$CapitalRaidSeasonsCopyWithImpl(this._self, this._then);

  final _CapitalRaidSeasons _self;
  final $Res Function(_CapitalRaidSeasons) _then;

/// Create a copy of CapitalRaidSeasons
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? paging = freezed,}) {
  return _then(_CapitalRaidSeasons(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CapitalRaidSeason>,paging: freezed == paging ? _self.paging : paging // ignore: cast_nullable_to_non_nullable
as Paging?,
  ));
}

/// Create a copy of CapitalRaidSeasons
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PagingCopyWith<$Res>? get paging {
    if (_self.paging == null) {
    return null;
  }

  return $PagingCopyWith<$Res>(_self.paging!, (value) {
    return _then(_self.copyWith(paging: value));
  });
}
}

// dart format on
