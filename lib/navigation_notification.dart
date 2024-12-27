import 'package:flutter/material.dart';
import 'package:navigation_listener/navigation_route.dart';

sealed class NavigateNotification extends Notification {
  const NavigateNotification();
}

final class NavigateToNotification extends NavigateNotification {
  const NavigateToNotification({
    required this.route,
  });

  final NavigationRoute route;
}

final class NavigateBackNotification extends NavigateNotification {
  const NavigateBackNotification();
}
