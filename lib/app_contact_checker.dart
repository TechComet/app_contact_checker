import 'app_contact_checker_platform_interface.dart';

class AppContactChecker {
  Future<bool> isOnTelegram(String phone) {
    return AppContactCheckerPlatform.instance.isOnTelegram(phone);
  }

  Future<bool> isOnWhatsApp(String phone) {
    return AppContactCheckerPlatform.instance.isOnWhatsApp(phone);
  }

  Future<bool> isOnWhatsAppBusiness(String phone) {
    return AppContactCheckerPlatform.instance.isOnWhatsAppBusiness(phone);
  }
}
