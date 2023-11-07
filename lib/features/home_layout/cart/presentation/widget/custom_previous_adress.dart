import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mozart_flutter_app/config/app_assets.dart';
import 'package:mozart_flutter_app/utils/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mozart_flutter_app/utils/styles/fonts.dart';

class CustomPreviousAdress extends StatelessWidget {
  const CustomPreviousAdress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16.h,right: 16.w,left: 16.w),
      height: 190.h,
      width: 335.w,
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.2.w,
          color: AppColors.grey
        )
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(AppAssets.orderIcon,width: 40.w,),
              Spacer(),
              Text("4,000 د.ع"),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(AppAssets.locationIcon),
              SizedBox(width: 10.w,),
              Text( AppLocalizations.of(context)!.detectlocation,
              style: AppFonts.bodyText,
              )
            ],
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30.w),
            child: Text("home,city"),
          ),
          Row(
            children: [
              SvgPicture.asset(AppAssets.callIcon,color: AppColors.grey2,),
              SizedBox(width: 10.w,),
              Text( AppLocalizations.of(context)!.phonenumber,
                style: AppFonts.bodyText,
              )
            ],
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30.w),
            child: Text("01061489546"),
          ),
          Row(
            children: [
              SvgPicture.asset(AppAssets.locationIcon,color: AppColors.grey2,),
              SizedBox(width: 10.w,),
              Text("الفرع",
                style: AppFonts.bodyText,
              )
            ],
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30.w),
            child: Text("فرع الشرقيه"),
          ),




        ],
      ),
    );
  }
}
