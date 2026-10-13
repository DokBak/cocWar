#!/usr/bin/env bash
# 앱이 쓰는 게임 데이터(apps/mobile/assets/data/level_caps.json, item_groups.json)를 다시 만든다.
# 새 타운홀·새 장비가 나와 clash-of-clans-data가 업데이트되면 VERSION을 올리고 실행한다.
# (이미지를 받는 tool/fetch_game_images.sh의 VERSION도 같이 올린다.)
# `npm pack`은 압축 파일만 받고 패키지의 스크립트를 실행하지 않는다.
set -euo pipefail

VERSION="0.18.1"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

echo "clash-of-clans-data@$VERSION 내려받는 중..."
(cd "$TMP" && npm pack "clash-of-clans-data@$VERSION" --silent >/dev/null && tar -xzf ./*.tgz)
node "$ROOT/tool/gen_game_data.mjs" "$TMP/package" \
  "$ROOT/apps/mobile/assets/data" "clash-of-clans-data@$VERSION"
