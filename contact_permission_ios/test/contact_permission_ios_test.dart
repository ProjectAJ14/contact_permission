import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:contact_permission_ios/contact_permission_ios.dart';
import 'package:contact_permission_platform_interface/contact_permission_platform_interface.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ContactPermissionIOS', () {
    const kPlatformName = 'iOS';
    late ContactPermissionIOS contactPermission;
    late List<MethodCall> log;

    setUp(() async {
      contactPermission = ContactPermissionIOS();

      log = <MethodCall>[];
      TestDefaultBinaryMessengerBinding.instance!.defaultBinaryMessenger
          .setMockMethodCallHandler(contactPermission.methodChannel, (methodCall) async {
        log.add(methodCall);
        switch (methodCall.method) {
          case 'getPlatformName':
            return kPlatformName;
          default:
            return null;
        }
      });
    });

    test('can be registered', () {
      ContactPermissionIOS.registerWith();
      expect(ContactPermissionPlatform.instance, isA<ContactPermissionIOS>());
    });

    test('getPlatformName returns correct name', () async {
      final name = await contactPermission.getPlatformName();
      expect(
        log,
        <Matcher>[isMethodCall('getPlatformName', arguments: null)],
      );
      expect(name, equals(kPlatformName));
    });
  });
}
