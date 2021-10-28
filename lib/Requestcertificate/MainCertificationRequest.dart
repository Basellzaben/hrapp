import 'package:flutter/material.dart';
import 'package:hrmsapp/vacation_request/body_vacation.dart';

import '../homePage.dart';
import 'CertificationRequest.dart';
//import 'body_Leave_Screen.dart';

void main() {
  runApp(MainCertificationRequest());
}
class MainCertificationRequest extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
goBackToPreviousScreen(BuildContext context) {
  Navigator.pop(context);
}

class _MyAppState extends State<MainCertificationRequest> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CertificationRequest(),
      debugShowCheckedModeBanner: false,
      title: 'title.en',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),




      //home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}