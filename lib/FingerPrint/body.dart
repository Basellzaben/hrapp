import 'dart:async';
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'dart:math' show sin, cos, sqrt, atan2;
import 'package:hrmsapp/FingerPrint/user_location.dart';
import 'package:hrmsapp/GlobalVar/Globalvireables.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:vector_math/vector_math.dart';
//import 'package:flutter/material.dart';
import 'package:flutter/material.dart' ;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hrmsapp/FingerPrint/Location.dart';
import 'package:hrmsapp/models/my_theme_provider.dart';
import 'package:provider/provider.dart';
import '../LanguageProvider.dart';
import 'clock.dart';
import 'time_in_hour_and_minute.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class Body extends StatefulWidget {

  Body({Key? key}) : super(key: key);

  _ExampleState createState() => _ExampleState();
}
class _ExampleState extends State<Body> {
  late Theme theme;
  var distance = 0.0;
  late var lats = 0.0;

  // late var type=true;
  late var lngs = 0.0;
  double distanceInMeters = 0.0;
   Position? _currentPosition= Globalvireable.currentPosition;
  double earthRadius = 6378100;
  late var Loc;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        // _determinePosition();
      });
    });
  }

  @override
  Future<Location> getLocation1() async {

    late Uri apiUrl = Uri.parse(
        "http://10.0.1.63:8017/api/Destination/GetLocation");
    http.Response response = await http.get(apiUrl);
    late var jsonResponse = jsonDecode(response.body);
    // var parsedJson = json.decode(jsonResponse);
    Loc = Location.fromJson(jsonResponse);
    return Loc;
  }

  // late Position currentposition;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: 'Please enable Your Location Service');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(
          msg:
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);


    return position;
  }

  void getLocation() async {
    _currentPosition = await GeolocatorPlatform.instance.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  //}
  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner:false;
    debugShowCheckedModeBanner:false;


    return Scaffold (
     //  body: SingleChildScrollView(
     body: Center(

         child: FutureBuilder<Location>  (
          future: getLocation1(),
          builder: (context, snapshot) {
            var data = snapshot.data;
            if ( snapshot.hasData || _currentPosition==null || snapshot.error!=null
            || snapshot.connectionState != ConnectionState.waiting
            ){
              distance = double.parse(data!.Distination);
              return SizedBox(

                width: double.infinity,
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                child: Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(top: 20.0,right: 0.0,left: 0.0),


                    child: Consumer<MyThemeModel>
                      (
                      builder: (context, theme, child) =>
                          GestureDetector
                            (
                            onTap: () =>
                            theme.isLightTheme
                                ? Globalvireable.type2 = 1
                                : Globalvireable.type2 = 0,

                            /*  setState(() {

                        print("Globalvireable  "+Globalvireable.type2.toString());
                        // _determinePosition();
                      })*/ /*=!Globalvireable.type*/ /*
*/ /*onchange()*/ /*,*/
                            child: Text(
                                theme.isLightTheme ? "Check In" : "Check Out",
                              /*  style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyText1,*/

                                style: TextStyle(fontSize: 22.0,color:Color(0xFF3A65D0))

                            ),

                          ), )

                    ),
                    TimeInHourAndMinute(),
                    Spacer(),
                    Clock(),
                    Spacer(),
                    Container(
                        margin: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 0.0, bottom: 0.0),

                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 30,
                              height: 30,
                              color: /*Color(0xff9c27b0)*/distanceInMeters <
                                  double.parse(data.Distination) ? Color(
                                  0xFF2C582C) : Color(0xFFC63535),
                              child: Center(
                                child: Text(
                                  data.Distination,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      color: Color(0xFFFAFAFA),
                                      fontSize: 19),
                                ),),),
                            Expanded(

                              child: Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                       LanguageProvider.getTexts('distancesafe').toString(),
                                      textDirection: TextDirection.ltr,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19,),
                                    )),)
                          ],
                        )
                    ),
                    Container(
                        margin: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 1.0, bottom: 0.0),

                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 30,
                              height: 30,
                              color: double.parse(data.Distination)>=distanceInMeters ? Color(
                                  0xFF2C582C) : Color(0xFFC63535),
                              child: Center(
                                child: Text(

                                  getDistance(double.parse(data.LAT),
                                      double.parse(data.LANG)),
                                  textAlign: TextAlign.right,
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      color: Color(0xFFFAFAFA),
                                      fontSize: 19),
                                ),),),
                            Expanded(
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    LanguageProvider.getTexts('distancedang').toString(),
                                    textDirection: TextDirection.ltr,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19,),
                                  )),)
                          ],
                        )
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 0.0, top: 2),

                      child: Consumer<MyThemeModel>(
                        builder: (context, theme, child) =>
                            GestureDetector(
                              child: GestureDetector(
                                onTap: () {

          //  setState(() {
            check(Globalvireable.type);
            //});

            },
                                child: SvgPicture.asset(

                                  "assest/fingerprint.svg",
                                  alignment: Alignment.center,
                                  height: 150,
                                  width: 150,
                                  color:Color(0xFF3A65D0),
                                 /* distanceInMeters <= double.parse(data.Distination) ? Color(
                                      0xFF2C582C) : Color(0xFFC63535),*/

                                ),),
                            ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            };
          }
      ),
    ),);
  }


  /*getDistance(double pLat,double pLng){

    _determinePosition();
    getLocation();
    lats= _currentPosition!.latitude;
    lngs=_currentPosition!.longitude;

    print(lats);
    print(lngs);

    var dLat = radians(pLat - lats);
    var dLng = radians(pLng - lngs);
    var a = sin(dLat/2) * sin(dLat/2) + cos(radians(lats))
        * cos(radians(pLat)) * sin(dLng/2) * sin(dLng/2);
    var c = 2 * atan2(sqrt(a), sqrt(1-a));
    var d = earthRadius * c;
    print(d); //d is the distance in meters
    return (d.toInt()).toString();
  }
*/

  String getDistance(double pLat, double pLng) {
    _determinePosition();
    getLocation();
    print(_currentPosition.toString());

    try {
      lats = _currentPosition!.latitude;
      lngs = _currentPosition!.longitude;
    }
    on Exception catch (_) {
      /* ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  content: Text("يوجد مشكلة , يرجى المحاولة لاحقا"),
  ));
*/
    }
    //  print(lats);
    //   print(lngs);
    //  print("  111111  ");
    // print(pLat);
    // print(pLng);

    /*var dLat = radians(pLat -  lats);
    var dLng = radians(pLng - lngs);
    var a = sin(dLat/2)  * sin(dLat/2) + cos(radians( lats))
        * cos(radians(pLat)) * sin(dLng/2) * sin(dLng/2);
    var c = 2 * atan2(sqrt(a), sqrt(1-a));
    var d = earthRadius * c;
     a=double.parse(lats.toStringAsFixed(4));
    double b=double.parse(lngs.toStringAsFixed(4));
*/
    distanceInMeters = GeolocatorPlatform.instance.distanceBetween(pLat, pLng, lats, lngs);


    // print ("2222");
    //print (distanceInMeters);
    //  return (d.toInt()).toString(); //d is the distance in meters
    return (distanceInMeters.toInt()).toString(); //d is the distance in meters
  }

  String getDistance2(double pLat, double pLng) {
    _determinePosition();
    getLocation();
    print(_currentPosition.toString());
    lats = _currentPosition!.latitude;
    lngs = _currentPosition!.longitude;

    double distanceInMeters = sqrt(
        ((lats - pLat) * (lats - pLat)) + ((lngs - pLng) * (lngs - pLng)));
    // print ("2222");
    //  print (distanceInMeters);
    //  return (d.toInt()).toString(); //d is the distance in meters
    return (distanceInMeters.toInt()).toString(); //d is the distance in meters
  }


  check(bool Check_Type) async {
    //  data.Distination


    var IO = "";
    var IOtext = "";
    if (Globalvireable.type2 % 2 == 1) {
      IO = "I";
      IOtext = "تسجيل الدخول";

      print("if " );


    }
    else {
      IO = "O";
      IOtext = "تسجيل الخروج";

    }


    if(distance >= distanceInMeters) {
      print("inner " );

      var apiUrl = Uri.parse(Globalvireable.check);

      final json = {
        "Emp_NO": Globalvireable.id,
        "Check_Type": IO,
        "Check_Time": "08/02/2021"
      };
      http.Response response = await http.post(apiUrl, body: json);

    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse == "1" ) {
      print(IO + "done  " + distance.toString() + "  " +
          distanceInMeters.toString());


      if (Globalvireable.type2 % 2 == 1) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("تم تسجيل الدخول بنجاح "),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("تم تسجيل الخروج بنجاح "),
        ));
      }
    }
    else {
      print(IO + "error  " + distance.toString() + "  " +
          distanceInMeters.toString());


        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("يوجد مشكلة , يرجى المحاولة لاحقا"),
        ));

      //ScaffoldMessenger.of(context).hideCurrentSnackBar();
    }


    }else{
      print("error");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("يجب ان تكون بالقرب من الشركة, يرجى المحاولة لاحقا"),
      ));


      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('يجب ان تكون بالقرب من الشركة, يرجى المحاولة لاحقا'),
        ),
      );

    }

  }


  onchange() {
    // theme.changeTheme()
    Globalvireable.type = !Globalvireable.type;
  }

}


