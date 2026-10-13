// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClanMember {

 String? get tag; String? get name; String? get role; int? get townHallLevel; int? get expLevel; League? get league; League? get leagueTier; int? get trophies; int? get builderBaseTrophies; int? get clanRank; int? get previousClanRank; int? get donations; int? get donationsReceived;
/// Create a copy of ClanMember
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClanMemberCopyWith<ClanMember> get copyWith => _$ClanMemberCopyWithImpl<ClanMember>(this as ClanMember, _$identity);

  /// Serializes this ClanMember to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ClanMember;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClanMember&&(identical(other.tag, _this.tag) || other.tag == _this.tag)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.role, _this.role) || other.role == _this.role)&&(identical(other.townHallLevel, _this.townHallLevel) || other.townHallLevel == _this.townHallLevel)&&(identical(other.expLevel, _this.expLevel) || other.expLevel == _this.expLevel)&&(identical(other.league, _this.league) || other.league == _this.league)&&(identical(other.leagueTier, _this.leagueTier) || other.leagueTier == _this.leagueTier)&&(identical(other.trophies, _this.trophies) || other.trophies == _this.trophies)&&(identical(other.builderBaseTrophies, _this.builderBaseTrophies) || other.builderBaseTrophies == _this.builderBaseTrophies)&&(identical(other.clanRank, _this.clanRank) || other.clanRank == _this.clanRank)&&(identical(other.previousClanRank, _this.previousClanRank) || other.previousClanRank == _this.previousClanRank)&&(identical(other.donations, _this.donations) || other.donations == _this.donations)&&(identical(other.donationsReceived, _this.donationsReceived) || other.donationsReceived == _this.donationsReceived));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ClanMember;
  return Object.hash(runtimeType,_this.tag,_this.name,_this.role,_this.townHallLevel,_this.expLevel,_this.league,_this.leagueTier,_this.trophies,_this.builderBaseTrophies,_this.clanRank,_this.previousClanRank,_this.donations,_this.donationsReceived);
}

@override
String toString() {
  final _this = this as ClanMember;
  return 'ClanMember(tag: ${_this.tag}, name: ${_this.name}, role: ${_this.role}, townHallLevel: ${_this.townHallLevel}, expLevel: ${_this.expLevel}, league: ${_this.league}, leagueTier: ${_this.leagueTier}, trophies: ${_this.trophies}, builderBaseTrophies: ${_this.builderBaseTrophies}, clanRank: ${_this.clanRank}, previousClanRank: ${_this.previousClanRank}, donations: ${_this.donations}, donationsReceived: ${_this.donationsReceived})';
}


}

