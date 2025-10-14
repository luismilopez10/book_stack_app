import 'package:book_stack_design_system/domain/models/error_model.dart';

import '../models/book_response_model.dart';

abstract class BookGateway {
  Future<(List<BookResponseModel>?, ErrorModel?)> getBooks();
}
