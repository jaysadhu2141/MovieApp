import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/Model/model_get_movies.dart';
import 'package:movieapp/api/api_repositary.dart';
import 'package:movieapp/controller/base_controller.dart';
import 'package:movieapp/device/app_utility.dart';
import 'package:movieapp/resource/app_string.dart';

class MovieDetailController extends BaseController {
  @override
  void errorHandler() {

  }
  @override
  void onInit() {
    super.onInit();


  }


  Rx<ModelGetMovie> topRatedMovieDetails = ModelGetMovie().obs;
  RxBool isTopRatedApiLoading = true.obs;
  BuildContext? context;

  getTopRatedMovie() async {
    isTopRatedApiLoading.value = true;
    ModelGetMovie? master =
    await ApiRepository().getTopRatedMovie(onNoInternet: () {
      AppUtility.showRedToastMessage(context, AppStrings.strNoInternetConnection);
    });
    if (master != null) {
      isTopRatedApiLoading.value = false;
      topRatedMovieDetails.value = master;
    } else {
      AppUtility.showRedToastMessage(context, 'data not found');
    }
  }


}