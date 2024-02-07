# Firebase Analytics

### GA 이벤트

- Android
    - firebase_analytics_collection_enabled : true
- ‘Firebase Console → 프로젝트 설정 → 내 앱’의 SHA 인증서 지문 부분은 Firebase Messaging, Firebase Analytics와 관련 없음

### Google Play Console의 Debug View 사용 방법

##### Android
- 활성화 : adb shell setprop [debug.firebase.analytics.app](http://debug.firebase.analyticsapp) {패키지명}
- 비활성화 : adb shell setprop [debug.firebase.analytics.app](http://debug.firebase.analyticsapp) .none.
- 상세 로깅 : adb logcat -v time -s FA FA-SVC
    - Debug View에서 보이지 않을 경우 대응 가능
##### iOS
- 활성화 : Xcode → Product → Scheme → Edit Scheme → Arguments → Arguments Passed On Launch →`-FIRDebugEnabled` arguments 추가 후 실행
- 비활성화 : `-FIRDebugDisabled` 추가 후 실행