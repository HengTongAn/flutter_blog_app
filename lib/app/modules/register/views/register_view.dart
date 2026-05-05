import 'package:flutter/material.dart';
import 'package:flutter_blog_application/app/data/model/req/register_req.model.dart';
import 'package:flutter_blog_application/component/widget/text_form_field_cus.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({super.key});
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RegisterView'), centerTitle: true),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                spacing: 12,
                children: [
                  TextFormFieldCus(
                    hintText: 'Username',
                    controller: _nameController,
                    validator: (v) {
                      if (v == null && v!.isEmpty) {
                        return "Name is required";
                      }
                      return null;
                    },
                    icon: Icons.person,
                  ),
                  TextFormFieldCus(
                    hintText: 'Email',
                    controller: _emailController,
                    validator: (v) {
                      if (v == null && v!.isEmpty) {
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
                    controller: _passwordController,
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
                        final req = RegisterReq(
                          name: _nameController.text,
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                        controller.register(req);
                      }
                    },
                    child: Text("Register"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
