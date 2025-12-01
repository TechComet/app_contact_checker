import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:app_contact_checker/app_contact_checker.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  WakelockPlus.enable();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _whatsAppChecker = false;
  bool _whatsAppBusinessChecker = false;
  bool _telegramChecker = false;
  String? _phoneNumber;
  final _appContactCheckerPlugin = AppContactChecker();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('WhatsApp: $_whatsAppChecker\n'),
              Text('WhatsApp Business: $_whatsAppBusinessChecker\n'),
              Text('Telegram: $_telegramChecker\n'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), hint: Text('+970505123456')),
                  keyboardType: TextInputType.phone,
                  onSubmitted: _checkPhone,
                  onChanged: (phoneNumber) => _phoneNumber = phoneNumber,
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  _checkPhone(_phoneNumber ?? '');
                },
                child: Text('Check'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _checkPhone(String phoneNumber) async {
    _whatsAppChecker = await _appContactCheckerPlugin.isOnWhatsApp(phoneNumber);
    _whatsAppBusinessChecker = await _appContactCheckerPlugin
        .isOnWhatsAppBusiness(phoneNumber);
    _telegramChecker = await _appContactCheckerPlugin.isOnTelegram(phoneNumber);
    setState(() {});
  }
}
