import 'package:book_stack_design_system/domain/models/error_model.dart';

import '../gateways/books_gateway.dart';
import '../models/book_response_model.dart';

class BookUseCase {
  BookUseCase(this._gateway);

  final BookGateway _gateway;

  Future<(List<BookResponseModel>?, ErrorModel?)> getBooks() async {
    return _gateway.getBooks();
  }
}
