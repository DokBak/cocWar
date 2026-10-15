// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'league_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LeagueGroupMember {

 String? get tag; String? get name; int? get townHallLevel;
/// Create a copy of LeagueGroupMember
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeagueGroupMemberCopyWith<LeagueGroupMember> get copyWith => _$LeagueGroupMemberCopyWithImpl<LeagueGroupMember>(this as LeagueGroupMember, _$identity);

  /// Serializes this LeagueGroupMember to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LeagueGroupMember;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeagueGroupMember&&(identical(other.tag, _this.tag) || other.tag == _this.tag)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.townHallLevel, _this.townHallLevel) || other.townHallLevel == _this.townHallLevel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LeagueGroupMember;
  return Object.hash(runtimeType,_this.tag,_this.name,_this.townHallLevel);
}

@override
String toString() {
  final _this = this as LeagueGroupMember;
  return 'LeagueGroupMember(tag: ${_this.tag}, name: ${_this.name}, townHallLevel: ${_this.townHallLevel})';
}


}

/// @nodoc
abstract mixin class $LeagueGroupMemberCopyWith<$Res>  {
  factory $LeagueGroupMemberCopyWith(LeagueGroupMember value, $Res Function(LeagueGroupMember) _then) = _$LeagueGroupMemberCopyWithImpl;
@useResult
$Res call({
 String? tag, String? name, int? townHallLevel
});




}
/// @nodoc
class _$LeagueGroupMemberCopyWithImpl<$Res>
    implements $LeagueGroupMemberCopyWith<$Res> {
  _$LeagueGroupMemberCopyWithImpl(this._self, this._then);

  final LeagueGroupMember _self;
  final $Res Function(LeagueGroupMember) _then;

/// Create a copy of LeagueGroupMember
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tag = freezed,Object? name = freezed,Object? townHallLevel = freezed,}) {
  return _then(LeagueGroupMember(
tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,townHallLevel: freezed == townHallLevel ? _self.townHallLevel : townHallLevel // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [LeagueGroupMember].
extension LeagueGroupMemberPatterns on LeagueGroupMember {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeagueGroupMember value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeagueGroupMember() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeagueGroupMember value)  $default,){
final _that = this;
switch (_that) {
case _LeagueGroupMember():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeagueGroupMember value)?  $default,){
final _that = this;
switch (_that) {
case _LeagueGroupMember() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? tag,  String? name,  int? townHallLevel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeagueGroupMember() when $default != null:
return $default(_that.tag,_that.name,_that.townHallLevel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? tag,  String? name,  int? townHallLevel)  $default,) {final _that = this;
switch (_that) {
case _LeagueGroupMember():
return $default(_that.tag,_that.name,_that.townHallLevel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? tag,  String? name,  int? townHallLevel)?  $default,) {final _that = this;
switch (_that) {
case _LeagueGroupMember() when $default != null:
return $default(_that.tag,_that.name,_that.townHallLevel);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LeagueGroupMember implements LeagueGroupMember {
  const _LeagueGroupMember({this.tag, this.name, this.townHallLevel});
  factory _LeagueGroupMember.fromJson(Map<String, dynamic> json) => _$LeagueGroupMemberFromJson(json);

@override final  String? tag;
@override final  String? name;
@override final  int? townHallLevel;

/// Create a copy of LeagueGroupMember
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeagueGroupMemberCopyWith<_LeagueGroupMember> get copyWith => __$LeagueGroupMemberCopyWithImpl<_LeagueGroupMember>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeagueGroupMemberToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeagueGroupMember&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.name, name) || other.name == name)&&(identical(other.townHallLevel, townHallLevel) || other.townHallLevel == townHallLevel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,tag,name,townHallLevel);
}

@override
String toString() {
    return 'LeagueGroupMember(tag: $tag, name: $name, townHallLevel: $townHallLevel)';
}


}

/// @nodoc
abstract mixin class _$LeagueGroupMemberCopyWith<$Res> implements $LeagueGroupMemberCopyWith<$Res> {
  factory _$LeagueGroupMemberCopyWith(_LeagueGroupMember value, $Res Function(_LeagueGroupMember) _then) = __$LeagueGroupMemberCopyWithImpl;
@override @useResult
$Res call({
 String? tag, String? name, int? townHallLevel
});




}
/// @nodoc
class __$LeagueGroupMemberCopyWithImpl<$Res>
    implements _$LeagueGroupMemberCopyWith<$Res> {
  __$LeagueGroupMemberCopyWithImpl(this._self, this._then);

  final _LeagueGroupMember _self;
  final $Res Function(_LeagueGroupMember) _then;

/// Create a copy of LeagueGroupMember
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tag = freezed,Object? name = freezed,Object? townHallLevel = freezed,}) {
  return _then(_LeagueGroupMember(
tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,townHallLevel: freezed == townHallLevel ? _self.townHallLevel : townHallLevel // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$LeagueGroupClan {

 String? get tag; String? get name; int? get clanLevel; BadgeUrls? get badgeUrls; List<LeagueGroupMember> get members;
/// Create a copy of LeagueGroupClan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeagueGroupClanCopyWith<LeagueGroupClan> get copyWith => _$LeagueGroupClanCopyWithImpl<LeagueGroupClan>(this as LeagueGroupClan, _$identity);

  /// Serializes this LeagueGroupClan to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LeagueGroupClan;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeagueGroupClan&&(identical(other.tag, _this.tag) || other.tag == _this.tag)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.clanLevel, _this.clanLevel) || other.clanLevel == _this.clanLevel)&&(identical(other.badgeUrls, _this.badgeUrls) || other.badgeUrls == _this.badgeUrls)&&const DeepCollectionEquality().equals(other.members, _this.members));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LeagueGroupClan;
  return Object.hash(runtimeType,_this.tag,_this.name,_this.clanLevel,_this.badgeUrls,const DeepCollectionEquality().hash(_this.members));
}

@override
String toString() {
  final _this = this as LeagueGroupClan;
  return 'LeagueGroupClan(tag: ${_this.tag}, name: ${_this.name}, clanLevel: ${_this.clanLevel}, badgeUrls: ${_this.badgeUrls}, members: ${_this.members})';
}


}

/// @nodoc
abstract mixin class $LeagueGroupClanCopyWith<$Res>  {
  factory $LeagueGroupClanCopyWith(LeagueGroupClan value, $Res Function(LeagueGroupClan) _then) = _$LeagueGroupClanCopyWithImpl;
@useResult
$Res call({
 String? tag, String? name, int? clanLevel, BadgeUrls? badgeUrls, List<LeagueGroupMember> members
});


$BadgeUrlsCopyWith<$Res>? get badgeUrls;

}
/// @nodoc
class _$LeagueGroupClanCopyWithImpl<$Res>
    implements $LeagueGroupClanCopyWith<$Res> {
  _$LeagueGroupClanCopyWithImpl(this._self, this._then);

  final LeagueGroupClan _self;
  final $Res Function(LeagueGroupClan) _then;

/// Create a copy of LeagueGroupClan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tag = freezed,Object? name = freezed,Object? clanLevel = freezed,Object? badgeUrls = freezed,Object? members = null,}) {
  return _then(LeagueGroupClan(
tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,clanLevel: freezed == clanLevel ? _self.clanLevel : clanLevel // ignore: cast_nullable_to_non_nullable
as int?,badgeUrls: freezed == badgeUrls ? _self.badgeUrls : badgeUrls // ignore: cast_nullable_to_non_nullable
as BadgeUrls?,members: null == members ? _self.members : members // ignore: cast_nullable_to_non_nullable
as List<LeagueGroupMember>,
  ));
}
/// Create a copy of LeagueGroupClan
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


/// Adds pattern-matching-related methods to [LeagueGroupClan].
extension LeagueGroupClanPatterns on LeagueGroupClan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeagueGroupClan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeagueGroupClan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeagueGroupClan value)  $default,){
final _that = this;
switch (_that) {
case _LeagueGroupClan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeagueGroupClan value)?  $default,){
final _that = this;
switch (_that) {
case _LeagueGroupClan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? tag,  String? name,  int? clanLevel,  BadgeUrls? badgeUrls,  List<LeagueGroupMember> members)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeagueGroupClan() when $default != null:
return $default(_that.tag,_that.name,_that.clanLevel,_that.badgeUrls,_that.members);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? tag,  String? name,  int? clanLevel,  BadgeUrls? badgeUrls,  List<LeagueGroupMember> members)  $default,) {final _that = this;
switch (_that) {
case _LeagueGroupClan():
return $default(_that.tag,_that.name,_that.clanLevel,_that.badgeUrls,_that.members);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? tag,  String? name,  int? clanLevel,  BadgeUrls? badgeUrls,  List<LeagueGroupMember> members)?  $default,) {final _that = this;
switch (_that) {
case _LeagueGroupClan() when $default != null:
return $default(_that.tag,_that.name,_that.clanLevel,_that.badgeUrls,_that.members);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LeagueGroupClan implements LeagueGroupClan {
  const _LeagueGroupClan({this.tag, this.name, this.clanLevel, this.badgeUrls,  List<LeagueGroupMember> members = const <LeagueGroupMember>[]}): _members = members;
  factory _LeagueGroupClan.fromJson(Map<String, dynamic> json) => _$LeagueGroupClanFromJson(json);

@override final  String? tag;
@override final  String? name;
@override final  int? clanLevel;
@override final  BadgeUrls? badgeUrls;
 final  List<LeagueGroupMember> _members;
@override@JsonKey() List<LeagueGroupMember> get members {
  if (_members is EqualUnmodifiableListView) return _members;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_members);
}


/// Create a copy of LeagueGroupClan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeagueGroupClanCopyWith<_LeagueGroupClan> get copyWith => __$LeagueGroupClanCopyWithImpl<_LeagueGroupClan>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeagueGroupClanToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeagueGroupClan&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.name, name) || other.name == name)&&(identical(other.clanLevel, clanLevel) || other.clanLevel == clanLevel)&&(identical(other.badgeUrls, badgeUrls) || other.badgeUrls == badgeUrls)&&const DeepCollectionEquality().equals(other.members, _members));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,tag,name,clanLevel,badgeUrls,const DeepCollectionEquality().hash(_members));
}

@override
String toString() {
    return 'LeagueGroupClan(tag: $tag, name: $name, clanLevel: $clanLevel, badgeUrls: $badgeUrls, members: $members)';
}


}

