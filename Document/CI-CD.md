// Notion 문서 이전, 수정 필요

# CI/CD

# Fastlane Match

### 용도

- iOS 개발 및 배포 시, 애플 개발자 계정으로 생성된 인증서 및 프로파일을 모든 작업자 및 빌드머신에 일괄 적용하기 위함

### 방식

- 애플 개발자 계정으로 생성한 인증서와 프로파일을 git 저장소에 암호화하여 저장
- 작업자 및 빌드머신은 해당 저장소의 인증서를 로컬 빌드 시 적용
- 모든 과정은 Fastlane의 Match 기능을 활용함

### 사전 조건

- Xcode → Targets 각 항목들에 대해 동일하게 적용
    - Signing & Capabilities → 모든 ‘Automatically manage signing’ 체크박스 해제
- Mac의 ‘키체인 접근’ → 개인 인증서가 있다면 제거
- Apple Developer → Account → Certificates → 개인이 생성한 인증서 제거
- Apple Developer → Account → Profiles → 개인이 생성한 프로파일 제거
- ‘/Users/{user_name}/Library/MobileDevice/Provisioning Profiles’ 폴더의 ‘*.mobileprovision’ 파일들 모두 제거

### 개별 작업자의 인증서 적용 방법

- 프로젝트의 iOS 폴더 내에서 `fastlane certificates`  실행
    - 커맨드 실행 시 로컬 저장소에 대한 암호 설정
- Xcode → TARGETS → Runner → Signing & Capabilities, Provisioning Profile 설정
    - Debug, Profile, Debug-prod, Profile-prod
        - match Development com.example.app
    - Release, Release-prod
        - match AppStore com.example.app
    - Debug-dev, Profile-dev, Debug-stage, Profile-stage
        - match Development com.example.app.dev
    - Release-dev, Release-stage
        - match AppStore com.example.app.dev

### Build Machine에서의 설정

- 인증서 제거 (선택사항)
    
    ```bash
    $ fastlane match nuke development
    $ fastlane match nuke distribution
    ```
    
- 인증서 생성 및 업로드

