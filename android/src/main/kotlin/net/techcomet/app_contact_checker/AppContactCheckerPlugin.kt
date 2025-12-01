package net.techcomet.app_contact_checker

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** AppContactCheckerPlugin */
class AppContactCheckerPlugin :
    FlutterPlugin,
    MethodCallHandler {
    // The MethodChannel that will the communication between Flutter and native Android
    //
    // This local reference serves to register the plugin with the Flutter Engine and unregister it
    // when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var contentResolver: android.content.ContentResolver

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "app_contact_checker")
        contentResolver = flutterPluginBinding.applicationContext.contentResolver
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(
        call: MethodCall,
        result: Result
    ) {
        val phone = call.argument<String>("phone") ?: ""
        val checker = ContactDirectoryChecker(contentResolver)
        when (call.method) {
            "isOnWhatsApp" ->
                result.success(checker.isContactInApp(phone, "com.whatsapp"))

            "isOnWhatsAppBusiness" ->
                result.success(checker.isContactInApp(phone, "com.whatsapp.w4b"))

            "isOnTelegram" ->
                result.success(checker.isContactInApp(phone, "org.telegram.messenger"))

            else -> result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
