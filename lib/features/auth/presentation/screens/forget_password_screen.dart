import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mozart_flutter_app/config/app_routes.dart';
import 'package:mozart_flutter_app/features/auth/presentation/screens/login_screen.dart';
import 'package:mozart_flutter_app/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/custom_botton.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/custom_text_form_filed.dart';
import 'package:mozart_flutter_app/utils/styles/colors.dart';
import 'package:mozart_flutter_app/utils/styles/fonts.dart';

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          AppLocalizations.of(context)!.forgetpassword,
          style: AppFonts.titleScreen.copyWith(height: 0),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding:
            EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h, bottom: 30.h),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.forgetpassword,
                  style: AppFonts.black2Text,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              AppLocalizations.of(context)!
                  .enteryouremailwewillsend5digitsverificationcode,
              style: AppFonts.greyText,
            ),
            SizedBox(
              height: 10.h,
            ),
            Form(key: formKey,
              child: CustomTextFormFiled(
                label: AppLocalizations.of(context)!.email,
                controller: controller,
                validator: (text) {
                  if (text!.isEmpty || text == null) {
                    return "${AppLocalizations.of(context)!.pleaseenteryour} ${AppLocalizations.of(context)!.email}";
                  }
                },
              ),
            ),
            Spacer(),
            CustomButtonWidget(
              height: 48.h,
              width: 300.w,
              text: AppLocalizations.of(context)!.sendcode,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Navigator.pushNamed(context, RouteName.resetPasswordRoute);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
