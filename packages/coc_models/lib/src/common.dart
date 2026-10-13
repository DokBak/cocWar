import 'package:freezed_annotation/freezed_annotation.dart';

part 'common.freezed.dart';
part 'common.g.dart';

@freezed
abstract class BadgeUrls with _$BadgeUrls {
  const factory BadgeUrls({String? small, String? medium, String? large}) =
      _BadgeUrls;

  factory BadgeUrls.fromJson(Map<String, dynamic> json) =>
      _$BadgeUrlsFromJson(json);
}

@freezed
abstract class IconUrls with _$IconUrls {
  const factory IconUrls({
    String? tiny,
    String? small,
    String? medium,
    String? large,
  }) = _IconUrls;

  factory IconUrls.fromJson(Map<String, dynamic> json) =>
      _$IconUrlsFromJson(json);
}

@freezed
abstract class Label with _$Label {
  const factory Label({int? id, String? name, IconUrls? iconUrls}) = _Label;

  factory Label.fromJson(Map<String, dynamic> json) => _$LabelFromJson(json);
}

@freezed
abstract class League with _$League {
  const factory League({int? id, String? name, IconUrls? iconUrls}) = _League;

  factory League.fromJson(Map<String, dynamic> json) => _$LeagueFromJson(json);
}

@freezed
abstract class Location with _$Location {
  const factory Location({
    int? id,
    String? name,
    bool? isCountry,
    String? countryCode,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
