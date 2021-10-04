import 'package:flutter/cupertino.dart';
import 'package:hrmsapp/GlobalVar/Globalvireables.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io' show Platform;

class LanguageProvider with ChangeNotifier{

  bool isER=true;
  static Map<String , Object?>  ar={
    "savelogindetails":"تذكر معلومات الدخول"
    ,"username":"اسم المستخدم"
    ,"password":"رمز المرور"
    ,"login":"تسجيل الدخول"
    ,"profile":"الملف الشخصي"
    ,"timeimprint":"بصمة الدوام"
    ,"workingstate":"حالة الدوام"
    ,"Logout":"تسجيل الخروج"
    ,"language":"عربي"
    ,"log":" جار تسجيل الدخول يرجى الانتظار"
    ,"logerror":" رقم المستخدم او رمز المرور خطأ"
    ,"distancesafe":"المسافة المسموح بها"
    ,"distancedang":"  المسافة الى الشركة   "
    ,"leaverequest":"طلب مغادرة"
    ,"vacationrequest":"طلب اجازة"
  };
  static Map<String , Object?>  en={
    "savelogindetails":" Remember login information"
    ,"username":"username "
    ,"password":"password"
    ,"login":"LogIn"
    ,"profile":"profile"
    ,"timeimprint":"time imprint"
    ,"workingstate":"working state"
    ,"Logout":"Logout"
    ,"language":"language"
    ,"log":"Signing in"
    ,"logerror":"Wrong user number or passcode"
    ,"distancesafe":"Allowed distance"
    ,"distancedang":"The distance to the company"
    ,"leaverequest":"leave request"
    ,"vacationrequest":"vacation request"
  };


  changeLan (bool lan){

    isER=lan;
notifyListeners();

  }

  static TextDirection getDirection(){
    String languageCode = Globalvireable.languageCode;//Platform.localeName.split('_')[0];

    if(languageCode == "ar")
      return TextDirection.rtl;
    return TextDirection.ltr;

  }

  static TextAlign TxtAlign(){
   // String languageCode = Platform.localeName.split('_')[0];
    String languageCode = Globalvireable.languageCode;//Platform.localeName.split('_')[0];

    if(languageCode == "ar")
      return TextAlign.right;
    return TextAlign.left;

  }


  static Object? getTexts(String txt){
   // String languageCode = Platform.localeName.split('_')[0];
    String languageCode = Globalvireable.languageCode;//Platform.localeName.split('_')[0];

    if(languageCode == "ar")
    return ar[txt];
    return en[txt];
  }

  static getStringValuesSF(String key) async {
  //  SharedPreferences prefs = await SharedPreferences.getInstance();
    String prefs = Globalvireable.languageCode;//Platform.localeName.split('_')[0];

    //Return String
    String? stringValue = prefs/*.getString(key);*/;
    if(stringValue !="en" && stringValue !="ar")
      return "en";
    return stringValue;
  }


}