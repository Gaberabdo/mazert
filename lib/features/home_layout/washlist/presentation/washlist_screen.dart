import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mozart_flutter_app/config/app_assets.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/custom_product.dart';

class WashListScreen extends StatelessWidget {
  const WashListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> image = [
    AppAssets.product1,
    AppAssets.product2,
    AppAssets.product3,
    AppAssets.product3,
    ];
    return GridView.builder(
      itemCount: image.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      primary: false,
      padding: EdgeInsets.all(20.sp),
      itemBuilder: (context, index) {
        return CustomProduct(
          height: 160,
          width: 155,
          image: image[index],
          text1: AppLocalizations.of(context)!.helloketchup,
          text2: "3500 دع",
        );
      },
    );
  }
}
