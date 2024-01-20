import 'package:dinnova/utils/DinnovaLanguages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension LangEx on LangEnum {
  String tr() {
    return this.name.tr;
  }
}

enum LangEnum {
  language,
  login,
  phone,
  password,
  pleaseEnterPassword,
  pleaseEnterUserName,
  forgetPassword,
  createAnNewPassword,
  oldPassword,
  pleaseEnterOldPassword,
  enterYourPassword,
  newPassword,
  pleaseEnterNewPassword,
  confirmPassword,
  pleaseEnterConfirmPassword,
  passwordNotMatching,
  enteryourlastname,
  Continue,
  selectALanguage,
  enterOtp,
  pleaseEnterOtpthatsendtoyourEmail,
  Idontreceiveacode,
  resendCode,
  checkOtp,
  signUp,
  next,
  completeyourAccount,
  firstName,
  enteryourfirstname,
  lastName,
  commonFacilities,
  details,
  book,
  changeLang,
  currency,
  payments,
  orders,
  logout,
  joinUs,
  hotels,
  places,
  enteryouremail,
  AlreadyhaveanAccount,
  username,
  notes,
  email,
  addTrip,
  carCategory,
  hospital,
  Administration,
  Governorate,
  userProfile,
  updateProfileImage,
  save,
  memories,
  trips,
  transports,
  earnMoney,
  selectCurrency,
  perNight,
  location,
  viewDetails,
  dark,
  light,
  areYouSureWantToLogOut,
  or,
  bookingDetails,
  selectData,
  roomType,
  adults,
  adultAge,
  children,
  childrenAge,
  dates,
  guests,
  promo,
  resetPassword,
  editProfile,
  fullName,
  saveChanges,
  changePassword,
  favorites, favoriteItem, pleaseEnterYourEmailWeWillSendVerificationCode, sendCode, night, recommendedHotels, seemore, nearbyHotels, reviews, bookNow, search, hotelsIn, filter, priceRange, PleaseLoginToYourAccount, pleaseEnterYourEmail, pleaseEnterCorrectEmail, haveAnAccount,  darkTheme,

}

class MyLanguages extends Translations {
  Map<String, String> arStrings = {};
  Map<String, String> enStrings = {};

  static const enKey = 'en';
  static const arKey = 'ar';

