import 'dart:convert';

import 'package:book_stack_design_system/book_stack_design_system.dart';
import 'package:book_stack_widget/book_stack_widget.dart';
import 'package:http/http.dart' as http;

import '../../../core/exceptions/exception_helper.dart';
import '../../../domain/mappers/book_response_mapper.dart';
import '../../../domain/models/models.dart';
import '../../../utils/constants/environment.dart';
import '../../utils/endpoint_utils.dart';
import '../repository_mocks/books_mock.dart';
import 'base_api_client.dart';

class BooksApi extends BaseApiClient implements BooksGateway {
  BooksApi(super.context);

  @override
  Future<(List<BookModel>?, ErrorModel?)> getProgrammingBooks({
    required int pageNumber,
  }) async {
    final String endpoint = '${EndpointUtils.getProgrammingBooks}/$pageNumber';
    try {
      final Uri url = Uri.https(appConfig.apiBaseUrl, endpoint);

      final Map<String, dynamic> response =
          appConfig.environment != Environment.Mock
          ? jsonDecode((await http.get(url)).body)
          : BooksMock.getBooks;

      final BookResponseModel bookResponse = BookResponseMapper.fromMap(
        response,
      );

      return (bookResponse.books, null);
    } on Exception catch (e) {
      final ErrorModel error = ExceptionHelper.mapExceptionToErrorModel(e);

      return (null, error);
    }
  }

  @override
  Future<(List<BookModel>?, ErrorModel?)> getBooksByQuery(
    String query, {
    required int pageNumber,
  }) async {
    final String endpoint =
        '${EndpointUtils.getBooksByQuery}/$query/$pageNumber';
    try {
      final Uri url = Uri.https(appConfig.apiBaseUrl, endpoint);

      final Map<String, dynamic> response =
          appConfig.environment != Environment.Mock
          ? jsonDecode((await http.get(url)).body)
          : BooksMock.getBooks;

      final BookResponseModel bookResponse = BookResponseMapper.fromMap(
        response,
      );

      return (bookResponse.books, null);
    } on Exception catch (e) {
      final ErrorModel error = ExceptionHelper.mapExceptionToErrorModel(e);

      return (null, error);
    }
  }
}