/// @nodoc
abstract mixin class $ClanMemberCopyWith<$Res>  {
  factory $ClanMemberCopyWith(ClanMember value, $Res Function(ClanMember) _then) = _$ClanMemberCopyWithImpl;
@useResult
$Res call({
 String? tag, String? name, String? role, int? townHallLevel, int? expLevel, League? league, League? leagueTier, int? trophies, int? builderBaseTrophies, int? clanRank, int? previousClanRank, int? donations, int? donationsReceived
});


$LeagueCopyWith<$Res>? get league;$LeagueCopyWith<$Res>? get leagueTier;

}
/// @nodoc
class _$ClanMemberCopyWithImpl<$Res>
    implements $ClanMemberCopyWith<$Res> {
  _$ClanMemberCopyWithImpl(this._self, this._then);

  final ClanMember _self;
  final $Res Function(ClanMember) _then;

/// Create a copy of ClanMember
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tag = freezed,Object? name = freezed,Object? role = freezed,Object? townHallLevel = freezed,Object? expLevel = freezed,Object? league = freezed,Object? leagueTier = freezed,Object? trophies = freezed,Object? builderBaseTrophies = freezed,Object? clanRank = freezed,Object? previousClanRank = freezed,Object? donations = freezed,Object? donationsReceived = freezed,}) {
  return _then(ClanMember(
tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,townHallLevel: freezed == townHallLevel ? _self.townHallLevel : townHallLevel // ignore: cast_nullable_to_non_nullable
as int?,expLevel: freezed == expLevel ? _self.expLevel : expLevel // ignore: cast_nullable_to_non_nullable
as int?,league: freezed == league ? _self.league : league // ignore: cast_nullable_to_non_nullable
as League?,leagueTier: freezed == leagueTier ? _self.leagueTier : leagueTier // ignore: cast_nullable_to_non_nullable
as League?,trophies: freezed == trophies ? _self.trophies : trophies // ignore: cast_nullable_to_non_nullable
as int?,builderBaseTrophies: freezed == builderBaseTrophies ? _self.builderBaseTrophies : builderBaseTrophies // ignore: cast_nullable_to_non_nullable
as int?,clanRank: freezed == clanRank ? _self.clanRank : clanRank // ignore: cast_nullable_to_non_nullable
as int?,previousClanRank: freezed == previousClanRank ? _self.previousClanRank : previousClanRank // ignore: cast_nullable_to_non_nullable
as int?,donations: freezed == donations ? _self.donations : donations // ignore: cast_nullable_to_non_nullable
as int?,donationsReceived: freezed == donationsReceived ? _self.donationsReceived : donationsReceived // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of ClanMember
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
}/// Create a copy of ClanMember
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LeagueCopyWith<$Res>? get leagueTier {
    if (_self.leagueTier == null) {
    return null;
  }

  return $LeagueCopyWith<$Res>(_self.leagueTier!, (value) {
    return _then(_self.copyWith(leagueTier: value));
  });
}
}


/// Adds pattern-matching-related methods to [ClanMember].
extension ClanMemberPatterns on ClanMember {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClanMember value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClanMember() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClanMember value)  $default,){
final _that = this;
switch (_that) {
case _ClanMember():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClanMember value)?  $default,){
final _that = this;
switch (_that) {
case _ClanMember() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? tag,  String? name,  String? role,  int? townHallLevel,  int? expLevel,  League? league,  League? leagueTier,  int? trophies,  int? builderBaseTrophies,  int? clanRank,  int? previousClanRank,  int? donations,  int? donationsReceived)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClanMember() when $default != null:
return $default(_that.tag,_that.name,_that.role,_that.townHallLevel,_that.expLevel,_that.league,_that.leagueTier,_that.trophies,_that.builderBaseTrophies,_that.clanRank,_that.previousClanRank,_that.donations,_that.donationsReceived);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? tag,  String? name,  String? role,  int? townHallLevel,  int? expLevel,  League? league,  League? leagueTier,  int? trophies,  int? builderBaseTrophies,  int? clanRank,  int? previousClanRank,  int? donations,  int? donationsReceived)  $default,) {final _that = this;
switch (_that) {
case _ClanMember():
return $default(_that.tag,_that.name,_that.role,_that.townHallLevel,_that.expLevel,_that.league,_that.leagueTier,_that.trophies,_that.builderBaseTrophies,_that.clanRank,_that.previousClanRank,_that.donations,_that.donationsReceived);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? tag,  String? name,  String? role,  int? townHallLevel,  int? expLevel,  League? league,  League? leagueTier,  int? trophies,  int? builderBaseTrophies,  int? clanRank,  int? previousClanRank,  int? donations,  int? donationsReceived)?  $default,) {final _that = this;
switch (_that) {
case _ClanMember() when $default != null:
return $default(_that.tag,_that.name,_that.role,_that.townHallLevel,_that.expLevel,_that.league,_that.leagueTier,_that.trophies,_that.builderBaseTrophies,_that.clanRank,_that.previousClanRank,_that.donations,_that.donationsReceived);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClanMember implements ClanMember {
  const _ClanMember({this.tag, this.name, this.role, this.townHallLevel, this.expLevel, this.league, this.leagueTier, this.trophies, this.builderBaseTrophies, this.clanRank, this.previousClanRank, this.donations, this.donationsReceived});
  factory _ClanMember.fromJson(Map<String, dynamic> json) => _$ClanMemberFromJson(json);

@override final  String? tag;
@override final  String? name;
@override final  String? role;
@override final  int? townHallLevel;
@override final  int? expLevel;
@override final  League? league;
@override final  League? leagueTier;
@override final  int? trophies;
@override final  int? builderBaseTrophies;
@override final  int? clanRank;
@override final  int? previousClanRank;
@override final  int? donations;
@override final  int? donationsReceived;

/// Create a copy of ClanMember
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClanMemberCopyWith<_ClanMember> get copyWith => __$ClanMemberCopyWithImpl<_ClanMember>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClanMemberToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClanMember&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.name, name) || other.name == name)&&(identical(other.role, role) || other.role == role)&&(identical(other.townHallLevel, townHallLevel) || other.townHallLevel == townHallLevel)&&(identical(other.expLevel, expLevel) || other.expLevel == expLevel)&&(identical(other.league, league) || other.league == league)&&(identical(other.leagueTier, leagueTier) || other.leagueTier == leagueTier)&&(identical(other.trophies, trophies) || other.trophies == trophies)&&(identical(other.builderBaseTrophies, builderBaseTrophies) || other.builderBaseTrophies == builderBaseTrophies)&&(identical(other.clanRank, clanRank) || other.clanRank == clanRank)&&(identical(other.previousClanRank, previousClanRank) || other.previousClanRank == previousClanRank)&&(identical(other.donations, donations) || other.donations == donations)&&(identical(other.donationsReceived, donationsReceived) || other.donationsReceived == donationsReceived));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,tag,name,role,townHallLevel,expLevel,league,leagueTier,trophies,builderBaseTrophies,clanRank,previousClanRank,donations,donationsReceived);
}

