import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mozart_flutter_app/config/app_routes.dart';
import 'package:mozart_flutter_app/features/auth/presentation/screens/new_password_screen.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/custom_botton.dart';
import 'package:mozart_flutter_app/utils/styles/colors.dart';
import 'package:mozart_flutter_app/utils/styles/fonts.dart';
import 'package:pinput/pinput.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController pinputController=TextEditingController();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(AppLocalizations.of(context)!.verification,
          style: AppFonts.titleScreen.copyWith(height: 0),
        ),
        centerTitle: true,

      ),
      body: Padding(
        padding:  EdgeInsets.only(left: 20.w,right: 20.w,top: 50.h,bottom: 30.h),
        child: Column(
          children: [
            Row(
              children: [
                Text(AppLocalizations.of(context)!.verification,
                  style: AppFonts.black2Text,
                ),
              ],
            ),
            SizedBox(height: 10.h,),
            Text(AppLocalizations.of(context)!.enteryouremailwewillsend5digitsverificationcode,
              style: AppFonts.greyText,
            ),
            SizedBox(height: 30.h,),
            SizedBox(
              width: 270.w,
              height: 40.h,
              child: Pinput(
                androidSmsAutofillMethod:
                AndroidSmsAutofillMethod.smsUserConsentApi,
                controller: pinputController,
                length: 6,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                focusedPinTheme: PinTheme(
                  height: 40.h,
                  width: 40.w,
                  // textStyle: AppFonts.textInPip,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    // color: AppColors.whiteColor,
                    border: Border.all(
                      width: 1.w,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                defaultPinTheme: PinTheme(
                  height: 40.h,
                  width: 40.w,
                  // textStyle: AppFonts.textInPip,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    color: AppColors.white,
                    border: Border.all(
                      width: 1.w,
                     color: AppColors.grey2
                    ),
                    // ),
                  ),
                ),
                // errorPinTheme: PinTheme(
                //   height: 40.h,
                //   width: 40.w,
                //   textStyle: GoogleFonts.inter(
                //     fontSize: 30.sp,
                //     height: 1.h,
                //     color: AppColors.black2Color,
                //     fontWeight: FontWeight.w500,
                //   ),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10.sp),
                //     color: AppColors.whiteColor,
                //     border: Border.all(
                //       width: 1.w,
                //       color: AppColors.errorColor,
                //     ),
                //     // ),
                //   ),
                // ),
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '';
                  }
                  return null;
                },
                onCompleted: (value) async {
                  // if (verifyKey.currentState!.validate()) {
                  //   BlocProvider.of<AuthCubit>(context).createFun(
                  //     social_security_number: personalNumber,
                  //     email: email,
                  //     first_name: firstName,
                  //     full_name: fullName,
                  //     phone_number: phoneNumber,
                  //     surname: lastName,
                  //   );
                  //   setState(() {
                  //     showErrorText = true;
                  //   });
                  // } else {
                  //   setState(() {
                  //     showErrorText = false;
                  //   });
                  // }
                  // Navigator.pushReplacementNamed(
                  //     context, 'add-card-screen');
                },
              ),
            ),
            SizedBox(height: 10.h,),
            RichText(
              text:  TextSpan(children: [
                TextSpan(
                    text: AppLocalizations.of(context)!.ifyoudidntreceiveacode,
                    style: AppFonts.primarytext),
                TextSpan(
                    text: AppLocalizations.of(context)!.resend,
                    style: AppFonts.primarytext.copyWith(fontWeight: FontWeight.bold)),
              ]),
            ),
            Spacer(),
            CustomButtonWidget(
              height: 48.h,
              width: 300.w,
              text: AppLocalizations.of(context)!.send,
              onPressed: (){
                Navigator.pushNamed(context, RouteName.newPasswordRoute);

              },
            ),

          ],
        ),
      ),
    );
  }
}
