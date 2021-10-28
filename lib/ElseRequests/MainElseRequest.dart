import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrmsapp/ElseRequests/ElseRequestBody.dart';

import '../homePage.dart';

void main() {
  runApp(MainElseRequest());
}
class MainElseRequest extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
goBackToPreviousScreen(BuildContext context) {
  Navigator.pop(context);
}

class _MyAppState extends State<MainElseRequest> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ElseRequestBody(),
      debugShowCheckedModeBanner: false,
      title: 'title.en',
      theme: ThemeData(

        primarySwatch: Colors.deepPurple,
      ),




      //home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
