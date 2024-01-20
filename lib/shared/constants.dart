import 'package:Des/shared/shareprefrances.dart';
import '../Data/models/base_model/langauge_model.dart';
import 'images.dart';



final List<LanguageModel> langModelList=[
  LanguageModel(name: "عربي", imagePath: Images.arFlag, local: "ar"),
  LanguageModel(name: "English", imagePath: Images.enFlag, local: "en"),

];


class Constants{





  static String? language=SharedPreferencesService.getData(key: "currentLanguage")??"en";


  static changeLanguage({required String currentLanguage}){
    language=currentLanguage;
    SharedPreferencesService.SaveData(key: "currentLanguage", value: currentLanguage);
  }


}