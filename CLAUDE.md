# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

Dart pub workspace 모노레포: `apps/mobile`(Flutter), `server`(Dart shelf 프록시), `packages/coc_models`(공유 모델). 실행·이미지 도구는 `README.md` 참고. 사용자에게는 한국어로 답한다.

## 명령
- 분석/테스트는 각 패키지 폴더에서: `flutter analyze` + `flutter test`(앱), `dart analyze` + `dart test`(server, coc_models)
- 모델(freezed/json)을 고치면 `cd packages/coc_models && dart run build_runner build -d`. **생성 파일(`*.freezed.dart`, `*.g.dart`)은 커밋한다**
- ARB(`apps/mobile/lib/l10n/app_{ko,en,ja}.arb`)를 고치면 `cd apps/mobile && flutter gen-l10n`. 새 문구는 **3개 언어 모두** 추가하고 생성된 `app_localizations*.dart`도 커밋
- 웹 실행: `cd apps/mobile && flutter run -d web-server --web-hostname localhost --web-port 5173 --dart-define=API_BASE_URL=http://localhost:8080` (3000번 포트는 다른 프로그램이 씀). 서버는 `cd server && dart run bin/server.dart`(8080)
- 서버 토큰(`COC_API_TOKEN`)은 `server/.env`에만 둔다(gitignore). 허용된 IP에서만 동작. 토큰을 채팅·커밋에 노출하지 않는다

## Git·PR 규칙
- phase마다 브랜치(`phase-N-이름`) + PR. **병합은 사용자 확인 후에만**. 번호는 건너뛰거나 미리 예약하지 않고 직전 phase + 1
- phase마다 `README.md`(한국어)와 `README.ja.md`(일본어)의 "기능"·"진행 상황"을 함께 갱신한다. 두 파일 내용은 같게 유지하고 맨 위 언어 전환 링크도 유지한다
- 커밋 메시지와 PR 설명은 **한국어 + 일본어** 함께 작성(예: `Phase 5: 한국어 / 日本語`)
- 공개 저장소이므로 푸시 전 `.env`·토큰·게임 이미지(`apps/mobile/assets/game/**/*.webp`)가 스테이징되지 않았는지 확인

## 게임 이미지·데이터
- Supercell 저작물인 게임 이미지는 저장소에 올리지 않는다. `./tool/fetch_game_images.sh`로 로컬에만 받는다(없어도 앱은 대체 이미지로 동작)
- 수치·분류 데이터(`assets/data/level_caps.json`, `item_groups.json`)는 `./tool/gen_game_data.sh`로 만들어 커밋한다
- 공식 API의 `maxLevel`은 게임 전체 최대 레벨이라 타운홀별 최고 레벨로 쓰면 안 된다(표를 쓴다)
- 통계 아이콘은 Material 아이콘만 쓴다

## 앱 코드·테스트 관례
- Riverpod 3의 기본 자동 재시도(10회)는 끈다: `noAutoRetry`(`core/providers.dart`). 테스트도 `retry: noAutoRetry`로 단일 요청을 단언한다
- 테스트는 `test/support/fake_api.dart`의 `FakeApi`와 `war_fixture.dart`를 쓴다. `autoDispose` provider는 테스트에서 listener가 있어야 하고, `sharedPreferencesProvider`를 override한다
- `byTooltip`은 RawTooltip을 찾으므로 `ancestor`/`descendant` finder와 함께 쓴다. 같은 테스트에서 `pumpWidget`을 다시 부를 때 override가 안 바뀌면 `key: UniqueKey()`를 준다
- 본문 폭은 `core/layout.dart`의 `contentMaxWidth`(640) 하나로 통일, 나란히 보기는 `splitViewMinWidth` 이상에서만
- 서버는 공식 API 오류를 앱 오류 종류로 바꿔 돌려주고 TTL 캐시를 쓴다(`server/lib/src/app.dart`)
