import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop_app/logic/bindings/controller/auth_controller.dart';
import 'package:ushop_app/utils/theme.dart';
import 'package:ushop_app/view/widgets/text_utils.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({super.key});
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.checkBox();
            },
            child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: controller.isCheckBox
                    ? Get.isDarkMode
                        ? const Icon(
                            Icons.done,
                            color: pinkClr,
                          )
                        : Image.asset('assets/images/check.png')
                    : Container()),
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              TextUtils(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                text: "I accept ",
                fontSize: 16,
                fontWeight: FontWeight.normal,
                underline: TextDecoration.none,
              ),
              TextUtils(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                text: "terms & conditions",
                fontSize: 16,
                fontWeight: FontWeight.normal,
                underline: TextDecoration.underline,
              ),
            ],
          )
        ],
      );
    });
  }
}
