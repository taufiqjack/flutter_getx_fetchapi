import 'dart:developer';

import 'package:dio/dio.dart' as res;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_fetchapi/core/services/api.dart';
import 'package:flutter_getx_fetchapi/ui/views/home_view.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController? usernameController;
  TextEditingController? passwordController;
  res.Response? response;
  res.Dio dio = res.Dio();

  @override
  Future<void> onInit() async {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  void auth(String username, String password) async {
    try {
      Get.dialog(const Center(child: CircularProgressIndicator()),
          barrierDismissible: false);

      response = await dio.post(Api.login, data: {
        "username": username,
        "password": password,
      });

      if (response!.data['message'] == 'LoginSuccess') {
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setBool('success', true);
        Get.back();
        Get.offAll(() => const HomeView());
      } else {}
    } catch (e) {
      log('error');
      if (kDebugMode) {
        print('error $e');
      }
    } finally {}
  }

  @override
  void onClose() async {
    usernameController?.dispose();
    passwordController?.dispose();
    super.onClose();
  }
}
