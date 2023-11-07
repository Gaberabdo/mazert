import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mozart_flutter_app/config/app_assets.dart';
import 'package:mozart_flutter_app/config/app_routes.dart';
import 'package:mozart_flutter_app/features/home_layout/profile/presentation/connect_with_us.dart';
import 'package:mozart_flutter_app/features/home_layout/profile/presentation/my_account.dart';
import 'package:mozart_flutter_app/features/home_layout/profile/presentation/my_order.dart';
import 'package:mozart_flutter_app/features/home_layout/profile/presentation/widget/custom_container_profile.dart';
import 'package:mozart_flutter_app/features/home_layout/profile/presentation/widget/show_language_bottom_shet.dart';
import 'package:mozart_flutter_app/features/home_layout/profile/presentation/widget/show_tell_us_about_your_experience_bottom_shet.dart';
import 'package:mozart_flutter_app/utils/styles/colors.dart';
import 'package:mozart_flutter_app/utils/styles/fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatefulWidget {
   ProfileScreen({Key? key}) : super(key: key);


  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
TextEditingController controller=TextEditingController();
class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    List<Widget> icon=[

      SvgPicture.asset(AppAssets.profileIcon),
      SvgPicture.asset(AppAssets.myorderIcon),
      SvgPicture.asset(AppAssets.locationIcon),
      SvgPicture.asset(AppAssets.walletIcon),
      SvgPicture.asset(AppAssets.earphonesIcon),
      SvgPicture.asset(AppAssets.textIcon),
      SvgPicture.asset(AppAssets.language),
      SvgPicture.asset(AppAssets.signoutIcon),
    ];
    List<String> text=[
    AppLocalizations.of(context)!.editprofile,
    AppLocalizations.of(context)!.myrequests,
    AppLocalizations.of(context)!.theaddress,
    AppLocalizations.of(context)!.banadorawallet,
    AppLocalizations.of(context)!.connectwithus,
    AppLocalizations.of(context)!.tellusaboutyourexperience,
    AppLocalizations.of(context)!.language,
    AppLocalizations.of(context)!.signout,

    ];

    return Center(
      child: Column(
        children: [
          SizedBox(height: 32.h,),
          CircleAvatar(
            radius: 61.r,
            backgroundColor: AppColors.primaryColor,
            child: CircleAvatar(
              radius:53,
              backgroundColor: AppColors.white,
              child: CircleAvatar(
                radius: 52.r,
                backgroundColor: AppColors.primaryColor,
                child: Icon(Icons.person_2_outlined,color: AppColors.white,size: 40.sp,),
              ),
            ),
          ),
          Text("Amira Adel",style: TextStyle(
            fontSize: 18.sp,
            height: 2
          ),),
          Text("01061489546",style: AppFonts.bodyText.copyWith(fontSize: 15.sp),),
          SizedBox(height: 20.h,),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context,index){
                  return GestureDetector(
                      onTap: (){
                     index==0? Navigator.pushNamed(context, RouteName.myAccountRoute) :
                         index==1?Navigator.pushNamed(context, RouteName.myOrderRoute):
                         index==4?Navigator.pushNamed(context, RouteName.connectWithUsRoute):
                    index==5?showTellUsAboutYourExperienceBottomShet():
                    showLanguageBottomShet();
                     ;
                      },
                      child: CustomContainerProfile(icon: icon[index], text: text[index]));
                },
                separatorBuilder:(context,index){
                  return Padding(
                    padding:  EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 5.h
                    ),
                    child: Divider(
                      thickness: 1,
                    ),
                  );
                },
                itemCount: text.length),
          ),
        ],
      ),
    );
  }
  void showLanguageBottomShet() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.r),
            topLeft: Radius.circular(20.r),
          )
        ),
        context: context,
        builder: (context) {
          return ShowLnguageBottomShet();
        });
  }
  void showTellUsAboutYourExperienceBottomShet() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.r),
            topLeft: Radius.circular(20.r),

          ),
        ),
        context: context,
        builder: (context) {
          return ShowTellUsAboutYourExperienceBottomShet(controller: controller,);
        });
  }

}