@override
String toString() {
    return 'ClanMember(tag: $tag, name: $name, role: $role, townHallLevel: $townHallLevel, expLevel: $expLevel, league: $league, leagueTier: $leagueTier, trophies: $trophies, builderBaseTrophies: $builderBaseTrophies, clanRank: $clanRank, previousClanRank: $previousClanRank, donations: $donations, donationsReceived: $donationsReceived)';
}


}

/// @nodoc
abstract mixin class _$ClanMemberCopyWith<$Res> implements $ClanMemberCopyWith<$Res> {
  factory _$ClanMemberCopyWith(_ClanMember value, $Res Function(_ClanMember) _then) = __$ClanMemberCopyWithImpl;
@override @useResult
$Res call({
 String? tag, String? name, String? role, int? townHallLevel, int? expLevel, League? league, League? leagueTier, int? trophies, int? builderBaseTrophies, int? clanRank, int? previousClanRank, int? donations, int? donationsReceived
});


@override $LeagueCopyWith<$Res>? get league;@override $LeagueCopyWith<$Res>? get leagueTier;

}
/// @nodoc
class __$ClanMemberCopyWithImpl<$Res>
    implements _$ClanMemberCopyWith<$Res> {
  __$ClanMemberCopyWithImpl(this._self, this._then);

  final _ClanMember _self;
  final $Res Function(_ClanMember) _then;

/// Create a copy of ClanMember
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tag = freezed,Object? name = freezed,Object? role = freezed,Object? townHallLevel = freezed,Object? expLevel = freezed,Object? league = freezed,Object? leagueTier = freezed,Object? trophies = freezed,Object? builderBaseTrophies = freezed,Object? clanRank = freezed,Object? previousClanRank = freezed,Object? donations = freezed,Object? donationsReceived = freezed,}) {
  return _then(_ClanMember(
tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,townHallLevel: freezed == townHallLevel ? _self.townHallLevel : townHallLevel // ignore: cast_nullable_to_non_nullable
as int?,expLevel: freezed == expLevel ? _self.expLevel : expLevel // ignore: cast_nullable_to_non_nullable
as int?,league: freezed == league ? _self.league : league // ignore: cast_nullable_to_non_nullable
as League?,leagueTier: freezed == leagueTier ? _self.leagueTier : leagueTier // ignore: cast_nullable_to_non_nullable
as League?,trophies: freezed == trophies ? _self.trophies : trophies // ignore: cast_nullable_to_non_nullable
as int?,builderBaseTrophies: freezed == builderBaseTrophies ? _self.builderBaseTrophies : builderBaseTrophies // ignore: cast_nullable_to_non_nullable
as int?,clanRank: freezed == clanRank ? _self.clanRank : clanRank // ignore: cast_nullable_to_non_nullable
as int?,previousClanRank: freezed == previousClanRank ? _self.previousClanRank : previousClanRank // ignore: cast_nullable_to_non_nullable
as int?,donations: freezed == donations ? _self.donations : donations // ignore: cast_nullable_to_non_nullable
as int?,donationsReceived: freezed == donationsReceived ? _self.donationsReceived : donationsReceived // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of ClanMember
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
}/// Create a copy of ClanMember
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LeagueCopyWith<$Res>? get leagueTier {
    if (_self.leagueTier == null) {
    return null;
  }

  return $LeagueCopyWith<$Res>(_self.leagueTier!, (value) {
    return _then(_self.copyWith(leagueTier: value));
  });
}
}


/// @nodoc
mixin _$Clan {

 String get tag; String? get name; String? get type; String? get description; Location? get location; BadgeUrls? get badgeUrls; int? get clanLevel; int? get clanPoints; int? get requiredTrophies; String? get warFrequency; int? get warWinStreak; int? get warWins; int? get warTies; int? get warLosses; bool? get isWarLogPublic; int? get members; List<ClanMember> get memberList; List<Label> get labels;
/// Create a copy of Clan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClanCopyWith<Clan> get copyWith => _$ClanCopyWithImpl<Clan>(this as Clan, _$identity);

  /// Serializes this Clan to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Clan;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Clan&&(identical(other.tag, _this.tag) || other.tag == _this.tag)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.location, _this.location) || other.location == _this.location)&&(identical(other.badgeUrls, _this.badgeUrls) || other.badgeUrls == _this.badgeUrls)&&(identical(other.clanLevel, _this.clanLevel) || other.clanLevel == _this.clanLevel)&&(identical(other.clanPoints, _this.clanPoints) || other.clanPoints == _this.clanPoints)&&(identical(other.requiredTrophies, _this.requiredTrophies) || other.requiredTrophies == _this.requiredTrophies)&&(identical(other.warFrequency, _this.warFrequency) || other.warFrequency == _this.warFrequency)&&(identical(other.warWinStreak, _this.warWinStreak) || other.warWinStreak == _this.warWinStreak)&&(identical(other.warWins, _this.warWins) || other.warWins == _this.warWins)&&(identical(other.warTies, _this.warTies) || other.warTies == _this.warTies)&&(identical(other.warLosses, _this.warLosses) || other.warLosses == _this.warLosses)&&(identical(other.isWarLogPublic, _this.isWarLogPublic) || other.isWarLogPublic == _this.isWarLogPublic)&&(identical(other.members, _this.members) || other.members == _this.members)&&const DeepCollectionEquality().equals(other.memberList, _this.memberList)&&const DeepCollectionEquality().equals(other.labels, _this.labels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Clan;
  return Object.hash(runtimeType,_this.tag,_this.name,_this.type,_this.description,_this.location,_this.badgeUrls,_this.clanLevel,_this.clanPoints,_this.requiredTrophies,_this.warFrequency,_this.warWinStreak,_this.warWins,_this.warTies,_this.warLosses,_this.isWarLogPublic,_this.members,const DeepCollectionEquality().hash(_this.memberList),const DeepCollectionEquality().hash(_this.labels));
}

@override
String toString() {
  final _this = this as Clan;
  return 'Clan(tag: ${_this.tag}, name: ${_this.name}, type: ${_this.type}, description: ${_this.description}, location: ${_this.location}, badgeUrls: ${_this.badgeUrls}, clanLevel: ${_this.clanLevel}, clanPoints: ${_this.clanPoints}, requiredTrophies: ${_this.requiredTrophies}, warFrequency: ${_this.warFrequency}, warWinStreak: ${_this.warWinStreak}, warWins: ${_this.warWins}, warTies: ${_this.warTies}, warLosses: ${_this.warLosses}, isWarLogPublic: ${_this.isWarLogPublic}, members: ${_this.members}, memberList: ${_this.memberList}, labels: ${_this.labels})';
}


}

