# 빌드 컨텍스트는 저장소 루트여야 한다 (coc_models를 함께 복사하기 위해):
#   docker build -f server/Dockerfile -t cocwar-server .
FROM dart:stable AS build

WORKDIR /app
COPY server ./server
COPY packages/coc_models ./packages/coc_models

# 루트 워크스페이스에서 Flutter 앱을 뺀 최소 구성 (이미지에는 Flutter SDK가 없다).
RUN printf 'name: cocwar_build\npublish_to: none\nenvironment:\n  sdk: ^3.13.5\nworkspace:\n  - server\n  - packages/coc_models\n' > pubspec.yaml
RUN dart pub get
RUN dart build cli --target server/bin/server.dart -o output

# AOT 컴파일된 결과만 담은 최소 이미지.
FROM scratch
COPY --from=build /runtime/ /
COPY --from=build /app/output/bundle/ /app/

# COC_API_TOKEN은 실행 시 환경변수로 넘긴다 (이미지에 넣지 않는다).
EXPOSE 8080
CMD ["/app/bin/server"]
