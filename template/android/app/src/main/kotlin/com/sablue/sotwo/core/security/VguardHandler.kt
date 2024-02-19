package com.sablue.sotwo.core.security
import android.content.Context
import com.google.gson.Gson
import com.polarisoffice.vguardsecuone.interfaces.VGsecuOneCtl
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class VguardHandler {
    companion object {
        private const val METHOD_CHANNEL = "com.sablue.sotwo.vguard"
        private lateinit var methodChannel: MethodChannel

        fun setMethodChannel(
            applicationContext: Context,
            flutterEngine: FlutterEngine,
        ) {
            methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, METHOD_CHANNEL)

            methodChannel.setMethodCallHandler { call, result ->
                when (call.method) {
                    "start" -> {
                        result.success(start(applicationContext))
                        registerListeners()
                    }
                    "isRunning" -> {
                        result.success(isRunning(applicationContext))
                    }
                    else -> result.notImplemented()
                }
            }
        }

        private fun start(applicationContext: Context): Int {
            return VGsecuOneCtl.getInstance().startVGuard(applicationContext)
        }

        private fun isRunning(applicationContext: Context): Boolean {
            return VGsecuOneCtl.getInstance().isVGuardsecuOneRunning(applicationContext)
        }

        private fun registerListeners() {
            // V-Guard secuOne에서 악성 앱이 진단되었을 경우, 해당 정보를 전달 받을 수 있는 MalwareDetectedListener의 등록 Method
            VGsecuOneCtl.getInstance().registerMalwareDetectedListener { list ->
                methodChannel.invokeMethod("onMalwareDetected", Gson().toJson(list))
            }

            // V-Guard secuOne에서 루팅을 탐지하였을 경우, 해당 정보를 전달 받을 수 있는 RootingDetectedListener의 등록 Method
            VGsecuOneCtl.getInstance().registerRootingDetectedListener {
                    rootingData ->
                methodChannel.invokeMethod("onRootingDetected", Gson().toJson(rootingData))
            }

            // V-Guard secuOne에서 원격제어 앱을 탐지하였을 경우, 해당 정보를 전달 받을 수 있는 RemotewareDetectedListener의 등록 Method
            VGsecuOneCtl.getInstance().registerRemoteWareDetectedListener { list ->
                methodChannel.invokeMethod("onRemoteWareDetected", Gson().toJson(list))
            }
        }
    }
}
