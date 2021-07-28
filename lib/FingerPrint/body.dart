
import 'dart:async';
import 'dart:convert';
import 'dart:math' show sin, cos, sqrt, atan2;
import 'package:hrmsapp/FingerPrint/user_location.dart';
import 'package:hrmsapp/GlobalVar/Globalvireables.dart';
import 'package:vector_math/vector_math.dart';
//import 'package:flutter/material.dart';
import 'package:flutter/material.dart' ;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hrmsapp/FingerPrint/Location.dart';
import 'package:hrmsapp/models/my_theme_provider.dart';
import 'package:provider/provider.dart';
import 'clock.dart';

import 'package:geocoding/geocoding.dart';
import 'time_in_hour_and_minute.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);
  _ExampleState createState() => _ExampleState();
}
class _ExampleState extends State<Body> {
  late var lats,lngs;


 // late Position _currentPosition;
  double earthRadius = 6371000;
  late var Loc;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _determinePosition();
      });
    });
  }
  @override
  Future<Location1> getLocation1() async {
    late Uri apiUrl = Uri.parse("http://10.0.1.63:8017/api/Destination/GetLocation");


    http.Response response = await http.get(apiUrl);

    late var jsonResponse = jsonDecode(response.body);

    // var parsedJson = json.decode(jsonResponse);
    Loc = Location1.fromJson(jsonResponse);
    return Loc;
  }
  late Position currentposition;

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

    try {
      List<Placemark> placemarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);

      Placemark place = placemarks[0];



    } catch (e) {
      print(e);
    }
    return position;
  }
/*
  void getLocation() async {
    _currentPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
*/


  //}
  @override
  Widget build(BuildContext context) {

    return SafeArea (

        child: FutureBuilder<Location1>(
        future: getLocation1(),
        builder: (context, snapshot) {


          var data = snapshot.data;
          return SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Container(

                  )
                  ,
                 Consumer<MyThemeModel>
                   (
                 builder: (context, theme, child) => GestureDetector
                   (
                   onTap: () => theme.changeTheme(),
                   child: Text(
                    theme.isLightTheme ? "Check In" : "Check Out",
                    style: Theme.of(context).textTheme.bodyText1,),
                   ),
                   ),
               TimeInHourAndMinute(),
              Spacer(),
              Clock(),
               Spacer(),
              Container(
                 margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 0.0,bottom: 0.0),

                 child: Row(
                   children: <Widget>[
                     Container(
                       width:60,
                       height: 60,
                       color: Color(0xff9c27b0),
                       child: Center(
                         child: Text(
                          data!.Distination,
                           textAlign: TextAlign.right,
                            style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFFAFAFA),fontSize: 19),
                        ),),),
                 Expanded(
                  child: Align(
                   alignment: Alignment.centerRight,

                   child: Text(
                     "المسافة المسموح بها",
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,),
                       )),)
                       ],
                         )
                          ),
                  Container(
                       margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 2.0,bottom: 0.0),

                        child: Row(
                        children: <Widget>[
                           Container(
                            width:60,
                            height: 60,
                           color: Color(0xff9c27b0),
                            child: Center(
                             child: Text(
                              getDistance(double.parse(data!.LAT), double.parse(data!.LANG)),
                               textAlign: TextAlign.right,
                                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFFAFAFA),fontSize: 14),
                                ),),),
                        Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                           child: Text(
                            "المسافة الى الشركة",
                            textDirection: TextDirection.ltr,
                             textAlign: TextAlign.center,
                             style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,),
                              )),)
                        ],
                         )
                               ),
                  Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 20.0,bottom: 50.0),

                     child: Consumer<MyThemeModel>(
                      builder: (context, theme, child) => GestureDetector(

                       child: SvgPicture.asset(

                      "assest/fingerprint.svg",
                         alignment: Alignment.center,
                         height: 150,
                          width: 150,
                          color:
                          theme.isLightTheme
                          ? Color(0xFF101112) : Color(0xFFFAFAFA) ,

                                               ),
                                         ),
                                   ),
                                ),
                             ],
                       ),
                    );





        }
    ),
    );
  }
  String getDistance(double pLat,double pLng)   {
     lats=currentposition.latitude;
     lngs=currentposition.longitude;
     print(lats);
     print(lngs);
     print("  111111  ");
     print(pLat);
     print(pLng);
/*    var dLat = radians(pLat -  lats);
    var dLng = radians(pLng - lngs);
    var a = sin(dLat/2) * sin(dLat/2) + cos(radians( lats))
        * cos(radians(pLat)) * sin(dLng/2) * sin(dLng/2);
    var c = 2 * atan2(sqrt(a), sqrt(1-a));
    var d = earthRadius * c;*/
    double a=double.parse(lats.toStringAsFixed(4));
    double b=double.parse(lngs.toStringAsFixed(4));
    double distanceInMeters =
    Geolocator.distanceBetween(pLat, pLng,a ,b);
    print ("2222");
    print (distanceInMeters);
  //  return (d.toInt()).toString(); //d is the distance in meters
  return (distanceInMeters.toInt()).toString(); //d is the distance in meters
  }
}