import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movieapp/binding/homebinding.dart';
import 'package:movieapp/screen/home.dart';


class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: Home.pageId,
      page: () => Home(),
      binding: HomeBinding(),
    ),
  ];
}