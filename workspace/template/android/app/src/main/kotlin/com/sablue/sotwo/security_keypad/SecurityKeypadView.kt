package com.sablue.sotwo.security_keypad
import SecurityKeypadHostApi
import android.content.Context
import android.view.View
import com.sablue.sotwo.MainActivity
import io.flutter.plugin.platform.PlatformView
import kr.co.kings.kmvkeypad.Init.KMVkeyPopupView
import com.sablue.sotwo.R

class SecurityKeypadView(context: Context, maxInputLength: Int) : PlatformView, SecurityKeypadHostApi {
    private val view : View = View.inflate(context, R.layout.activity_keypad_test, null)
    private val keypad: KMVkeyPopupView
    private var currentLength: Int = 0

    override fun getView(): View? {
        return view
    }

    override fun dispose() {
        SecurityKeypadHostApi.setUp(MainActivity.flutterEngine!!.dartExecutor.binaryMessenger,null)
    }

    init {
        SecurityKeypadHostApi.setUp(MainActivity.flutterEngine!!.dartExecutor.binaryMessenger, this)

        keypad = KMVkeyPopupView(context, view, 0)
        keypad.showPopup(false)
        keypad.setInputBar(false, false, "", "")

        keypad.KMVCreatePopNumPad(maxInputLength, onInput@{ result ->
            // '확인' 버튼 탭
            if (result == 1004) {
                keypad.endKMVNumpad()
            }
            // 숫자 입력 시, {maxInputLength}개 까지 입력 가능 (result: 입력 문자 길이)
            else if (result < 1000) {
                currentLength = result
                SecurityKeypadFlutterApiImplementation.onInputLengthChanged(currentLength.toLong())
                if (currentLength >= maxInputLength) {
                   keypad.endKMVNumpad()
                }
            }
            // 아래 코드에 대한 처리는 하지 않음
            // 1005 : 3자리 이상 동일한 숫자 입력
            // 1006 : 3자리 이상 연속숫자 입력(정방향)
            // 1007 : 3자리 이상 연속숫자 입력(역방향)
        }, false)

        // 네이티브 수준 포커스 해제 시
        keypad.SetFocusoutCallback {
            SecurityKeypadFlutterApiImplementation.onHostFocusLost()
        }

        // 키패드가 사라질 때 호출
        keypad.SetHideCallback {
            onInputCompleted()
        }
    }

    override fun hide() {
        keypad.endKMVNumpad()
    }

    private fun onInputCompleted() {
        val input = String(keypad.KMVGetDecByteString(currentLength))
        val encryptedInput = keypad.KMVGetEncString(input)
        SecurityKeypadFlutterApiImplementation.onInputCompleted(encryptedInput)
    }
}
