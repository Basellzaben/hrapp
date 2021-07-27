
import 'package:shared_preferences/shared_preferences.dart';


class Globalvireable{
  static String logo="";
  static String id="";
  static getStringValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefs.getString(key);
    if(stringValue !="en" && stringValue !="ar")
      return "en";
    return stringValue;
  }

  static String language=getStringValuesSF("");


}