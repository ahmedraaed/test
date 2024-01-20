import 'package:dinnova/utils/DinnovaDropdownSearch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/languages.dart';
import '../../shared/sizes.dart';
import '../questionnaire/questionnaire_view.dart';

class HospitalAndDepartmentScreen extends StatefulWidget {
  const HospitalAndDepartmentScreen({Key? key}) : super(key: key);

  @override
  State<HospitalAndDepartmentScreen> createState() => _HospitalAndDepartmentScreenState();
}


class _HospitalAndDepartmentScreenState extends State<HospitalAndDepartmentScreen> {

  int currentIndex=-1;

  List<String> hospitals=["a","b"];
  List<String> department=["a","b"];
  List<String> city=["a","b"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("استبيان"),
      ),
      body: Container(
        margin: EdgeInsetsDirectional.only(end: 15.w,start: 15.w,top: 15.h,bottom: 15.h),
        child: Column(
          children: [
            Text("select",style: TextStyle(fontWeight: FontWeight.w700),),
            SizedBox(height: 20.h,),
            Row(
              children: [
                Expanded(
                  child: DinnovaDropdownSearch<String>(
                    labelText: LangEnum.Administration.tr(),
                    // initSelectedItem: countryListVM.countryName,
                    items: hospitals ?? [],
                    onItemChanged: (item) {

                    },
                  ),
                ),
                Expanded(
                  child: DinnovaDropdownSearch<String>(
                    labelText: LangEnum.Governorate.tr(),
                    // initSelectedItem: countryListVM.countryName,
                    items: hospitals ?? [],
                    onItemChanged: (item) {

                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h,),
            DinnovaDropdownSearch<String>(
              labelText: LangEnum.hospital.tr(),
              // initSelectedItem: countryListVM.countryName,
              items: hospitals ?? [],
              onItemChanged: (item) {

              },
            ),
            SizedBox(height: 50.h,),
            Text("Questionnaire Type",style:Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 20.h,),

            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // lang.changeIndex(currentIndex: index);
                        setState(() {
                          currentIndex=index;
                        });
                      },
                      child: Container(
                        height: MySizes.height60,
                        padding: EdgeInsetsDirectional.symmetric(
                            vertical: MySizes.height10,
                            horizontal: MySizes.width20),
                        decoration: BoxDecoration(
                          color: currentIndex==index
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.primary.withOpacity(.1),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MySizes.width10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "title",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: currentIndex==index
                                          ? Theme.of(context).colorScheme.onPrimary
                                          : Theme.of(context).colorScheme.primary),
                                ),
                                SizedBox(height: 5.h,),
                                Text(
                                  "sub Title",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: currentIndex==index
                                          ? Theme.of(context).colorScheme.onPrimary
                                          : Theme.of(context).colorScheme.primary),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 15.w,
                    );
                  },
                  itemCount: 2),
            ),


            SizedBox(height: 20.h,),
            Center(
              child: Container(
                height: 40.h,
                  margin: EdgeInsetsDirectional.only(end: MySizes.defaultMargin , start: MySizes.defaultMargin),
                  child: TextButton(
                      child: Center(
                        child: Text(
                          LangEnum.next.tr(),
                          style: TextStyle(fontSize: 18.sp),
                        ),
                      ),
                      onPressed: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => QuestionnaireView(),));
                      })),
            )


          ],
        ),
      ),
    );
  }
}
