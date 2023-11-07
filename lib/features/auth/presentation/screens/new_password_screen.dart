import 'package:flutter/material.dart';
import 'package:mozart_flutter_app/config/app_routes.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/custom_botton.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/custom_text_form_filed.dart';
import 'package:mozart_flutter_app/utils/styles/colors.dart';
import 'package:mozart_flutter_app/utils/styles/fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({Key? key}) : super(key: key);
  TextEditingController newpssController = TextEditingController();
  TextEditingController confirmpssController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          AppLocalizations.of(context)!.newpassword,
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Text(
                    AppLocalizations.of(context)!.enternewpassword,
                    style: AppFonts.black2Text,
                  ),
                ),
              ],
            ),
            Form(
                child: Column(
              children: [
                CustomTextFormFiled(
                  label: AppLocalizations.of(context)!.newpassword,
                  controller: newpssController,
                  validator: (text) {
                    if (text!.isEmpty || text == null) {
                      return "${AppLocalizations.of(context)!.pleaseenteryour} ${AppLocalizations.of(context)!.newpassword}";
                    }
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Text(
                        AppLocalizations.of(context)!.confirmpassword,
                        style: AppFonts.black2Text,
                      ),
                    ),
                  ],
                ),
                CustomTextFormFiled(
                  label: AppLocalizations.of(context)!.confirmpassword,
                  controller: confirmpssController,
                  validator: (text) {
                    if (text!.isEmpty || text == null) {
                      return "${AppLocalizations.of(context)!.pleaseenteryour} ${AppLocalizations.of(context)!.confirmpassword}";
                    }
                  },
                ),
              ],
            )),
            Spacer(),
            CustomButtonWidget(
              height: 48.h,
              width: 300,
              onPressed: () {
                if(formKey.currentState!.validate()){
                  Navigator.pushNamed(context, RouteName.homeLayoutRoute);
                }
              },
              text: AppLocalizations.of(context)!.confirm,
            )
          ],
        ),
      ),
    );
  }
}
