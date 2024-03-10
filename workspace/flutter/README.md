# Carbonic Mono Repo Workspace

> [Melos 공식 문서](https://melos.invertase.dev)

## Melos 적용

### Melos 활성화

`dart pub global activate melos`

### Bootstrapping

`melos bootstrap`

- Melos 환경 하위의 각 프로젝트마다, 종속성을 가지는 모든 패키지를 설치한다. (즉, 각 프로젝트 폴더 내에서 pub get 실행)
- 로컬 환경에서, 프로젝트 폴더 내에 존재하는 패키지들을 버전과 상관없이 연결한다.

## 패키지 버전 업데이트

> [Melos 공식 문서](https://melos.invertase.dev/guides/automated-releases#versioning)

> [Conventional Commits 안내](https://www.conventionalcommits.org/en/v1.0.0/)

### command

`melos version`

### 버전 표현 방식

`{major}.{minor}.{patch}+{meta}`

### Conventional Commits 표기법
```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

### 자동 버전 업데이트를 위한 커밋 규칙

#### 기본 규칙

- major 업데이트
  - footer에 `BREAKING CHANGE` 명시
  - (또는) type, scope 뒤에 `!` 추가
- minor 업데이트
  - type : `feat`
- patch 업데이트
  - major, minor 업데이트에 해당하지 않는 모든 방식
  - ex. `fix`, `refactor`, `docs`

#### 예시

- major 업데이트
  - ```
    feat!: 커밋 요약

    커밋 설명
    ```
  - ```
    fix: 커밋 요약

    BREAKING CHANGE: 설명
    ```
  - ```
    refactor!: 커밋 요약

    커밋 설명

    BREAKING CHANGE: 설명
    ```
- minor 업데이트
  - ```
    feat: 커밋 요약

    커밋 설명
    ```
- patch 업데이트
  - ```
    fix: 커밋 요약

    커밋 설명
    ```
  - ```
    refactor: 커밋 요약

    커밋 설명
    ```

#### 추가 규칙

- Pre-release 버전의 경우(major 버전이 0인 경우), major 업데이트 규칙은 minor 버전 업데이트로, minor 업데이트 규칙은 patch 버전 업데이트로, patch 업데이트 규칙은 meta(build metadata) 버전 업데이트로 적용된다.
  - ex.
    - `0.1.2` 버전에서 `feat!:` 형태의 커밋은, `version` 커맨드 실행 시, `0.2.2`로 업데이트 한다.
    - `0.1.2` 버전에서 `feat:` 형태의 커밋은, `version` 커맨드 실행 시, `0.1.3`로 업데이트 한다.
    - `0.1.2` 버전에서 `fix:` 형태의 커밋은, `version` 커맨드 실행 시, `0.1.2+1`로 업데이트 한다.

## 패키지 공유 (Publish)

### 필수 작성 항목

- README.md
- CHANGELOG.md
- LICENSE
- pubspec.yaml
  - description
  - homepage

### 로컬 환경에서 유효성 검사

`melos validate`

### Publish

`melos upload`
