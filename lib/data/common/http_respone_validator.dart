import 'package:car/common/exceptions.dart';
import 'package:dio/dio.dart';

mixin HttpResponseValidator {
  validateResponse(Response response) {
    if (response.statusCode != 200) {
      throw AppExceptions();
    } else {
      return response;
    }
  }
}
