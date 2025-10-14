import 'package:book_stack_widget/ui/home/providers/books_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../theme/theme_notifier.dart';
import '../../utils/constants/environment.dart';

class AllProviders {
  static List<SingleChildWidget> getAllProviders({
    required Environment env,
    required ThemeNotifier themeNotifier,
  }) {
    return <SingleChildWidget>[
      ChangeNotifierProvider<BooksNotifier>(
        create: (_) => BooksNotifier(),
        lazy: false,
      ),
      ChangeNotifierProvider<ThemeNotifier>(
        create: (BuildContext context) => themeNotifier,
      ),
    ];
  }
}
