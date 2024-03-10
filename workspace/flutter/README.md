# Carbonic Mono Repo Workspace

> [Melos 공식 문서](https://melos.invertase.dev)

## Melos 적용

### Melos 활성화

`dart pub global activate melos`

### Bootstrapping

`melos bootstrap`

- Melos 환경 하위의 각 프로젝트마다, 종속성을 가지는 모든 패키지를 설치한다. (즉, 각 프로젝트 폴더 내에서 pub get 실행)
- 로컬 환경에서, 프로젝트 폴더 내에 존재하는 패키지들을 버전과 상관없이 연결한다.

## 패키지 공유 (Publish)

### 필수 작성 파일

- README.md
- CHANGELOG.md
- LICENSE
- pubspec.yaml
  - description

### 로컬 환경에서 유효성 검사

`melos validate`

### Publish

`melos upload`
