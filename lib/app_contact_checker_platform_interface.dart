import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'app_contact_checker_method_channel.dart';

abstract class AppContactCheckerPlatform extends PlatformInterface {
  /// Constructs a AppContactCheckerPlatform.
  AppContactCheckerPlatform() : super(token: _token);

  static final Object _token = Object();

  static AppContactCheckerPlatform _instance = MethodChannelAppContactChecker();

  /// The default instance of [AppContactCheckerPlatform] to use.
  ///
  /// Defaults to [MethodChannelAppContactChecker].
  static AppContactCheckerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AppContactCheckerPlatform] when
  /// they register themselves.
  static set instance(AppContactCheckerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Checks if a contact is on Telegram.
  Future<bool> isOnTelegram(String phone) {
    throw UnimplementedError(
      'isOnTelegram(String phone) has not been implemented.',
    );
  }

  /// Checks if a contact is on WhatsApp.
  Future<bool> isOnWhatsApp(String phone) {
    throw UnimplementedError(
      'isOnWhatsApp(String phone) has not been implemented.',
    );
  }

  /// Checks if a contact is on WhatsApp Business.
  Future<bool> isOnWhatsAppBusiness(String phone) {
    throw UnimplementedError(
      'isOnWhatsAppBusiness(String phone) has not been implemented.',
    );
  }
}
