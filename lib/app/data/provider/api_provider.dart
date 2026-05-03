import 'package:flutter_blog_application/app/constant/app_config.dart';
import 'package:flutter_blog_application/app/data/model/req/login_req.model.dart';
import 'package:flutter_blog_application/app/data/model/req/register_req.model.dart';
import 'package:flutter_blog_application/flavors.dart';
import 'package:get/get.dart' hide Response;
import 'package:dio/dio.dart';

class ApiProvider extends GetxService {
  late Dio _dio;

  @override
  void onInit() {
    _initialDio();
    super.onInit();
  }

  void _initialDio() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "${F.baseUrl}/api",
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        headers: {
          "Content-Type": "application/json",
          "Accept": 'application/json',
        },
      ),
    );
  }

  Future<Response<dynamic>> login(LoginReq req) async {
    return _dio.post("/login", data: req.toJson());
  }

  Future<Response<dynamic>> register(RegisterReq req) async {
    return _dio.post("/register", data: req.toJson());
  }
}