  @override
  Map<String, Map<String, String>> get keys {
    var lang = DinnovaLanguages();

    arStrings.addAll(lang.keys[arKey]!);
    enStrings.addAll(lang.keys[enKey]!);
    addString(
      key: LangEnum.language.name,
      enValue: "Arabic",
      arValue: "عربي",
    );

    addString(
      key: LangEnum.guests.name,
      enValue: "Guests",
      arValue: "ضيوف",
    );

    addString(
      key: LangEnum.favorites.name,
      enValue: "Favorites",
      arValue: "المفضلة",
    );


    addString(
      key: LangEnum.night.name,
      enValue: "Night",
      arValue: "ليلة",
    );





    addString(
      key: LangEnum.recommendedHotels.name,
      enValue: "Recommended Hotels",
      arValue: "الفنادق الموصى بها",
    );addString(
      key: LangEnum.hospital.name,
      enValue: "Hospital",
      arValue: "المستشفى",
    );addString(
      key: LangEnum.Administration.name,
      enValue: "Administration",
      arValue: "الادارة",
    );addString(
      key: LangEnum.Governorate.name,
      enValue: "Governorate",
      arValue: "المحافظة",
    );

    addString(
        key: LangEnum.darkTheme.name,
        enValue: "Dark Theme",
        arValue: "مظلم",);

    addString(
      key: LangEnum.seemore.name,
      enValue: "See More",
      arValue: "شاهد المزيد",
    );

    addString(
      key: LangEnum.next.name,
      enValue: "Next",
      arValue: "التالي",
    );


    addString(
      key: LangEnum.nearbyHotels.name,
      enValue: "Nearby Hotels",
      arValue: "الفنادق القريبة",
    );


    addString(
      key: LangEnum.reviews.name,
      enValue: "Reviews",
      arValue: "مراجعات",
    );

    addString(
      key: LangEnum.haveAnAccount.name,
      enValue: "have an account",
      arValue: "لديك حساب",
    );

    addString(
      key: LangEnum.bookNow.name,
      enValue: "Book Now",
      arValue: "احجز الآن",
    );


    addString(
      key: LangEnum.pleaseEnterYourEmail.name,
      enValue: "Please Enter Your Email",
      arValue: "رجاءا أدخل بريدك الإلكتروني",
    );

    addString(
      key: LangEnum.PleaseLoginToYourAccount.name,
      enValue: "Please Login to your account",
      arValue: "يرجى تسجيل الدخول إلى حسابك",
    );

    addString(
      key: LangEnum.PleaseLoginToYourAccount.name,
      enValue: "Please Login to your account",
      arValue: "يرجى تسجيل الدخول إلى حسابك",
    );

    addString(
      key: LangEnum.search.name,
      enValue: "Search",
      arValue: "بحث",
    );

    addString(
      key: LangEnum.filter.name,
      enValue: "Filter",
      arValue: "فلتر",
    );

    addString(
      key: LangEnum.priceRange.name,
      enValue: "Price Range",
      arValue: "نطاق السعر",
    );

    addString(
      key: LangEnum.hotelsIn.name,
      enValue: "Hotels in",
      arValue: "الفنادق في",
    );


    addString(
      key: LangEnum.pleaseEnterYourEmailWeWillSendVerificationCode.name,
      enValue: "Please enter your Email. we will send verification code .",
      arValue: "رجاءا أدخل بريدك الإلكتروني. سوف نرسل رمز التحقق.",
    );


    addString(
      key: LangEnum.sendCode.name,
      enValue: "Send Code",
      arValue: "إرسال الرمز",
    );




    addString(
      key: LangEnum.favoriteItem.name,
      enValue: "Favorite Items",
      arValue: "العناصر المفضلة",
    );




    addString(
      key: LangEnum.resetPassword.name,
      enValue: "Reset Password",
      arValue: "إعادة تعيين كلمة المرور",
    );
    addString(
      key: LangEnum.editProfile.name,
      enValue: "Edit Profile",
      arValue: "تعديل الملف الشخصي",
    );

    addString(
      key: LangEnum.fullName.name,
      enValue: "Full Name",
      arValue: "الاسم الكامل",
    );

    addString(
      key: LangEnum.changePassword.name,
      enValue: "Change Password",
      arValue: "تغيير كلمة المرور",
    );

    addString(
      key: LangEnum.saveChanges.name,
      enValue: "Save Change",
      arValue: "حفظ التغيير",
    );

    addString(
      key: LangEnum.promo.name,
      enValue: "Promo",
      arValue: "العرض",
    );

    addString(
      key: LangEnum.dates.name,
      enValue: "Dates",
      arValue: "تواريخ",
    );

    addString(
      key: LangEnum.perNight.name,
      enValue: "per Night",
      arValue: "في الليلة الواجدة",
    );

    addString(
      key: LangEnum.location.name,
      enValue: "Location",
      arValue: "الموقع",
    );

    addString(key: LangEnum.adults.name, arValue: 'الكبار', enValue: 'Adults');

    addString(
        key: LangEnum.children.name, arValue: 'أطفال', enValue: 'Children');

    addString(
        key: LangEnum.childrenAge.name,
        arValue: 'العمر 2 - 12',
        enValue: 'Age 2 - 12');

    addString(
        key: LangEnum.adultAge.name, arValue: 'العمر +18', enValue: 'Age +18');

    addString(
        key: LangEnum.roomType.name,
        arValue: 'نوع الغرفة',
        enValue: 'Room Type');

    addString(
        key: LangEnum.selectData.name,
        arValue: 'حدد تاريخ',
        enValue: 'select Date');

    addString(key: LangEnum.or.name, arValue: 'أو', enValue: 'or');

    addString(
        key: LangEnum.bookingDetails.name,
        arValue: 'تفاصيل الحجز',
        enValue: 'Booking Details');
    addString(key: LangEnum.dark.name, arValue: 'داكن', enValue: 'Dark');
    addString(key: LangEnum.light.name, arValue: 'مضيئ', enValue: 'Light');

    addString(
      key: LangEnum.viewDetails.name,
      enValue: "View Details",
      arValue: "التفاصيل",
    );

    addString(
      key: LangEnum.changeLang.name,
      enValue: "Change Language",
      arValue: "تغيير اللغة",
    );

    addString(
      key: LangEnum.selectCurrency.name,
      enValue: "Select Currency",
      arValue: "اختر العملة",
    );

    addString(
      key: LangEnum.currency.name,
      enValue: "Currency",
      arValue: "العملة",
    );

    addString(
      key: LangEnum.payments.name,
      enValue: "Payments",
      arValue: "المدفوعات",
    );

    addString(
      key: LangEnum.orders.name,
      enValue: "Orders",
      arValue: "طلبات",
    );

    addString(
      key: LangEnum.logout.name,
      enValue: "Logout",
      arValue: "تسجيل خروج",
    );

    addString(
      key: LangEnum.joinUs.name,
      enValue: "Join Us",
      arValue: "انضم إلينا",
    );

    addString(
      key: LangEnum.login.name,
      enValue: "Login",
      arValue: "تسجيل دخول",
    );

    addString(
      key: LangEnum.phone.name,
      enValue: "Phone Number",
      arValue: "رقم التليفون",
    );

    addString(
      key: LangEnum.password.name,
      enValue: "Password",
      arValue: "كلمة المرور",
    );

    addString(
      key: LangEnum.pleaseEnterPassword.name,
      enValue: "please enter password",
      arValue: "الرجاء إدخال كلمة المرور",
    );

    addString(
      key: LangEnum.forgetPassword.name,
      enValue: "Forgot password",
      arValue: "نسيت كلمة السر",
    );

    addString(
      key: LangEnum.createAnNewPassword.name,
      enValue: "create an New Password",
      arValue: "أنشئ كلمة مرور جديدة",
    );

    addString(
      key: LangEnum.oldPassword.name,
      enValue: "Old Password",
      arValue: "كلمة المرور القديمة",
    );

    addString(
      key: LangEnum.pleaseEnterOldPassword.name,
      enValue: "please enter old Password",
      arValue: "الرجاء إدخال كلمة المرور القديمة",
    );

    addString(
      key: LangEnum.enterYourPassword.name,
      enValue: "enter your password",
      arValue: "ادخل رقمك السري",
    );

    addString(
      key: LangEnum.newPassword.name,
      enValue: "New Password",
      arValue: "كلمة المرور الجديدة",
    );

    addString(
      key: LangEnum.newPassword.name,
      enValue: "New Password",
      arValue: "كلمة المرور الجديدة",
    );

    addString(
      key: LangEnum.userProfile.name,
      enValue: "User Profile",
      arValue: "ملف تعريفي للمستخدم",
    );

    addString(
      key: LangEnum.updateProfileImage.name,
      enValue: "Update Profile Image",
      arValue: "تتغير الصورة الشخصية",
    );

    addString(
      key: LangEnum.save.name,
      enValue: "Save",
      arValue: "حفظ",
    );

    addString(
      key: LangEnum.pleaseEnterNewPassword.name,
      enValue: "please enter new password",
      arValue: "الرجاء إدخال كلمة المرور الجديدة",
    );

    addString(
      key: LangEnum.confirmPassword.name,
      enValue: "Confirm Password",
      arValue: "تأكيد كلمة المرور",
    );

    addString(
      key: LangEnum.pleaseEnterConfirmPassword.name,
      enValue: "please enter confirm password",
      arValue: "الرجاء إدخال تأكيد كلمة المرور",
    );

    addString(
      key: LangEnum.passwordNotMatching.name,
      enValue: "password Not matching",
      arValue: "كلمة المرور غير متطابقة",
    );

    addString(
      key: LangEnum.Continue.name,
      enValue: "Continue",
      arValue: "استمر",
    );

    addString(
      key: LangEnum.selectALanguage.name,
      enValue: "Select a Language",
      arValue: "اختر لغة",
    );

    addString(
      key: LangEnum.enterOtp.name,
      enValue: "Enter Otp",
      arValue: "أدخل Otp",
    );

    addString(
      key: LangEnum.pleaseEnterOtpthatsendtoyourEmail.name,
      enValue: "Please Enter Otp that send to your Email",
      arValue: "الرجاء إدخال Otp التي ترسل إلى بريدك الإلكتروني",
    );

    addString(
      key: LangEnum.Idontreceiveacode.name,
      enValue: "I don't receive a code?",
      arValue: "لا أتلقى رمز؟",
    );

    addString(
      key: LangEnum.resendCode.name,
      enValue: "Resend Code",
      arValue: "أعد إرسال الرمز",
    );

    addString(
      key: LangEnum.checkOtp.name,
      enValue: "check Otp",
      arValue: "تاكيد الرمز",
    );

    addString(
      key: LangEnum.notes.name,
      enValue: "Notes",
      arValue: "ملحوظات",
    );

    addString(
      key: LangEnum.signUp.name,
      enValue: "Sign Up",
      arValue: "انشاء حساب",
    );

    addString(
      key: LangEnum.firstName.name,
      enValue: "First Name",
      arValue: "الاسم الأول",
    );

    addString(
      key: LangEnum.completeyourAccount.name,
      enValue: "Complete your Account",
      arValue: "أكمل حسابك",
    );

    addString(
      key: LangEnum.enteryourfirstname.name,
      enValue: "enter your first name",
      arValue: "أدخل اسمك الأول",
    );

    addString(
      key: LangEnum.lastName.name,
      enValue: "Last Name",
      arValue: "اسم العائلة",
    );

    addString(
      key: LangEnum.lastName.name,
      enValue: "Last Name",
      arValue: "اسم العائلة",
    );

    addString(
      key: LangEnum.commonFacilities.name,
      enValue: "Common Facilities",
      arValue: "المرافق العامة",
    );

    addString(
      key: LangEnum.details.name,
      enValue: "Details",
      arValue: "تفاصيل",
    );

    addString(
      key: LangEnum.book.name,
      enValue: "Book",
      arValue: "حجز",
    );

    addString(
      key: LangEnum.hotels.name,
      enValue: "Hotels",
      arValue: "الفنادق",
    );

    addString(
      key: LangEnum.places.name,
      enValue: "Places",
      arValue: "أماكن",
    );

    addString(
      key: LangEnum.enteryourlastname.name,
      enValue: "enter your last name",
      arValue: "أدخل اسمك الأخير",
    );

    addString(
      key: LangEnum.enteryouremail.name,
      enValue: "enter your email",
      arValue: "أدخل بريدك الإلكتروني",
    );

    addString(
      key: LangEnum.AlreadyhaveanAccount.name,
      enValue: "Already have an Account ?",
      arValue: "هل لديك حساب ؟",
    );

    addString(
      key: LangEnum.pleaseEnterUserName.name,
      enValue: "please Enter Username",
      arValue: "الرجاء إدخال اسم المستخدم",
    );

    addString(
      key: LangEnum.username.name,
      enValue: "Username",
      arValue: "اسم المستخدم",
    );

    addString(
      key: LangEnum.email.name,
      enValue: "Email",
      arValue: "بريد إلكتروني",
    );

    addString(
      key: LangEnum.addTrip.name,
      enValue: "Add Trip",
      arValue: "أضف رحلة",
    );

    addString(
      key: LangEnum.carCategory.name,
      enValue: "Car Category ",
      arValue: "فئة السيارة",
    );

    addString(
      key: LangEnum.memories.name,
      enValue: "Memories",
      arValue: "ذكريات",
    );

    addString(
      key: LangEnum.trips.name,
      enValue: "Trips",
      arValue: "رحلات",
    );

    addString(
      key: LangEnum.transports.name,
      enValue: "Transports",
      arValue: "وسائل النقل",
    );

    addString(
      key: LangEnum.earnMoney.name,
      enValue: "Earn Money",
      arValue: "اكتساب النقود",
    );

    addString(
      key: LangEnum.earnMoney.name,
      enValue: "Earn Money",
      arValue: "اكتساب النقود",
    );
    addString(
      key: LangEnum.areYouSureWantToLogOut.name,
      enValue: "Are you sure want to Log out",
      arValue: "هل أنت متأكد من أنك تريد تسجيل الخروج",
    );

    return {
      arKey: arStrings,
      enKey: enStrings,
    };
  }

  addString({
    required String key,
    required String enValue,
    required String arValue,
  }) {
    enStrings[key] = enValue;
    arStrings[key] = arValue;
  }

  static changeAppLanguage() {
    SharedPreferences.getInstance().then((pref) {
      switch (Get.locale!.languageCode) {
        case MyLanguages.arKey:
          return updateLanguage(stringKey: MyLanguages.arKey, pref: pref);

        case MyLanguages.enKey:
          return updateLanguage(stringKey: MyLanguages.enKey, pref: pref);
      }
    });
  }

  static void updateLanguage(
      {required String stringKey, required SharedPreferences pref}) {
    pref.setString(LangEnum.language.name, stringKey);
    Get.updateLocale(Locale(stringKey));
  }
}
