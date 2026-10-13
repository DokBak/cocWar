// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'war_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WarClan {

 String? get tag; String? get name; BadgeUrls? get badgeUrls; int? get clanLevel; int? get attacks; int? get stars; double? get destructionPercentage; int? get expEarned;
/// Create a copy of WarClan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WarClanCopyWith<WarClan> get copyWith => _$WarClanCopyWithImpl<WarClan>(this as WarClan, _$identity);

  /// Serializes this WarClan to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WarClan;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarClan&&(identical(other.tag, _this.tag) || other.tag == _this.tag)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.badgeUrls, _this.badgeUrls) || other.badgeUrls == _this.badgeUrls)&&(identical(other.clanLevel, _this.clanLevel) || other.clanLevel == _this.clanLevel)&&(identical(other.attacks, _this.attacks) || other.attacks == _this.attacks)&&(identical(other.stars, _this.stars) || other.stars == _this.stars)&&(identical(other.destructionPercentage, _this.destructionPercentage) || other.destructionPercentage == _this.destructionPercentage)&&(identical(other.expEarned, _this.expEarned) || other.expEarned == _this.expEarned));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WarClan;
  return Object.hash(runtimeType,_this.tag,_this.name,_this.badgeUrls,_this.clanLevel,_this.attacks,_this.stars,_this.destructionPercentage,_this.expEarned);
}

@override
String toString() {
  final _this = this as WarClan;
  return 'WarClan(tag: ${_this.tag}, name: ${_this.name}, badgeUrls: ${_this.badgeUrls}, clanLevel: ${_this.clanLevel}, attacks: ${_this.attacks}, stars: ${_this.stars}, destructionPercentage: ${_this.destructionPercentage}, expEarned: ${_this.expEarned})';
}


}

