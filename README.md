# app_contact_checker

## Getting Started

```
final _appContactCheckerPlugin = AppContactChecker();

_whatsAppChecker = await _appContactCheckerPlugin.isOnWhatsApp(phoneNumber);

_whatsAppBusinessChecker = await _appContactCheckerPlugin
.isOnWhatsAppBusiness(phoneNumber);

_telegramChecker = await _appContactCheckerPlugin.isOnTelegram(phoneNumber);
```

