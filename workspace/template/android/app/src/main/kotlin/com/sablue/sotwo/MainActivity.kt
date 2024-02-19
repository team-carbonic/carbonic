package com.sablue.sotwo

import com.sablue.sotwo.core.security.VguardHandler
import com.sablue.sotwo.security_keypad.SecurityKeypadFlutterApiImplementation
import com.sablue.sotwo.security_keypad.SecurityKeypadViewFactory
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterFragmentActivity() {
    companion object {
        var flutterEngine: FlutterEngine? = null
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MainActivity.flutterEngine = flutterEngine
        VguardHandler.setMethodChannel(applicationContext, flutterEngine)
        flutterEngine.platformViewsController.registry.registerViewFactory(
            "password",
            SecurityKeypadViewFactory()
        )
        flutterEngine.platformViewsController.registry.registerViewFactory(
            "residentNumber",
            SecurityKeypadViewFactory()
        )
        SecurityKeypadFlutterApiImplementation.initialize()
    }
}