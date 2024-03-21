import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mozart_flutter_app/features/auth/data/data_provider/local/cach_keys.dart';
import 'package:mozart_flutter_app/features/auth/data/data_provider/local/cache.dart';
import 'package:mozart_flutter_app/features/auth/data/data_provider/remote/dio_helper.dart';
import 'package:mozart_flutter_app/features/home_layout/home/data/models/banner_model.dart';
import 'package:mozart_flutter_app/features/home_layout/home/data/models/category_model.dart';
import 'package:mozart_flutter_app/features/home_layout/home/data/models/product_model.dart';
import 'package:mozart_flutter_app/features/home_layout/home/data/models/products_in_category.dart';
import 'package:mozart_flutter_app/features/home_layout/home/data/models/specific_banner_model.dart';
import 'package:mozart_flutter_app/features/home_layout/home/data/models/specific_category.dart';
import 'package:mozart_flutter_app/features/home_layout/home/data/models/specific_product_model.dart';
import 'package:mozart_flutter_app/utils/constants/constants.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();

  BannerModel? bannerModel;
  CategoryModel? categoryModel;
  List<CategoryData> categoryData = [];
  List<CategoryData> searchCategoryList = [];
  ProductModel? productModel;
  List<ProductData> searchProductList = [];
  SpecificProductModel? specificProductModel;
  ProductsInCategoryModel? productsInCategoryModel;
  SpecificBannerModel? specificBannerModel;
  SpecificCategoryModel? specificCategoryModel;

  /// Get Banner
  Future<void> getBanner() async {
    emit(GetBannersLoadingState());
    await dioHelper
        .getData(endPoint: AppConstants.getBannerUrl)
        .then((response) {
      bannerModel = BannerModel.fromJson(response.data);
      emit(GetBannersSuccessState());
    }).catchError((error) {
      print('Get Banner error is $error');
      emit(GetBannersErrorState());
    });
  }

  Future<void> getSpecificBanner({required String bannerId}) async {
    emit(GetSpecificBannersLoadingState());
    await dioHelper
        .getData(endPoint: '${AppConstants.getSpecificBannerUrl}$bannerId')
        .then((response) {
      specificBannerModel = SpecificBannerModel.fromJson(response.data);
      emit(GetSpecificBannersSuccessState());
    }).catchError((error) {
      print('Get Banner error is $error');
      emit(GetSpecificBannersErrorState());
    });
  }

  int currentIndexSlider = 0;

  void onPageChangedSlider(int index, CarouselPageChangedReason reason) {
    currentIndexSlider = index;
    emit(ChangeSliderPage());
  }

  /// Get Category in Home Row
  Future<void> getCategory() async {
    emit(GetCategoryLoadingState());
    await dioHelper
        .getData(endPoint: '${AppConstants.getCategoryUrl}?page=1&limit=4')
        .then((response) {
      categoryModel = CategoryModel.fromJson(response.data);
      if (categoryModel != null) {
        categoryModel!.data
            ?.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
      }
      emit(GetCategorySuccessState());
    }).catchError((error) {
      print('Get Category error is $error');
      emit(GetCategoryErrorState());
    });
  }

  /// Get Category in Categories
  Future<void> getCategoryList() async {
    emit(GetAllCategoriesLoadingState());
    await dioHelper
        .getData(endPoint: AppConstants.getCategoryUrl)
        .then((response) {
      categoryModel = CategoryModel.fromJson(response.data);
      if (categoryModel != null) {
        categoryModel!.data
            ?.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
      }
      emit(GetAllCategoriesSuccessState());
    }).catchError((error) {
      print('Get Category error is $error');
      emit(GetAllCategoriesErrorState());
    });
  }

  /// Search Category
  void searchCategory({
    required String searchedText,
    required BuildContext context,
  }) {
    emit(SearchCategoryLoadingState());

    var categoryCubit = HomeCubit.get(context);
    var categoryList = categoryCubit.categoryModel;

    // Filter the category list based on the search text
    categoryCubit.searchCategoryList = categoryList!.data!
        .where((element) =>
            element.name!.toLowerCase().contains(searchedText.toLowerCase()) ||
            element.nameAr!.toLowerCase().contains(searchedText.toLowerCase()))
        .toList();

    print('-------------------------');
    print(categoryCubit.searchProductList.length);
    print('-------------------------');
    emit(SearchCategorySuccessState());
  }

  /// Get Specific Category
  Future<void> getSpecificCategory({required String categoryId}) async {
    emit(GetSpecificCategoriesLoadingState());
    await dioHelper
        .getData(endPoint: '${AppConstants.getSpecificCategoryUrl}$categoryId')
        .then((response) {
      specificCategoryModel = SpecificCategoryModel.fromJson(response.data);
      emit(GetSpecificCategoriesSuccessState());
    }).catchError((error) {
      print('Get Specific Category error is $error');
      emit(GetSpecificCategoriesErrorState());
    });
  }

  /// Get Products in Category
  Future<void> getProductsInCategory({required String categoryId}) async {
    emit(GetProductsInCategoryLoadingState());
    await dioHelper
        .getData(
            endPoint:
                '${AppConstants.getProductsInCategoryUrl}$categoryId/products')
        .then((response) {
      print(response.data);
      productsInCategoryModel = ProductsInCategoryModel.fromJson(response.data);
      if (productsInCategoryModel != null) {
        productsInCategoryModel!.data
            ?.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
      }
      emit(GetProductsInCategorySuccessState());
    }).catchError((error) {
      print('Error in Get Products in Category is $error');
      emit(GetProductsInCategoryErrorState());
    });
  }

  /// Get All Products
  Future<void> getAllProductsFunction() async {
    emit(GetAllProductsLoadingState());
    await dioHelper
        .postData(endPoint: AppConstants.getProductUrl)
        .then((response) {
      productModel = ProductModel.fromJson(response.data);
      if (productModel != null) {
        productModel!.data
            ?.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
      }
      emit(GetAllCategoriesSuccessState());
    }).catchError((error) {
      print('Get All Products error is $error');
      emit(GetAllCategoriesErrorState());
    });
  }

  /// Search Category
  void searchProduct({
    required String searchedProduct,
    required BuildContext context,
  }) {
    emit(SearchProductLoadingState());

    var productCubit = HomeCubit.get(context);
    var productList = productCubit.productModel;

    // Filter the category list based on the search text
    productCubit.searchProductList = productList!.data!
        .where((element) =>
            element.title!
                .toLowerCase()
                .contains(searchedProduct.toLowerCase()) ||
            element.titleAr!
                .toLowerCase()
                .contains(searchedProduct.toLowerCase()))
        .toList();

    print('-------------------------');
    print(productCubit.searchCategoryList.length);
    print('-------------------------');
    emit(SearchProductSuccessState());
  }

  /// Get Products High Sold in Home Row
  Future<void> getProductInHighSold() async {
    emit(GetProductHighNySoldLoadingState());
    await dioHelper
        .getData(endPoint: '${AppConstants.getProductUrl}')
        .then((response) {
      print(response.data);
      productModel = ProductModel.fromJson(response.data);

      if (productModel != null) {
        productModel!.data
            ?.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
      }
      emit(GetProductHighNySoldSuccessState());
    }).catchError((error) {
      print('Get Product In High Sold is $error');
      emit(GetProductHighNySoldErrorState());
    });
  }

  /// Get Specific Product
  Future<void> getSpecificProductFunction({required String productId}) async {
    emit(GetSpecificProductLoadingState());
    await dioHelper
        .getData(endPoint: '${AppConstants.getSpecificProductUrl}$productId')
        .then((response) {
      print('---------');
      print(response.data);
      print('---------');
      specificProductModel = SpecificProductModel.fromJson(response.data);
      emit(GetSpecificProductSuccessState());
    }).catchError((error) {
      print('Get Specific Product error is $error');
      emit(GetSpecificProductErrorState());
    });
  }

  /// Add To Cart
  Future<void> addToCart({required String productId, int? quantity}) async {
    emit(AddToCartLoadingState());
    await dioHelper.postData(endPoint: AppConstants.addToCartUrl, body: {
      'productId': productId,
      'quantity': quantity,
    }).then((value) {
      emit(AddToCartSuccessState());
    }).catchError((error) {
      print('Add to cart error is $error');
      emit(AddToCartErrorState());
    });
  }

  /// Add Review
  Future<void> addReviewFunction({
    required String title,
    required double ratings,
    required String productId,
  }) async {
    emit(AddReviewLoadingState());
    await dioHelper.postData(endPoint: AppConstants.addReviewUrl, body: {
      "title": title,
      "ratings": ratings,
      "product": productId,
      "user": MyCache.getString(key: CacheKeys.userId),
    }).then((response) {
      emit(AddReviewSuccessState());
    }).catchError((error) {
      print('Error in Add review in $error');
      emit(AddReviewErrorState());
    });
  }

  /// Add To Favorite
  Future<void> addToFavoriteFunction({required String productId}) async {
    emit(AddToFavoriteLoadingState());
    await dioHelper.postData(endPoint: AppConstants.addFavoriteUrl, body: {
      'productId': productId,
    }).then((value) {
      emit(AddToFavoriteSuccessState());
    }).catchError((error) {
      print('Add to favorite error is $error');
      emit(AddToFavoriteErrorState());
    });
  }

  Dio dio = Dio();

  /// Upload Image To Admin
  Future<void> uploadImageToServer(
    File image,
    String nameOfProduct,
    String productId,
  ) async {
    emit(UploadImageToAdminLoadingState());
    print('*************');
    print('++++++++++++++++++++');
    print('++++++++++++++++++++');
    FormData formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(
        image.path,
        filename: Uri.file(image.path).pathSegments.last,
        // filename: 'file',
      ),
      'nameOfProduct': nameOfProduct,
      'productId': productId,
    });
    print('llllllllllllllllllllll');
    print(image.path);
    Options options = Options(
      headers: {
        'authorization': "Bearer ${MyCache.getString(key: CacheKeys.token)}",
      },
    );
    print('aaaaaaaaaaaaaaaaaaa');
    await Dio()
        .post(
      'https://mozart-application.onrender.com/api/v1/uploadImage/${MyCache.getString(key: CacheKeys.userId)}',
      data: formData,
      options: options,
    )
        .then((value) {
      print('-------------');
      emit(UploadImageToAdminSuccessState());
    }).catchError((error) {
      // print('Error in upload image to server: $error');
      if (error is DioError) {
        print('DioError response: ${error.response}');
      } else {
        print('Error in upload image to server: $error');
      }
      emit(UploadImageToAdminErrorState());
    });
  }
}