import 'package:flutter/widgets.dart';

import 'config_router/book_details_router.dart';
import 'config_router/home_router.dart';

class AppRouter {
  static Map<String, WidgetBuilder> getAllRoutes() {
    final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
      ...HomeRouter.routes,
      ...BookDetailsRouter.routes,
    };

    return _updateSessionContext(routes);
  }

  static Map<String, WidgetBuilder> _updateSessionContext(
    Map<String, WidgetBuilder> routes,
  ) {
    return routes.map<String, WidgetBuilder>((
      String routeName,
      WidgetBuilder builder,
    ) {
      return MapEntry<String, WidgetBuilder>(routeName, (BuildContext context) {
        return builder(context);
      });
    });
  }
}