/// @nodoc
abstract mixin class $WarClanCopyWith<$Res>  {
  factory $WarClanCopyWith(WarClan value, $Res Function(WarClan) _then) = _$WarClanCopyWithImpl;
@useResult
$Res call({
 String? tag, String? name, BadgeUrls? badgeUrls, int? clanLevel, int? attacks, int? stars, double? destructionPercentage, int? expEarned
});


$BadgeUrlsCopyWith<$Res>? get badgeUrls;

}
/// @nodoc
class _$WarClanCopyWithImpl<$Res>
    implements $WarClanCopyWith<$Res> {
  _$WarClanCopyWithImpl(this._self, this._then);

  final WarClan _self;
  final $Res Function(WarClan) _then;

/// Create a copy of WarClan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tag = freezed,Object? name = freezed,Object? badgeUrls = freezed,Object? clanLevel = freezed,Object? attacks = freezed,Object? stars = freezed,Object? destructionPercentage = freezed,Object? expEarned = freezed,}) {
  return _then(WarClan(
tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,badgeUrls: freezed == badgeUrls ? _self.badgeUrls : badgeUrls // ignore: cast_nullable_to_non_nullable
as BadgeUrls?,clanLevel: freezed == clanLevel ? _self.clanLevel : clanLevel // ignore: cast_nullable_to_non_nullable
as int?,attacks: freezed == attacks ? _self.attacks : attacks // ignore: cast_nullable_to_non_nullable
as int?,stars: freezed == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int?,destructionPercentage: freezed == destructionPercentage ? _self.destructionPercentage : destructionPercentage // ignore: cast_nullable_to_non_nullable
as double?,expEarned: freezed == expEarned ? _self.expEarned : expEarned // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of WarClan
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


/// Adds pattern-matching-related methods to [WarClan].
extension WarClanPatterns on WarClan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WarClan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WarClan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WarClan value)  $default,){
final _that = this;
switch (_that) {
case _WarClan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WarClan value)?  $default,){
final _that = this;
switch (_that) {
case _WarClan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? tag,  String? name,  BadgeUrls? badgeUrls,  int? clanLevel,  int? attacks,  int? stars,  double? destructionPercentage,  int? expEarned)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WarClan() when $default != null:
return $default(_that.tag,_that.name,_that.badgeUrls,_that.clanLevel,_that.attacks,_that.stars,_that.destructionPercentage,_that.expEarned);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? tag,  String? name,  BadgeUrls? badgeUrls,  int? clanLevel,  int? attacks,  int? stars,  double? destructionPercentage,  int? expEarned)  $default,) {final _that = this;
switch (_that) {
case _WarClan():
return $default(_that.tag,_that.name,_that.badgeUrls,_that.clanLevel,_that.attacks,_that.stars,_that.destructionPercentage,_that.expEarned);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? tag,  String? name,  BadgeUrls? badgeUrls,  int? clanLevel,  int? attacks,  int? stars,  double? destructionPercentage,  int? expEarned)?  $default,) {final _that = this;
switch (_that) {
case _WarClan() when $default != null:
return $default(_that.tag,_that.name,_that.badgeUrls,_that.clanLevel,_that.attacks,_that.stars,_that.destructionPercentage,_that.expEarned);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WarClan implements WarClan {
  const _WarClan({this.tag, this.name, this.badgeUrls, this.clanLevel, this.attacks, this.stars, this.destructionPercentage, this.expEarned});
  factory _WarClan.fromJson(Map<String, dynamic> json) => _$WarClanFromJson(json);

@override final  String? tag;
@override final  String? name;
@override final  BadgeUrls? badgeUrls;
@override final  int? clanLevel;
@override final  int? attacks;
@override final  int? stars;
@override final  double? destructionPercentage;
@override final  int? expEarned;

/// Create a copy of WarClan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WarClanCopyWith<_WarClan> get copyWith => __$WarClanCopyWithImpl<_WarClan>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WarClanToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WarClan&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.name, name) || other.name == name)&&(identical(other.badgeUrls, badgeUrls) || other.badgeUrls == badgeUrls)&&(identical(other.clanLevel, clanLevel) || other.clanLevel == clanLevel)&&(identical(other.attacks, attacks) || other.attacks == attacks)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.destructionPercentage, destructionPercentage) || other.destructionPercentage == destructionPercentage)&&(identical(other.expEarned, expEarned) || other.expEarned == expEarned));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,tag,name,badgeUrls,clanLevel,attacks,stars,destructionPercentage,expEarned);
}

@override
String toString() {
    return 'WarClan(tag: $tag, name: $name, badgeUrls: $badgeUrls, clanLevel: $clanLevel, attacks: $attacks, stars: $stars, destructionPercentage: $destructionPercentage, expEarned: $expEarned)';
}


}

/// @nodoc
abstract mixin class _$WarClanCopyWith<$Res> implements $WarClanCopyWith<$Res> {
  factory _$WarClanCopyWith(_WarClan value, $Res Function(_WarClan) _then) = __$WarClanCopyWithImpl;
@override @useResult
$Res call({
 String? tag, String? name, BadgeUrls? badgeUrls, int? clanLevel, int? attacks, int? stars, double? destructionPercentage, int? expEarned
});


@override $BadgeUrlsCopyWith<$Res>? get badgeUrls;

}
/// @nodoc
class __$WarClanCopyWithImpl<$Res>
    implements _$WarClanCopyWith<$Res> {
  __$WarClanCopyWithImpl(this._self, this._then);

  final _WarClan _self;
  final $Res Function(_WarClan) _then;

/// Create a copy of WarClan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tag = freezed,Object? name = freezed,Object? badgeUrls = freezed,Object? clanLevel = freezed,Object? attacks = freezed,Object? stars = freezed,Object? destructionPercentage = freezed,Object? expEarned = freezed,}) {
  return _then(_WarClan(
tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,badgeUrls: freezed == badgeUrls ? _self.badgeUrls : badgeUrls // ignore: cast_nullable_to_non_nullable
as BadgeUrls?,clanLevel: freezed == clanLevel ? _self.clanLevel : clanLevel // ignore: cast_nullable_to_non_nullable
as int?,attacks: freezed == attacks ? _self.attacks : attacks // ignore: cast_nullable_to_non_nullable
as int?,stars: freezed == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int?,destructionPercentage: freezed == destructionPercentage ? _self.destructionPercentage : destructionPercentage // ignore: cast_nullable_to_non_nullable
as double?,expEarned: freezed == expEarned ? _self.expEarned : expEarned // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of WarClan
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
mixin _$ClanWarLogEntry {

@JsonKey(unknownEnumValue: WarResult.unknown) WarResult? get result;@CocDateTimeConverter() DateTime? get endTime; int? get teamSize; int? get attacksPerMember; String? get battleModifier; WarClan? get clan; WarClan? get opponent;
/// Create a copy of ClanWarLogEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClanWarLogEntryCopyWith<ClanWarLogEntry> get copyWith => _$ClanWarLogEntryCopyWithImpl<ClanWarLogEntry>(this as ClanWarLogEntry, _$identity);

  /// Serializes this ClanWarLogEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ClanWarLogEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClanWarLogEntry&&(identical(other.result, _this.result) || other.result == _this.result)&&(identical(other.endTime, _this.endTime) || other.endTime == _this.endTime)&&(identical(other.teamSize, _this.teamSize) || other.teamSize == _this.teamSize)&&(identical(other.attacksPerMember, _this.attacksPerMember) || other.attacksPerMember == _this.attacksPerMember)&&(identical(other.battleModifier, _this.battleModifier) || other.battleModifier == _this.battleModifier)&&(identical(other.clan, _this.clan) || other.clan == _this.clan)&&(identical(other.opponent, _this.opponent) || other.opponent == _this.opponent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ClanWarLogEntry;
  return Object.hash(runtimeType,_this.result,_this.endTime,_this.teamSize,_this.attacksPerMember,_this.battleModifier,_this.clan,_this.opponent);
}

@override
String toString() {
  final _this = this as ClanWarLogEntry;
  return 'ClanWarLogEntry(result: ${_this.result}, endTime: ${_this.endTime}, teamSize: ${_this.teamSize}, attacksPerMember: ${_this.attacksPerMember}, battleModifier: ${_this.battleModifier}, clan: ${_this.clan}, opponent: ${_this.opponent})';
}


}

/// @nodoc
abstract mixin class $ClanWarLogEntryCopyWith<$Res>  {
  factory $ClanWarLogEntryCopyWith(ClanWarLogEntry value, $Res Function(ClanWarLogEntry) _then) = _$ClanWarLogEntryCopyWithImpl;
@useResult
$Res call({
@JsonKey(unknownEnumValue: WarResult.unknown) WarResult? result,@CocDateTimeConverter() DateTime? endTime, int? teamSize, int? attacksPerMember, String? battleModifier, WarClan? clan, WarClan? opponent
});


$WarClanCopyWith<$Res>? get clan;$WarClanCopyWith<$Res>? get opponent;

}
/// @nodoc
class _$ClanWarLogEntryCopyWithImpl<$Res>
    implements $ClanWarLogEntryCopyWith<$Res> {
  _$ClanWarLogEntryCopyWithImpl(this._self, this._then);

  final ClanWarLogEntry _self;
  final $Res Function(ClanWarLogEntry) _then;

/// Create a copy of ClanWarLogEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? result = freezed,Object? endTime = freezed,Object? teamSize = freezed,Object? attacksPerMember = freezed,Object? battleModifier = freezed,Object? clan = freezed,Object? opponent = freezed,}) {
  return _then(ClanWarLogEntry(
result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as WarResult?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,teamSize: freezed == teamSize ? _self.teamSize : teamSize // ignore: cast_nullable_to_non_nullable
as int?,attacksPerMember: freezed == attacksPerMember ? _self.attacksPerMember : attacksPerMember // ignore: cast_nullable_to_non_nullable
as int?,battleModifier: freezed == battleModifier ? _self.battleModifier : battleModifier // ignore: cast_nullable_to_non_nullable
as String?,clan: freezed == clan ? _self.clan : clan // ignore: cast_nullable_to_non_nullable
as WarClan?,opponent: freezed == opponent ? _self.opponent : opponent // ignore: cast_nullable_to_non_nullable
as WarClan?,
  ));
}
/// Create a copy of ClanWarLogEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WarClanCopyWith<$Res>? get clan {
    if (_self.clan == null) {
    return null;
  }

  return $WarClanCopyWith<$Res>(_self.clan!, (value) {
    return _then(_self.copyWith(clan: value));
  });
}/// Create a copy of ClanWarLogEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WarClanCopyWith<$Res>? get opponent {
    if (_self.opponent == null) {
    return null;
  }

  return $WarClanCopyWith<$Res>(_self.opponent!, (value) {
    return _then(_self.copyWith(opponent: value));
  });
}
}


