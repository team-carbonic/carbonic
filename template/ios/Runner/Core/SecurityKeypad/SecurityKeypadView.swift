//
//  SecurityKeypadView.swift
//  Runner
//
//  Created by SAB-150 on 1/31/24.
//

import Flutter

class SecurityKeypadView: NSObject, FlutterPlatformView {
	// 아래 멤버변수들은 callback 함수에서 접근 가능해야 한다.
	static public var instance: SecurityKeypadView?
	public let keypad: KMVAPI = KMVAPI()
    public var uiView: UIView = UIView()
	public var currentLength: Int32 = 0
	public let maxInputLength: Int
	public let flutterApi: SecurityKeypadFlutterApi

    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?,
		maxInputLength max: Int,
		flutterApi: SecurityKeypadFlutterApi
    ) {
		self.maxInputLength = max
		self.flutterApi = flutterApi
        super.init()
		SecurityKeypadView.instance = self
        createNativeView()
    }

    func view() -> UIView {
        return uiView
    }

    private func createNativeView() {
		// init 호출 즉시 setKMVNumPad가 호출될 경우 키패드 나타나지 않음
		Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { (timer) -> Void in
			self.keypad.setInputBar(false, false, "", "")
			self.keypad.showPopup(false)
			self.keypad.setActionButton("delete", "done")
			self.keypad.setKMVNumPad(self.uiView, self.maxInputLength, callback, nil, 1, 1)
		}
    }
	
	func onInputCompleted() {
		var encryptedInput: NSString!
		let result = keypad.getKMVNumpadE2EString(&encryptedInput)
		// submit된 문자열이 없을 경우 6이 오는 듯...
		if (result == 6) {
			return
		}
		guard let encryptedInput = encryptedInput else {
			return
		}
		flutterApi.onInputCompleted(encryptedInput: encryptedInput as String) { (error) -> Void in
			print("error: \(error)")
		}
	}
}

func callback(inputResult: Int32) {
	guard let instance = SecurityKeypadView.instance else {
		return
	}

	// '확인' 버튼 탭, maxInputLength만큼 입력 완료
	if (inputResult == CALLBACK_DONE) {
		instance.onInputCompleted()
	}
	// 포커스 해제 시
	else if (inputResult == CALLBACK_CLOSE) {
		instance.flutterApi.onHostFocusLost() { (error) -> Void in }
	}
	// 숫자 입력 시, {maxInputLength}개 까지 입력 가능 (result: 입력 문자 길이)
	else if (inputResult < 1000) {
		instance.currentLength = inputResult
		instance.flutterApi.onInputLengthChanged(length: Int64(instance.currentLength)) { (error) -> Void in }
	}
	// 그 외 코드에 대한 처리는 하지 않음
}
