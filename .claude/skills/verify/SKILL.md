---
name: verify
description: 앱·공유 모델·서버의 정적 분석과 테스트를 모두 실행해 변경이 안전한지 확인한다. 코드 변경을 마친 뒤나 커밋·PR 전에 사용한다.
---

저장소 루트에서 아래를 순서대로 실행하고, 실패하면 원인을 고치거나 보고한다. 결과는 패키지별로 한 줄씩 요약한다.

1. 공유 모델: `cd packages/coc_models && dart analyze && dart test`
2. 서버: `cd server && dart analyze && dart test`
3. 앱: `cd apps/mobile && flutter analyze && flutter test`

모델 파일을 바꿨다면 먼저 `cd packages/coc_models && dart run build_runner build -d`, ARB를 바꿨다면 `cd apps/mobile && flutter gen-l10n`을 실행한다.
마지막으로 `git status`로 `.env`나 `assets/game/**/*.webp`가 스테이징되지 않았는지 확인한다.
테스트가 실패하면 통과시키려고 테스트를 약화하지 말고, 앱 코드 문제인지 테스트 구성 문제인지 먼저 구분해 말한다.
