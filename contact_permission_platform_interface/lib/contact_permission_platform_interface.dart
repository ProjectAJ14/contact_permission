import 'package:contact_permission_platform_interface/src/method_channel_contact_permission.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// The interface that implementations of contact_permission must implement.
///
/// Platform implementations should extend this class
/// rather than implement it as `ContactPermission`.
/// Extending this class (using `extends`) ensures that the subclass will get
/// the default implementation, while platform implementations that `implements`
///  this interface will be broken by newly added [ContactPermissionPlatform] methods.
abstract class ContactPermissionPlatform extends PlatformInterface {
  /// Constructs a ContactPermissionPlatform.
  ContactPermissionPlatform() : super(token: _token);

  static final Object _token = Object();

  static ContactPermissionPlatform _instance = MethodChannelContactPermission();

  /// The default instance of [ContactPermissionPlatform] to use.
  ///
  /// Defaults to [MethodChannelContactPermission].
  static ContactPermissionPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [ContactPermissionPlatform] when they register themselves.
  static set instance(ContactPermissionPlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// Return the current platform name.
  Future<String?> getPlatformName();
}
