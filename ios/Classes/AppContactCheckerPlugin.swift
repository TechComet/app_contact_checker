import Flutter
import UIKit

public class AppContactCheckerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "app_contact_checker", binaryMessenger: registrar.messenger())
    let instance = AppContactCheckerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    // The 'phone' argument is received but not used on iOS, as we can only check
    // if the application is installed, not if a specific contact exists.
    // This is a platform limitation. We keep the argument for API consistency with Android.
    guard call.arguments is [String: Any] else {
        result(FlutterError(code: "INVALID_ARGUMENTS", message: "Arguments are not a map", details: nil))
        return
    }

    let urlScheme: String
    switch call.method {
    case "isOnWhatsApp":
      urlScheme = "whatsapp://"
    case "isOnWhatsAppBusiness":
      urlScheme = "whatsappbusiness://"
    case "isOnTelegram":
      urlScheme = "tg://"
    default:
      result(FlutterMethodNotImplemented)
      return
    }

    if let url = URL(string: urlScheme) {
        result(UIApplication.shared.canOpenURL(url))
    } else {
        result(false) // Should not happen with hardcoded schemes
    }
  }
}
