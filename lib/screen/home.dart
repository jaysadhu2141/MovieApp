import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/controller/homecontroller.dart';
import 'package:movieapp/resource/app_colors.dart';


class Home extends GetView<HomeController> {
  Home({Key? key}) : super(key: key);
  static String pageId = "/home";
  final controllerr = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.black),
          elevation: 2,
          backgroundColor: AppColors.red,
          centerTitle: true,

          title: Text(
            'Movies List',
            style: TextStyle(
                fontSize: 18,
                color: AppColors.white,
                fontWeight: FontWeight.w500),
          ),
          bottom: TabBar(
            indicatorColor: AppColors.yellow,
            onTap: (int index){
              if(index == 0){
                 controllerr.getPopularMovie();
              }
              else if (index == 1){

              }
              else{

              }
            },
            labelColor: AppColors.yellow,
            unselectedLabelColor: AppColors.white,
            indicatorWeight: 3.0,
            tabs: [
              Tab(text: 'Populer',),
              Tab(text: 'Top Rated'),
              Tab(text: 'Up Coming'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Icon(Icons.flight, size: 350),
            Icon(Icons.directions_transit, size: 350),
            Icon(Icons.directions_car, size: 350),
          ],
        ),
        // SingleChildScrollView(
        //   child: Padding(
        //     padding: const EdgeInsets.all(15.0),
        //     child: Column(
        //       children: [
        //
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
