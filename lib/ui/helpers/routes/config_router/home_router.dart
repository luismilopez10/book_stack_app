import 'package:flutter/material.dart';

import '../widgets_routes/home_routes.dart';

class HomeRouter {
  static const String homeRouteName = '/home';

  static const Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    homeRouteName: HomeRoutes.getHomePage,
  };
}
