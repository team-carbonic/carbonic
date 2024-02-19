package com.sablue.sotwo.security_keypad

import android.content.Context
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory
import java.lang.Exception

class SecurityKeypadViewFactory : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        val creationParams = args as Map<String?, Any?>
        val maxInputLength = when(creationParams["viewType"] as String) {
            // TODO : Flutter로부터 전달받도록 수정
            "password" -> 4
            "residentNumber" -> 13
            else -> throw Exception("Wrong viewType")
        }
        return SecurityKeypadView(context, maxInputLength)
    }
}