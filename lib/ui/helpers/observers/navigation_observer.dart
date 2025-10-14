import 'package:flutter/widgets.dart';

class NavigationObserver extends NavigatorObserver {
  NavigationObserver(this.context);

  final BuildContext context;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (route is PageRoute) {
      _reportNavigation(route.settings.name);
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is PageRoute) {
      _reportNavigation(newRoute.settings.name);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute is PageRoute) {
      _reportNavigation(previousRoute.settings.name);
    }
  }

  void _reportNavigation(String? routeName) {
    debugPrint('Navegó a $routeName');
  }
}
