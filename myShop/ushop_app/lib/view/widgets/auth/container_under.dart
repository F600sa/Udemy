import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop_app/utils/theme.dart';
import 'package:ushop_app/view/widgets/text_utils.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final String textType;
  const ContainerUnder(
      {required this.text,
      required this.onPressed,
      required this.textType,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
        color: Get.isDarkMode ? pinkClr : mainColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
              color: Colors.white,
              text: text,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              underline: TextDecoration.none),
          TextButton(
            onPressed: onPressed,
            child: TextUtils(
                color: Colors.white,
                text: textType,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                underline: TextDecoration.underline),
          )
        ],
      ),
    );
  }
}
