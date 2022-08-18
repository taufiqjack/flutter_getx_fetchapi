import 'package:flutter_getx_fetchapi/core/constants/routes_page_constant.dart';
import 'package:flutter_getx_fetchapi/ui/bindings/home_binding.dart';
import 'package:flutter_getx_fetchapi/ui/views/home_view.dart';
import 'package:get/get.dart';

List<GetPage> getPages = [
  GetPage(
      name: RouteConstant.homeView,
      page: () => const HomeView(),
      middlewares: [],
      binding: HomeViewBinding())
];
