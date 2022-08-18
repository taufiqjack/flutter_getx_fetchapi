import 'package:flutter_getx_fetchapi/ui/views/home_view.dart';
import 'package:flutter_getx_fetchapi/ui/views/login_view.dart';
import 'package:get/get.dart';

// List<GetPage> getPages = [
//   GetPage(
//       name: RouteConstant.homeView,
//       page: () => const HomeView(),
//       middlewares: const [],
//       binding: HomeViewBinding()),
// ];

class Routers {
  static final router = [
    GetPage(name: '/loginview', page: () => const LoginView()),
    GetPage(name: '/homeview', page: () => const HomeView()),
  ];
}
