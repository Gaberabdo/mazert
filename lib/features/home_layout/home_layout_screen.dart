import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mozart_flutter_app/config/app_assets.dart';
import 'package:mozart_flutter_app/config/app_routes.dart';
import 'package:mozart_flutter_app/features/home_layout/cart/presentation/cart_screen.dart';
import 'package:mozart_flutter_app/features/home_layout/category/presentation/category_screen.dart';
import 'package:mozart_flutter_app/features/home_layout/follow_order.dart';
import 'package:mozart_flutter_app/features/home_layout/home/presentation/home_screen.dart';
import 'package:mozart_flutter_app/features/home_layout/profile/presentation/profile_screen.dart';
import 'package:mozart_flutter_app/features/home_layout/washlist/presentation/washlist_screen.dart';
import 'package:mozart_flutter_app/utils/styles/colors.dart';
import 'package:mozart_flutter_app/utils/styles/fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeLayoutScreen extends StatefulWidget {
   HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  State<HomeLayoutScreen> createState() => _HomeLayoutScreenState();
}
class _HomeLayoutScreenState extends State<HomeLayoutScreen> {
   int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages= [
      HomeScreen(),
      CategoryScreen(),
      CartScreen(),
      WashListScreen(),
      ProfileScreen(),
    ];
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          currentIndex==1?AppLocalizations.of(context)!.mypersonalfile:
          AppLocalizations.of(context)!.mozart
          ,
          style: AppFonts.banadoraText,
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
              onTap: (){
               Navigator.pushNamed(context, RouteName.followOrderRoute);

              },
              child: SvgPicture.asset(AppAssets.followOrderIcon)),
        ],
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index){
        setState(() {
          currentIndex=index;
        });
        },
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.category_outlined),label: "Category"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_rounded),label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined),label: "Washlist"),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),label: "Profile"),
        ],
      ),

    );
  }
}
