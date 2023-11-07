import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mozart_flutter_app/config/app_assets.dart';
import 'package:mozart_flutter_app/features/check_languge/presentation/check_language_screen.dart';
class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fadingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();

    navigationToHome();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: fadingAnimation!,
            builder: (context, child) {
              return Opacity(
                opacity: fadingAnimation!.value,
                child: Image.asset(AppAssets.logoIcon),
              );
            },
          ),
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    fadingAnimation =
        Tween<double>(begin: 0.2, end: 1).animate(animationController!);

    animationController!.repeat(reverse: true);
  }

  void navigationToHome() {
    Future.delayed(
      const Duration(seconds: 2),
          () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CheckLangugeScreen()));

      },
    );
  }
}
