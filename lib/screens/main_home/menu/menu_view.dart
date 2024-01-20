import 'dart:io';

import 'package:dinnova/utils/DinnovaMode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../shared/images.dart';
import '../../../shared/languages.dart';
import '../../../utils/MySizes.dart';
import '../../../widgets/select_language_view.dart';

import 'package:dinnova/utils/DinnovaDialog.dart';

class MenuView extends ConsumerStatefulWidget {
  const MenuView();

  @override
  ConsumerState<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends ConsumerState<MenuView> {
  final ScrollController scrollController = ScrollController();
  bool isDark = DinnovaMode.getThemeMode() == ThemeMode.dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 SizedBox(
                  height: MySizes.defaultMargin,
                ),
                userData(context, 'name'),
                divider(context),
                getRow(context, Images.lang, LangEnum.changeLang.tr(),
                    () {
                  Get.bottomSheet(
                    const SelectLangView(),
                    isScrollControlled: true,
                  );
                }),
                lightDarkRow(context),


                getRow(context,Images.logout, LangEnum.logout.tr(), () {
                  // print("");
                  DinnovaDialog.warningYesNoBottomSheet(
                      context,
                      LangEnum.logout.tr(),
                      LangEnum.areYouSureWantToLogOut.tr(), () async {
                    Get.back();
                    // Get.offAllNamed(loginRouting().screenFullPath);
                  }, () {
                    Get.back();
                  });
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget getRow(
      BuildContext context, String image, String title, Function onTap,
      {bool? isBold}) {
    return GestureDetector(
      onTap: () {
        onTap.call();
      },
      child: Container(
        color: Theme.of(context).colorScheme.background,

        /// to make click fill all row and height
        child: Column(
          children: [
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Card(
                      margin: const EdgeInsets.all(5),
                      child: Image.asset(
                        image,
                      ).marginAll(5),
                    ),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: isBold == true
                          ? FontWeight.bold
                          : FontWeight.normal,
                      fontSize: isBold == true ? 22 : 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ]),
            divider(context)
          ],
        ),
      ),
    );
  }

  Widget lightDarkRow(
    BuildContext context,
  ) {
    return Container(
      color: Theme.of(context).colorScheme.background,

      /// to make click fill all row and height
      child: Column(
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: 50,
              width: 50,
              child: Switch(
                value: isDark,
                activeColor: Theme.of(context).colorScheme.primary,
                onChanged: (bool value) {
                  isDark = !isDark;
                  DinnovaMode.changeThemeMode();
                  setState(() {});
                },
              ),
            ),
            Expanded(
              child: Text(
                LangEnum.darkTheme.tr(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ]),
          divider(context)
        ],
      ),
    );
  }

  Widget userData(BuildContext context, String name) {
    return GestureDetector(
      onTap: () {
        Get.back();
        // Get.toNamed(userProfileRouting().screenFullPath,parameters:{"id": ref.read(myAccountProvider).id.toString()??"-1"});
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          children: [
              ClipOval(
                    child: Icon(Icons.account_circle,size: 70.sp),
                  ),
             SizedBox(
              height: MySizes.defaultMargin,
            ),
            Text(name, style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
      ),
    );
  }

  Widget divider(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: 1,
      color: Theme.of(context).colorScheme.onBackground.withOpacity(.1),
    );
  }

  String typePlatform({required String phone}) {
    if (Platform.isIOS) {
      return "whatsapp://wa.me/$phone/?text=${Uri.parse(".")}";
    } else {
      return "whatsapp://send?phone=$phone";
    }
  }
}
