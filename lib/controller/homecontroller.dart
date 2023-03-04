import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/Model/model_get_populer_movies.dart';
import 'package:movieapp/api/api_repositary.dart';
import 'package:movieapp/controller/base_controller.dart';
import 'package:movieapp/device/app_utility.dart';
import 'package:movieapp/resource/app_string.dart';

class HomeController extends BaseController {
  @override
  void errorHandler() {

  }
  @override
  void onInit() {
    super.onInit();
    getPopularMovie();
  }

  Rx<ModelGetPopulerMovie> popularMovieDetails = ModelGetPopulerMovie().obs;
  RxBool isApiLoading = true.obs;
  BuildContext? context;

  getPopularMovie() async {
    isApiLoading.value = true;
    ModelGetPopulerMovie? master =
    await ApiRepository().getPopularMovie(onNoInternet: () {
      AppUtility.showRedToastMessage(context, AppStrings.strNoInternetConnection);
    });
      if (master != null) {
        isApiLoading.value = false;
        popularMovieDetails.value = master;
      } else {
        AppUtility.showRedToastMessage(context, 'data not found');
      }
  }

}