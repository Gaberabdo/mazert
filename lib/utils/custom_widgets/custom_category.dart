import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mozart_flutter_app/utils/styles/colors.dart';

class CustomCategory extends StatelessWidget {
   CustomCategory({Key? key , required this.image,required this.text}) : super(key: key);
String image;
String text;
  @override

  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRect(
          child:Image.asset(image) ,
        ),
        SizedBox(
            width: 80.w,
            child: Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
              ),

            )
        )
      ],
    );
  }
}
