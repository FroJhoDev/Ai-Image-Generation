import 'package:dio/dio.dart';
import 'package:ai_image_generetor/core/service/dio_service.dart';
import 'package:ai_image_generetor/core/config/api_constants.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${ApiConstants.secretKey}'
        }
      )
    );
  }
}