import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ushop_app/utils/my_string.dart';

class SettingController extends GetxController {
  var switchValue = false.obs;
  var storage = GetStorage();
  var lanLocal = ene;
  String capitalize(String profileName) {
    return profileName.split(" ").map((name) => name.capitalize).join(" ");
  }

  //Language123

  @override
  void onInit() async {
    super.onInit();
    lanLocal = await getLanguage;
  }

  void saveLanguage(String lang) async {
    await storage.write("lang", lang);
  }

  Future<String> get getLanguage async {
    return await storage.read("lang");
  }

  void changeLanguage(String typeLang) {
    if (lanLocal == typeLang) {
      return;
    }
    if (typeLang == frf) {
      lanLocal == frf;
      saveLanguage(frf);
    } else if (typeLang == ara) {
      lanLocal == ara;
      saveLanguage(ara);
    } else {
      lanLocal == ene;
      saveLanguage(ene);
    }
    update();
  }
}
