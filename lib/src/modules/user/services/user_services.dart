import 'package:dio/dio.dart';

import '../models/request_login.dart';
import '../../../utils/api_status.dart';
import '../../../utils/enviroment.dart';
import '../../../utils/dio_exceptios.dart';

class UserServices {
  static final Dio _dio = Dio();

  static Future<Object> loguinUsers(RequesLogin requesLogin) async {
    // Response response=await ApiClient().callLoginApi(userName.text, password.text);
    try {
      final response = await _dio.post(
        '${Enviroment.ENDPOINT}/api/login',
        data: requesLogin.toJson(),
      );
      if (response.statusCode == 200) {
        final loginResponse = (response.data);
        return Success(code: 200, response: loginResponse);
      } else {
        return Failure(code: 100, errorResponse: 'loginResponse');
      }
    } on DioError catch (e) {
      final dioError = DioExceptions.fromDioError(e);
      return Failure(code: 100, errorResponse: dioError.message);
    } catch (e){
        return Failure(code: 500, errorResponse: 'loginResponse');

    }
  }
}
