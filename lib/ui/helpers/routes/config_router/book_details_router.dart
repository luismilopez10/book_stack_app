import 'package:flutter/material.dart';

import '../widgets_routes/book_details_routes.dart';

class BookDetailsRouter {
  static const String bookDetailsRouteName = '/bookDetails';

  static const Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    bookDetailsRouteName: BookDetailsRoutes.getBookDetailsPage,
  };
}
