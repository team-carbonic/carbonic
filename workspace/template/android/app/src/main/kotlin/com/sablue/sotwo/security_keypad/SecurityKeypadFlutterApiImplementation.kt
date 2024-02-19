package com.sablue.sotwo.security_keypad

import SecurityKeypadFlutterApi
import com.sablue.sotwo.MainActivity

class SecurityKeypadFlutterApiImplementation {
    companion object {
        private var flutterApi: SecurityKeypadFlutterApi? = null

        fun initialize() {
            flutterApi = SecurityKeypadFlutterApi(MainActivity.flutterEngine!!.dartExecutor.binaryMessenger)
        }

        fun onHostFocusLost() {
            flutterApi?.onHostFocusLost() {}
        }

        fun onInputLengthChanged(length: Long) {
            flutterApi?.onInputLengthChanged(length) {}
        }

        fun onInputCompleted(encryptedInput: String?) {
            flutterApi?.onInputCompleted(encryptedInput) {}
        }
    }
}