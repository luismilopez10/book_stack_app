import 'package:book_stack_widget/domain/mappers/mappers.dart';
import '../models/book_response_model.dart';

class BookResponseMapper {
  static BookResponseModel fromMap(Map<String, dynamic> response) {
    final List<Map<String, dynamic>> books =
        (response['books'] as List<dynamic>? ?? <Map<String, dynamic>>[])
            .cast<Map<String, dynamic>>();

    return BookResponseModel(
      error: response['error'] as String,
      total: response['total'] as String,
      page: response['page'] as String? ?? '',
      books: books.map(BookMapper.fromMap).toList(),
    );
  }
}
