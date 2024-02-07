# iOS App Signing

## Provisioning Profile

### 특징

- Apple에서 제공하는 App Service를 추가하는데 필요하다. (ex. APNs 등)
- 특정 개발자가 개발, App Store Connect 업로드, 배포에 대한 권한이 있는지 인증한다.

### 포함 정보

- Development Certificates : 특정 개발자에 대한 인증서로, 개발 단계에서 기기 테스트를 진행할 수 있도록 한다.
- Device Identifiers : 해당 프로파일로 