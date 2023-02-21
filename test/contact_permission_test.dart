import 'package:flutter_test/flutter_test.dart';
import 'package:contact_permission/contact_permission.dart';
import 'package:contact_permission/contact_permission_platform_interface.dart';
import 'package:contact_permission/contact_permission_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockContactPermissionPlatform
    with MockPlatformInterfaceMixin
    implements ContactPermissionPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ContactPermissionPlatform initialPlatform = ContactPermissionPlatform.instance;

  test('$MethodChannelContactPermission is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelContactPermission>());
  });

  test('getPlatformVersion', () async {
    ContactPermission contactPermissionPlugin = ContactPermission();
    MockContactPermissionPlatform fakePlatform = MockContactPermissionPlatform();
    ContactPermissionPlatform.instance = fakePlatform;

    expect(await contactPermissionPlugin.getPlatformVersion(), '42');
  });
}
