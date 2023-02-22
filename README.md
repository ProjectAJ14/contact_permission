[![](https://img.shields.io/badge/build-1.0.0-brightgreen)](https://github.com/ProjectAj14/contact_permission)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

# contact_permission

A plugin for Flutter that requests and verifies contact permissions.

> Why this package?
> 
> Integrating Flutter Frameworks into the Android and iOS "add-to-app" 
> scenario can pose its own set of challenges. In one instance, when 
> attempting to integrate the permission_handler, we mistakenly added 
> `GCC_PREPROCESSOR_DEFINITIONS` flags to the root project instead of 
> within the module package. After numerous hours of researching the 
> issue, it became evident that this approach was not effective. 
> As a result, we had to relocate the flags to the Flutter Module 
> Podfile, which should not have been committed in the first place. 
> However, even after this adjustment, we discovered that the 
> Android permission was still not functioning correctly 
> on many devices. 
>This predicament led to the development of this package.

## Let's get started

1. Go to `pubspec.yaml`
2. add a contact_permission and replace `[version]` with the latest version:

```yaml
dependencies:
  flutter:
    sdk: flutter
  contact_permission: ^[version]
```
3. click the packages get button or *flutter pub get*

## Import the package

```dart
import 'package:contact_permission/contact_permission.dart';
```

##Check if permission is granted or not

```dart
...

 onTap: () async {
        if (await ContactPermission.isPermissionGranted) {
          showSnackBar(
            _scaffoldKey,
            title: "Contact Permission Granted",
            color: Colors.green,
          );
        } else {
          showSnackBar(
            _scaffoldKey,
            title: "Contact Permission Not Granted",
          );
        }
      },

...

```

##Request permission

```dart
...

 onTap: () async {
        if (await ContactPermission.requestPermission) {
          showSnackBar(
            _scaffoldKey,
            title: "Contact Permission Granted",
            color: Colors.green,
          );
        } else {
          showSnackBar(
            _scaffoldKey,
            title: "Contact Permission Not Granted",
          );
        }
      },
```      



## Contributing

There are couple of ways in which you can contribute.
- Propose any feature, enhancement
- Report a bug
- Fix a bug
- Participate in a discussion and help in decision making
- Write and improve some **documentation**. Documentation is super critical and its importance
  cannot be overstated!
- Send in a Pull Request :-)



<br>
<div align="center" >
  <p>Thanks to all contributors of this package</p>
  <a href="https://github.com/ProjectAJ14/contact_permission/graphs/contributors">
    <img src="https://contrib.rocks/image?repo=ProjectAJ14/contact_permission" />
  </a>
</div>
<br>