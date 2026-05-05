import 'package:flutter_blog_application/app/data/model/req/login_req.model.dart';
import 'package:flutter_blog_application/app/data/provider/api_provider.dart';
import 'package:flutter_blog_application/app/routes/app_pages.dart';
import 'package:flutter_blog_application/service/local_storage_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final _provider = Get.find<ApiProvider>();

  void login(LoginReq req) async {
    try {
      final response = await _provider.login(req);

      if (response.statusCode == 200) {
        final token = response.data['token'];
        LocalStorageService.write(token);
        
        Get.offAndToNamed(Routes.HOME);
        return;
      }
      throw Exception(response.data['message']);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