/// @nodoc
abstract mixin class $ClanCopyWith<$Res>  {
  factory $ClanCopyWith(Clan value, $Res Function(Clan) _then) = _$ClanCopyWithImpl;
@useResult
$Res call({
 String tag, String? name, String? type, String? description, Location? location, BadgeUrls? badgeUrls, int? clanLevel, int? clanPoints, int? requiredTrophies, String? warFrequency, int? warWinStreak, int? warWins, int? warTies, int? warLosses, bool? isWarLogPublic, int? members, List<ClanMember> memberList, List<Label> labels
});


$LocationCopyWith<$Res>? get location;$BadgeUrlsCopyWith<$Res>? get badgeUrls;

}
/// @nodoc
class _$ClanCopyWithImpl<$Res>
    implements $ClanCopyWith<$Res> {
  _$ClanCopyWithImpl(this._self, this._then);

  final Clan _self;
  final $Res Function(Clan) _then;

/// Create a copy of Clan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tag = null,Object? name = freezed,Object? type = freezed,Object? description = freezed,Object? location = freezed,Object? badgeUrls = freezed,Object? clanLevel = freezed,Object? clanPoints = freezed,Object? requiredTrophies = freezed,Object? warFrequency = freezed,Object? warWinStreak = freezed,Object? warWins = freezed,Object? warTies = freezed,Object? warLosses = freezed,Object? isWarLogPublic = freezed,Object? members = freezed,Object? memberList = null,Object? labels = null,}) {
  return _then(Clan(
tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Location?,badgeUrls: freezed == badgeUrls ? _self.badgeUrls : badgeUrls // ignore: cast_nullable_to_non_nullable
as BadgeUrls?,clanLevel: freezed == clanLevel ? _self.clanLevel : clanLevel // ignore: cast_nullable_to_non_nullable
as int?,clanPoints: freezed == clanPoints ? _self.clanPoints : clanPoints // ignore: cast_nullable_to_non_nullable
as int?,requiredTrophies: freezed == requiredTrophies ? _self.requiredTrophies : requiredTrophies // ignore: cast_nullable_to_non_nullable
as int?,warFrequency: freezed == warFrequency ? _self.warFrequency : warFrequency // ignore: cast_nullable_to_non_nullable
as String?,warWinStreak: freezed == warWinStreak ? _self.warWinStreak : warWinStreak // ignore: cast_nullable_to_non_nullable
as int?,warWins: freezed == warWins ? _self.warWins : warWins // ignore: cast_nullable_to_non_nullable
as int?,warTies: freezed == warTies ? _self.warTies : warTies // ignore: cast_nullable_to_non_nullable
as int?,warLosses: freezed == warLosses ? _self.warLosses : warLosses // ignore: cast_nullable_to_non_nullable
as int?,isWarLogPublic: freezed == isWarLogPublic ? _self.isWarLogPublic : isWarLogPublic // ignore: cast_nullable_to_non_nullable
as bool?,members: freezed == members ? _self.members : members // ignore: cast_nullable_to_non_nullable
as int?,memberList: null == memberList ? _self.memberList : memberList // ignore: cast_nullable_to_non_nullable
as List<ClanMember>,labels: null == labels ? _self.labels : labels // ignore: cast_nullable_to_non_nullable
as List<Label>,
  ));
}
/// Create a copy of Clan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $LocationCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of Clan
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


