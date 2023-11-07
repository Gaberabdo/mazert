import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mozart_flutter_app/features/auth/presentation/screens/register_screen.dart';
import 'package:mozart_flutter_app/provider/provider.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/custom_botton.dart';
import 'package:mozart_flutter_app/utils/styles/colors.dart';
import 'package:mozart_flutter_app/utils/styles/fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CheckLangugeScreen extends StatefulWidget {
  const CheckLangugeScreen({Key? key}) : super(key: key);

  @override
  State<CheckLangugeScreen> createState() => _CheckLangugeScreenState();
}

class _CheckLangugeScreenState extends State<CheckLangugeScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.h),
        child: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text(
            AppLocalizations.of(context)!.language,
            style: AppFonts.titleScreen.copyWith(height: 7.h),
          ),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.chooselanguage,
              style:
                  AppFonts.titleScreen.copyWith(color: AppColors.primaryColor),
            ),
            CustomButtonWidget(
              onPressed: () {
                setState(() {
                  provider.ChangeAppLanguage("ar");
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));

                });
              },
              borderRadius: 10.r,
              text: AppLocalizations.of(context)!.arabic,
              width: 227.w,
              height: 49.h,
            ),
            CustomButtonWidget(
              onPressed: () {
                setState(() {
                  provider.ChangeAppLanguage("en");
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
                });
              },
              borderRadius: 10.r,
              text: AppLocalizations.of(context)!.english,
              width: 227.w,
              height: 49.h,
            ),
            SizedBox(
              height: 80.h,
            )
          ],
        ),
      ),
    );
  }
}
