import 'package:coc_models/coc_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'game_assets.dart';
import 'level_caps.dart';
import 'player_providers.dart';

const _tileSize = 56.0;
const _gold = Color(0xFFFFD54F);
const _badgeBackground = Color(0xE6101018);

/// 오른쪽 위 "현재 홀 최고 레벨" 배지. 왼쪽 아래 현재 레벨(어두운/노란 배지)과 헷갈리지 않게 파란색이다.
const _capBadge = Color(0xFF1E88E5);
const _superStar = Color(0xFFE53935);

/// 장비 희귀도 배경색. API에는 희귀도가 없지만 최대 레벨로 구분된다(일반 18, 에픽 27).
Color _equipmentBackground(int? maxLevel) =>
    (maxLevel ?? 0) > 18 ? const Color(0xFF8A3FA8) : const Color(0xFF4F86C6);

/// 진행률(%) 문자열. 레벨 합계 / 최대 레벨 합계, 소수 둘째 자리까지 (예: `91.85`, `100`).
String? progressPercent(Iterable<PlayerItem> items) {
  var level = 0;
  var max = 0;
  for (final i in items) {
    level += i.level ?? 0;
    max += i.maxLevel ?? 0;
  }
  if (max == 0) return null;
  final text = (level / max * 100).toStringAsFixed(2);
  return text.replaceFirst(RegExp(r'\.?0+$'), '');
}

/// 아이콘 타일 여러 개를 줄바꿈하며 나열한다.
class ItemGrid extends StatelessWidget {
  const ItemGrid({
    super.key,
    required this.entries,
    required this.kind,
    this.townHall,
  });

  final List<ItemEntry> entries;
  final ItemKind kind;

  /// 플레이어의 타운홀 레벨. 오른쪽 위 "현재 홀 최고 레벨"을 계산하는 데 쓴다.
  final int? townHall;

  @override
  Widget build(BuildContext context) => Wrap(
    spacing: 8,
    runSpacing: 8,
    children: [
      for (final e in entries)
        ItemTile(
          item: e.item,
          kind: kind,
          townHall: townHall,
          superName: e.superName,
        ),
    ],
  );
}

/// 이미지 한 장과 배지들.
///
/// - 왼쪽 아래: 현재 레벨 (최대 레벨이면 노란 배지 + 금색 테두리)
/// - 오른쪽 위: 현재 타운홀에서의 최고 레벨. 현재 레벨과 같거나 알 수 없으면 숨긴다
/// - 왼쪽 위: 슈퍼 부대가 활성화되어 있으면 빨간 별
///
/// 이름은 길게 누르거나(웹은 마우스를 올리면) 툴팁으로 보인다.
/// 이미지가 없으면 "이미지 없음" 대체 이미지를 보여준다.
class ItemTile extends ConsumerWidget {
  const ItemTile({
    super.key,
    required this.item,
    required this.kind,
    this.townHall,
    this.superName,
  });

  final PlayerItem item;
  final ItemKind kind;
  final int? townHall;

  /// 이 부대의 슈퍼 부대가 활성화되어 있으면 그 이름 (예: `Super Barbarian`).
  final String? superName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final assets = ref.watch(gameAssetsProvider).value ?? const <String>{};
    final caps = ref.watch(levelCapsProvider).value;

    // 슈퍼 부대 이미지가 있으면 그것을, 없으면 기본 부대 이미지를 쓴다.
    final path =
        (superName == null ? null : resolveAsset(assets, kind, superName)) ??
        resolveAsset(assets, kind, item.name);

    final level = item.level;
    final maxed = level != null && level == item.maxLevel;
    final cap = caps?.capFor(kind, item.name, townHall);
    final showCap = level != null && cap != null && cap > level;

    final name = item.name ?? '-';
    final label =
        '$name · ${level ?? '-'}/${item.maxLevel ?? '-'}'
        '${superName == null ? '' : ' · $superName'}';
    final background = kind == ItemKind.equipment
        ? _equipmentBackground(item.maxLevel)
        : theme.colorScheme.surfaceContainerHigh;

    return Tooltip(
      message: label,
      child: Semantics(
        label: label,
        child: Container(
          width: _tileSize,
          height: _tileSize,
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: maxed ? _gold : theme.colorScheme.outline,
              width: 2,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Stack(
              fit: StackFit.expand,
              children: [
                if (path != null)
                  Image.asset(
                    path,
                    fit: BoxFit.cover,
                    // 원본(수백 KB)을 타일 크기에 맞춰 줄여 디코딩해 메모리를 아낀다. 파일은 그대로다.
                    cacheWidth: (_tileSize * 3).round(),
                    errorBuilder: (_, _, _) => _MissingImage(name: name),
                  )
                else
                  _MissingImage(name: name),
                Positioned(
                  left: 2,
                  bottom: 2,
                  child: _Badge(text: '${level ?? '-'}', highlight: maxed),
                ),
                if (showCap)
                  Positioned(
                    right: 2,
                    top: 2,
                    child: _Badge(text: '$cap', small: true, color: _capBadge),
                  ),
                if (superName != null)
                  const Positioned(left: 2, top: 2, child: _SuperStar()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// 이미지 파일이 없을 때의 대체 이미지.
/// 이름이 길어도 타일(배지 자리 제외) 안에 들어가도록 내용이 알아서 줄어든다.
class _MissingImage extends StatelessWidget {
  const _MissingImage({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(4, 14, 4, 16),
    child: FittedBox(
      fit: BoxFit.scaleDown,
      child: SizedBox(
        width: 44,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.image_not_supported_outlined,
              size: 20,
              color: Colors.white70,
            ),
            const SizedBox(height: 2),
            Text(
              name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 8,
                height: 1.1,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class _Badge extends StatelessWidget {
  const _Badge({
    required this.text,
    this.highlight = false,
    this.small = false,
    this.color,
  });

  final String text;
  final bool highlight;
  final bool small;

  /// 배경색을 직접 지정할 때(기본은 어두운 배지, [highlight]면 금색).
  final Color? color;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.symmetric(horizontal: small ? 3 : 4, vertical: 1),
    decoration: BoxDecoration(
      color: color ?? (highlight ? _gold : _badgeBackground),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      text,
      style: TextStyle(
        fontSize: small ? 10 : 11,
        fontWeight: FontWeight.bold,
        height: 1.2,
        color: highlight && color == null ? Colors.black : Colors.white,
      ),
    ),
  );
}

class _SuperStar extends StatelessWidget {
  const _SuperStar();

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(1),
    decoration: const BoxDecoration(
      color: _badgeBackground,
      shape: BoxShape.circle,
    ),
    child: const Icon(Icons.star, size: 13, color: _superStar),
  );
}
