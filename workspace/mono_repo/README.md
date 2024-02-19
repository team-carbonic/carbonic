# Carbonic Mono Repo Workspace

> [Melos 공식 문서](https://melos.invertase.dev)

## Melos 적용

### Melos 활성화

`dart pub global activate melos`

### Bootstrapping

`melos bootstrap`

- package 폴더의 각 패키지 마다, 종속성을 가지는 모든 패키지를 설치한다. (즉, 각 패키지 폴더 내에서 pub get 실행)
- 로컬 환경에서, package 폴더 내에 존재하는 패키지들을 버전과 상관없이 연결한다. (pub.dev가 아닌, 로컬 환경에 존재하는 패키지 형상을 참조)

## 패키지 공유 (Publish)

### 로컬 환경에서 유효성 검사

`melos publish --verbose`

### Publish

`melos publish --no-dry-run --verbose`
