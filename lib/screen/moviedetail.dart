import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/controller/homecontroller.dart';
import 'package:movieapp/controller/movie_detail_controller.dart';
import 'package:movieapp/resource/app_colors.dart';



class MovieDetail extends GetView<MovieDetailController> {
  MovieDetail({Key? key}) : super(key: key);
  static String pageId = "/moviedetail";
  final controllerr = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.black),
          elevation: 2,
          backgroundColor: AppColors.red,
          centerTitle: true,
          leading: InkWell(
              onTap: (){
                Get.back();
              },
              child: Icon(Icons.arrow_back_rounded,size: 20,color: AppColors.black,)),
          title:Text(
            'Movie Detail',
            style: TextStyle(
                fontSize: 18,
                color: AppColors.white,
                fontWeight: FontWeight.w500),
          ),
        ),
      body: Column(children: [

      ],
      ),

    );
  }
}
