import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mozart_flutter_app/utils/styles/colors.dart';

class CustomProduct extends StatelessWidget {
   CustomProduct({Key? key  ,required this.text1,required this.text2, required this.image,this.height=155,this.width=135}) : super(key: key);
String text1;
String text2;
String image;
double height;
double width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.w,),
      child: Stack(
        children: [
          Container(padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
            height: height.h,
            width: width.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                    color: AppColors.grey,
                    width: 0.2.w
                )
            ),
            child: Column(
              children: [
                Image.asset(image,width: 99.w,height: 75.h,),
                Row(
                  children: [
                    Text(text1,),
                  ],
                ),
                Row(
                  children: [
                    Text(text2),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 10.h,
            left: 10.w,
            child: CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              minRadius: 10.r,
              child: Icon(Icons.add,color: AppColors.white,),
            ),
          )
        ],
      ),
    );
  }
}
