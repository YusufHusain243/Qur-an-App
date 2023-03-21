import 'package:get/get.dart';
import 'package:quran_app/bindings/home_binding.dart';
import 'package:quran_app/bindings/surat_binding.dart';
import 'package:quran_app/pages/home_page.dart';
import 'package:quran_app/pages/splash_screen_page.dart';
import 'package:quran_app/pages/surat_page.dart';
import 'package:quran_app/routes/route_name.dart';

class AppPage {
  static final pages = [
    GetPage(
      name: RouteName.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: RouteName.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RouteName.surat,
      page: () => SuratPage(),
      binding: SuratBinding(),
    ),
  ];
}
