import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mozart_flutter_app/config/app_assets.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/custom_botton.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/custom_text_field_connect_us.dart';
import 'package:mozart_flutter_app/utils/styles/colors.dart';

class ShowTellUsAboutYourExperienceBottomShet extends StatelessWidget {
  ShowTellUsAboutYourExperienceBottomShet({Key? key, required this.controller})
      : super(key: key);
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      height: 442.h,
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  AppAssets.exitIcon,
                ),
              ),
            ],
          ),
          Text(
            AppLocalizations.of(context)!.shareyourthoughtsonourapp,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Text(
              AppLocalizations.of(context)!.helpus,
              style: TextStyle(fontSize: 14.sp, color: AppColors.grey),
            ),
          ),
          CustomTextFormFieldConnectUs(
              controller: controller,
              label: AppLocalizations.of(context)!.tellusaboutyourexperience,
              maxLines: 5),
           SizedBox(height: 32.h,),
          CustomButtonWidget(
            height: 46.h,
            width: 330.w,
            text: AppLocalizations.of(context)!.sendfeedback,
          )
        ],
      ),
    );
  }
}
