library navigation_listener;

import 'package:flutter/material.dart';
import 'package:navigation_listener/navigation_route.dart';

sealed class NavigateNotification<T extends NavigationRoute> extends Notification {
  const NavigateNotification();
}

final class NavigateToNotification<T extends NavigationRoute> extends NavigateNotification<T> {
  const NavigateToNotification({
    required this.route,
  });

  final T route;
}

final class NavigateBackNotification<T extends NavigationRoute> extends NavigateNotification<T> {
  const NavigateBackNotification();
}
