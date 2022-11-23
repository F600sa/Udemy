import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop_app/model/product_models.dart';

import '../../../routes/routes.dart';
import '../../../utils/theme.dart';

class CartController extends GetxController {
  var productsMap = {}.obs;

  void addProductToCart(ProductModels productModels) {
    if (productsMap.containsKey(productModels)) {
      productsMap[productModels] += 1;
    } else {
      productsMap[productModels] = 1;
    }
  }

  void removeProductsFromCart(ProductModels productModels) {
    if (productsMap.containsKey(productModels) &&
        productsMap[productModels] == 1) {
      productsMap.removeWhere((key, value) => key == productModels);
    } else {
      productsMap[productModels] -= 1;
    }

    // Get.snackbar(
    //   'Error!',
    //   "{$productsMap[]}",
    //   snackPosition: SnackPosition.BOTTOM,
    //   backgroundColor: Colors.green,
    //   colorText: Colors.white,
    //  );
  }

  void removeOneProduct(ProductModels productModels) {
    productsMap.removeWhere((key, value) => key == productModels);
  }

  void clearAllProducts() {
    Get.defaultDialog(
      title: "Clean Products",
      titleStyle: TextStyle(
        fontSize: 18,
        color: Get.isDarkMode ? Colors.black : Colors.black,
        fontWeight: FontWeight.bold,
      ),
      middleText: "Are you sure you need clear products",
      middleTextStyle: TextStyle(
        fontSize: 18,
        color: Get.isDarkMode ? Colors.black : Colors.black,
        fontWeight: FontWeight.normal,
      ),
      backgroundColor: Colors.grey,
      radius: 10,
      textCancel: "No",
      cancelTextColor: Colors.white,
      textConfirm: "Yes",
      confirmTextColor: Colors.white,
      onCancel: () {
        Get.toNamed(Routes.cartScreen);
      },
      onConfirm: () {
        productsMap.clear();
        Get.back();
      },
      buttonColor: Get.isDarkMode ? pinkClr : mainColor,
    );
  }

  get productSubTolal =>
      productsMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productsMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  int quantity() {
    if (productsMap.isEmpty) {
      return 0;
    } else {
      return productsMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }
}
