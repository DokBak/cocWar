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

Supercell과 무관한 비공식 팬 프로젝트입니다.
