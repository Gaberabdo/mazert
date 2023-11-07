import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mozart_flutter_app/config/app_assets.dart';
import 'package:mozart_flutter_app/utils/styles/colors.dart';
import 'package:mozart_flutter_app/utils/styles/fonts.dart';

class CustomProductInCart extends StatefulWidget {
   CustomProductInCart({Key? key , required this.image ,required this.text ,required this.text2 ,required this.text3,this.quantity=1 }) : super(key: key);
 String image;
 String text;
 String text2;
 String text3;
 int quantity;

  @override
  State<CustomProductInCart> createState() => _CustomProductInCartState();
}

class _CustomProductInCartState extends State<CustomProductInCart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.h),
      child: Container(
        height: 165.h,
        width: 335.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(
            width: 0.2.w,
            color: AppColors.grey
          )
        ),
        child: Row(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 5.h,left: 16.w,right: 16.w,bottom: 5.h),

              child: Column(
                children: [
                  SvgPicture.asset(AppAssets.deleteIcon),
                  Spacer(),
                  SvgPicture.asset(AppAssets.fullLoveIcon),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 5.h,left: 16.w,right: 11.w,bottom: 5.h),
              child: Column(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(widget.text,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(
                    width: 160.w,
                    child: Text(widget.text2,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                         setState(() {
                           widget.quantity++;
                         });
                        },
                        child: Card(
                          elevation: 1,
                          child: Container(
                            height: 25.h,
                            width: 25.w,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(5.w),
                            ),
                            child: Center(
                              child: Icon(Icons.add,color: AppColors.white,),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5.w,),
                      Text("${widget.quantity}",
                        style: TextStyle(
                          fontSize: 18.sp
                        ),
                      ),
                      SizedBox(width: 5.w,),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            widget.quantity--;
                          });
                        },
                        child: Card(
                          elevation: 1,
                          child: Container(
                            height: 25.h,
                            width: 25.w,
                            decoration: BoxDecoration(
                              color: AppColors.blue,
                              borderRadius: BorderRadius.circular(5.w),
                            ),
                            child: Center(
                              child: Icon(Icons.remove),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Text(widget.text3,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 165.h,
              width: 127.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                      width: 0.2.w,
                      color: AppColors.grey
                  )
              ),
              child: Image.asset(widget.image),
            ),

          ],
        ),
      ),
    );
  }
}
