// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BadgeUrls _$BadgeUrlsFromJson(Map<String, dynamic> json) => _BadgeUrls(
  small: json['small'] as String?,
  medium: json['medium'] as String?,
  large: json['large'] as String?,
);

Map<String, dynamic> _$BadgeUrlsToJson(_BadgeUrls instance) =>
    <String, dynamic>{
      'small': instance.small,
      'medium': instance.medium,
      'large': instance.large,
    };

_IconUrls _$IconUrlsFromJson(Map<String, dynamic> json) => _IconUrls(
  tiny: json['tiny'] as String?,
  small: json['small'] as String?,
  medium: json['medium'] as String?,
  large: json['large'] as String?,
);

Map<String, dynamic> _$IconUrlsToJson(_IconUrls instance) => <String, dynamic>{
  'tiny': instance.tiny,
  'small': instance.small,
  'medium': instance.medium,
  'large': instance.large,
};

_Label _$LabelFromJson(Map<String, dynamic> json) => _Label(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  iconUrls: json['iconUrls'] == null
      ? null
      : IconUrls.fromJson(json['iconUrls'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LabelToJson(_Label instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'iconUrls': instance.iconUrls?.toJson(),
};

_League _$LeagueFromJson(Map<String, dynamic> json) => _League(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  iconUrls: json['iconUrls'] == null
      ? null
      : IconUrls.fromJson(json['iconUrls'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LeagueToJson(_League instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'iconUrls': instance.iconUrls?.toJson(),
};

_Location _$LocationFromJson(Map<String, dynamic> json) => _Location(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  isCountry: json['isCountry'] as bool?,
  countryCode: json['countryCode'] as String?,
);

Map<String, dynamic> _$LocationToJson(_Location instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'isCountry': instance.isCountry,
  'countryCode': instance.countryCode,
};
