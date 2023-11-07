import 'package:flutter/material.dart';
import 'package:mozart_flutter_app/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:mozart_flutter_app/features/auth/presentation/screens/login_screen.dart';
import 'package:mozart_flutter_app/features/auth/presentation/screens/new_password_screen.dart';
import 'package:mozart_flutter_app/features/auth/presentation/screens/register_screen.dart';
import 'package:mozart_flutter_app/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:mozart_flutter_app/features/check_languge/presentation/check_language_screen.dart';
import 'package:mozart_flutter_app/features/home_layout/cart/presentation/add_adress_to%20confirm_order.dart';
import 'package:mozart_flutter_app/features/home_layout/cart/presentation/cart_screen.dart';
import 'package:mozart_flutter_app/features/home_layout/cart/presentation/previous_adress.dart';
import 'package:mozart_flutter_app/features/home_layout/category/presentation/category_screen.dart';
import 'package:mozart_flutter_app/features/home_layout/follow_order.dart';
import 'package:mozart_flutter_app/features/home_layout/home/presentation/home_screen.dart';
import 'package:mozart_flutter_app/features/home_layout/home/presentation/product/presentation/details_product.dart';
import 'package:mozart_flutter_app/features/home_layout/home_layout_screen.dart';
import 'package:mozart_flutter_app/features/home_layout/profile/presentation/connect_with_us.dart';
import 'package:mozart_flutter_app/features/home_layout/profile/presentation/message_connect_with_us.dart';
import 'package:mozart_flutter_app/features/home_layout/profile/presentation/my_account.dart';
import 'package:mozart_flutter_app/features/home_layout/profile/presentation/my_order.dart';
import 'package:mozart_flutter_app/features/home_layout/profile/presentation/profile_screen.dart';
import 'package:mozart_flutter_app/features/home_layout/washlist/presentation/washlist_screen.dart';
import 'package:mozart_flutter_app/features/splash/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splashRoute:
        return PageTransition(
          child:  SplashScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case RouteName.loginRoute:
        return PageTransition(
          child: SignInScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case RouteName.forgetPasswordRoute:
        return PageTransition(
          child: ForgetPasswordScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case RouteName.resetPasswordRoute:
        return PageTransition(
          child: ResetPasswordScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case RouteName.newPasswordRoute:
        return PageTransition(
          child: NewPasswordScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case RouteName.registerRoute:
        return PageTransition(
          child:  RegisterScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case RouteName.checkLanguageRoute:
        return PageTransition(
          child:  CheckLangugeScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case RouteName.homeLayoutRoute:
        return PageTransition(
          child:  HomeLayoutScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case RouteName.homeRoute:
        return PageTransition(
          child:  HomeScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case RouteName.detailsProductRoute:
        return PageTransition(
          child:  DetailsProduct(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case RouteName.cartRoute:
        return PageTransition(
          child:  CartScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case RouteName.addAdressToConfirmOrderRoute:
        return PageTransition(
          child:  AddAdressToConfirmOrder(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case RouteName.previousAdressRoute:
        return PageTransition(
          child:  PreviousAdress(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case RouteName.categoryRoute:
        return PageTransition(
          child: CategoryScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case RouteName.profileRoute:
        return PageTransition(
          child:  ProfileScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case RouteName.connectWithUsRoute:
        return PageTransition(
          child:  ConnectWithUs(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case RouteName.messageConnectWithUsRoute:
        return PageTransition(
          child:  MessageConnectWhithUs(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case RouteName.myAccountRoute:
        return PageTransition(
          child:  MyAccount(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case RouteName.myOrderRoute:
        return PageTransition(
          child:  MyOrderScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case RouteName.washlistRoute:
        return PageTransition(
          child:  WashListScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      case RouteName.followOrderRoute:
        return PageTransition(
          child:  FollowOrder(),
          type: PageTransitionType.fade,
          settings: settings,
          reverseDuration: const Duration(milliseconds: 250),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(
            '',
          ),
        ),
        body: const Center(
          child: Text(
            '',
          ),
        ),
      ),
    );
  }
}

class RouteName {
  static const String splashRoute = 'splash-screen';
  static const String loginRoute = 'login-screen';
  static const String forgetPasswordRoute = 'forgetPassword-screen';
  static const String resetPasswordRoute = 'resetPassword-screen';
  static const String newPasswordRoute = 'newPassword-screen';
  static const String registerRoute = 'register-screen';
  static const String checkLanguageRoute = 'checkLanguage-screen';
  static const String homeLayoutRoute = 'homeLayout-screen';
  static const String homeRoute = 'home-screen';
  static const String detailsProductRoute = 'detailsProduct-screen';
  static const String cartRoute = 'cart-screen';
  static const String addAdressToConfirmOrderRoute = 'addAdressToConfirmOrder-screen';
  static const String previousAdressRoute = 'previousAdress-screen';
  static const String categoryRoute = 'category-screen';
  static const String profileRoute = 'profile-screen';
  static const String connectWithUsRoute = 'connectWithUs-screen';
  static const String editProfileRoute = 'editProfile-screen';
  static const String messageConnectWithUsRoute = 'messageConnectWithUs-screen';
  static const String myAccountRoute = 'myAccount-screen';
  static const String myOrderRoute = 'myOrder-screen';
  static const String washlistRoute = 'washlist-screen';
  static const String followOrderRoute = 'followOrder-screen';
}