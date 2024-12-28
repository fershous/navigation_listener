library navigation_listener;

import 'dart:async';
import 'package:navigation_listener/navigation_route.dart';

abstract class AppRouter<T extends NavigationRoute> {
  const AppRouter();

  FutureOr<void> navigate(T route);
  FutureOr<void> replaceAll(List<T> routes);
  void back();
}