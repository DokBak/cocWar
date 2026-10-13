# cocWar

Clash of Clans 클랜전 통계 앱 (War Report 유사 기능). Flutter(iOS/Android/Web) + Dart shelf 프록시 서버.

## 구조
- `apps/mobile` — Flutter 앱
- `server` — CoC 공식 API 프록시 (고정 IP 필요, 토큰은 `COC_API_TOKEN` 환경변수)
- `packages/coc_models` — 앱·서버 공유 모델

## 개발
```
dart pub get          # 워크스페이스 전체 의존성
dart analyze
```

## 실행
```
# 1) 프록시 서버 (server/.env에 COC_API_TOKEN 필요, 토큰은 허용된 IP에서만 동작)
cd server && dart run bin/server.dart          # http://localhost:8080

# 2) 앱
cd apps/mobile
flutter run -d chrome                           # 웹
flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8080   # Android 에뮬레이터
flutter gen-l10n                                # ARB(ko/en/ja) 수정 후
```
서버 이미지: `docker build -f server/Dockerfile -t cocwar-server .` (저장소 루트에서)

## 게임 이미지와 레벨 표
영웅·장비·부대·주문 아이콘은 Supercell의 저작물이라 **저장소에 올리지 않습니다.** 앱을 실행하기 전에 한 번 받아 두세요.
```
./tool/fetch_game_images.sh     # apps/mobile/assets/game/ 에 아이콘을 내려받음 (git에서 제외됨)
```
- 이미지가 없어도 앱은 동작하며, 해당 항목은 "이미지 없음" 대체 이미지로 표시됩니다.
- 출처는 `clash-of-clans-data`(MIT) 패키지입니다. 새 장비·부대가 나왔는데 이미지가 없다면 패키지가 업데이트될 때까지 기다린 뒤 스크립트의 `VERSION`을 올려 다시 실행하세요.
- 이미지는 수정하지 않고 표시만 합니다. [Supercell 팬 콘텐츠 정책](https://supercell.com/en/fan-content-policy/)을 따릅니다.

공식 API가 주지 않는 정보(타운홀별 최고 레벨, 장비가 속한 영웅, 부대·주문의 자원 구분)는 같은 패키지 데이터로 계산한 표를 씁니다. 이미지가 아니라 수치·분류라서 저장소에 포함되어 있습니다(`apps/mobile/assets/data/level_caps.json`, `item_groups.json`).
```
./tool/gen_game_data.sh         # 새 타운홀·새 장비가 나오면 VERSION을 올리고 다시 생성
```
- 패키지에 아직 없는 신규 장비는 `tool/gen_game_data.mjs`의 `EXTRA_EQUIPMENT_HERO`에 수동으로 영웅을 지정할 수 있습니다(예: Portal Pendant).

Supercell과 무관한 비공식 팬 프로젝트입니다.
