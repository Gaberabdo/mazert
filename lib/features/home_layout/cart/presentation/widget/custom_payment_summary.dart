import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mozart_flutter_app/utils/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomPaymentSummary extends StatelessWidget {
  const CustomPaymentSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        padding: EdgeInsets.only(top: 16.h,left: 16.w,right: 16.w),
        width: 335,
          height: 190,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            width: 0.2.w,
            color: AppColors.grey
          ),
        ),
        child: Column(
          children: [
            Text( AppLocalizations.of(context)!.paymentsummary,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500
            ),),
            SizedBox(height: 10.h,),
            Row(
              children: [
                Text( AppLocalizations.of(context)!.initialtotal,),
                Spacer(),
                Text( "20,500 د.ع"),
              ],
            ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 5.h),
              child: Divider(
                thickness: 0.2.w,
                color: AppColors.grey,
              ),
            ),
            Row(
              children: [
                Text( AppLocalizations.of(context)!.discountcoupon,),
                Spacer(),

                Text( "20,500 د.ع"),
              ],
            ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 5.h),
              child: Divider(
                thickness: 0.2.w,
                color: AppColors.grey,
              ),
            ),
            Row(
              children: [
                Text( AppLocalizations.of(context)!.finalcashtotal,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Spacer(),

                Text( "20,500 د.ع",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
