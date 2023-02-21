import 'package:contact_permission_platform_interface/contact_permission_platform_interface.dart';

ContactPermissionPlatform get _platform => ContactPermissionPlatform.instance;

/// Returns the name of the current platform.
Future<String> getPlatformName() async {
  final platformName = await _platform.getPlatformName();
  if (platformName == null) throw Exception('Unable to get platform name.');
  return platformName;
}
