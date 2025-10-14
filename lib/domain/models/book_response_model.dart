import 'package:book_stack_widget/domain/models/models.dart';

class BookResponseModel {
  const BookResponseModel({
    required this.error,
    required this.total,
    required this.page,
    required this.books,
  });

  final String error;
  final String total;
  final String page;
  final List<BookModel> books;
}
