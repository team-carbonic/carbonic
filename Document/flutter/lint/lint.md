# Lint

## Lint란

Lint는 명령어의 실행을 통해 소스 코드를 분석하여 일련의 규칙에 어긋나는 사항에 flag를 달아 식별 가능하게 해 주는 도구를 가리킨다. [[참고](<https://ko.wikipedia.org/wiki/%EB%A6%B0%ED%8A%B8_(%EC%86%8C%ED%94%84%ED%8A%B8%EC%9B%A8%EC%96%B4)>)]

현대의 언어는 flag를 분류해 컴파일 시 강제로 오류를 발생하도록 하기도 한다.

## Flutter에서의 Lint

Flutter에서는 기본적으로 [flutter_lints](https://pub.dev/packages/flutter_lints)라는 패키지를 통해 기본 규칙들을 제공한다. 해당 패키지는 flutter version 2.3.0 이상을 사용한다면 프로젝트 생성시 기본으로 구성되며, 프로젝트에서의 lint 규칙은 analysis_options.yaml 파일에 기술한다. 예시는 [다음](analysis_options.yaml)과 같다. 물론 flutter_lints는 dart의 기본 [lint](https://pub.dev/packages/lints)에 의존하고 있다.

기본으로 제공하는 규칙 외에도 사용자가 원하는 검사 방식을 [custom_lint](https://pub.dev/packages/custom_lint)라는 패키지를 통해 맞춤으로 제작할 수 있다. [riverpod_lint](https://pub.dev/packages/riverpod_lint) 등 다양한 패키지의 lint 규칙들이 해당 패키지를 통해 제작되었으니 참고하라.

analysis_options.yaml 파일은 크게 linter와 analyzer로 구분된다. linter에는 rule과 해당 rule의 동작 여부를 설정하고, analyzer에는 lint가 동작하는 범위나 lint 검사의 수행 결과에 영향을 미치는 요소 등을 설정한다. 두 영역은 flutter_lints가 제공하는 기본 권장 규칙을 덮어쓴다. analyzer의 errors 목록에 설정된 severity 수준에 따라 컴파일 가능 여부가 달라지므로 주의한다.

dart와 flutter에서 제공하는 규칙 목록은 [여기](https://dart.dev/tools/linter-rules)서 확인할 수 있다. 규칙들 중 일부는 `has fix` 태그가 있는데, 해당 태그가 있는 규칙들은 `dart fix` 명령어를 통해 자동으로 lint 규칙에 맞게 수정된다.

구성된 규칙에 따라 `flutter analyze` 명령어를 통해 분석을 실행할 수 있다.

## <!-- 주요 lint rule에 대해 간략하게 목록과 설명을 작성하고 analysis_options.yaml 파일 정리할 것 -->

#### 참고

- vs code를 사용한다면 파일 저장 시 lint의 auto fix를 수행하도록 설정할 수 있다. 설정은 다음과 같다.
  ```
  "editor.formatOnSave": true,
  "editor.codeActionsOnSave": {
      "source.fixAll": "explicit"
  }
  ```
- analysis_options.yaml 파일에 linter/rules와 analyzer/errors 목록에 사용할 수 있는 항목이 일대일 대응되지는 않는다.
- vs code의 PROBLEMS에 보고되는 항목을 전부 analysis_options.yaml 파일에 customization할 수 있는 것은 아니다.
- Lefthook 등을 통해 git commit 전 lint 검사를 수행하도록 구성해 놓을 수도 있다. [[참고](https://deku.posstree.com/ko/flutter/linter/)]