/// Adds pattern-matching-related methods to [ClanWarLogEntry].
extension ClanWarLogEntryPatterns on ClanWarLogEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClanWarLogEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClanWarLogEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClanWarLogEntry value)  $default,){
final _that = this;
switch (_that) {
case _ClanWarLogEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClanWarLogEntry value)?  $default,){
final _that = this;
switch (_that) {
case _ClanWarLogEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: WarResult.unknown)  WarResult? result, @CocDateTimeConverter()  DateTime? endTime,  int? teamSize,  int? attacksPerMember,  String? battleModifier,  WarClan? clan,  WarClan? opponent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClanWarLogEntry() when $default != null:
return $default(_that.result,_that.endTime,_that.teamSize,_that.attacksPerMember,_that.battleModifier,_that.clan,_that.opponent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: WarResult.unknown)  WarResult? result, @CocDateTimeConverter()  DateTime? endTime,  int? teamSize,  int? attacksPerMember,  String? battleModifier,  WarClan? clan,  WarClan? opponent)  $default,) {final _that = this;
switch (_that) {
case _ClanWarLogEntry():
return $default(_that.result,_that.endTime,_that.teamSize,_that.attacksPerMember,_that.battleModifier,_that.clan,_that.opponent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(unknownEnumValue: WarResult.unknown)  WarResult? result, @CocDateTimeConverter()  DateTime? endTime,  int? teamSize,  int? attacksPerMember,  String? battleModifier,  WarClan? clan,  WarClan? opponent)?  $default,) {final _that = this;
switch (_that) {
case _ClanWarLogEntry() when $default != null:
return $default(_that.result,_that.endTime,_that.teamSize,_that.attacksPerMember,_that.battleModifier,_that.clan,_that.opponent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClanWarLogEntry implements ClanWarLogEntry {
  const _ClanWarLogEntry({@JsonKey(unknownEnumValue: WarResult.unknown) this.result, @CocDateTimeConverter() this.endTime, this.teamSize, this.attacksPerMember, this.battleModifier, this.clan, this.opponent});
  factory _ClanWarLogEntry.fromJson(Map<String, dynamic> json) => _$ClanWarLogEntryFromJson(json);

@override@JsonKey(unknownEnumValue: WarResult.unknown) final  WarResult? result;
@override@CocDateTimeConverter() final  DateTime? endTime;
@override final  int? teamSize;
@override final  int? attacksPerMember;
@override final  String? battleModifier;
@override final  WarClan? clan;
@override final  WarClan? opponent;

/// Create a copy of ClanWarLogEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClanWarLogEntryCopyWith<_ClanWarLogEntry> get copyWith => __$ClanWarLogEntryCopyWithImpl<_ClanWarLogEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClanWarLogEntryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClanWarLogEntry&&(identical(other.result, result) || other.result == result)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.teamSize, teamSize) || other.teamSize == teamSize)&&(identical(other.attacksPerMember, attacksPerMember) || other.attacksPerMember == attacksPerMember)&&(identical(other.battleModifier, battleModifier) || other.battleModifier == battleModifier)&&(identical(other.clan, clan) || other.clan == clan)&&(identical(other.opponent, opponent) || other.opponent == opponent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,result,endTime,teamSize,attacksPerMember,battleModifier,clan,opponent);
}

@override
String toString() {
    return 'ClanWarLogEntry(result: $result, endTime: $endTime, teamSize: $teamSize, attacksPerMember: $attacksPerMember, battleModifier: $battleModifier, clan: $clan, opponent: $opponent)';
}


}

/// @nodoc
abstract mixin class _$ClanWarLogEntryCopyWith<$Res> implements $ClanWarLogEntryCopyWith<$Res> {
  factory _$ClanWarLogEntryCopyWith(_ClanWarLogEntry value, $Res Function(_ClanWarLogEntry) _then) = __$ClanWarLogEntryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(unknownEnumValue: WarResult.unknown) WarResult? result,@CocDateTimeConverter() DateTime? endTime, int? teamSize, int? attacksPerMember, String? battleModifier, WarClan? clan, WarClan? opponent
});


@override $WarClanCopyWith<$Res>? get clan;@override $WarClanCopyWith<$Res>? get opponent;

}
/// @nodoc
class __$ClanWarLogEntryCopyWithImpl<$Res>
    implements _$ClanWarLogEntryCopyWith<$Res> {
  __$ClanWarLogEntryCopyWithImpl(this._self, this._then);

  final _ClanWarLogEntry _self;
  final $Res Function(_ClanWarLogEntry) _then;

/// Create a copy of ClanWarLogEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? result = freezed,Object? endTime = freezed,Object? teamSize = freezed,Object? attacksPerMember = freezed,Object? battleModifier = freezed,Object? clan = freezed,Object? opponent = freezed,}) {
  return _then(_ClanWarLogEntry(
result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as WarResult?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,teamSize: freezed == teamSize ? _self.teamSize : teamSize // ignore: cast_nullable_to_non_nullable
as int?,attacksPerMember: freezed == attacksPerMember ? _self.attacksPerMember : attacksPerMember // ignore: cast_nullable_to_non_nullable
as int?,battleModifier: freezed == battleModifier ? _self.battleModifier : battleModifier // ignore: cast_nullable_to_non_nullable
as String?,clan: freezed == clan ? _self.clan : clan // ignore: cast_nullable_to_non_nullable
as WarClan?,opponent: freezed == opponent ? _self.opponent : opponent // ignore: cast_nullable_to_non_nullable
as WarClan?,
  ));
}

/// Create a copy of ClanWarLogEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WarClanCopyWith<$Res>? get clan {
    if (_self.clan == null) {
    return null;
  }

  return $WarClanCopyWith<$Res>(_self.clan!, (value) {
    return _then(_self.copyWith(clan: value));
  });
}/// Create a copy of ClanWarLogEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WarClanCopyWith<$Res>? get opponent {
    if (_self.opponent == null) {
    return null;
  }

  return $WarClanCopyWith<$Res>(_self.opponent!, (value) {
    return _then(_self.copyWith(opponent: value));
  });
}
}


