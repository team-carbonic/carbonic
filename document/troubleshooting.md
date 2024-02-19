# Troubleshooting

## MacOS Sonoma(14.1.1) iOS 빌드 실패

1. Build Phase 종속성 순환 문제
    - 참고: https://github.com/flutter/flutter/issues/134256
    - Thin Binary 단계를 Embed Foundation Extension 단계 다음으로 위치 시켜 해결
    - 반드시 그런 것 같지는 않고, 에러 메시지를 참고하여 build phase를 수정해야 함
2. CocoaPod 배포 타겟 오류(IPHONEOS_DEPLOYMENT_TARGET 이슈)
    - 참고: https://green1229.tistory.com/260
    - `'IPHONEOS_DEPLOYMENT_TARGET' is set to {N}, but the range of supported deployment target versions is …`
    - 아래와 같이 모든 라이브러리의 배포 타겟을 특정 버전으로 고정시킨다.
        ```ruby
        post_install do |installer|
          installer.pods_project.targets.each do |target|
            target.build_configurations.each do |config|
              config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
            end
          end
        end
        ```

## 안드로이드 키패드 Proguard 관련 이슈

### 오류 원인

- Release 빌드의 경우 ‘lib’, ‘class’ 들을 패키징하여 처리 되는데, 이때 특정 함수들을 인식하지 못해 발생하는 이슈

### 오류 관련 로그

```ruby
java.lang.NoSuchMethodError: no static or non-static method
```

### 해결 내용

- ‘pro-guard’의 경우에는 패키징 하지않고 빌드되도록 관련 처리를 넣어 준다.

### 해결 과정

- “proguard-rules.pro” 파일에 아래 부분 추가
    
    ```ruby
    -keep class [kr.co](http://kr.co/).kings.kmvkeypad.*
    -keepclassmembers class [kr.co](http://kr.co/).kings.kmvkeypad.* {*;}
    ```
    
- “build.grade” 파일에 아래 부분 추가
    
    ```ruby
    proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
    ```

## flutterfire 설정 중 xcodeproj 파일 LoadError 발생

- flutterfire 설정 진행중에 아래와 같은 에러 발생
    ```
    Unhandled exception:
    Exception: /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require': cannot load such file -- xcodeproj (LoadError)
            from /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
            from -e:1:in `<main>'
    ```
    
- 아래 명령어 실행 후 재시도
    ```
    sudo gem install xcodeproj
    ```

## ruby update를 통한 ruby 새 버전이 적용되지 않는 현상

[[Mac] 맥 Ruby Update 업데이트 적용 방법](https://2vup.com/mac-ruby-update/)

## sudo gem install 명령어 실행 시 진행되지 않는 현상 (ruby version 관련)

### 재현

- `sudo gem install fastlane` 실행 시 아무것도 나타나지 않고 진행되지 않음
- `sudo gem install fastlane --verbose` 명령어 실행으로 자세한 실행 과정 확인 시, [https://rubygems.org/api/…](https://rubygems.org/api) 주소 접속이 불가능하다는 메시지가 출력됨.

### 원인

- ruby 3.0.0 이후 ruby API 경로가 바뀌어 발생한 현상

### 해결

- `ruby —-version` 을 통해 ruby의 버전이 낮은 것을 확인하고 최신 ruby 버전으로 업데이트 진행
- 관련 페이지 : [https://www.notion.so/ruby-update-ruby-20648ec375464392af220bd9b113b41e?pvs=4](https://www.notion.so/ruby-update-ruby-20648ec375464392af220bd9b113b41e?pvs=21)

## flutter buld ipa 실행 시 exportArchive 에러 발생

### 현상

```bash
error: exportArchive: "Runner.app" requires a provisioning profile with the Associated Domains and Push Notifications features.
```

### 원인

- ipa를 빌드해야 하는 scheme 별로 ExportOptions.plist 파일 필요

### 해결

- Xcode → Product → Archive 에서 scheme 별로 아카이브를 진행한다.
- 추출된 파일들 중 ExportOptions.plist 파일을 프로젝트의 ios 폴더 내에 위치시킨다.

## ADB(Android Debug Bridge) 오류

### 현상

```bash
Error: ADB exited with exit code 1
Performing Streamed Install

adb: failed to install /Users/woojin/project/blue_app/build/app/outputs/flutter-apk/app-dev-debug.apk:
```

### 원인

- ADB 앱 패키지 검증 시스템의 차단

### 해결

```bash
$ **adb shell**
x1q:/ $ **settings put global package_verifier_enable 0**
```

## Swift Compiler Error (Xcode): No such module ‘…’

### 현상

- 외부 프레임워크/라이브러리를 추가한 뒤 빌드 시, `Swift Compiler Error (Xcode): No such module '...'` 와 같은 에러가 발생한다.

### 원인

- 프레임워크/라이브러리의 경로를 찾지 못해 발생하는 현상

### 해결

- Xcode → TARGETS → Runner → Build Settings → Framework/Library Search Paths에 모듈 경로 추가
- Objective-C 기반 모듈인 경우, Runner-Bridging-Header.h에 import문 추가