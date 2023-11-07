import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mozart_flutter_app/config/app_assets.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/custom_category.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> image=[
     AppAssets.category1,
     AppAssets.category2,
     AppAssets.category3,
     AppAssets.category4,
     AppAssets.category5,
     AppAssets.category6,
     AppAssets.category7,
     AppAssets.category8,
     AppAssets.category1,
     AppAssets.category2,
     AppAssets.category3,
     AppAssets.category4,
      AppAssets.category5,
      AppAssets.category6,
      AppAssets.category7,
      AppAssets.category8,
      AppAssets.category8,
      AppAssets.category8,
    ];
    List<String> text =[
      AppLocalizations.of(context)!.waters,
      AppLocalizations.of(context)!.meatandchicken,
      AppLocalizations.of(context)!.icecreame,
      AppLocalizations.of(context)!.bakedgoods,
      AppLocalizations.of(context)!.fruitsandvegetables,
      AppLocalizations.of(context)!.colddrinks,
      AppLocalizations.of(context)!.waters,
      AppLocalizations.of(context)!.thebreakfast,
      AppLocalizations.of(context)!.dairyandmilk,
      AppLocalizations.of(context)!.waters,
      AppLocalizations.of(context)!.meatandchicken,
      AppLocalizations.of(context)!.icecreame,
      AppLocalizations.of(context)!.bakedgoods,
      AppLocalizations.of(context)!.fruitsandvegetables,
      AppLocalizations.of(context)!.colddrinks,
      AppLocalizations.of(context)!.waters,
      AppLocalizations.of(context)!.thebreakfast,
      AppLocalizations.of(context)!.dairyandmilk,
    ];
    return GridView.builder(
      itemCount: image.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      primary: false,
      padding: EdgeInsets.all(10.sp),
      itemBuilder: (context, index) {
        return CustomCategory(image: image[index], text:text[index] );
      },
    );
  }
}
