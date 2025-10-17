import 'package:book_stack_design_system/book_stack_design_system.dart';
import 'package:book_stack_widget/book_stack_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../infrastructure/driven_adapters/repository/books_api.dart';
import '../../../../infrastructure/enums/navigation_type.dart';
import '../../../../infrastructure/extensions/navigation_extension.dart';
import '../config_router/home_router.dart';
import 'book_details_routes.dart';

class HomeRoutes {
  static HomePage getHomePage(BuildContext context) {
    final Map<String, dynamic> homeLanguage = <String, dynamic>{
      'appBarTitle': 'Book Stack',
      'placeHolderPath': 'assets/images/loading_books.gif',
      'imageNotFoundPath': 'assets/images/book_image_not_found.png',
    };

    final Map<String, dynamic> searchLanguage = <String, dynamic>{
      'searchLabel': 'Buscar libro',
      'emptySearchText': 'No hay resultados para la búsqueda',
      'placeHolderPath': 'assets/images/loading_books.gif',
      'imageNotFoundPath': 'assets/images/book_image_not_found.png',
    };

    final Map<String, dynamic> overlayFilterLanguage = <String, dynamic>{
      'title': 'Ordenar por precio',
      'sortPriceAscendingLabel': 'menor a mayor',
      'sortPriceDescendingLabel': 'mayor a menor',
    };

    return HomePage(
      args: HomeArgs(
        config: BooksConfig(bookGateway: BooksApi(context)),
        language: homeLanguage,
        midRightAppBarIcon: Icons.filter_list_outlined,
        onMidRightAppBarPressed: () => _onMidRightAppBarPressed(
          context,
          title: overlayFilterLanguage['title']!,
          sortPriceAscendingLabel:
              overlayFilterLanguage['sortPriceAscendingLabel']!,
          sortPriceDescendingLabel:
              overlayFilterLanguage['sortPriceDescendingLabel']!,
        ),
        rightAppBarIcon: Icons.search,
        onRightAppBarPressed: () => showSearch(
          context: context,
          delegate: BsSearchDelegate(
            args: SearchArgs(
              config: BooksConfig(bookGateway: BooksApi(context)),
              language: searchLanguage,
              onSelectBook: (BookModel book) => _onSelectBook(context, book),
            ),
          ),
        ),
        onBookCardPressed: (BookModel book) => _onSelectBook(context, book),
      ),
    );
  }

  static void showHomePage(
    BuildContext context, {
    NavigationType navigationType = NavigationType.push,
  }) {
    context.navigateTo(
      HomeRouter.homeRouteName,
      navigationType: navigationType,
    );
  }

  static void _onSelectBook(BuildContext context, BookModel book) {
    final BooksNotifier booksNotifier = context.read<BooksNotifier>();
    booksNotifier.selectedBook = book;

    BookDetailsRoutes.showBookDetailsPage(context);
  }

  static Future<void> _onMidRightAppBarPressed(
    BuildContext context, {
    required String title,
    required String sortPriceAscendingLabel,
    required String sortPriceDescendingLabel,
  }) async {
    await showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 3.0,
                width: 50,
                margin: const EdgeInsets.only(
                  top: BsSpacing.SPACE_MEDIUM,
                  bottom: BsSpacing.SPACE_MEDIUM,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: BsColors.NEUTRAL_02,
                ),
              ),
              BsText(title, style: BsTypography.HEADER_2),
              const SizedBox(height: BsSpacing.SPACE_MEDIUM),
              ListTile(
                leading: const Icon(Icons.arrow_drop_up),
                title: BsText(sortPriceAscendingLabel),
                onTap: () {
                  context.read<BooksNotifier>().sortBooksByPrice(
                    filter: BookFilters.ascending,
                  );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.arrow_drop_down),
                title: BsText(sortPriceDescendingLabel),
                onTap: () {
                  context.read<BooksNotifier>().sortBooksByPrice(
                    filter: BookFilters.descending,
                  );
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: BsSpacing.SPACE_MEDIUM),
            ],
          ),
        );
      },
    );
  }
}
