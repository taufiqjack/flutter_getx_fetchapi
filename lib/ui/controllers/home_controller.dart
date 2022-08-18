import 'dart:developer';

import 'package:dio/dio.dart' as res;
import 'package:flutter/foundation.dart';
import 'package:flutter_getx_fetchapi/core/models/contact_model.dart';
import 'package:flutter_getx_fetchapi/core/services/api.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  res.Response? response;
  res.Dio dioo = res.Dio();
  ContactModel? contactModel;
  var isDataLoad = false.obs;

  @override
  Future<void> onInit() async {
    getContact();
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  getContact() async {
    try {
      isDataLoad(true);
      response = await dioo.get(Api.contact);
      if (response!.statusCode == 200) {
        var result = response!.data;
        contactModel = ContactModel.fromJson(result);
      } else {}
    } catch (e) {
      log('error get data');
      if (kDebugMode) {
        print('error : $e');
      }
    } finally {
      isDataLoad(false);
    }
  }
}
