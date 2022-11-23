import 'package:get/instance_manager.dart';
import 'package:ushop_app/logic/bindings/controller/cart_controller.dart';
import 'package:ushop_app/logic/bindings/controller/category_cantroller.dart';
import 'package:ushop_app/logic/bindings/controller/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.lazyPut(() => CartController());
    Get.put(CategoryController());
  }
}
