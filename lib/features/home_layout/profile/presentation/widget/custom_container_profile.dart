import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainerProfile extends StatelessWidget {
   CustomContainerProfile({Key? key ,required this.icon ,required this.text,}) : super(key: key);
  Widget icon;
  String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 8.h),
      child: Row(
        children: [
          icon,
          SizedBox(width: 10.w,),
          Text(text,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
          )
        ],
      ),
    );
  }
}
