
import 'package:flutter/material.dart';
import 'package:hrmsapp/GlobalVar/Globalvireables.dart';
import 'package:provider/provider.dart';
import 'package:hrmsapp/FingerPrint/body.dart';
import 'package:hrmsapp/FingerPrint/user_location.dart';

class HomeView extends StatelessWidget {
  late BuildContext mcontext;

  goBackToPreviousScreen(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner: false;

    var lat,lng;
    var userLocation = Provider.of<UserLocation>(context);
  //  Globalvireable.lat1=  userLocation.longitude!;//userLocation.latitude!;
   // Globalvireable.lng=userLocation.longitude!;
    mcontext = context;
//print(Globalvireable.lat1);
//print(Globalvireable.lng);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Body()


    );
  }


}