<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

A wrapper that decouples navigation from the UI using Flutter's Notification system.

## Features

Decouples any navigating library, allowing to use any Router you want.

## Getting started

To use this plugin, add navigation_listener as a dependency in your pubspec.yaml file.

dependencies:
  navigation_listener: ^lastVersion

## Usage

Configure your main app to use MaterialApp.router and use the builder function to wrap the child application with a NavigationListener.

```dart
MaterialApp.router(
    builder: (context, child) => NavigationListener(child: child!,),
);
```

## Additional information

Feel free to open a PR with any feature you think it could be added.