/// Adds pattern-matching-related methods to [Clan].
extension ClanPatterns on Clan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Clan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Clan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Clan value)  $default,){
final _that = this;
switch (_that) {
case _Clan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Clan value)?  $default,){
final _that = this;
switch (_that) {
case _Clan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tag,  String? name,  String? type,  String? description,  Location? location,  BadgeUrls? badgeUrls,  int? clanLevel,  int? clanPoints,  int? requiredTrophies,  String? warFrequency,  int? warWinStreak,  int? warWins,  int? warTies,  int? warLosses,  bool? isWarLogPublic,  int? members,  List<ClanMember> memberList,  List<Label> labels)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Clan() when $default != null:
return $default(_that.tag,_that.name,_that.type,_that.description,_that.location,_that.badgeUrls,_that.clanLevel,_that.clanPoints,_that.requiredTrophies,_that.warFrequency,_that.warWinStreak,_that.warWins,_that.warTies,_that.warLosses,_that.isWarLogPublic,_that.members,_that.memberList,_that.labels);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tag,  String? name,  String? type,  String? description,  Location? location,  BadgeUrls? badgeUrls,  int? clanLevel,  int? clanPoints,  int? requiredTrophies,  String? warFrequency,  int? warWinStreak,  int? warWins,  int? warTies,  int? warLosses,  bool? isWarLogPublic,  int? members,  List<ClanMember> memberList,  List<Label> labels)  $default,) {final _that = this;
switch (_that) {
case _Clan():
return $default(_that.tag,_that.name,_that.type,_that.description,_that.location,_that.badgeUrls,_that.clanLevel,_that.clanPoints,_that.requiredTrophies,_that.warFrequency,_that.warWinStreak,_that.warWins,_that.warTies,_that.warLosses,_that.isWarLogPublic,_that.members,_that.memberList,_that.labels);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tag,  String? name,  String? type,  String? description,  Location? location,  BadgeUrls? badgeUrls,  int? clanLevel,  int? clanPoints,  int? requiredTrophies,  String? warFrequency,  int? warWinStreak,  int? warWins,  int? warTies,  int? warLosses,  bool? isWarLogPublic,  int? members,  List<ClanMember> memberList,  List<Label> labels)?  $default,) {final _that = this;
switch (_that) {
case _Clan() when $default != null:
return $default(_that.tag,_that.name,_that.type,_that.description,_that.location,_that.badgeUrls,_that.clanLevel,_that.clanPoints,_that.requiredTrophies,_that.warFrequency,_that.warWinStreak,_that.warWins,_that.warTies,_that.warLosses,_that.isWarLogPublic,_that.members,_that.memberList,_that.labels);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Clan implements Clan {
  const _Clan({required this.tag, this.name, this.type, this.description, this.location, this.badgeUrls, this.clanLevel, this.clanPoints, this.requiredTrophies, this.warFrequency, this.warWinStreak, this.warWins, this.warTies, this.warLosses, this.isWarLogPublic, this.members,  List<ClanMember> memberList = const <ClanMember>[],  List<Label> labels = const <Label>[]}): _memberList = memberList,_labels = labels;
  factory _Clan.fromJson(Map<String, dynamic> json) => _$ClanFromJson(json);

@override final  String tag;
@override final  String? name;
@override final  String? type;
@override final  String? description;
@override final  Location? location;
@override final  BadgeUrls? badgeUrls;
@override final  int? clanLevel;
@override final  int? clanPoints;
@override final  int? requiredTrophies;
@override final  String? warFrequency;
@override final  int? warWinStreak;
@override final  int? warWins;
@override final  int? warTies;
@override final  int? warLosses;
@override final  bool? isWarLogPublic;
@override final  int? members;
 final  List<ClanMember> _memberList;
@override@JsonKey() List<ClanMember> get memberList {
  if (_memberList is EqualUnmodifiableListView) return _memberList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_memberList);
}

 final  List<Label> _labels;
@override@JsonKey() List<Label> get labels {
  if (_labels is EqualUnmodifiableListView) return _labels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_labels);
}


/// Create a copy of Clan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClanCopyWith<_Clan> get copyWith => __$ClanCopyWithImpl<_Clan>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClanToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Clan&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description)&&(identical(other.location, location) || other.location == location)&&(identical(other.badgeUrls, badgeUrls) || other.badgeUrls == badgeUrls)&&(identical(other.clanLevel, clanLevel) || other.clanLevel == clanLevel)&&(identical(other.clanPoints, clanPoints) || other.clanPoints == clanPoints)&&(identical(other.requiredTrophies, requiredTrophies) || other.requiredTrophies == requiredTrophies)&&(identical(other.warFrequency, warFrequency) || other.warFrequency == warFrequency)&&(identical(other.warWinStreak, warWinStreak) || other.warWinStreak == warWinStreak)&&(identical(other.warWins, warWins) || other.warWins == warWins)&&(identical(other.warTies, warTies) || other.warTies == warTies)&&(identical(other.warLosses, warLosses) || other.warLosses == warLosses)&&(identical(other.isWarLogPublic, isWarLogPublic) || other.isWarLogPublic == isWarLogPublic)&&(identical(other.members, members) || other.members == members)&&const DeepCollectionEquality().equals(other.memberList, _memberList)&&const DeepCollectionEquality().equals(other.labels, _labels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,tag,name,type,description,location,badgeUrls,clanLevel,clanPoints,requiredTrophies,warFrequency,warWinStreak,warWins,warTies,warLosses,isWarLogPublic,members,const DeepCollectionEquality().hash(_memberList),const DeepCollectionEquality().hash(_labels));
}

