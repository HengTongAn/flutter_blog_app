import 'package:flutter/material.dart';
import 'package:flutter_blog_application/app.dart';
import 'package:flutter_blog_application/app/data/model/req/login_req.model.dart';
import 'package:flutter_blog_application/app/routes/app_pages.dart';
import 'package:flutter_blog_application/component/widget/text_form_field_cus.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final controller = Get.put(LoginController());
  LoginView({super.key});
  final _formKey = GlobalKey<FormState>();
  final _emailCon = TextEditingController();
  final _passCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  spacing: 8,
                  children: [
                    TextFormFieldCus(
                      hintText: 'Email',
                      controller: _emailCon,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return "Email is required";
                        } else if (!GetUtils.isEmail(v)) {
                          return "Email is not formatted";
                        }
                        return null;
                      },
                      icon: Icons.email_rounded,
                    ),
                    TextFormFieldCus(
                      hintText: 'Password',
                      controller: _passCon,
                      validator: (v) {
                        if (v == null && v!.isEmpty) {
                          return "Password is required";
                        } else if (v.length < 6) {
                          return "Password must be 6 digits long";
                        }
                        return null;
                      },
                      icon: Icons.key,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final req = LoginReq(
                            email: _emailCon.text,
                            password: _passCon.text,
                          );
                          controller.login(req);
                        }
                      },
                      child: Text("Login"),
                    ),
                    Row(
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.REGISTER);
                          },
                          child: Text("Register"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
