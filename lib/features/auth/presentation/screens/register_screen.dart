import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mozart_flutter_app/config/app_routes.dart';
import 'package:mozart_flutter_app/features/auth/presentation/screens/login_screen.dart';
import 'package:mozart_flutter_app/features/home_layout/home_layout_screen.dart';
import 'package:mozart_flutter_app/provider/provider.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/custom_botton.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/custom_divider.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/custom_phone_text_field.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/custom_text_form_filed.dart';
import 'package:mozart_flutter_app/utils/styles/colors.dart';
import 'package:mozart_flutter_app/utils/styles/fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController streetNameController = TextEditingController();
  final TextEditingController apartmentController = TextEditingController();
  final TextEditingController floorNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          AppLocalizations.of(context)!.createanaccount,
          style: AppFonts.titleScreen.copyWith(height: 0),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 25.w, left: 25.w, top: 20.h),
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
              Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomTextFormFiled(
                          label: AppLocalizations.of(context)!.name,
                          controller: nameController,
                          validator: (text) {
                            if (text!.isEmpty || text == null) {
                              return "${AppLocalizations.of(context)!.pleaseenteryour} ${AppLocalizations.of(context)!.name}";
                            }
                          },
                        ),
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
                          validator: (text) {
                            if (text!.isEmpty || text == null) {
                              return "${AppLocalizations.of(context)!.pleaseenteryour} ${AppLocalizations.of(context)!.password}";
                            }
                          },
                        ),
                        CustomPhoneTextField(
                          text: AppLocalizations.of(context)!.phonenumber,
                          controller: phoneNumberController,
                          validator: (text) {
                            if (text!.isEmpty || text == null) {
                              return "${AppLocalizations.of(context)!.pleaseenteryour} ${AppLocalizations.of(context)!.phonenumber}";
                            }
                          },
                        ),
                        CustomTextFormFiled(
                          label: AppLocalizations.of(context)!.streetname,
                          controller: streetNameController,
                          validator: (text) {
                            if (text!.isEmpty || text == null) {
                              return "${AppLocalizations.of(context)!.pleaseenteryour} ${AppLocalizations.of(context)!.streetname}";
                            }
                          },
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextFormFiled(
                                label: AppLocalizations.of(context)!.apartment,
                                controller: apartmentController,
                                validator: (text) {
                                  if (text!.isEmpty || text == null) {
                                    return "${AppLocalizations.of(context)!.pleaseenteryour} ${AppLocalizations.of(context)!.apartment}";
                                  }
                                },
                              ),
                            ),
                            Expanded(
                              child: CustomTextFormFiled(
                                label: AppLocalizations.of(context)!.zipcountry,
                                controller: apartmentController,
                                validator: (text) {
                                  if (text!.isEmpty || text == null) {
                                    return "${AppLocalizations.of(context)!.pleaseenteryour} ${AppLocalizations.of(context)!.zipcountry}";
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextFormFiled(
                                label: AppLocalizations.of(context)!.city,
                                controller: floorNumberController,
                                validator: (text) {
                                  if (text!.isEmpty || text == null) {
                                    return "${AppLocalizations.of(context)!.pleaseenteryour} ${AppLocalizations.of(context)!.city}";
                                  }
                                },
                              ),
                            ),
                            Expanded(
                              child: CustomTextFormFiled(
                                label: AppLocalizations.of(context)!.country,
                                controller: floorNumberController,
                                validator: (text) {
                                  if (text!.isEmpty || text == null) {
                                    return "${AppLocalizations.of(context)!.pleaseenteryour} ${AppLocalizations.of(context)!.country}";
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 20.h,
              ),
              CustomButtonWidget(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, RouteName.registerRoute);
                  }
                },
                borderRadius: 10.r,
                text: AppLocalizations.of(context)!.createanaccount,
                width: 335.w,
                height: 49.h,
              ),
              Row(
                children: [
                  Expanded(
                      child:
                          CustomDevider(thicness: 0.3, color: AppColors.grey)),
                  Text(
                    AppLocalizations.of(context)!.or,
                    style: AppFonts.bodyText,
                  ),
                  Expanded(
                      child:
                          CustomDevider(thicness: 0.3, color: AppColors.grey)),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.loginRoute);
                },
                child: Text(
                  AppLocalizations.of(context)!.signin,
                  style:
                      AppFonts.bodyText.copyWith(color: AppColors.primaryColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
