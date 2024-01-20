import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../shared/sizes.dart';
import '../hospital_department/fillter_hospital_department_screen.dart';
import 'menu/menu_view.dart';

class MainHomeView extends StatefulWidget {
  const MainHomeView({Key? key}) : super(key: key);

  @override
  State<MainHomeView> createState() => _MainHomeViewState();
}

class _MainHomeViewState extends State<MainHomeView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MainHome")),
      drawer: Container(
          height: double.infinity,
          margin: EdgeInsetsDirectional.only(end: Get.width / 4.5),
          padding:  EdgeInsets.all(MySizes.defaultMargin),
          color: Theme.of(context).colorScheme.background,
          width: Get.width / 1.5,
          child: const MenuView()),
      body: Container(
        padding: EdgeInsetsDirectional.only(start: 20.w,end: 20.w),
        child: Center(
          child: Lottie.asset(
            'assets/animation/analysis.json',
            // width: 200,
            // height: 200,
            fit: BoxFit.fill,
          ),
        ),
      ),
      floatingActionButton:FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => HospitalAndDepartmentScreen(),));
      },backgroundColor: Theme.of(context).primaryColor,child: Icon(Icons.add,color: Colors.white,)) ,

    );
  }
}
