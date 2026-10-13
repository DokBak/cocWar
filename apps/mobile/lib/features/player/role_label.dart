import '../../l10n/app_localizations.dart';

/// API의 역할 값(`member`, `admin`, `coLeader`, `leader`)을 현재 언어의 이름으로 바꾼다.
/// `admin`이 장로(Elder)다. 알 수 없는 값은 null.
String? roleLabel(AppLocalizations l10n, String? role) => switch (role) {
  'member' => l10n.roleMember,
  'admin' => l10n.roleElder,
  'coLeader' => l10n.roleCoLeader,
  'leader' => l10n.roleLeader,
  _ => null,
};
