import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  String _message = '';

  String get message => _message;

  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.response:
        if (dioError.response != null) {
          _message = _handleError(
            dioError.response?.statusCode,
            dioError.response?.data,
          );
        }
        break;
      case DioErrorType.cancel:
        _message = "Se canceló la solicitud al servidor API";
        break;
      case DioErrorType.connectTimeout:
        _message = "Por favor revisa tu conexion a internet";
        break;
      case DioErrorType.receiveTimeout:
        _message = "No fue posible conectar con el servidor";
        break;
      case DioErrorType.sendTimeout:
        _message = "tiempo de espera en conexión con el servidor sobrepasado";
        break;
      case DioErrorType.other:
        _message = "La conexión al servidor falló. Por favor revisa tu conexion a internet";
        break;
      default:
        _message = "Servicio No disponible. Por favor intente más tarde";
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    try {
      switch (statusCode) {
        case 400:
          return error["message"] ?? 'Solicitud No encontrada (400)';
        case 403:
          return error["message"] ?? 'No Posee los permisos necesarios par esta solicitud (403)';
        case 404:
          return error["message"] ?? 'Solicitud No Encontrada (404)';
        case 500:
          return 'Error interno de servidor';
        default:
          return 'Oops Algo salió mal. Intente más tarde (CODE ${statusCode ?? 0})';
      }
    } catch (e) {
      return 'Por favor intente mas tarde (CODE ${statusCode ?? -1})';
    }
  }

  @override
  String toString() => _message;
}
