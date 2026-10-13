#!/usr/bin/env bash
# 영웅·장비·부대·주문 아이콘을 내려받아 apps/mobile/assets/game/ 에 배치한다.
#
# - 이미지는 Supercell의 저작물이라 저장소에 커밋하지 않는다(.gitignore 처리).
#   앱을 빌드·실행하기 전에 이 스크립트를 한 번 실행한다. 없어도 앱은 동작하며
#   이미지 대신 이름 텍스트가 표시된다.
# - 출처: npm 패키지 clash-of-clans-data (MIT, 데이터는 Clash of Clans Wiki 기반).
#   `npm pack`은 압축 파일만 받고 패키지의 스크립트를 실행하지 않는다.
# - 이미지를 수정하지 않고 파일 이름만 바꿔서 복사한다 (Supercell 팬 콘텐츠 정책).
#   https://supercell.com/en/fan-content-policy/
set -euo pipefail

VERSION="0.18.1"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DEST="$ROOT/apps/mobile/assets/game"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

echo "clash-of-clans-data@$VERSION 내려받는 중..."
(cd "$TMP" && npm pack "clash-of-clans-data@$VERSION" --silent >/dev/null && tar -xzf ./*.tgz)
SRC="$TMP/package/images/home"
[ -d "$SRC" ] || { echo "이미지 폴더를 찾을 수 없습니다: $SRC" >&2; exit 1; }

# 이전 결과를 지우고 다시 만든다 (.gitkeep은 남긴다).
for d in heroes equipment troops siege pets spells builder_heroes builder_troops; do
  mkdir -p "$DEST/$d"
  find "$DEST/$d" -type f ! -name '.gitkeep' -delete
done

# <원본 폴더> <대상 폴더>: 각 항목 폴더의 icon.png(실제로는 WebP)를 <항목>.webp 로 복사한다.
copy_icons() {
  local from="$1" to="$2"
  for dir in "$SRC/$from"/*/; do
    local name; name="$(basename "$dir")"
    [ -f "$dir/icon.png" ] && cp "$dir/icon.png" "$DEST/$to/$name.webp"
  done
}
copy_icons heroes heroes
copy_icons hero-equipment equipment
copy_icons troops troops
copy_icons siege-machines siege
copy_icons pets pets
copy_icons spells spells

# 장인기지(본마을과 이름이 겹치는 유닛이 있어서 폴더를 따로 둔다)
copy_builder_icons() {
  local from="$1" to="$2"
  for dir in "$TMP/package/images/builder/$from"/*/; do
    local name; name="$(basename "$dir")"
    [ -f "$dir/icon.png" ] && cp "$dir/icon.png" "$DEST/$to/$name.webp"
  done
}
copy_builder_icons heroes builder_heroes
copy_builder_icons troops builder_troops

# 슈퍼 부대: troops/<기본 부대>/super/icon.png → troops/<기본 부대>-super.webp
for dir in "$SRC"/troops/*/super; do
  [ -f "$dir/icon.png" ] || continue
  base="$(basename "$(dirname "$dir")")"
  cp "$dir/icon.png" "$DEST/troops/$base-super.webp"
done

echo "완료:"
for d in heroes equipment troops siege pets spells builder_heroes builder_troops; do
  printf "  %-10s %s개\n" "$d" "$(find "$DEST/$d" -name '*.webp' | wc -l | tr -d ' ')"
done
du -sh "$DEST" | awk '{print "  전체 크기 " $1}'
