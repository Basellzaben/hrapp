
import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Globalvireable{
  static String galaxyinternationalURL="http://www.gi-group.com/";
  static String logo="";
  static String id="";
  static String name="";
  static String languageCode = Platform.localeName.split('_')[0];



  static bool type=true;
  static int type2=1;
  static Position? currentPosition=null;
  static String email="";
  static double lat1=0;
  static double lng=0;


//apis using in app galaxy international
  static String loginapi="http://10.0.1.60:8017/api/User/CheckUser";
  static String personalinfoapi="http://10.0.1.60:8017/api/EmployeeInfo/GetEmployeePersonalInfo/";
  static String workstateapi="http://10.0.1.60:8017/api/EmployeeInfo/GetEmployeeWorkInfo/";
  static String check="http://10.0.1.60:8017/api/Attendance/CheckinOut/";



}