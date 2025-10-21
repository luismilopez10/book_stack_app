import 'package:book_stack_widget/book_stack_widget.dart';
import 'package:flutter/material.dart';

import '../../../../infrastructure/enums/navigation_type.dart';
import '../../../../infrastructure/extensions/navigation_extension.dart';
import '../config_router/book_details_router.dart';

class BookDetailsRoutes {
  static BookDetailsPage getBookDetailsPage(BuildContext context) {
    final Map<String, dynamic> bookDetailsLanguage = <String, dynamic>{
      'appBarTitle': 'Detalles',
      'isbn13Label': 'Isbn13:',
      'priceLabel': 'Price:',
      'urlLabel': 'Url:',
      'placeHolderPath': 'assets/images/loading_books.gif',
      'imageNotFoundPath': 'assets/images/book_image_not_found.png',
    };

    return BookDetailsPage(
      args: BookDetailsArgs(
        language: bookDetailsLanguage,
        leftAppBarIcon: Icons.chevron_left,
        onLeftAppBarPressed: () => Navigator.pop(context),
      ),
    );
  }

  static void showBookDetailsPage(
    BuildContext context, {
    NavigationType navigationType = NavigationType.push,
  }) {
    context.navigateTo(
      BookDetailsRouter.bookDetailsRouteName,
      navigationType: navigationType,
    );
  }
}