/// @nodoc
abstract mixin class _$LeagueGroupClanCopyWith<$Res> implements $LeagueGroupClanCopyWith<$Res> {
  factory _$LeagueGroupClanCopyWith(_LeagueGroupClan value, $Res Function(_LeagueGroupClan) _then) = __$LeagueGroupClanCopyWithImpl;
@override @useResult
$Res call({
 String? tag, String? name, int? clanLevel, BadgeUrls? badgeUrls, List<LeagueGroupMember> members
});


@override $BadgeUrlsCopyWith<$Res>? get badgeUrls;

}
/// @nodoc
class __$LeagueGroupClanCopyWithImpl<$Res>
    implements _$LeagueGroupClanCopyWith<$Res> {
  __$LeagueGroupClanCopyWithImpl(this._self, this._then);

  final _LeagueGroupClan _self;
  final $Res Function(_LeagueGroupClan) _then;

/// Create a copy of LeagueGroupClan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tag = freezed,Object? name = freezed,Object? clanLevel = freezed,Object? badgeUrls = freezed,Object? members = null,}) {
  return _then(_LeagueGroupClan(
tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,clanLevel: freezed == clanLevel ? _self.clanLevel : clanLevel // ignore: cast_nullable_to_non_nullable
as int?,badgeUrls: freezed == badgeUrls ? _self.badgeUrls : badgeUrls // ignore: cast_nullable_to_non_nullable
as BadgeUrls?,members: null == members ? _self._members : members // ignore: cast_nullable_to_non_nullable
as List<LeagueGroupMember>,
  ));
}

