import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ushop_app/logic/bindings/main_binding.dart';
import 'package:ushop_app/logic/bindings/product_binding.dart';
import 'package:ushop_app/view/screens/auth/forgot_password_screen.dart';
import 'package:ushop_app/view/screens/auth/login_screen.dart';
import 'package:ushop_app/view/screens/auth/signup_screen.dart';
import 'package:ushop_app/view/screens/cart_screen.dart';
import 'package:ushop_app/view/screens/main_screen.dart';

import '../logic/bindings/auth_binding.dart';
import '../view/screens/welcome_screen.dart';

class AppRoutes {
  //initialRoute
  static const welcome = Routes.WelcomeScreen;
  static const mainScreen = Routes.mainScreen;
  //getPages
  static final routes = [
    GetPage(
      name: Routes.WelcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.loginscreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainScreen(),
      bindings: [
        AuthBinding(),
        MainBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: Routes.cartScreen,
      page: () => CartScreen(),
      bindings: [
        AuthBinding(),
        ProductBinding(),
      ],
    ),
  ];
}

class Routes {
  // ignore: constant_identifier_names
  static const WelcomeScreen = '/welcomeScreen';
  static const loginscreen = '/loginScreen';
  static const signUpScreen = '/SigUpScreen';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const mainScreen = '/mainScreen';
  static const cartScreen = '/cartScreen';
}
