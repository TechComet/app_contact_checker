## 0.0.3

* Reordered methods in Dart files for better readability.
* Added documentation comments to the platform interface methods.
* Improved error logging in the method channel.
* **Breaking change:** Migrated Android implementation to use Kotlin Coroutines for non-blocking UI.
* Fixed a critical bug where `isOnTelegram` was incorrectly checking for WhatsApp.
* Added a check for blank phone numbers on Android to prevent crashes.
* Improved contact permission handling logic.

## 0.0.2
* Update README.md


## 0.0.1

* Initial release of the plugin, with support for checking contacts on WhatsApp, WhatsApp Business, and Telegram.
* Updated license to "Unlicense".
* Added a usage example to the `README.md`.
