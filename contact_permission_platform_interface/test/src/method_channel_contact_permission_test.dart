import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:contact_permission_platform_interface/src/method_channel_contact_permission.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const kPlatformName = 'platformName';

  group('$MethodChannelContactPermission', () {
    late MethodChannelContactPermission methodChannelContactPermission;
    final log = <MethodCall>[];

    setUp(() async {
      methodChannelContactPermission = MethodChannelContactPermission()
        ..methodChannel.setMockMethodCallHandler((MethodCall methodCall) async {
          log.add(methodCall);
          switch (methodCall.method) {
            case 'getPlatformName':
              return kPlatformName;
            default:
              return null;
          }
        });
    });

    tearDown(log.clear);

    test('getPlatformName', () async {
      final platformName = await methodChannelContactPermission.getPlatformName();
      expect(
        log,
        <Matcher>[isMethodCall('getPlatformName', arguments: null)],
      );
      expect(platformName, equals(kPlatformName));
    });
  });
}
