import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mozart_flutter_app/config/app_assets.dart';
import 'package:mozart_flutter_app/config/app_routes.dart';
import 'package:mozart_flutter_app/features/home_layout/home/presentation/product/presentation/details_product.dart';
import 'package:mozart_flutter_app/features/home_layout/home/presentation/widget/custom_container.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/custom_category.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/custom_page_view.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/custom_product.dart';
import 'package:mozart_flutter_app/utils/styles/colors.dart';
import 'package:mozart_flutter_app/utils/styles/fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  PageController? pageController;
  List<String> image=[
   AppAssets.product1,
   AppAssets.product2,
   AppAssets.product3,
  ];
@override
  void initState() {
    // TODO: implement initState
    // super.initState();
  pageController = PageController(
    initialPage: 0,
  );
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 150.h,
            child: CustomPageView(
              onPageChanged: (p0) {},
              pageController: pageController!,
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomContainer(
                  height: 70.h,
                  width: 169.w,
                  color: AppColors.primaryColor,
                  text: AppLocalizations.of(context)!.onlyattomato200products,
                  textStyle: AppFonts.primarytext
                      .copyWith(color: AppColors.white, fontSize: 13.sp),
                  image: "assets/images/logoIcon.png"),
              DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(8.r),
                color: AppColors.primaryColor,
                child: CustomContainer(
                    height: 70.h ,
                    width: 159.w,
                    color: AppColors.white,
                    text: AppLocalizations.of(context)!
                        .availableinoffersweekly20products,
                    textStyle: AppFonts.primarytext.copyWith(fontSize: 13.sp),
                    image: AppAssets.discount),
              ),
            ],
          ),
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 12.h),
            child: Row(
              children: [
                CustomCategory(
                  image:AppAssets.category1,
                  text: AppLocalizations.of(context)!.icecreame,
                ),
                CustomCategory(
                  image:AppAssets.category2,
                  text: AppLocalizations.of(context)!.meatandchicken,
                ),
                CustomCategory(
                  image: AppAssets.category3,
                  text: AppLocalizations.of(context)!.waters,
                ),
                CustomCategory(
                  image: AppAssets.category4,
                  text: AppLocalizations.of(context)!.colddrinks,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Row(
              children: [
                CustomCategory(
                  image: AppAssets.category5,
                  text: AppLocalizations.of(context)!.fruitsandvegetables,
                ),
                CustomCategory(
                  image: AppAssets.category6,
                  text: AppLocalizations.of(context)!.bakedgoods,
                ),
                CustomCategory(
                  image: AppAssets.category7,
                  text: AppLocalizations.of(context)!.dairyandmilk,
                ),
                CustomCategory(
                  image: AppAssets.category8,
                  text: AppLocalizations.of(context)!.thebreakfast,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.featuredproducts,
                  style: AppFonts.primarytext
                      .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                ),
                Text(
                  AppLocalizations.of(context)!.showmore,
                  style:
                      AppFonts.primarytext.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
           SizedBox(
             height: 155.h,
             width: double.infinity,
             child: ListView.builder(
               scrollDirection: Axis.horizontal,
               itemCount: image.length,
                 itemBuilder: (context ,index){
                   return  GestureDetector(
                     onTap: (){
                       Navigator.pushNamed(context, RouteName.detailsProductRoute);

                     },
                     child: CustomProduct(
                       image: image[index],
                       text1: AppLocalizations.of(context)!.helloketchup,
                       text2: "3500 دع",
                     ),
                   );
                 }

             ),
           ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.topratedproducts,
                  style: AppFonts.primarytext
                      .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                ),
                Text(
                  AppLocalizations.of(context)!.showmore,
                  style:
                  AppFonts.primarytext.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 155.h,
            width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: image.length,
                itemBuilder: (context ,index){
                  return  CustomProduct(
                    image: image[1],
                    text1: AppLocalizations.of(context)!.helloketchup,
                    text2: "3500 دع",
                  );
                }

            ),
          ),
        ],
      ),
    );
  }
}
