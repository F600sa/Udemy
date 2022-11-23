import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop_app/logic/bindings/controller/settings_controller.dart';
import 'package:ushop_app/utils/my_string.dart';

import '../../../utils/theme.dart';
import '../text_utils.dart';

class LanguageWidget extends StatelessWidget {
  LanguageWidget({super.key});
  final controller = Get.find<SettingController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
        builder: (_) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: languageSettings,
                        ),
                        child: const Icon(
                          Icons.language,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      TextUtils(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        text: "Language".tr,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        underline: TextDecoration.none,
                      )
                    ],
                  ),
                ),
                Container(
                  width: 120,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      width: 2,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      iconSize: 25,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                      items: [
                        DropdownMenuItem(
                          value: ene,
                          child: Text(
                            english,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: ara,
                          child: Text(
                            arabic,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: frf,
                          child: Text(
                            france,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                      value: controller.lanLocal,
                      onChanged: (value) {
                        controller.changeLanguage(value!);
                        Get.updateLocale(Locale(value));
                      },
                    ),
                  ),
                ),
              ],
            ));
  }
}
