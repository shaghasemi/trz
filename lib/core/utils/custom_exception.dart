import 'package:hamdars/app/app_strings.dart';

class CustomException implements Exception {
  final String message;
  final CustomExceptionType type;

  CustomException(this.message, this.type);

  ///for handle no access network
  factory CustomException.networkError() => CustomException(
        AppStrings.networkError,
        CustomExceptionType.networkError,
      );

  ///for handle  Errors received from server
  factory CustomException.failure(final String message) => CustomException(
        message,
        CustomExceptionType.serverError,
      );

  ///for unHandler Error
  factory CustomException.custom(final String message) => CustomException(
        message,
        CustomExceptionType.customError,
      );

  bool isNetworkError() => type == CustomExceptionType.networkError;
}

enum CustomExceptionType { networkError, serverError, customError }
