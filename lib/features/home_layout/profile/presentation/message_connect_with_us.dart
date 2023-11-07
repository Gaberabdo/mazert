import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/custom_text_field_connect_us.dart';
import 'package:mozart_flutter_app/utils/styles/colors.dart';
import 'package:mozart_flutter_app/utils/styles/fonts.dart';
final GlobalKey<FormState> formKey = GlobalKey<FormState>();

class MessageConnectWhithUs extends StatelessWidget {
  MessageConnectWhithUs({Key? key}) : super(key: key);
  TextEditingController namecontroller = TextEditingController();
  TextEditingController messagecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          AppLocalizations.of(context)!.connectwithus,
          style: AppFonts.titleScreen.copyWith(height: 0),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Text(AppLocalizations.of(context)!.fullname,
                  style: AppFonts.blackText),
              SizedBox(
                height: 16.h,
              ),
              Form(child: Column(
                children: [
                  CustomTextFormFieldConnectUs(
                      controller: namecontroller, maxLines: 1),
                  SizedBox(
                    height: 24,
                  ),
                  Text(AppLocalizations.of(context)!.message,
                      style: AppFonts.blackText),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextFormFieldConnectUs(
                      label:AppLocalizations.of(context)!.enteryourmessage ,
                      controller: messagecontroller, maxLines: 7),
                ],

              ))
            ],
          ),
        ),
      ),
    );
  }
}
