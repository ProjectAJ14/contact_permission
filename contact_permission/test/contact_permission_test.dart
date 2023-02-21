import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:contact_permission/contact_permission.dart';
import 'package:contact_permission_platform_interface/contact_permission_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockContactPermissionPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements ContactPermissionPlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ContactPermission', () {
    late ContactPermissionPlatform contactPermissionPlatform;

    setUp(() {
      contactPermissionPlatform = MockContactPermissionPlatform();
      ContactPermissionPlatform.instance = contactPermissionPlatform;
    });

    group('getPlatformName', () {
      test('returns correct name when platform implementation exists',
          () async {
        const platformName = '__test_platform__';
        when(
          () => contactPermissionPlatform.getPlatformName(),
        ).thenAnswer((_) async => platformName);

        final actualPlatformName = await getPlatformName();
        expect(actualPlatformName, equals(platformName));
      });

      test('throws exception when platform implementation is missing',
          () async {
        when(
          () => contactPermissionPlatform.getPlatformName(),
        ).thenAnswer((_) async => null);

        expect(getPlatformName, throwsException);
      });
    });
  });
}
