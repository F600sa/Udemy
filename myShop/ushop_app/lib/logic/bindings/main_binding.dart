import 'package:get/instance_manager.dart';
import 'package:ushop_app/logic/bindings/controller/main_controller.dart';
import 'package:ushop_app/logic/bindings/controller/settings_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingController());
  }
}
