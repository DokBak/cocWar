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

Supercell과 무관한 비공식 팬 프로젝트입니다.
