import 'package:flutter/foundation.dart';
import 'package:flutter_blog_application/app/constants/app_config.dart';

enum Flavor { dev, prod }

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;
  static String baseUrl = "";

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        baseUrl = kBaseLocalUrl;
        debugPrint("Server url: $baseUrl");
        return 'BlogApp-Dev';
      case Flavor.prod:
        baseUrl = kBaseUrl;
        return 'Blog App';
    }
  }
}
