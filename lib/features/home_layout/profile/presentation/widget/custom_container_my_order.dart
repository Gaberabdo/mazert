import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mozart_flutter_app/config/app_assets.dart';
import 'package:mozart_flutter_app/utils/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mozart_flutter_app/utils/styles/fonts.dart';

class CustomContainerMyOrder extends StatelessWidget {
   CustomContainerMyOrder({Key? key,required this.text,required this.color}) : super(key: key);
  String text;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        horizontal: 20.w,vertical: 8.h
      ),
      child: Container(
        padding: EdgeInsets.only(top: 7.h,bottom: 5.h,left: 16.w,right: 16.w),
        height: 116.h,
        width: 335,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(
            width: 0.2.w,
            color: AppColors.grey
          )
        ),
        child: Column(
          children: [
             Row(
               children: [
                 Text( AppLocalizations.of(context)!.ordernumber,
                 style: AppFonts.blackText,
                 ),
                 SizedBox(width: 5.w,),
                 Text( "368",
                 style: AppFonts.blackText.copyWith(fontWeight: FontWeight.bold),
                 ),
                 Spacer(),
                 Text("Mon , 15 may 2023")
               ],
             ),
            SizedBox(height: 5.h,),
            Row(
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 5.w),
                  child: SvgPicture.asset(AppAssets.reloadIcon),
                ),
              ],
            ),
           SizedBox(height: 5.h,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context)!.reorder,
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500
                  ),

                ),
                Text(text,
                style: TextStyle(
                  color: color,
                ),
                ),
                Row(
                  children: [
                    Text( AppLocalizations.of(context)!.showproducts,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,

                    ),
                    ),
                    Icon(Icons.arrow_forward_ios,size: 17.sp,)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
