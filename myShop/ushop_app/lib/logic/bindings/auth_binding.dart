import 'package:get/instance_manager.dart';
import 'package:ushop_app/logic/bindings/controller/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
