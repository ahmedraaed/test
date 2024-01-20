import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../shared/languages.dart';
import '../shared/constants.dart';
import '../shared/sizes.dart';
import '../vm/select_lang_vm.dart';

class SelectLangView extends ConsumerStatefulWidget {
  const SelectLangView();

  @override
  ConsumerState<SelectLangView> createState() => _SelectLangViewState();
}

class _SelectLangViewState extends ConsumerState<SelectLangView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400.h,
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: MySizes.width20,
          vertical: MySizes.height20,
        ),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        margin: EdgeInsetsDirectional.only(
                            start: MySizes.width20, top: MySizes.height20),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.15),
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(10.sp),
                        child: Icon(
                          Icons.clear,
                          size: 20.sp,
                          color: Theme.of(context).colorScheme.onSurface,
                        )),
                  ),
                ),
                Text(LangEnum.selectALanguage.tr(),
                    style: TextStyle(fontWeight: FontWeight.w700)),
                SizedBox(
                  width: MySizes.width10,
                ),
              ],
            ),
            SizedBox(
              height: MySizes.height30,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // lang.changeIndex(currentIndex: index);
                        ref.read(selectLangProvider.notifier).changeLang(
                              lang: langModelList[index].local,
                            );
                        Get.back();
                      },
                      child: Container(
                        height: MySizes.height40,
                        padding: EdgeInsetsDirectional.symmetric(
                            vertical: MySizes.height10,
                            horizontal: MySizes.width20),
                        decoration: BoxDecoration(
                          color: langModelList[index].local ==
                                  ref.watch(selectLangProvider)
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.primary.withOpacity(.1),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              langModelList[index].imagePath,
                              height: MySizes.width20,
                              width: MySizes.width20,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(
                              width: MySizes.width10,
                            ),
                            Text(
                              langModelList[index].name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: langModelList[index].local ==
                                          ref.watch(selectLangProvider)
                                      ? Theme.of(context).colorScheme.onPrimary
                                      : Theme.of(context).colorScheme.primary),
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
          ],
        ));
  }
}