/// Create a copy of LeagueGroupClan
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
mixin _$LeagueRound {

 List<String> get warTags;
/// Create a copy of LeagueRound
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeagueRoundCopyWith<LeagueRound> get copyWith => _$LeagueRoundCopyWithImpl<LeagueRound>(this as LeagueRound, _$identity);

  /// Serializes this LeagueRound to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LeagueRound;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeagueRound&&const DeepCollectionEquality().equals(other.warTags, _this.warTags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LeagueRound;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.warTags));
}

@override
String toString() {
  final _this = this as LeagueRound;
  return 'LeagueRound(warTags: ${_this.warTags})';
}


}

/// @nodoc
abstract mixin class $LeagueRoundCopyWith<$Res>  {
  factory $LeagueRoundCopyWith(LeagueRound value, $Res Function(LeagueRound) _then) = _$LeagueRoundCopyWithImpl;
@useResult
$Res call({
 List<String> warTags
});




}
/// @nodoc
class _$LeagueRoundCopyWithImpl<$Res>
    implements $LeagueRoundCopyWith<$Res> {
  _$LeagueRoundCopyWithImpl(this._self, this._then);

  final LeagueRound _self;
  final $Res Function(LeagueRound) _then;

/// Create a copy of LeagueRound
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? warTags = null,}) {
  return _then(LeagueRound(
warTags: null == warTags ? _self.warTags : warTags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [LeagueRound].
extension LeagueRoundPatterns on LeagueRound {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeagueRound value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeagueRound() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeagueRound value)  $default,){
final _that = this;
switch (_that) {
case _LeagueRound():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeagueRound value)?  $default,){
final _that = this;
switch (_that) {
case _LeagueRound() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> warTags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeagueRound() when $default != null:
return $default(_that.warTags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> warTags)  $default,) {final _that = this;
switch (_that) {
case _LeagueRound():
return $default(_that.warTags);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> warTags)?  $default,) {final _that = this;
switch (_that) {
case _LeagueRound() when $default != null:
return $default(_that.warTags);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LeagueRound implements LeagueRound {
  const _LeagueRound({ List<String> warTags = const <String>[]}): _warTags = warTags;
  factory _LeagueRound.fromJson(Map<String, dynamic> json) => _$LeagueRoundFromJson(json);

 final  List<String> _warTags;
@override@JsonKey() List<String> get warTags {
  if (_warTags is EqualUnmodifiableListView) return _warTags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_warTags);
}


/// Create a copy of LeagueRound
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeagueRoundCopyWith<_LeagueRound> get copyWith => __$LeagueRoundCopyWithImpl<_LeagueRound>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeagueRoundToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeagueRound&&const DeepCollectionEquality().equals(other.warTags, _warTags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_warTags));
}

@override
String toString() {
    return 'LeagueRound(warTags: $warTags)';
}


}

/// @nodoc
abstract mixin class _$LeagueRoundCopyWith<$Res> implements $LeagueRoundCopyWith<$Res> {
  factory _$LeagueRoundCopyWith(_LeagueRound value, $Res Function(_LeagueRound) _then) = __$LeagueRoundCopyWithImpl;
@override @useResult
$Res call({
 List<String> warTags
});




}
/// @nodoc
class __$LeagueRoundCopyWithImpl<$Res>
    implements _$LeagueRoundCopyWith<$Res> {
  __$LeagueRoundCopyWithImpl(this._self, this._then);

  final _LeagueRound _self;
  final $Res Function(_LeagueRound) _then;

/// Create a copy of LeagueRound
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? warTags = null,}) {
  return _then(_LeagueRound(
warTags: null == warTags ? _self._warTags : warTags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$ClanWarLeagueGroup {

@JsonKey(unknownEnumValue: LeagueGroupState.unknown) LeagueGroupState? get state;/// `2026-11` 형태.
 String? get season; List<LeagueGroupClan> get clans; List<LeagueRound> get rounds;
/// Create a copy of ClanWarLeagueGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClanWarLeagueGroupCopyWith<ClanWarLeagueGroup> get copyWith => _$ClanWarLeagueGroupCopyWithImpl<ClanWarLeagueGroup>(this as ClanWarLeagueGroup, _$identity);

  /// Serializes this ClanWarLeagueGroup to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ClanWarLeagueGroup;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClanWarLeagueGroup&&(identical(other.state, _this.state) || other.state == _this.state)&&(identical(other.season, _this.season) || other.season == _this.season)&&const DeepCollectionEquality().equals(other.clans, _this.clans)&&const DeepCollectionEquality().equals(other.rounds, _this.rounds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ClanWarLeagueGroup;
  return Object.hash(runtimeType,_this.state,_this.season,const DeepCollectionEquality().hash(_this.clans),const DeepCollectionEquality().hash(_this.rounds));
}

@override
String toString() {
  final _this = this as ClanWarLeagueGroup;
  return 'ClanWarLeagueGroup(state: ${_this.state}, season: ${_this.season}, clans: ${_this.clans}, rounds: ${_this.rounds})';
}


}

/// @nodoc
abstract mixin class $ClanWarLeagueGroupCopyWith<$Res>  {
  factory $ClanWarLeagueGroupCopyWith(ClanWarLeagueGroup value, $Res Function(ClanWarLeagueGroup) _then) = _$ClanWarLeagueGroupCopyWithImpl;
@useResult
$Res call({
@JsonKey(unknownEnumValue: LeagueGroupState.unknown) LeagueGroupState? state, String? season, List<LeagueGroupClan> clans, List<LeagueRound> rounds
});




}
/// @nodoc
class _$ClanWarLeagueGroupCopyWithImpl<$Res>
    implements $ClanWarLeagueGroupCopyWith<$Res> {
  _$ClanWarLeagueGroupCopyWithImpl(this._self, this._then);

  final ClanWarLeagueGroup _self;
  final $Res Function(ClanWarLeagueGroup) _then;

/// Create a copy of ClanWarLeagueGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? state = freezed,Object? season = freezed,Object? clans = null,Object? rounds = null,}) {
  return _then(ClanWarLeagueGroup(
state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as LeagueGroupState?,season: freezed == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as String?,clans: null == clans ? _self.clans : clans // ignore: cast_nullable_to_non_nullable
as List<LeagueGroupClan>,rounds: null == rounds ? _self.rounds : rounds // ignore: cast_nullable_to_non_nullable
as List<LeagueRound>,
  ));
}

}


/// Adds pattern-matching-related methods to [ClanWarLeagueGroup].
extension ClanWarLeagueGroupPatterns on ClanWarLeagueGroup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClanWarLeagueGroup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClanWarLeagueGroup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClanWarLeagueGroup value)  $default,){
final _that = this;
switch (_that) {
case _ClanWarLeagueGroup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClanWarLeagueGroup value)?  $default,){
final _that = this;
switch (_that) {
case _ClanWarLeagueGroup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: LeagueGroupState.unknown)  LeagueGroupState? state,  String? season,  List<LeagueGroupClan> clans,  List<LeagueRound> rounds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClanWarLeagueGroup() when $default != null:
return $default(_that.state,_that.season,_that.clans,_that.rounds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: LeagueGroupState.unknown)  LeagueGroupState? state,  String? season,  List<LeagueGroupClan> clans,  List<LeagueRound> rounds)  $default,) {final _that = this;
switch (_that) {
case _ClanWarLeagueGroup():
return $default(_that.state,_that.season,_that.clans,_that.rounds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(unknownEnumValue: LeagueGroupState.unknown)  LeagueGroupState? state,  String? season,  List<LeagueGroupClan> clans,  List<LeagueRound> rounds)?  $default,) {final _that = this;
switch (_that) {
case _ClanWarLeagueGroup() when $default != null:
return $default(_that.state,_that.season,_that.clans,_that.rounds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClanWarLeagueGroup implements ClanWarLeagueGroup {
  const _ClanWarLeagueGroup({@JsonKey(unknownEnumValue: LeagueGroupState.unknown) this.state, this.season,  List<LeagueGroupClan> clans = const <LeagueGroupClan>[],  List<LeagueRound> rounds = const <LeagueRound>[]}): _clans = clans,_rounds = rounds;
  factory _ClanWarLeagueGroup.fromJson(Map<String, dynamic> json) => _$ClanWarLeagueGroupFromJson(json);

@override@JsonKey(unknownEnumValue: LeagueGroupState.unknown) final  LeagueGroupState? state;
/// `2026-11` 형태.
@override final  String? season;
 final  List<LeagueGroupClan> _clans;
@override@JsonKey() List<LeagueGroupClan> get clans {
  if (_clans is EqualUnmodifiableListView) return _clans;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_clans);
}

 final  List<LeagueRound> _rounds;
@override@JsonKey() List<LeagueRound> get rounds {
  if (_rounds is EqualUnmodifiableListView) return _rounds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rounds);
}


/// Create a copy of ClanWarLeagueGroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClanWarLeagueGroupCopyWith<_ClanWarLeagueGroup> get copyWith => __$ClanWarLeagueGroupCopyWithImpl<_ClanWarLeagueGroup>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClanWarLeagueGroupToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClanWarLeagueGroup&&(identical(other.state, state) || other.state == state)&&(identical(other.season, season) || other.season == season)&&const DeepCollectionEquality().equals(other.clans, _clans)&&const DeepCollectionEquality().equals(other.rounds, _rounds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,state,season,const DeepCollectionEquality().hash(_clans),const DeepCollectionEquality().hash(_rounds));
}

@override
String toString() {
    return 'ClanWarLeagueGroup(state: $state, season: $season, clans: $clans, rounds: $rounds)';
}


}

/// @nodoc
abstract mixin class _$ClanWarLeagueGroupCopyWith<$Res> implements $ClanWarLeagueGroupCopyWith<$Res> {
  factory _$ClanWarLeagueGroupCopyWith(_ClanWarLeagueGroup value, $Res Function(_ClanWarLeagueGroup) _then) = __$ClanWarLeagueGroupCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(unknownEnumValue: LeagueGroupState.unknown) LeagueGroupState? state, String? season, List<LeagueGroupClan> clans, List<LeagueRound> rounds
});




}
/// @nodoc
class __$ClanWarLeagueGroupCopyWithImpl<$Res>
    implements _$ClanWarLeagueGroupCopyWith<$Res> {
  __$ClanWarLeagueGroupCopyWithImpl(this._self, this._then);

  final _ClanWarLeagueGroup _self;
  final $Res Function(_ClanWarLeagueGroup) _then;

/// Create a copy of ClanWarLeagueGroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? state = freezed,Object? season = freezed,Object? clans = null,Object? rounds = null,}) {
  return _then(_ClanWarLeagueGroup(
state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as LeagueGroupState?,season: freezed == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as String?,clans: null == clans ? _self._clans : clans // ignore: cast_nullable_to_non_nullable
as List<LeagueGroupClan>,rounds: null == rounds ? _self._rounds : rounds // ignore: cast_nullable_to_non_nullable
as List<LeagueRound>,
  ));
}


}

// dart format on
