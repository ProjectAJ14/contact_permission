import 'package:flutter_test/flutter_test.dart';
import 'package:contact_permission_platform_interface/contact_permission_platform_interface.dart';

class ContactPermissionMock extends ContactPermissionPlatform {
  static const mockPlatformName = 'Mock';

  @override
  Future<String?> getPlatformName() async => mockPlatformName;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('ContactPermissionPlatformInterface', () {
    late ContactPermissionPlatform contactPermissionPlatform;

    setUp(() {
      contactPermissionPlatform = ContactPermissionMock();
      ContactPermissionPlatform.instance = contactPermissionPlatform;
    });

    group('getPlatformName', () {
      test('returns correct name', () async {
        expect(
          await ContactPermissionPlatform.instance.getPlatformName(),
          equals(ContactPermissionMock.mockPlatformName),
        );
      });
    });
  });
}
