import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mozart_flutter_app/config/app_routes.dart';
import 'package:mozart_flutter_app/features/home_layout/cart/presentation/add_adress_to%20confirm_order.dart';
import 'package:mozart_flutter_app/features/home_layout/cart/presentation/widget/custom_payment_summary.dart';
import 'package:mozart_flutter_app/features/home_layout/cart/presentation/widget/custom_previous_adress.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/custom_botton.dart';
import 'package:mozart_flutter_app/utils/styles/colors.dart';
import 'package:mozart_flutter_app/utils/styles/fonts.dart';

class PreviousAdress extends StatelessWidget {
  const PreviousAdress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          AppLocalizations.of(context)!.order,
          style: AppFonts.titleScreen.copyWith(height: 0),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.previousorders,
                    style: TextStyle(
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
            ),
            CustomPreviousAdress(),
            SizedBox(height: 20.h,),
            CustomButtonWidget(
              height: 48.h,
              width: 227.w,
              onPressed: () {

                    Navigator.pushNamed(context, RouteName.addAdressToConfirmOrderRoute);

              },
              text: AppLocalizations.of(context)!.addnewadress,
            ),
            SizedBox(height: 20.h,),
            CustomPaymentSummary(),
            SizedBox(height: 10.h,),
            Text(AppLocalizations.of(context)!.reviewtherequest,
            style: AppFonts.primarytext,
            ),
            SizedBox(height: 10.h,),
            CustomButtonWidget(
              text:AppLocalizations.of(context)!.order,
              height: 48.h,
              width: 227.w,
            )
          ],
        ),
      ),
    );
  }
}
