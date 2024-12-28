library navigation_listener;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:navigation_listener/app_router.dart';
import 'package:navigation_listener/navigation_notification.dart';
import 'package:navigation_listener/navigation_route.dart';

class NavigationListener<S extends AppRouter, T extends NavigationRoute> extends StatelessWidget {
  const NavigationListener({
    super.key,
    required this.child,
    required S appRouter,
    bool Function(
      NavigateToNotification<T> notification,
      S router,
    )? onNavigateTo,
  })  : _appRouter = appRouter,
        _onNavigateTo = onNavigateTo;

  final Widget child;
  final S _appRouter;
  final bool Function(
    NavigateToNotification<T> notification,
    S router,
  )? _onNavigateTo;

  @override
  Widget build(context) {
    return NotificationListener<NavigateNotification<T>>(
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
