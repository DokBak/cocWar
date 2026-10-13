// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paging.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Cursors _$CursorsFromJson(Map<String, dynamic> json) => _Cursors(
  after: json['after'] as String?,
  before: json['before'] as String?,
);

Map<String, dynamic> _$CursorsToJson(_Cursors instance) => <String, dynamic>{
  'after': instance.after,
  'before': instance.before,
};

_Paging _$PagingFromJson(Map<String, dynamic> json) => _Paging(
  cursors: json['cursors'] == null
      ? null
      : Cursors.fromJson(json['cursors'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PagingToJson(_Paging instance) => <String, dynamic>{
  'cursors': instance.cursors?.toJson(),
};
