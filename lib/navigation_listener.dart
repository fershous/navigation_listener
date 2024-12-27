import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:navigation_listener/app_router.dart';
import 'package:navigation_listener/navigation_notification.dart';

typedef OnNavigateTo = bool Function(NavigateToNotification notification, AppRouter router);

class NavigationListener<T extends NavigateNotification> extends StatelessWidget {
  const NavigationListener({
    super.key,
    required this.child,
    required AppRouter appRouter,
    OnNavigateTo? onNavigateTo,
  })  : _appRouter = appRouter,
        _onNavigateTo = onNavigateTo;

  final Widget child;
  final AppRouter _appRouter;
  final OnNavigateTo? _onNavigateTo;

  @override
  Widget build(context) {
    return NotificationListener<T>(
      child: child,
      onNotification: (notification) {
        return switch (notification) {
          NavigateToNotification() => _onNavigateTo == null
              ? _defaultOnNavigateTo(notification, _appRouter)
              : _onNavigateTo(
                  notification,
                  _appRouter,
                ),
          NavigateBackNotification() => _onNavigateBack(notification, _appRouter),
        };
      },
    );
  }

  bool _defaultOnNavigateTo(
    NavigateToNotification notification,
    AppRouter router,
  ) {
    if (kDebugMode) {
      print('Navigating to ${notification.route}...');
    }
    router.navigate(notification.route);
    return true;
  }

  bool _onNavigateBack(
    NavigateBackNotification notification,
    AppRouter router,
  ) {
    if (kDebugMode) {
      print('Navigating back...');
    }
    router.back();
    return true;
  }
}
