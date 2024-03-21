import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mozart_flutter_app/config/app_routes.dart';
import 'package:mozart_flutter_app/features/admin/admin_home_screen/managers/admin_home_cubit.dart';
import 'package:mozart_flutter_app/features/home_layout/home/managers/home_cubit.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/cache_image.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/custom_botton.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/custom_loading.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/custom_stackbar.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/custom_text_form_filed.dart';
import 'package:mozart_flutter_app/utils/styles/colors.dart';
import 'package:mozart_flutter_app/utils/styles/fonts.dart';

class EditToProduct extends StatefulWidget {
  final String productId;

  const EditToProduct({
    Key? key,
    required this.productId,
  }) : super(key: key);

  @override
  State<EditToProduct> createState() => _EditToProductState();
}

class _EditToProductState extends State<EditToProduct> {
  String? imagePath;
  TextEditingController nameOfProductController = TextEditingController();
  TextEditingController nameArOfProductController = TextEditingController();
  TextEditingController descriptionOfProductController =
      TextEditingController();
  TextEditingController descriptionArOfProductController =
      TextEditingController();
  TextEditingController quantityOfProductController = TextEditingController();

  TextEditingController categoryOfProductController = TextEditingController();

  TextEditingController priceNormalController = TextEditingController();
  TextEditingController priceWholesaleController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imagePath = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit()..getSpecificProductFunction(productId: widget.productId),
      child: BlocConsumer<AdminHomeCubit, AdminHomeState>(
        listener: (context, state) {
          if (state is EditSpecificProductSuccessState) {
            Navigator.pushReplacementNamed(
                context, RouteName.adminHomeLayoutRoute);
            return CustomSnackBar.showMessage(
              context,
              message: 'تمت عملية المسح بنجاح',
              messageColor: AppColors.primaryColor,
            );
          }
        },
        builder: (context, state) {
          var adminHomeCubit = AdminHomeCubit.get(context);

          return BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              var cubit = HomeCubit.get(context);

              return Scaffold(
                appBar: AppBar(
                  backgroundColor: AppColors.primaryColor,
                  title: Text(
                    AppLocalizations.of(context)!.edit,
                    style: AppFonts.titleScreen.copyWith(height: 0),
                  ),
                  centerTitle: true,
                ),
                body: state is GetSpecificProductLoadingState ||
                        cubit.specificProductModel == null
                    ? const Center(
                        child: CustomLoading(),
                      )
                    : Form(
                        key: formKey,
                        child: SingleChildScrollView(
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(height: 30.h),
                                GestureDetector(
                                  onTap: _pickImage,
                                  child: DottedBorder(
                                    borderType: BorderType.RRect,
                                    radius: Radius.circular(8.r),
                                    padding: EdgeInsets.all(10.sp),
                                    color: AppColors.primaryColor,
                                    child: imagePath != null
                                        ? Image.file(
                                            File(imagePath!),
                                            height: 200.h,
                                            width: 200.w,
                                            fit: BoxFit.cover,
                                          )
                                        : CachedImage(
                                            link: cubit.specificProductModel!
                                                .data!.image!.url,
                                            width: 200.w,
                                            height: 100.h,
                                            borderRadius: 12.r,
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                Text(
                                  'أضغط علي الصورة لتغيرها',
                                  style: GoogleFonts.cairo(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.sp,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20.h),
                                    Padding(
                                      padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                      child: CustomTextFormFiled(
                                        floatingLabelBehavior: FloatingLabelBehavior.always,
                                        label: 'العنوان باللغة العربية',
                                        keyboardType: TextInputType.name,
                                        hintText: cubit
                                            .specificProductModel!.data!.titleAr,
                                        controller: nameArOfProductController,
                                        validator: (p0) {
                                          if (p0!.isEmpty) {
                                            return 'برجاء ملئ هذا الحقل لتحديث أسم الفئة';
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 20.h),
                                    Padding(
                                      padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                      child: CustomTextFormFiled(
                                        floatingLabelBehavior: FloatingLabelBehavior.always,
                                        label: 'العنوان باللغة الانجليزية',
                                        keyboardType: TextInputType.name,
                                        hintText:
                                        cubit.specificProductModel!.data!.title,
                                        controller: nameOfProductController,
                                        validator: (p0) {
                                          if (p0!.isEmpty) {
                                            return 'برجاء ملئ هذا الحقل لتحديث أسم الفئة';
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 20.h),
                                    cubit.specificProductModel!.data!
                                        .descriptionAr == null ? Container() : Padding(
                                      padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                      child: CustomTextFormFiled(
                                        floatingLabelBehavior: FloatingLabelBehavior.always,
                                        label: 'تفاصيل المنتج باللغة العربية',
                                        keyboardType: TextInputType.name,
                                        hintText: cubit.specificProductModel!.data!
                                            .descriptionAr ?? '',
                                        controller:
                                        descriptionArOfProductController,
                                        validator: (p0) {
                                          if (p0!.isEmpty) {
                                            return 'برجاء ملئ هذا الحقل لتحديث أسم الفئة';
                                          }
                                        },
                                      ),
                                    ),
                                    cubit.specificProductModel!.data!
                                        .descriptionAr == null ? Container() : SizedBox(height: 20.h),

                                    cubit.specificProductModel!.data!
                                        .description == null ? Container() : Padding(
                                      padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                      child: CustomTextFormFiled(
                                        floatingLabelBehavior: FloatingLabelBehavior.always,
                                        label: 'تفاصيل المنتج باللغة الأنجليزية',
                                        keyboardType: TextInputType.name,
                                        hintText: cubit.specificProductModel!.data!
                                            .description,
                                        controller: descriptionOfProductController,
                                        validator: (p0) {
                                          if (p0!.isEmpty) {
                                            return 'برجاء ملئ هذا الحقل لتحديث أسم الفئة';
                                          }
                                        },
                                      ),
                                    ),
                                    cubit.specificProductModel!.data!
                                        .descriptionAr == null ? Container() : SizedBox(height: 20.h),

                                    Padding(
                                      padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                      child: CustomTextFormFiled(
                                        floatingLabelBehavior: FloatingLabelBehavior.always,
                                        label: 'الكمية',
                                        keyboardType: TextInputType.name,
                                        hintText: cubit
                                            .specificProductModel!.data!.quantity
                                            .toString(),
                                        controller: quantityOfProductController,
                                        validator: (p0) {
                                          if (p0!.isEmpty) {
                                            return 'برجاء ملئ هذا الحقل لتحديث أسم الفئة';
                                          }
                                        },
                                      ),
                                    ),

                                    SizedBox(height: 20.h),
                                    Padding(
                                      padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                      child: CustomTextFormFiled(
                                        floatingLabelBehavior: FloatingLabelBehavior.always,
                                        label: 'الكمية',
                                        keyboardType: TextInputType.name,
                                        hintText: cubit
                                            .specificProductModel!.data!.priceNormal
                                            .toString(),
                                        controller: priceNormalController,
                                        validator: (p0) {
                                          if (p0!.isEmpty) {
                                            return 'برجاء ملئ هذا الحقل لتحديث أسم الفئة';
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 20.h),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: CustomTextFormFiled(
                                    floatingLabelBehavior: FloatingLabelBehavior.always,
                                    label: 'السعر بالجملة',
                                    keyboardType: TextInputType.name,
                                    hintText: cubit.specificProductModel!.data!
                                        .priceWholesale
                                        .toString(),
                                    controller: priceWholesaleController,
                                    validator: (p0) {
                                      if (p0!.isEmpty) {
                                        return 'برجاء ملئ هذا الحقل لتحديث أسم الفئة';
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(height: 30.h),
                                imagePath == null
                                    ? Container()
                                    : state is EditSpecificProductLoadingState
                                        ? const Center(
                                            child: CustomLoading(),
                                          )
                                        : CustomButtonWidget(
                                            onPressed: () async {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                if (imagePath != null) {
                                                  File imageFile =
                                                      File(imagePath!);
                                                  adminHomeCubit
                                                      .updateSpecificProductFunction(
                                                    productId: widget.productId,
                                                    image: imageFile,
                                                    imageId: cubit
                                                        .specificProductModel!
                                                        .data!
                                                        .image!
                                                        .imageId!,
                                                    title:
                                                        nameOfProductController
                                                            .text,
                                                    titleAr:
                                                        nameArOfProductController
                                                            .text,
                                                    description:
                                                        descriptionOfProductController
                                                            .text,
                                                    descriptionAr:
                                                        descriptionArOfProductController
                                                            .text,
                                                    quantity:
                                                        quantityOfProductController
                                                            .text,
                                                    priceNormal:
                                                        priceNormalController
                                                            .text,
                                                    priceWholesale:
                                                        priceWholesaleController
                                                            .text,
                                                  );
                                                }
                                              }
                                              // print(widget.productId);
                                              // print(cubit.specificProductModel!
                                              //     .data!.image!.imageId!);
                                              // }
                                            },
                                            borderRadius: 10.r,
                                            text: AppLocalizations.of(context)!
                                                .submit,
                                            width: 335.w,
                                            height: 49.h,
                                          ),
                              ],
                            ),
                          ),
                        ),
                      ),
              );
            },
          );
        },
      ),
    );
  }
}
