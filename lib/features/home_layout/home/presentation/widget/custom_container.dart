import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mozart_flutter_app/utils/styles/colors.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer(
      {Key? key,
      required this.color,
      required this.text,
      required this.textStyle,
      required this.image,
      required this.height,
        required this.width
      })
      : super(key: key);
  Color color;
  String text;
  String image;
  TextStyle textStyle;

  double height;
  double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
        padding: EdgeInsets.all(7.sp),
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 85.w,
              child: Text(
                text,
                style: textStyle,
              ),
            ),
            Image.asset(
              image,
              width: 60.w,
              height: 60.h,
            )
          ],
        ),
      ),
    );
  }
}
