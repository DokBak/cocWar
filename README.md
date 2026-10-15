# cocWar

**한국어** | [日本語](README.ja.md)

Clash of Clans 클랜전 통계 앱 (War Report 유사 기능). Flutter(iOS/Android/Web) + Dart shelf 프록시 서버.

## 기능
- **홈**: 클랜·플레이어 태그 검색, 최근 검색(리그 아이콘 표시), 즐겨찾기, 한국어·영어·일본어, 라이트/다크 테마
- **클랜**: 배지·레벨·승패·연승, 클랜전 리그·캐피탈 리그, 멤버 목록(캐피탈 레이드 공격권 사용 수), 전쟁 로그(10개씩 페이지)
- **플레이어**: 리그·타운홀·소속 클랜, 통계, 본마을/장인기지의 영웅·장비·부대·주문 레벨(타운홀별 최고 레벨 표시)
- **현재 클랜전**: 준비일·전투일·종료 상태, 남은 시간, 양 클랜 점수 비교, 멤버별 공격 목록, 승패 전망
- **클랜전 리그(CWL)**: 그룹 순위(승리 보너스 포함), 라운드별 우리 경기와 상세, 멤버 시즌 성적. 리그전 기간에만 볼 수 있음(지난 시즌 기록은 저장하지 않음)
- **서버**: CoC 공식 API 프록시(토큰은 서버에만), TTL 캐시, 오류 종류 변환

## 진행 상황
| Phase | 내용 | 상태 |
|---|---|---|
| 0 | 모노레포 골격 (Flutter 앱, shelf 서버, 공유 모델) | ✅ |
| 1 | 공유 모델 (`coc_models`) | ✅ |
| 2 | 프록시 서버 | ✅ |
| 3 | 앱 기본 틀 (다국어, 테마, 홈 검색·즐겨찾기) | ✅ |
| 4 | 클랜 화면과 전쟁 로그 | ✅ |
| 5 | 플레이어 프로필과 클랜 화면 개선 | ✅ |
| 6 | 현재 클랜전 화면과 클랜 화면 개선 | ✅ |
| 7 | 클랜전 리그(CWL) 화면 | 🟡 리뷰 중 |

다음 단계
1. 게임 이미지를 공식 Fan Kit 이미지로 교체 (아래 TODO)
2. 배포 — 서버는 고정 IP VPS(Docker), 앱은 웹 호스팅·스토어
3. 전쟁·리그전 기록 수집(DB) — 지금은 DB 없이 서버 메모리 캐시만 쓰므로 지난 전쟁 상세와 지난 리그전 결과가 남지 않음
4. 이후 후보: 전설 리그 추적, 푸시 알림, 홈 위젯

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
영웅·장비·부대·주문·캐피탈 리그 아이콘은 Supercell의 저작물이라 **저장소에 올리지 않습니다.** 앱을 실행하기 전에 한 번 받아 두세요.
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

## TODO: 게임 이미지를 공식 Fan Kit 이미지로 교체
지금 이미지는 커뮤니티 패키지(원출처 Fandom 위키)에서 받습니다. 앱을 배포하기 전에 Supercell 공식 Fan Kit 이미지로 바꿉니다.
- [ ] [Fan Kit](https://fankit.supercell.com/)에서 약관을 확인하고 Clash of Clans 이미지를 **PNG(ORIGINAL)**, 가장 큰 해상도로 일괄 다운로드
      (투명 배경 유지·무변환 원본. JPEG는 투명 배경 없음, AVIF·HEIF는 Flutter 지원이 플랫폼마다 다름)
- [ ] 압축을 풀어 `~/Downloads/fankit`에 둔다 (프로젝트 밖, 하위 폴더·파일 이름은 받은 그대로)
- [ ] 앱이 쓰는 항목과 대조해 있는 것/없는 것 표 작성 (영웅·장비·부대·시즈머신·펫·주문·장인기지·캐피탈 리그)
- [ ] `tool/import_fankit_images.sh <폴더>` 작성: Fan Kit 파일 이름 → 앱 이름 규칙(`gameSlug()`)으로 대응해 `apps/mobile/assets/game/<종류>/<이름>.png`로 **변환 없이 복사**
- [ ] 앱 경로 규칙(`game_assets.dart`)을 `.png`(Fan Kit) 우선 → `.webp`(패키지) 대체로 변경 + 테스트
- [ ] `.gitignore`에 `apps/mobile/assets/game/**/*.png` 추가 (이미지는 계속 저장소에 올리지 않음)
- [ ] 앱 화면에 "비공식이며 Supercell의 보증을 받지 않았습니다" 고지 추가 (팬 콘텐츠 정책 요구)
- [ ] Fan Kit에 없는 항목은 패키지 이미지를 계속 쓸지, 텍스트·대체 아이콘으로 바꿀지 결정

참고: Fan Kit 포털은 로그인·약관 동의가 필요해 자동 다운로드하지 않습니다.

Supercell과 무관한 비공식 팬 프로젝트입니다.
