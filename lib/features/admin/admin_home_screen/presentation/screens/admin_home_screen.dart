import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mozart_flutter_app/config/app_assets.dart';
import 'package:mozart_flutter_app/config/app_routes.dart';
import 'package:mozart_flutter_app/features/admin/admin_home_screen/managers/admin_home_cubit.dart';
import 'package:mozart_flutter_app/features/admin/admin_home_screen/presentation/screens/category/details_category.dart';
import 'package:mozart_flutter_app/features/admin/admin_home_screen/presentation/screens/product/details_product.dart';
import 'package:mozart_flutter_app/features/auth/data/data_provider/local/cach_keys.dart';
import 'package:mozart_flutter_app/features/auth/data/data_provider/local/cache.dart';
import 'package:mozart_flutter_app/features/home_layout/home/managers/home_cubit.dart';
import 'package:mozart_flutter_app/features/home_layout/home/presentation/widget/custom_container.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/custom_banner.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/custom_botton.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/custom_category.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/custom_loading.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/custom_product.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/custom_stackbar.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/navigation.dart';
import 'package:mozart_flutter_app/utils/styles/colors.dart';
import 'package:mozart_flutter_app/utils/styles/fonts.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> image = [
      AppAssets.product1,
      AppAssets.product2,
      AppAssets.product3,
    ];
    return BlocProvider(
      create: (context) => HomeCubit()
        ..getBanner()
        ..getProductInHighSold()
        ..getCategoryList(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var homeCubit = HomeCubit.get(context);

          return BlocConsumer<AdminHomeCubit, AdminHomeState>(
            listener: (context, state) {
              if (state is DeleteAllImagesInBannerSuccessState) {
                print('-------Deleted----------');
                BlocProvider.of<HomeCubit>(context).getBanner();
                return CustomSnackBar.showMessage(
                  context,
                  message: 'تمت عملية المسح بنجاح',
                  messageColor: AppColors.primaryColor,
                );
              } else if (state is DeleteAllImagesInBannerErrorState) {
                return CustomSnackBar.showMessage(
                  context,
                  message: 'حدثت مشكلة أثناء مسح اللافتة',
                  messageColor: Colors.red,
                );
              }
            },
            builder: (context, state) {
              var adminHomeCubit = AdminHomeCubit.get(context);

              return SingleChildScrollView(
                child: Column(
                  children: [
                    homeCubit.bannerModel == null ||
                            homeCubit.bannerModel!.data!.images == null ||
                            homeCubit.bannerModel!.data!.images!.isEmpty
                        ? Container()
                        : Row(
                            children: [
                              CustomButtonWidget(
                                text: AppLocalizations.of(context)!.edit,
                                height: 35.h,
                                width: 120.w,
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    RouteName.editBannerRoute,
                                    arguments:
                                        homeCubit.bannerModel!.data!.sId!,
                                  );
                                },
                              ),
                              const Spacer(),
                              state is DeleteAllImagesInBannerLoadingState
                                  ? const Center(
                                      child: CustomLoading(),
                                    )
                                  : CustomButtonWidget(
                                      text:
                                          AppLocalizations.of(context)!.delete,
                                      height: 35.h,
                                      width: 120.w,
                                      onPressed: () {
                                        /// Delete All Banners Function
                                        adminHomeCubit
                                            .deleteAllImagesInBannerFunction(
                                          bannerId:
                                              homeCubit.bannerModel!.data!.sId!,
                                        );
                                      },
                                    ),
                            ],
                          ),

                    homeCubit.bannerModel == null ||
                            homeCubit.bannerModel!.data == null ||
                            homeCubit.bannerModel!.data!.images == null
                        ? Container()
                        : const SliderHome(),

                    homeCubit.bannerModel == null
                        ? const Center(child: CustomLoading())
                        : homeCubit.bannerModel!.data == null ||
                                homeCubit.bannerModel!.data!.images == null
                            ? CustomButtonWidget(
                                text:
                                    AppLocalizations.of(context)!.addnewbanner,
                                height: 49.h,
                                width: 335.w,
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, RouteName.addNewBanner);
                                },
                              )
                            : Container(),
                    SizedBox(height: 10.h),

                    // /// Two Containers
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     GestureDetector(
                    //       onTap: () {
                    //         // Navigator.pushNamed(
                    //         //     context, RouteName.getAllProductsRoute);
                    //       },
                    //       child: DottedBorder(
                    //         borderType: BorderType.RRect,
                    //         radius: Radius.circular(8.r),
                    //         color: AppColors.primaryColor,
                    //         child: CustomContainer(
                    //           height: 80.h,
                    //           width: 160.w,
                    //           color: AppColors.white,
                    //           text:
                    //               '${AppLocalizations.of(context)!.onlyattomato200products} ${homeCubit.productModel == null ? '...' : homeCubit.productModel!.data!.length} ${AppLocalizations.of(context)!.product}',
                    //           textStyle: AppFonts.primarytext.copyWith(
                    //               color: Colors.black, fontSize: 13.sp),
                    //           image: AppAssets.logoIcon2,
                    //         ),
                    //       ),
                    //     ),
                    //     SizedBox(width: 15.w),
                    //     DottedBorder(
                    //       borderType: BorderType.RRect,
                    //       radius: Radius.circular(8.r),
                    //       color: AppColors.primaryColor,
                    //       child: CustomContainer(
                    //         height: 80.h,
                    //         width: 160.w,
                    //         color: AppColors.white,
                    //         text: AppLocalizations.of(context)!
                    //             .availableinoffersweekly20products,
                    //         textStyle:
                    //             AppFonts.primarytext.copyWith(fontSize: 13.sp),
                    //         image: AppAssets.discount,
                    //       ),
                    //     ),
                    //   ],
                    // ),

                    /// Categories
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.category,
                            style: AppFonts.primarytext.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteName.adminGetAllCategories);
                            },
                            child: Text(
                              AppLocalizations.of(context)!.showmore,
                              style: AppFonts.primarytext
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),

                    state is GetAllCategoriesLoadingState
                        ? Padding(
                            padding: EdgeInsets.only(top: 20.h),
                            child: const CustomLoading(),
                          )
                        : homeCubit.categoryModel == null
                            ? Padding(
                                padding: EdgeInsets.only(top: 20.h),
                                child: const CustomLoading(),
                              )
                            : Container(
                                margin: EdgeInsets.only(top: 20.h),
                                height: 140.h,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  // padding: EdgeInsets.symmetric(horizontal: 40.w),
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      homeCubit.categoryModel!.data!.length,
                                  itemBuilder: (context, index) {
                                    String image = homeCubit.categoryModel!
                                        .data![index].image!.url!;
                                    String text = MyCache.getString(
                                                key: CacheKeys.lang) ==
                                            'ar'
                                        ? homeCubit.categoryModel!.data![index]
                                                .nameAr ??
                                            homeCubit.categoryModel!
                                                .data![index].name!
                                        : homeCubit
                                            .categoryModel!.data![index].name!;
                                    return CustomCategory(
                                      image: image,
                                      text: text,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          FadePageRoute(
                                            builder: (context) =>
                                                AdminDetailsCategory(
                                              image: image,
                                              text: text,
                                              createdAt: homeCubit
                                                  .categoryModel!
                                                  .data![index]
                                                  .createdAt!,
                                              updatedAt: homeCubit
                                                  .categoryModel!
                                                  .data![index]
                                                  .updatedAt!,
                                              categoryId: homeCubit
                                                  .categoryModel!
                                                  .data![index]
                                                  .sId!,
                                            ),
                                          ),
                                        );
                                        // await Navigator.pushNamed(
                                        //   context,
                                        //   RouteName
                                        //       .detailsCategoryRoute,
                                        //   arguments: homeCubit
                                        //       .categoryModel!.data![index].sId!,
                                        // );
                                      },
                                    );
                                  },
                                ),
                              ),

                    // Padding(
                    //   padding: EdgeInsets.symmetric(vertical: 12.h),
                    //   child: Row(
                    //     children: [
                    //       CustomCategory(
                    //         image: AppAssets.category1,
                    //         text: AppLocalizations.of(context)!.icecreame,
                    //         onTap: () {},
                    //       ),
                    //       CustomCategory(
                    //         image: AppAssets.category2,
                    //         text: AppLocalizations.of(context)!.meatandchicken,
                    //         onTap: () {},
                    //       ),
                    //       CustomCategory(
                    //         image: AppAssets.category3,
                    //         text: AppLocalizations.of(context)!.waters,
                    //         onTap: () {},
                    //       ),
                    //       CustomCategory(
                    //         image: AppAssets.category4,
                    //         text: AppLocalizations.of(context)!.colddrinks,
                    //         onTap: () {},
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(vertical: 12.h),
                    //   child: Row(
                    //     children: [
                    //       CustomCategory(
                    //         image: AppAssets.category5,
                    //         text: AppLocalizations.of(context)!.fruitsandvegetables,
                    //         onTap: () {},
                    //       ),
                    //       CustomCategory(
                    //         image: AppAssets.category6,
                    //         text: AppLocalizations.of(context)!.bakedgoods,
                    //         onTap: () {},
                    //       ),
                    //       CustomCategory(
                    //         image: AppAssets.category7,
                    //         text: AppLocalizations.of(context)!.dairyandmilk,
                    //         onTap: () {},
                    //       ),
                    //       CustomCategory(
                    //         image: AppAssets.category8,
                    //         text: AppLocalizations.of(context)!.thebreakfast,
                    //         onTap: () {},
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    /// Products
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.featuredproducts,
                            style: AppFonts.primarytext.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteName.getAllProduct);
                            },
                            child: Text(
                              AppLocalizations.of(context)!.showmore,
                              style: AppFonts.primarytext
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // SizedBox(
                    //   height: 155.h,
                    //   width: double.infinity,
                    //   child: ListView.builder(
                    //       scrollDirection: Axis.horizontal,
                    //       itemCount: image.length,
                    //       itemBuilder: (context, index) {
                    //         return GestureDetector(
                    //           onTap: () {
                    //             Navigator.pushNamed(
                    //                 context, RouteName.detailsProductRoute);
                    //           },
                    //           child: CustomProduct(
                    //             image: image[index],
                    //             text1: AppLocalizations.of(context)!.helloketchup,
                    //             text2: "3500 دع",
                    //           ),
                    //         );
                    //       }),
                    // ),
                    state is GetProductHighNySoldLoadingState ||
                            homeCubit.productModel == null
                        ? Padding(
                            padding: EdgeInsets.only(top: 20.h),
                            child: const CustomLoading(),
                          )
                        : homeCubit.productModel!.data!.isEmpty
                            // ? Text('Empty')
                            ? Padding(
                                padding: EdgeInsets.only(top: 20.h),
                                child: const CustomLoading(),
                              )
                            : Container(
                                margin: EdgeInsets.only(bottom: 20.h),
                                height: homeCubit.bannerModel!.data!.images ==
                                        null
                                    ? MediaQuery.of(context).size.height * 0.38
                                    : 155.h,
                                width: double.infinity,
                                child: GridView.builder(
                                    // scrollDirection: Axis.horizontal,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1.1.h,
                                    ),
                                    itemCount:
                                        homeCubit.productModel!.data!.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          // Navigator.push(
                                          //   context,
                                          //   FadePageRoute(
                                          //     builder: (context) => DetailsProduct(
                                          //       // productId: homeCubit
                                          //       //     .productModel!.data![index].id!,
                                          //     ),
                                          //   ),
                                          // );
                                          // homeCubit.getSpecificProductFunction(
                                          //   productId: homeCubit
                                          //       .productModel!.data![index].id!,
                                          // );
                                        },
                                        child: CustomProduct(
                                          cubit: homeCubit,
                                            model: homeCubit
                                                .productModel!.data![index],
                                            width: 180.w,
                                            image: homeCubit.productModel!
                                                .data![index].image!.url!,
                                            text1: MyCache.getString(
                                                        key: CacheKeys.lang) ==
                                                    'ar'
                                                ? homeCubit.productModel!
                                                    .data![index].titleAr!
                                                : homeCubit.productModel!
                                                    .data![index].title!,
                                            text2:
                                                '${MyCache.getString(key: CacheKeys.role) == 'user-normal' ? homeCubit.productModel!.data![index].priceNormal : homeCubit.productModel!.data![index].priceWholesale} ${AppLocalizations.of(context)!.egp}'),
                                      );
                                    }),
                              ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
