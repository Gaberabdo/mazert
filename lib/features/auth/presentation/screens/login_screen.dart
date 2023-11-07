import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mozart_flutter_app/config/app_routes.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/custom_botton.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/custom_text_form_filed.dart';
import 'package:mozart_flutter_app/utils/styles/colors.dart';
import 'package:mozart_flutter_app/utils/styles/fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool obsecure = true;

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          AppLocalizations.of(context)!.signin,
          style: AppFonts.titleScreen.copyWith(height: 0),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 25.w, left: 25.w, top: 40.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.enteryouraccountdetailsbelow,
                    style: AppFonts.bodyText,
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextFormFiled(
                        label: AppLocalizations.of(context)!.email,
                        controller: emailController,
                        validator: (text) {
                          if (text!.isEmpty || text == null) {
                            return "${AppLocalizations.of(context)!.pleaseenteryour} ${AppLocalizations.of(context)!.email}";
                          }
                        },
                      ),
                      CustomTextFormFiled(
                        label: AppLocalizations.of(context)!.password,
                        controller: passwordController,
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obsecure = !obsecure;
                              });
                            },
                            icon: obsecure
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility)),
                        obscureText: obsecure,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteName.forgetPasswordRoute);
                              },
                              child: Text(
                                AppLocalizations.of(context)!.forgetpassword,
                                style: AppFonts.primarytext
                                    .copyWith(color: AppColors.primaryColor),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
              SizedBox(
                height: 30.h,
              ),
              CustomButtonWidget(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, RouteName.homeLayoutRoute);
                  }
                },
                borderRadius: 10.r,
                text: AppLocalizations.of(context)!.signin,
                width: 335.w,
                height: 49.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.registerRoute);
                },
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: AppLocalizations.of(context)!.donthaveanaccount,
                        style: AppFonts.primarytext),
                    TextSpan(
                        text: AppLocalizations.of(context)!.createanaccount,
                        style: AppFonts.primarytext
                            .copyWith(fontWeight: FontWeight.bold)),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
