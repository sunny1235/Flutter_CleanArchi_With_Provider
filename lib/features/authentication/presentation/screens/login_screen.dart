import 'package:flutter/material.dart';
import 'package:flutter_ca_demo/base/base_view_model.dart';
import 'package:flutter_ca_demo/core/utils/response_message.dart';
import 'package:flutter_ca_demo/features/authentication/presentation/provider/auth_view_model.dart';
import 'package:flutter_ca_demo/features/home/route_paths.dart';

import '../widgets/input_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: BaseView<AuthViewModel>(
          onModelReady: (viewModel) {},
          builder: (context, viewModel, _) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  const Text(
                    "Demo Login",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  InputFormWidget(
                    title: "Email",
                    hint: "Enter Email",
                    isobscureText: false,
                    controller: viewModel.emailController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputFormWidget(
                    title: "Password",
                    hint: "Enter Password",
                    isobscureText: true,
                    controller: viewModel.passwordController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(15)),
                    child: TextButton(
                      onPressed: () async {
                        final res = await viewModel.login();

                        if (res.isLeft()) {
                          var a = ResponseMessage.failure(res);
                          print("Failure Data :: $a");
                        } else {
                          print("Navigate the user to Dashboard.....");
                          Navigator.pushNamed(
                            context,
                            AppRoutePaths.dashboard,
                          );
                        }
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
