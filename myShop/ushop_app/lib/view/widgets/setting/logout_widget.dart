import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop_app/logic/bindings/controller/auth_controller.dart';

import '../../../utils/theme.dart';
import '../text_utils.dart';

class LogoutWidget extends StatelessWidget {
  LogoutWidget({super.key});
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_) => Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Get.defaultDialog(
              title: "LogOut From App ",
              titleStyle: TextStyle(
                fontSize: 18,
                color: Get.isDarkMode ? Colors.black : Colors.black,
                fontWeight: FontWeight.bold,
              ),
              middleText: "Are you sure you need to logout",
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
                Get.back();
              },
              onConfirm: () {
                controller.signOutFromApp();
              },
              buttonColor: Get.isDarkMode ? pinkClr : mainColor,
            );
          },
          splashColor: Get.isDarkMode
              ? pinkClr.withOpacity(0.9)
              : mainColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(12),
          customBorder: const StadiumBorder(),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: logOutSettings,
                ),
                child: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              TextUtils(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                text: "Logout".tr,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                underline: TextDecoration.none,
              )
            ],
          ),
        ),
      ),
    );
  }
}
