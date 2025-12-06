package net.techcomet.app_contact_checker

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext

/** AppContactCheckerPlugin */
class AppContactCheckerPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel
    private lateinit var contentResolver: android.content.ContentResolver
    private val scope = CoroutineScope(Dispatchers.Main + SupervisorJob())

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "app_contact_checker")
        contentResolver = flutterPluginBinding.applicationContext.contentResolver
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        val phone = call.argument<String>("phone") ?: ""
        val checker = ContactDirectoryChecker(contentResolver)

        scope.launch(Dispatchers.IO) {
            try {
                val isInApp = when (call.method) {
                    "isOnWhatsApp" -> checker.isContactInApp(phone, "com.whatsapp")
                    "isOnWhatsAppBusiness" -> checker.isContactInApp(phone, "com.whatsapp.w4b")
                    "isOnTelegram" -> checker.isContactInApp(phone, "org.telegram.messenger")
                    else -> {
                        withContext(Dispatchers.Main) { result.notImplemented() }
                        return@launch
                    }
                }
                withContext(Dispatchers.Main) { result.success(isInApp) }
            } catch (e: Exception) {
                withContext(Dispatchers.Main) { result.error("Error", e.message, null) }
            }
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}