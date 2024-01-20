import 'package:dinnova/utils/DinnovaLanguages.dart';
import 'package:dinnova/utils/DinnovaMode.dart';
import 'package:dinnova/utils/DinnovaStorageManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';


StateNotifierProvider<SelectLangVM, String> selectLangProvider =
    StateNotifierProvider((ref) {
  return SelectLangVM(ref, initLang: DinnovaMode.getLanguageMode());
});

class SelectLangVM extends StateNotifier<String> {
  final Ref ref;
  SelectLangVM(this.ref, {required String initLang}) : super(initLang);

  int index = -1;
  changeLang({required String lang}) {
    state = lang;
    DinnovaStorageManager.saveData(DinnovaLanguagesKeys.language.toString(), state);
    Get.updateLocale(Locale(state));
  }

}
