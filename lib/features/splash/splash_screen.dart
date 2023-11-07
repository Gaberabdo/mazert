import 'package:flutter/material.dart';
import 'package:mozart_flutter_app/features/splash/components/splash_view_body.dart';
import 'package:mozart_flutter_app/utils/styles/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SplashViewBody(),
    );
  }
}