@override
String toString() {
    return 'Clan(tag: $tag, name: $name, type: $type, description: $description, location: $location, badgeUrls: $badgeUrls, clanLevel: $clanLevel, clanPoints: $clanPoints, requiredTrophies: $requiredTrophies, warFrequency: $warFrequency, warWinStreak: $warWinStreak, warWins: $warWins, warTies: $warTies, warLosses: $warLosses, isWarLogPublic: $isWarLogPublic, members: $members, memberList: $memberList, labels: $labels)';
}


}

/// @nodoc
abstract mixin class _$ClanCopyWith<$Res> implements $ClanCopyWith<$Res> {
  factory _$ClanCopyWith(_Clan value, $Res Function(_Clan) _then) = __$ClanCopyWithImpl;
@override @useResult
$Res call({
 String tag, String? name, String? type, String? description, Location? location, BadgeUrls? badgeUrls, int? clanLevel, int? clanPoints, int? requiredTrophies, String? warFrequency, int? warWinStreak, int? warWins, int? warTies, int? warLosses, bool? isWarLogPublic, int? members, List<ClanMember> memberList, List<Label> labels
});


@override $LocationCopyWith<$Res>? get location;@override $BadgeUrlsCopyWith<$Res>? get badgeUrls;

}
/// @nodoc
class __$ClanCopyWithImpl<$Res>
    implements _$ClanCopyWith<$Res> {
  __$ClanCopyWithImpl(this._self, this._then);

  final _Clan _self;
  final $Res Function(_Clan) _then;

/// Create a copy of Clan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tag = null,Object? name = freezed,Object? type = freezed,Object? description = freezed,Object? location = freezed,Object? badgeUrls = freezed,Object? clanLevel = freezed,Object? clanPoints = freezed,Object? requiredTrophies = freezed,Object? warFrequency = freezed,Object? warWinStreak = freezed,Object? warWins = freezed,Object? warTies = freezed,Object? warLosses = freezed,Object? isWarLogPublic = freezed,Object? members = freezed,Object? memberList = null,Object? labels = null,}) {
  return _then(_Clan(
tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Location?,badgeUrls: freezed == badgeUrls ? _self.badgeUrls : badgeUrls // ignore: cast_nullable_to_non_nullable
as BadgeUrls?,clanLevel: freezed == clanLevel ? _self.clanLevel : clanLevel // ignore: cast_nullable_to_non_nullable
as int?,clanPoints: freezed == clanPoints ? _self.clanPoints : clanPoints // ignore: cast_nullable_to_non_nullable
as int?,requiredTrophies: freezed == requiredTrophies ? _self.requiredTrophies : requiredTrophies // ignore: cast_nullable_to_non_nullable
as int?,warFrequency: freezed == warFrequency ? _self.warFrequency : warFrequency // ignore: cast_nullable_to_non_nullable
as String?,warWinStreak: freezed == warWinStreak ? _self.warWinStreak : warWinStreak // ignore: cast_nullable_to_non_nullable
as int?,warWins: freezed == warWins ? _self.warWins : warWins // ignore: cast_nullable_to_non_nullable
as int?,warTies: freezed == warTies ? _self.warTies : warTies // ignore: cast_nullable_to_non_nullable
as int?,warLosses: freezed == warLosses ? _self.warLosses : warLosses // ignore: cast_nullable_to_non_nullable
as int?,isWarLogPublic: freezed == isWarLogPublic ? _self.isWarLogPublic : isWarLogPublic // ignore: cast_nullable_to_non_nullable
as bool?,members: freezed == members ? _self.members : members // ignore: cast_nullable_to_non_nullable
as int?,memberList: null == memberList ? _self._memberList : memberList // ignore: cast_nullable_to_non_nullable
as List<ClanMember>,labels: null == labels ? _self._labels : labels // ignore: cast_nullable_to_non_nullable
as List<Label>,
  ));
}

/// Create a copy of Clan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $LocationCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of Clan
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

// dart format on
