import 'package:freezed_annotation/freezed_annotation.dart';

import 'coc_date_time.dart';
import 'common.dart';
import 'paging.dart';

part 'war_log.freezed.dart';
part 'war_log.g.dart';

@JsonEnum(fieldRename: FieldRename.none)
enum WarResult { win, lose, tie, unknown }

@freezed
abstract class WarClan with _$WarClan {
  const factory WarClan({
    String? tag,
    String? name,
    BadgeUrls? badgeUrls,
    int? clanLevel,
    int? attacks,
    int? stars,
    double? destructionPercentage,
    int? expEarned,
  }) = _WarClan;

  factory WarClan.fromJson(Map<String, dynamic> json) =>
      _$WarClanFromJson(json);
}

@freezed
abstract class ClanWarLogEntry with _$ClanWarLogEntry {
  const factory ClanWarLogEntry({
    // 진행 중이던 전쟁이나 알 수 없는 값은 unknown으로 받는다.
    @JsonKey(unknownEnumValue: WarResult.unknown) WarResult? result,
    @CocDateTimeConverter() DateTime? endTime,
    int? teamSize,
    int? attacksPerMember,
    String? battleModifier,
    WarClan? clan,
    WarClan? opponent,
  }) = _ClanWarLogEntry;

  factory ClanWarLogEntry.fromJson(Map<String, dynamic> json) =>
      _$ClanWarLogEntryFromJson(json);
}

@freezed
abstract class ClanWarLog with _$ClanWarLog {
  const factory ClanWarLog({
    @Default(<ClanWarLogEntry>[]) List<ClanWarLogEntry> items,
    Paging? paging,
  }) = _ClanWarLog;

  factory ClanWarLog.fromJson(Map<String, dynamic> json) =>
      _$ClanWarLogFromJson(json);
}
