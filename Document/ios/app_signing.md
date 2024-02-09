# iOS App Signing

## Provisioning Profile

### 특징

- Apple에서 제공하는 App Service를 추가하는데 필요하다. (ex. APNs 등)
- 특정 개발자가 개발, App Store Connect 업로드, 배포에 대한 권한이 있는지 인증한다.

### 포함 정보

- Development Certificates : 특정 개발자에 대한 인증서로, 개발 단계에서 기기 테스트를 진행할 수 있도록 한다.
- Device Identifiers : 해당 프로파일로

## Fastlane Match

### 기존의 인증파일(Certificates, Provisioning Profile) 관리 방식

- 팀원 모두와 빌드머신은 각자의 인증서를 생성해야 한다.
- 인증서가 만료될 경우 재발급 받아야 한다.
- 테스트용 기기가 추가되면 프로파일을 업데이트 해야 한다.
- 위 업데이트 사항들이 발생하면 모든 팀원이 새로 생성된 프로파일을 다시 다운받아 키체인에 등록해야 한다. 즉, 굉장히 번거롭다.

### Fastlane Match의 컨셉

- Fastlane Match는 단일 명령어로 iOS 인증파일들의 생성, 다운로드, 키체인 등록까지 가능하게 해준다.
- 로컬에서 Fastlane Match를 통해 인증파일을 생성하면 아래와 같은 과정이 진행된다.
    - 인증서와 프로파일을 Apple Developer에 생성한다.
    - 생성한 인증서와 프로파일을 다운받고, 로컬 키체인에 등록한다.
    - 지정한 git repository에 암호화하여 업로드한다.
- Fastlane Match를 통해 로컬의 인증파일을 업데이트하면 아래와 같은 과정이 진행된다.
    - git repository에 업로드 되어있는 인증서와 프로파일을 다운받는다.
    - 인증서를 키체인에 등록한다.