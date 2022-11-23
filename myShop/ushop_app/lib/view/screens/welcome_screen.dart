import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ushop_app/utils/theme.dart';
import '../../routes/routes.dart';
import '../widgets/text_utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/images/background.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.2),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Container(
                  height: 60,
                  width: 190,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                      child: TextUtils(
                    underline: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    text: "Welcome",
                  )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    height: 60,
                    width: 230,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        TextUtils(
                            underline: TextDecoration.none,
                            color: mainColor,
                            text: "Asroo",
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                        SizedBox(
                          width: 7,
                        ),
                        TextUtils(
                            underline: TextDecoration.none,
                            color: Colors.white,
                            text: "Shop",
                            fontSize: 35,
                            fontWeight: FontWeight.bold)
                      ],
                    )),
                const SizedBox(
                  height: 250,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12)),
                  onPressed: () {
                    // Get.toNamed(Routes.loginscreen);
                    Get.offNamed(Routes.loginscreen);
                  },
                  child: const TextUtils(
                    underline: TextDecoration.none,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    text: "Get Start",
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextUtils(
                      color: Colors.white,
                      text: "Don't have an Account?",
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      underline: TextDecoration.none,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.offNamed(Routes.signUpScreen);
                        },
                        child: const TextUtils(
                          text: "Sign Up",
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          underline: TextDecoration.underline,
                        )),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
