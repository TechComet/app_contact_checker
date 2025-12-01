// import 'package:flutter_test/flutter_test.dart';
// import 'package:app_contact_checker/app_contact_checker.dart';
// import 'package:app_contact_checker/app_contact_checker_platform_interface.dart';
// import 'package:app_contact_checker/app_contact_checker_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';
//
// class MockAppContactCheckerPlatform
//     with MockPlatformInterfaceMixin
//     implements AppContactCheckerPlatform {
//
//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }
//
// void main() {
//   final AppContactCheckerPlatform initialPlatform = AppContactCheckerPlatform.instance;
//
//   test('$MethodChannelAppContactChecker is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelAppContactChecker>());
//   });
//
//   test('getPlatformVersion', () async {
//     AppContactChecker appContactCheckerPlugin = AppContactChecker();
//     MockAppContactCheckerPlatform fakePlatform = MockAppContactCheckerPlatform();
//     AppContactCheckerPlatform.instance = fakePlatform;
//
//     expect(await appContactCheckerPlugin.getPlatformVersion(), '42');
//   });
// }
