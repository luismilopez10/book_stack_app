import 'package:book_stack_widget/ui/home/providers/books_notifier.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../utils/config/app_config.dart';

abstract class BaseApiClient {
  BaseApiClient(this.context, {BooksNotifier? booksNotifier})
    : appConfig = AppConfig.of(context),
      booksNotifier = booksNotifier ?? context.read<BooksNotifier>();

  final BuildContext context;
  final AppConfig appConfig;
  final BooksNotifier booksNotifier;
}
