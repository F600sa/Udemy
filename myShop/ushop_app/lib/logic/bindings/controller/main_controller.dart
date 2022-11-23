import 'package:get/get.dart';
import 'package:ushop_app/view/screens/category_screen.dart';
import 'package:ushop_app/view/screens/favories_screen.dart';
import 'package:ushop_app/view/screens/home_screen.dart';
import 'package:ushop_app/view/screens/setting_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final tabs = [
    const HomeScreen(),
    const CategoryScreen(),
    FavoriteScreen(),
    const SettingScreen(),
  ].obs;
  final title = ["Asroo Shop", "Categories", "Favorites", "Settings"].obs;
}
