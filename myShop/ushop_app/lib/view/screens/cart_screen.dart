import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop_app/logic/bindings/controller/cart_controller.dart';
import 'package:ushop_app/utils/theme.dart';

import '../widgets/cart/cart_product_card.dart';
import '../widgets/cart/cart_total.dart';
import '../widgets/cart/empty_card.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: const Text("Cart Items"),
          elevation: 0,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  controller.clearAllProducts();
                },
                icon: const Icon(Icons.backspace))
          ],
        ),
        body: Obx(() {
          if (controller.productsMap.isEmpty) {
            return const EmptyCard();
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 600,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return CartProductCard(
                            quantity:
                                controller.productsMap.values.toList()[index],
                            index: index,
                            productModels:
                                controller.productsMap.keys.toList()[index],
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 20,
                            ),
                        itemCount: controller.productsMap.length),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: CartTotal(),
                  )
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
