import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop_app/logic/bindings/controller/settings_controller.dart';
import 'package:ushop_app/utils/theme.dart';
import 'package:ushop_app/view/widgets/text_utils.dart';

import '../../../logic/bindings/controller/Theme_controller.dart';

class DarkModeWidged extends StatelessWidget {
  DarkModeWidged({super.key});
  final controller = Get.find<SettingController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildIconWidge(),
              Switch(
                activeTrackColor: Get.isDarkMode ? pinkClr : mainColor,
                activeColor: Get.isDarkMode ? pinkClr : mainColor,
                value: controller.switchValue.value,
                onChanged: (value) {
                  ThemeController().changeTheme();
                  controller.switchValue.value = value;
                },
              )
            ],
          )),
    );
  }
}

Widget buildIconWidge() {
  return Material(
    color: Colors.transparent,
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: darkSettings,
          ),
          child: const Icon(
            Icons.dark_mode,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        TextUtils(
          color: Get.isDarkMode ? Colors.white : Colors.black,
          text: "Dark Mode".tr,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          underline: TextDecoration.none,
        )
      ],
    ),
  );
}
