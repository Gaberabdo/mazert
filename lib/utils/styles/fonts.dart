import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mozart_flutter_app/utils/constants/constants.dart';
import 'package:mozart_flutter_app/utils/styles/colors.dart';


class AppFonts {
  static final TextStyle titleScreen = AppConstants.getTextStyle(
      fontWeight:FontWeight.w500,
      fontSize: 20.sp,
      letterSpacing: 0,
      height: 7.h,
      color: AppColors.white);
  static final TextStyle bodyText = AppConstants.getTextStyle(
      fontWeight:FontWeight.normal,
      fontSize: 18.sp,
      letterSpacing: 0,
      height: 0,
      color: AppColors.grey);
  static final TextStyle greyText = AppConstants.getTextStyle(
      fontWeight:FontWeight.normal,
      fontSize: 16.sp,
      letterSpacing: 0,
      height: 0,
      color: AppColors.grey2);
  static final TextStyle primarytext = AppConstants.getTextStyle(
      fontWeight:FontWeight.normal,
      fontSize: 16.sp,
      letterSpacing: 0,
      height: 0,
      color: AppColors.primaryColor);
  static final TextStyle banadoraText = GoogleFonts.aclonica(
    fontWeight: FontWeight.normal,
    fontSize: 24.sp,
    color: AppColors.white,
      height: 0.h
  );
  static final TextStyle blackText = GoogleFonts.cairo(
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,

      height: 0.h
  );
  static final TextStyle black2Text = GoogleFonts.cairo(
    fontWeight: FontWeight.bold,
    fontSize: 20.sp,
  );

}