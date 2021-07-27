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

  };


  changeLan (bool lan){

    isER=lan;
notifyListeners();

  }

  static TextDirection getDirection(){
    String languageCode = Platform.localeName.split('_')[0];

    if(languageCode == "ar")
      return TextDirection.rtl;
    return TextDirection.ltr;

  }

  static TextAlign TxtAlign(){
    String languageCode = Platform.localeName.split('_')[0];

    if(languageCode == "ar")
      return TextAlign.right;
    return TextAlign.left;

  }


  static Object? getTexts(String txt){
    String languageCode = Platform.localeName.split('_')[0];

    if(languageCode == "ar")
    return ar[txt];
    return en[txt];
  }

  static getStringValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefs.getString(key);
    if(stringValue !="en" && stringValue !="ar")
      return "en";
    return stringValue;
  }


}