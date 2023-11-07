import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mozart_flutter_app/utils/styles/colors.dart';
import 'package:mozart_flutter_app/utils/styles/fonts.dart';

class CustomTextFormFiled extends StatelessWidget {
CustomTextFormFiled( {required this.label,required this.controller,this.suffixIcon,this.obscureText=false,this.validator});
String label;
final Widget? suffixIcon;
final bool obscureText;
final String? Function(String?)? validator;

TextEditingController controller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 20.h,left: 10.w,right: 10.w),
      child: SizedBox(
        height: 48.h,
        child: TextFormField(
          validator: validator,
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            label:Text(label,),
            labelStyle: AppFonts.bodyText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide: BorderSide(
                width: 1.w,
                color: AppColors.grey
              ),

            )
          ),

        ),
      ),
    );
  }
}