/// @nodoc
mixin _$ClanWarLog {

 List<ClanWarLogEntry> get items; Paging? get paging;
/// Create a copy of ClanWarLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClanWarLogCopyWith<ClanWarLog> get copyWith => _$ClanWarLogCopyWithImpl<ClanWarLog>(this as ClanWarLog, _$identity);

  /// Serializes this ClanWarLog to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ClanWarLog;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClanWarLog&&const DeepCollectionEquality().equals(other.items, _this.items)&&(identical(other.paging, _this.paging) || other.paging == _this.paging));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ClanWarLog;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.items),_this.paging);
}

@override
String toString() {
  final _this = this as ClanWarLog;
  return 'ClanWarLog(items: ${_this.items}, paging: ${_this.paging})';
}


}

/// @nodoc
abstract mixin class $ClanWarLogCopyWith<$Res>  {
  factory $ClanWarLogCopyWith(ClanWarLog value, $Res Function(ClanWarLog) _then) = _$ClanWarLogCopyWithImpl;
@useResult
$Res call({
 List<ClanWarLogEntry> items, Paging? paging
});


$PagingCopyWith<$Res>? get paging;

}
/// @nodoc
class _$ClanWarLogCopyWithImpl<$Res>
    implements $ClanWarLogCopyWith<$Res> {
  _$ClanWarLogCopyWithImpl(this._self, this._then);

  final ClanWarLog _self;
  final $Res Function(ClanWarLog) _then;

/// Create a copy of ClanWarLog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? paging = freezed,}) {
  return _then(ClanWarLog(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ClanWarLogEntry>,paging: freezed == paging ? _self.paging : paging // ignore: cast_nullable_to_non_nullable
as Paging?,
  ));
}
/// Create a copy of ClanWarLog
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


