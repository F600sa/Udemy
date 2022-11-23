import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop_app/logic/bindings/controller/category_cantroller.dart';

import '../../../utils/theme.dart';
import 'category_items.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({super.key});
  final controller = Get.find<CategoryController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isCategoryLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
        );
      } else {
        return Expanded(
          child: ListView.separated(
              itemBuilder: ((context, index) {
                return InkWell(
                    onTap: () {
                      controller.getCategoryIndex(index);
                      Get.to(() => CategoryItems(
                            categoryTitle: controller.CategoryNameLise[index],
                          ));
                    },
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image:
                                NetworkImage(controller.imageCategory[index]),
                            fit: BoxFit.cover),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          bottom: 10,
                        ),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            controller.CategoryNameLise[index],
                            style: const TextStyle(
                              backgroundColor: Colors.black38,
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ));
              }),
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 20,
                );
              },
              itemCount: controller.CategoryNameLise.length),
        );
      }
    });
  }
}
