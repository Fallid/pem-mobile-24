import 'package:get/get.dart';
import 'package:modul_2/app/modules/home/bindings/home_binding.dart';
import 'package:modul_2/app/modules/home/views/home_view.dart';
import 'package:modul_2/app/modules/home/views/widgets/navigation_bar.dart';
import 'package:modul_2/app/modules/register/bindings/register_binding.dart';
import 'package:modul_2/app/modules/register/views/register_view.dart';

import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.REGISTER;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
        name: _Paths.REGISTER,
        page: () => const RegisterView(),
        binding: RegisterBinding()),
    GetPage(
        name: _Paths.HOME,
        page: () => const HomeView(),
        binding: HomeBinding()),
    GetPage(
        name: _Paths.BOTTOMNAV,
        page: () => CurvedNavigation(),
        binding: HomeBinding())
  ];
}
