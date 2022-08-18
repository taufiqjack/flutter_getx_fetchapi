import 'package:flutter/material.dart';
import 'package:flutter_getx_fetchapi/ui/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginController = Get.put(LoginController());
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final unameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                child: Form(
                    key: _key,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: unameController,
                          decoration:
                              const InputDecoration(hintText: 'Username'),
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null) {
                              return 'Username harus diisi';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passwordController,
                          textInputAction: TextInputAction.done,
                          decoration:
                              const InputDecoration(hintText: 'Password'),
                          validator: (value) {
                            if (value == null) {
                              return 'Password harus diisi';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                            onPressed: _onLoginButtonPress,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.blue),
                              child: const Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ))
                      ],
                    )))));
  }

  _onLoginButtonPress() {
    if (_key.currentState!.validate()) {
      loginController.auth(unameController.text, passwordController.text);
    } else {}
  }
}
