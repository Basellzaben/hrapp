import 'dart:convert';
import 'dart:html';
import 'package:hrmsapp/FingerPrint/Location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
class fingerprintEvent extends StatefulWidget  {


  late Position _currentPosition;
  double earthRadius = 6371000;

  @override
  _fingerprintEventState createState() => _fingerprintEventState();
}

class _fingerprintEventState extends State<fingerprintEvent> {
  late Position _currentPosition;

  var Loc;
  Future<Location> getLocation1() async {
    Uri apiUrl = Uri.parse("http://10.0.1.60:8017/api/Destination/GetLocation");


    http.Response response = await http.get(apiUrl);

    var jsonResponse = jsonDecode(response.body);

    // var parsedJson = json.decode(jsonResponse);
    //Loc = Location.fromJson(jsonResponse);
    return Loc;
  }
  void getLocation() async {
    _currentPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
    );


  }

  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner:false;

    return Scaffold(

      body: Center(

        child: RaisedButton(
          onPressed: () {
         //   getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}