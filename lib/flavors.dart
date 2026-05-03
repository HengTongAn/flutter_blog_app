import 'package:flutter_blog_application/app/constant/app_config.dart';

enum Flavor { dev, prod }

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;
  static String baseUrl = "http://localhost:8000";

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'BlogApp-Dev';
      case Flavor.prod:
        baseUrl = kBaseUrl;
        return 'Blog App';
    }
  }
}
