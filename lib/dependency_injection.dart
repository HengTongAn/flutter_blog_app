import 'package:flutter_blog_application/app/data/provider/api_provider.dart';
import 'package:flutter_blog_application/service/local_storage_service.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void init() {
    Get.put(ApiProvider());
    Get.put(LocalStorageService());
  }
}