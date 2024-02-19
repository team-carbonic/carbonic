# Debug

### 앱 실행 대기

딥링크나 푸시 메시지 등, 다른 경로로 앱을 실행하는 경우에 대한 디버깅을 위해 IDE가 앱 실행 이벤트를 대기하도록 할 수 있다.

##### iOS
- Xcode → Product → Scheme → Edit Scheme → 디버깅 할 ‘Build Configuration’ 선택 → Launch 설정을 ‘Wait for the executable to be launched’ 로 설정
- Xcode의 기본 콘솔에서 로그가 나타나지 않으므로, Device Console을 사용 : Window → Devices and Simulators → Open Console

##### Android
- 기기 설정 → 개발자 옵션 → 디버깅할 앱 선택, 디버거 연결을 위해 대기 on