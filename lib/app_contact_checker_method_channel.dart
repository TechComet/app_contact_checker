import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

import 'app_contact_checker_platform_interface.dart';

/// An implementation of [AppContactCheckerPlatform] that uses method channels.
class MethodChannelAppContactChecker extends AppContactCheckerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('app_contact_checker');

  Future<bool> _check(String method, String phone) async {
    if (!(await Permission.contacts.request()).isGranted) return false;
    try {
      return await methodChannel.invokeMethod(method, {'phone': phone}) ??
          false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<bool> isOnWhatsApp(String phone) => _check('isOnWhatsApp', phone);

  @override
  Future<bool> isOnWhatsAppBusiness(String phone) =>
      _check('isOnWhatsAppBusiness', phone);

  @override
  Future<bool> isOnTelegram(String phone) => _check('isOnWhatsApp', phone);
}
