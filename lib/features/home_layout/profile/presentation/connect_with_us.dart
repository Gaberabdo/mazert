import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mozart_flutter_app/config/app_assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mozart_flutter_app/config/app_routes.dart';
import 'package:mozart_flutter_app/features/home_layout/profile/presentation/message_connect_with_us.dart';
import 'package:mozart_flutter_app/features/home_layout/profile/presentation/widget/custom_container_in_connect_with_us.dart';
import 'package:mozart_flutter_app/utils/styles/colors.dart';
import 'package:mozart_flutter_app/utils/styles/fonts.dart';

class ConnectWithUs extends StatelessWidget {
   ConnectWithUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> image=[
      AppAssets.messageIcon,
      AppAssets.callIcon,
      AppAssets.facebookIcon,
      AppAssets.whatsappIcon,
      AppAssets.instagramIcon,
    ];
    List<String> text=[
      AppLocalizations.of(context)!.message,
      AppLocalizations.of(context)!.call,
      AppLocalizations.of(context)!.facebook,
      AppLocalizations.of(context)!.whatsaap,
      AppLocalizations.of(context)!.instagram,
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
          title: Text(
              AppLocalizations.of(context)!.connectwithus,
            style: AppFonts.titleScreen.copyWith(height: 0),
          ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 60.h,),
          Expanded(
            child: ListView.builder(
              itemCount: image.length,
                itemBuilder: (context ,index){
                  return GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, RouteName.messageConnectWithUsRoute);

                      },
                      child: CustomContainerConnectWithUs(image: image[index], text: text[index],));
                }
            ),
          ),
        ],
      ),
    );
  }
}
