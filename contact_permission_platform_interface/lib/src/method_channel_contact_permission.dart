import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:flutter/services.dart';
import 'package:contact_permission_platform_interface/contact_permission_platform_interface.dart';

/// An implementation of [ContactPermissionPlatform] that uses method channels.
class MethodChannelContactPermission extends ContactPermissionPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('contact_permission');

  @override
  Future<String?> getPlatformName() {
    return methodChannel.invokeMethod<String>('getPlatformName');
  }
}
