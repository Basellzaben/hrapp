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
    ,"Name":"الاسـم : "
    ,"Departuretype":"نوع المغادرة"
    ,"Departurestarttime":"وقت بداية المغادرة"
    ,"Departureendtime":"وقت نهاية المغادرة"
    ,"Send":"أرسال"
    ,"notes":"الملاحظات"
    ,"Departuretime":"مدة المغادرة"
    ,"vactioncount":"عدد ايام الاجازة"
    ,"vactiontype":"نوع الاجازة"
    ,"datestartvaction":"تاريخ بداية الاجازة"
    ,"dateendvaction":"تاريخ نهاية الاجازة"
    ,"emmployees":"الموظف البديل"
    ,"phoneanddetails":"العنوان ورقم الهاتف اثناء الاجازة"
    ,"selectimage":"اختيار صورة"
    ,"Administration":"الادارة"
    ,"Directresponsible":"المسؤول المباشر"
    ,"Qualification":"المؤهل العلمي"
    ,"employeestatus":"حالة الموظف"
    ,"YearsofExperience":"عدد سنوات الخبرة"
    ,"department":"القسم"
    ,"Requestcertificate":"طلب شهادة"
    ,"otherrequests":"طلبات اخرى"
    ,"to":"موجهة الى"
    ,"certificationtype":"نوع الشهادة"
    ,"thereasons":"الاسباب"
    ,"Certificatestatement":"بيان الشهادة"
    ,"documents":"الوثائق"
    ,"Order":"طلب"
    ,"requesttype":"نوع الطلب"
    ,"request":"الطلب"

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
    ,"Name":"Name : "
    ,"Departuretype":"Departure type"
    ,"Departurestarttime":"Departure start time"
    ,"Departureendtime":"Departure end time"
    ,"notes":"Notes & Comment"
    ,"Departuretime":"Departure time"
    ,"Send":"Send"
    ,"Departuretime":"Departure time"
    ,"vactiontype":"vacation Type"
    ,"datestartvaction":"vacation start date"
    ,"dateendvaction":"vacation end date"
    ,"vactioncount":"number of vacation days"
    ,"phoneanddetails":"Address and phone number while on vacation"
    ,"emmployees":"substitute employee"
    ,"selectimage":"Select Images"
    ,"Administration":"Administration"
,"Directresponsible":"Direct responsible"
    ,"Qualification":"Qualification"
    ,"employeestatus":"employee status"
    ,"YearsofExperience":"Years of Experience"
    ,"department":"department"
    ,"Requestcertificate":"Request a certificate"
    ,"otherrequests":"other requests"
    ,"to":"to"
    ,"certificationtype":"certificationtype"
    ,"thereasons":"the reasons"
    ,"Certificatestatement":"Certificate statement"
    ,"Order":"Order"
    ,"requesttype":"request type"
    ,"request":"request"
    ,"documents":"documents"

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

  static Alignment Align(){
    // String languageCode = Platform.localeName.split('_')[0];
    String languageCode = Globalvireable.languageCode;//Platform.localeName.split('_')[0];

    if(languageCode == "ar")
      return Alignment.topRight;
    return Alignment.topLeft;

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