/// Adds pattern-matching-related methods to [ClanWarLog].
extension ClanWarLogPatterns on ClanWarLog {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClanWarLog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClanWarLog() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClanWarLog value)  $default,){
final _that = this;
switch (_that) {
case _ClanWarLog():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClanWarLog value)?  $default,){
final _that = this;
switch (_that) {
case _ClanWarLog() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ClanWarLogEntry> items,  Paging? paging)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClanWarLog() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ClanWarLogEntry> items,  Paging? paging)  $default,) {final _that = this;
switch (_that) {
case _ClanWarLog():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ClanWarLogEntry> items,  Paging? paging)?  $default,) {final _that = this;
switch (_that) {
case _ClanWarLog() when $default != null:
return $default(_that.items,_that.paging);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClanWarLog implements ClanWarLog {
  const _ClanWarLog({ List<ClanWarLogEntry> items = const <ClanWarLogEntry>[], this.paging}): _items = items;
  factory _ClanWarLog.fromJson(Map<String, dynamic> json) => _$ClanWarLogFromJson(json);

 final  List<ClanWarLogEntry> _items;
@override@JsonKey() List<ClanWarLogEntry> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  Paging? paging;

/// Create a copy of ClanWarLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClanWarLogCopyWith<_ClanWarLog> get copyWith => __$ClanWarLogCopyWithImpl<_ClanWarLog>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClanWarLogToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClanWarLog&&const DeepCollectionEquality().equals(other.items, _items)&&(identical(other.paging, paging) || other.paging == paging));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),paging);
}

@override
String toString() {
    return 'ClanWarLog(items: $items, paging: $paging)';
}


}

/// @nodoc
abstract mixin class _$ClanWarLogCopyWith<$Res> implements $ClanWarLogCopyWith<$Res> {
  factory _$ClanWarLogCopyWith(_ClanWarLog value, $Res Function(_ClanWarLog) _then) = __$ClanWarLogCopyWithImpl;
@override @useResult
$Res call({
 List<ClanWarLogEntry> items, Paging? paging
});


@override $PagingCopyWith<$Res>? get paging;

}
/// @nodoc
class __$ClanWarLogCopyWithImpl<$Res>
    implements _$ClanWarLogCopyWith<$Res> {
  __$ClanWarLogCopyWithImpl(this._self, this._then);

  final _ClanWarLog _self;
  final $Res Function(_ClanWarLog) _then;

/// Create a copy of ClanWarLog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? paging = freezed,}) {
  return _then(_ClanWarLog(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ClanWarLogEntry>,paging: freezed == paging ? _self.paging : paging // ignore: cast_nullable_to_non_nullable
as Paging?,
  ));
}

/// Create a copy of ClanWarLog
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
