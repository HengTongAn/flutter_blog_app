import 'package:flutter/cupertino.dart';
import 'package:flutter_blog_application/app/data/model/req/register_req.model.dart';
import 'package:flutter_blog_application/app/data/provider/api_provider.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final _provider = Get.find<ApiProvider>();

  void register(RegisterReq req) async {
    try {
      final response = await _provider.register(req);
      if (response.statusCode == 200) {
        /// success
        Get.back(result: true);
        return;
      }
      throw Exception(response.data['message']);
    } catch (e) {
      debugPrint("Error message: ${e.toString()}");
      Get.snackbar("Error", e.toString());
    }
  }
}
