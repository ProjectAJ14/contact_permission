
import 'contact_permission_platform_interface.dart';

class ContactPermission {
  Future<String?> getPlatformVersion() {
    return ContactPermissionPlatform.instance.getPlatformVersion();
  }
}
