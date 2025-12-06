# app_contact_checker

## Important Notes

*   **Platform-Specific Behavior:**
    *   On **Android**, the plugin checks if a specific phone number is actually registered with the corresponding app (e.g., WhatsApp, Telegram).
    *   On **iOS**, due to privacy restrictions, the plugin only checks if the corresponding app is installed. It does not check for the presence of a specific contact.

*   **Testing:** This plugin has been tested on Android only. The iOS implementation is provided but has not yet been tested.

## Getting Started

```dart
String phoneNumber = "+970591234567";

final _appContactCheckerPlugin = AppContactChecker();

_whatsAppChecker = await _appContactCheckerPlugin.isOnWhatsApp(phoneNumber);

_whatsAppBusinessChecker = await _appContactCheckerPlugin
.isOnWhatsAppBusiness(phoneNumber);

_telegramChecker = await _appContactCheckerPlugin.isOnTelegram(phoneNumber);
```
