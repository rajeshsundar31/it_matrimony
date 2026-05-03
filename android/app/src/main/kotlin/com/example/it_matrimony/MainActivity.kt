package com.example.it_matrimony

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private val CHANNEL = "channel-name" // Same as Dart channel name

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->

            when (call.method) {

                "getBatteryLevel" -> {
                    val battery = getBatteryLevel()
                    result.success(battery)
                }

                else -> result.notImplemented()
            }
        }
    }

    private fun getBatteryLevel(): Int {
        return 90 // example
    }
}
