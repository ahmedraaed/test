import 'package:get/get.dart';

enum MyLanguageKeys {
  loadingPleaseWait,
  yes,
  add,
  cantEmpty,
  cantBeMoreThan,
  day,
  analysis,choosePeriod,
  sloganTitle,
  sloganDesc,
  enterPhoneHint,totalSurvies,
  phoneHintError,
  from,to,
  enterYourPassword,
  enterPatientName,
  send,
  enterNotes,chooseMonth,
  noResultsFound,
  newRate,
  passwordHintError,last6month,
  patientNameHintError,
  login,
  rate,
  pressAgainToExit,
  confirm,
  ok,
  sync,
  more,
  loginError,
  completeError,
  contactUs,
  next,
  email,
  phone,
  facebook,
  whatsapp,
  Instagram,
  Website,
  aboutUs,
  logout,
  logoutWait,
  about,
  error,
  unknown,
  back,
  exit,
  doSignOutAccount,
  newSurvey,
  yourRequestIsBeingSent,
  patientName,
  shouldHaveInternet,
  choose,
  male,
  female,
  gender,
  chooseAge,
}

class CustomTranslation extends Translations {
  Map<String, String> _arStrings = {};
  Map<String, String> _enStrings = {};

  @override
  Map<String, Map<String, String>> get keys {
    _addString(
        key: MyLanguageKeys.loadingPleaseWait.toString(),
        enValue: "Loading Please Wait..",
        arValue: "جاري التحميل, برجاء الانتظار...");
    _addString(
        key: MyLanguageKeys.choose.toString(),
        enValue: "Choose",
        arValue: "اختر");
    _addString(
        key: MyLanguageKeys.chooseAge.toString(),
        enValue: "Age",
        arValue: "السن");
    _addString(
        key: MyLanguageKeys.male.toString(), enValue: "Male", arValue: "ذكر");
    _addString(
        key: MyLanguageKeys.gender.toString(),
        enValue: "Gender",
        arValue: "النوع");
    _addString(
        key: MyLanguageKeys.female.toString(),
        enValue: "Female",
        arValue: "انثى");
    _addString(
        key: MyLanguageKeys.back.toString(), enValue: "Back", arValue: "رجوع");
    _addString(
        key: MyLanguageKeys.shouldHaveInternet.toString(),
        enValue: "You must have internet access to sync",
        arValue: "يجب ان يكون لديك وصول للانترنت لعمل المزامنة");
    _addString(
        key: MyLanguageKeys.newSurvey.toString(),
        enValue: "New Survey",
        arValue: "استبيان جديد");
    _addString(
        key: MyLanguageKeys.cantBeMoreThan.toString(),
        enValue: "Range cant be more than 35 days",
        arValue: "لا يمكن ان تكون الفتره اكبر من 35 يوم");
    _addString(
        key: MyLanguageKeys.chooseMonth.toString(),
        enValue: "Choose Month",
        arValue: "اختر الشهر");
    _addString(
        key: MyLanguageKeys.day.toString(),
        enValue: "Day",
        arValue: "يوم");

    _addString(
        key: MyLanguageKeys.yourRequestIsBeingSent.toString(),
        enValue: "Your request is being sent",
        arValue: "تم ارسال الاستبيان");
    _addString(
        key: MyLanguageKeys.sloganTitle.toString(),
        arValue: "رضاء المنتفعين");
    _addString(
        key: MyLanguageKeys.from.toString(),
        arValue: " من ",enValue: " From ");
    _addString(
        key: MyLanguageKeys.to.toString(),
        arValue: " الى ",
    enValue: " To ");
    _addString(
        key: MyLanguageKeys.sloganDesc.toString(),
        arValue: "نحو رعاية صحية آمنة، وتعزيزاً لمبدأ الشفافية ووصولاً لأعلي معايير الآمان والجودة للمتعاملين");

    _addString(
        key: MyLanguageKeys.exit.toString(), enValue: "Exit", arValue: "خروج");
    _addString(
        key: MyLanguageKeys.error.toString(), enValue: "Error", arValue: "خطأ");
    _addString(
        key: MyLanguageKeys.totalSurvies.toString(), enValue: "Total Survies", arValue: "اجمالي عدد الاستبيانات");

    _addString(
        key: MyLanguageKeys.doSignOutAccount.toString(),
        enValue: "Do you want to sign out of your account?",
        arValue: "هل تريد الخروج من حسابك؟");  _addString(
        key: MyLanguageKeys.last6month.toString(),
        enValue: "Last six months analysis",
        arValue: "احصائيات اخر ٦ شهور");

    _addString(
      key: MyLanguageKeys.about.toString(),
      arValue: "عنا",
      enValue: "About",
    );
    _addString(
      key: MyLanguageKeys.unknown.toString(),
      arValue: "غير معلوم",
      enValue: "Unknown",
    );

    _addString(
      key: MyLanguageKeys.analysis.toString(),
      arValue: "احصائيات",
      enValue: "Analysis",
    );

    _addString(
        key: MyLanguageKeys.enterNotes.toString(),
        arValue: "ادخل ملاحظاتك ( اختياري )",
        enValue: "Enter notes ( optional )");
    _addString(
        key: MyLanguageKeys.choosePeriod.toString(),
        arValue: "اختر الفترة",
        enValue: "Choose Period");

    _addString(
        key: MyLanguageKeys.logoutWait.toString(),
        arValue: "تسجيل خروج..برجاء الانتظار",
        enValue: "Logging out, please wait");
    _addString(
        key: MyLanguageKeys.rate.toString(),
        enValue: "Questionnaire",
        arValue: "استبيان");
    _addString(
        key: MyLanguageKeys.newRate.toString(),
        enValue: "New Questionnaire",
        arValue: "استبيان جديد");
    _addString(
        key: MyLanguageKeys.more.toString(),
        enValue: "More",
        arValue: "المزيد");

    _addString(
        key: MyLanguageKeys.sync.toString(),
        enValue: "syncing",
        arValue: "مزامنة");

    _addString(
        key: MyLanguageKeys.aboutUs.toString(),
        arValue: "عنا",
        enValue: "About Us");
    _addString(
        key: MyLanguageKeys.logout.toString(),
        arValue: "تسجيل خروج",
        enValue: "Logout");
    _addString(
        key: MyLanguageKeys.Website.toString(),
        arValue: "موقع الكتروني",
        enValue: "Website");
    _addString(
        key: MyLanguageKeys.noResultsFound.toString(),
        arValue: "لا يوجد نتائج",
        enValue: "No results found");
    _addString(
        key: MyLanguageKeys.Instagram.toString(),
        arValue: "انستجرام",
        enValue: "Instagram");
    _addString(
        key: MyLanguageKeys.facebook.toString(),
        arValue: "فيسبوك",
        enValue: "Facebook");
    _addString(
        key: MyLanguageKeys.phone.toString(),
        arValue: "هاتف",
        enValue: "Phone");
    _addString(
        key: MyLanguageKeys.enterPatientName.toString(),
        arValue: "ادخل اسم المريض",
        enValue: "Enter patient name");
    _addString(
        key: MyLanguageKeys.patientName.toString(),
        arValue: "اسم المريض",
        enValue: "Patient Name");
    _addString(
        key: MyLanguageKeys.patientNameHintError.toString(),
        arValue: "اسم المريض لا يمكن ان يكون فارغا",
        enValue: "Patient name cant be empty");
    _addString(
        key: MyLanguageKeys.email.toString(),
        arValue: "بريد الكتروني",
        enValue: "Email");
    _addString(
        key: MyLanguageKeys.next.toString(),
        arValue: "التالي",
        enValue: "Next");
    _addString(
        key: MyLanguageKeys.contactUs.toString(),
        arValue: "تواصل معنا",
        enValue: "Contact Us");
    _addString(
        key: MyLanguageKeys.completeError.toString(),
        arValue: "برجاء استكمال البيانات",
        enValue: "Please Complete Form");

    _addString(
        key: MyLanguageKeys.pressAgainToExit.toString(),
        arValue: "اضغط مره اخرى للخروج",
        enValue: "Press again to exit");

    _addString(
        key: MyLanguageKeys.confirm.toString(),
        arValue: "تاكيد",
        enValue: "Confirm");

    _addString(
        key: MyLanguageKeys.send.toString(), arValue: "ارسال", enValue: "Send");

    _addString(
        key: MyLanguageKeys.enterYourPassword.toString(),
        arValue: "ادخل كلمة السر",
        enValue: "Enter your password");

    _addString(
        key: MyLanguageKeys.passwordHintError.toString(),
        arValue: "كلمة السر يجب الا تقل عن ٦ حروف او ارقام",
        enValue: "Password cant be less than 6 digits");

    _addString(
        key: MyLanguageKeys.login.toString(),
        arValue: "تسجيل دخول",
        enValue: "Login");

    _addString(
        key: MyLanguageKeys.yes.toString(), arValue: "نعم", enValue: "Yes");

    _addString(
        key: MyLanguageKeys.whatsapp.toString(),
        arValue: "واتساب",
        enValue: "Whatsapp");

    _addString(
        key: MyLanguageKeys.phoneHintError.toString(),
        arValue: "رقم الهاتف غير صحيح",
        enValue: "Phone number is not invalid!");

    _addString(
        key: MyLanguageKeys.cantEmpty.toString(),
        arValue: "لا يمكن ان يكون فارغ",
        enValue: "Cant be empty");

    _addString(
        key: MyLanguageKeys.enterPhoneHint.toString(),
        arValue: "ادخل رقم الهاتف",
        enValue: "Enter your phone number");
    _addString(
        key: MyLanguageKeys.ok.toString(), arValue: "حسنا", enValue: "Ok");

    _addString(
        key: MyLanguageKeys.loginError.toString(),
        arValue: "خطأ في البريد الالكتروني او كلمة السر",
        enValue: "wrong email or password");
    _addString(
        key: MyLanguageKeys.add.toString(), arValue: "اضافة", enValue: "Add");

    return {'en': _enStrings, 'ar': _arStrings};
  }

  _addString({required String key, String? enValue, String? arValue}) {
    if (enValue != null) _enStrings[key] = enValue;
    if (arValue != null) _arStrings[key] = arValue;
  }
}
