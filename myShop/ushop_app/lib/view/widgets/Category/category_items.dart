import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop_app/logic/bindings/controller/cart_controller.dart';
import 'package:ushop_app/logic/bindings/controller/category_cantroller.dart';
import 'package:ushop_app/logic/bindings/controller/product_controller.dart';
import 'package:ushop_app/model/product_models.dart';
import 'package:ushop_app/utils/theme.dart';
import 'package:ushop_app/view/screens/product_details_screen.dart';
import 'package:ushop_app/view/widgets/text_utils.dart';

class CategoryItems extends StatelessWidget {
  final String categoryTitle;
  CategoryItems({
    required this.categoryTitle,
    super.key,
  });

  final controller = Get.find<ProductController>();
  final cartController = Get.find<CartController>();
  final categoryController = Get.find<CategoryController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: Text(categoryTitle),
          centerTitle: true,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
        ),
        body: Obx(() {
          if (categoryController.isAllCategory.value) {
            return Center(
              child: CircularProgressIndicator(
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
            );
          } else {
            return GridView.builder(
                itemCount: categoryController.CategoryList.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 9.0,
                  crossAxisSpacing: 6.0,
                  maxCrossAxisExtent: 400,
                ),
                itemBuilder: (context, index) {
                  return buildCardItems(
                      image: categoryController.CategoryList[index].image,
                      price: categoryController.CategoryList[index].price,
                      rate: categoryController.CategoryList[index].rating.rate,
                      productId: categoryController.CategoryList[index].id,
                      productModels: categoryController.CategoryList[index],
                      onTap: () {
                        Get.to(() => ProductDetailsScreen(
                              productModels:
                                  categoryController.CategoryList[index],
                            ));
                      });
                });
          }
        }));
  }

  Widget buildCardItems({
    required String image,
    required double price,
    required double rate,
    required int productId,
    required ProductModels productModels,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.0,
                  blurRadius: 5.0,
                )
              ]),
          child: Column(
            children: [
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            controller.mangeFavourites(productId);
                          },
                          icon: controller.isFavourites(productId)
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite_outline,
                                  color: Colors.black,
                                )),
                      IconButton(
                          onPressed: () {
                            cartController.addProductToCart(productModels);
                          },
                          icon: const Icon(
                            Icons.shopping_cart,
                            color: Colors.black,
                          ))
                    ],
                  )),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$ $price",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 3, right: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextUtils(
                                color: Colors.white,
                                text: "$rate",
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                underline: TextDecoration.none),
                            const Icon(
                              Icons.star,
                              size: 13,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}