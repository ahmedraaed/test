import 'package:dinnova/api/DinnovaApiController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/MyImages.dart';
import '../../utils/MyLanguages.dart';
import '../../utils/MySizes.dart';
import '../auth/Login.dart';
import 'analysis/Analysis.dart';

class MenuContent extends StatefulWidget {
  @override
  _MenuContentState createState() => _MenuContentState();
}

class _MenuContentState extends State<MenuContent> {
  List<Widget> menuRowsList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setMenuRowsList();
    return ListView.separated(
      itemBuilder: (_, index) {
        return Container(
            margin: EdgeInsets.all(MySizes.defaultMargin),
            width: double.infinity,
            child: Card(child: menuRowsList[index]));
      },
      itemCount: menuRowsList.length,
      separatorBuilder: (_, __) {
        return Divider();
      },
    );
  }

  Widget menuItem({required String title, required String imageLocation}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 30,
          width: 30,
          margin: EdgeInsets.symmetric(horizontal: MySizes.defaultMargin),
          child: Image(
            image: AssetImage(
              imageLocation,
            ),
            fit: BoxFit.contain,
          ),
        ),
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline6,
            maxLines: 1,
          ),
        ),
      ],
    ).marginAll(MySizes.defaultMargin);
  }

  void confirmLogoutBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        elevation: 0,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return Container(
            height: 100,
            margin: EdgeInsets.all(MySizes.halfMargin),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: Container(
                  height: double.infinity,
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          MyLanguageKeys.doSignOutAccount.toString().tr,
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(color: Colors.black),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 35,
                                child: Center(
                                  child: TextButton(
                                    child: Center(
                                        child: Text(
                                            MyLanguageKeys.exit.toString().tr,
                                            style: Theme.of(context)
                                                .textTheme
                                                .button!
                                                .copyWith(
                                                    color: Colors.white))),
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            OutlinedBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                    )),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Auth.clearToken();
                                      SharedPreferences.getInstance()
                                          .then((value) {
                                        value.clear();
                                      });
                                      Get.offAll(() => Login());
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MySizes.halfMargin,
                            ),
                            Expanded(
                              child: Container(
                                height: 35,
                                child: Center(
                                  child: TextButton(
                                    child: Center(
                                        child: Text(
                                            MyLanguageKeys.back.toString().tr,
                                            style: Theme.of(context)
                                                .textTheme
                                                .button!
                                                .copyWith(
                                                    color: Theme.of(context)
                                                        .primaryColor))),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.transparent),
                                        shape: MaterialStateProperty.all<
                                            OutlinedBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                          ),
                                        )),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ).marginAll(MySizes.halfMargin),
                  ),
                ),
              ),
            ),
          );
        });
  }

  setMenuRowsList() {
    menuRowsList.clear();
    menuRowsList.add(InkWell(
      onTap: () {
        Get.to(() => Analysis());
      },
      child: menuItem(
        title: MyLanguageKeys.analysis.toString().tr,
        imageLocation: MyImages.analysis,
      ),
    ));
    menuRowsList.add(InkWell(
      onTap: () {
        confirmLogoutBottomSheet(context);
      },
      child: menuItem(
        title: MyLanguageKeys.logout.toString().tr,
        imageLocation: MyImages.logout,
      ),
    ));
  }
}
