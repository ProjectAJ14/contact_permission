import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:contact_permission_platform_interface/contact_permission_platform_interface.dart';

/// The iOS implementation of [ContactPermissionPlatform].
class ContactPermissionIOS extends ContactPermissionPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('contact_permission_ios');

  /// Registers this class as the default instance of [ContactPermissionPlatform]
  static void registerWith() {
    ContactPermissionPlatform.instance = ContactPermissionIOS();
  }

  @override
  Future<String?> getPlatformName() {
    return methodChannel.invokeMethod<String>('getPlatformName');
  }
}
