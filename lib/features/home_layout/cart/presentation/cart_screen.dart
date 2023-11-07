import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mozart_flutter_app/config/app_assets.dart';
import 'package:mozart_flutter_app/config/app_routes.dart';
import 'package:mozart_flutter_app/features/home_layout/cart/presentation/add_adress_to%20confirm_order.dart';
import 'package:mozart_flutter_app/features/home_layout/cart/presentation/previous_adress.dart';
import 'package:mozart_flutter_app/features/home_layout/cart/presentation/widget/custom_product_in_cart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/custom_botton.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> image =[
   AppAssets.product1,
   AppAssets.product2,
   AppAssets.product3,
   AppAssets.product1,
    ];
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 3,
                itemBuilder: (context,index){
                  return CustomProductInCart(
                    image: image[index],
                    text: AppLocalizations.of(context)!.sadiaburger,
                    text2: AppLocalizations.of(context)!.beefburgerwithArabic,
                    text3: "4,000 د.ع",);
                }

            ),
          ),
          Spacer(),
          Row(
            children: [
              CustomButtonWidget(
                onPressed: (){
                  Navigator.pushNamed(context, RouteName.previousAdressRoute);

                },
                text: AppLocalizations.of(context)!.next,
                height: 48.h,
                width: 200,
              ),
              Spacer(),
              Text("د.ع 20,500")
            ],
          ),
        ],
      ),
    );
  }
}
