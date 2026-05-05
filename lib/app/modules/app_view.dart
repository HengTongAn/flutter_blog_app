import 'package:flutter/widgets.dart';
import 'package:flutter_blog_application/app/modules/login/views/login_view.dart';
import 'package:flutter_blog_application/dependency_injection.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    DependencyInjection.init();
    return LoginView();
  }
}
