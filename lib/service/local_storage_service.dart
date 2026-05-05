import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/state_manager.dart';

class LocalStorageService extends GetxService {
  static final storage = FlutterSecureStorage();

  static void write(String v) async {
    // write token
    await storage.write(key: 'token', value: v);
  }

  static void delete() async {
    // delete token
    await storage.delete(key: 'token');
  }
}
