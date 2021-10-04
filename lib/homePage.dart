
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hrmsapp/GlobalVar/Globalvireables.dart';
import 'package:hrmsapp/sqlite/DatabaseHelper.dart';
import 'FingerPrint/body.dart';
import 'FingerPrint/fingerprintPage.dart';
import 'LanguageProvider.dart';
import 'ProfilePage.dart';
import 'WorkStatePage.dart';
import 'main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}
class _homePageState extends State<homePage> {
  final dbHelper = DatabaseHelper.instance;
String ss="ar";
  goBackToPreviousScreen(BuildContext context){
   // Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => homePage()),);
  }

  @override
  Widget build(BuildContext context) {
    // final dbHelper = DatabaseHelper.instance;
    if (LanguageProvider.getTexts("language") == "language"){
      return Scaffold(
        appBar: AppBar(title: Text(
            LanguageProvider.getTexts('profile').toString(),
            textDirection: TextDirection.ltr),
        ),
        // appBar: AppBar(title: Text("")),
        body: Center(
          child: ProfilePage(),
        ),
        drawer: Drawer(

          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[

              UserAccountsDrawerHeader(
                accountName: Text(Globalvireable.name),
                accountEmail: Text(Globalvireable.email),
                currentAccountPicture: CircleAvatar(
                  // backgroundColor: Colors.black12,
                  backgroundImage: AssetImage('assest/background2.png'),
                  child: Text(
                    "G",
                    textDirection: LanguageProvider.getDirection(),
                    style: TextStyle(fontSize: 40.0),
                  ),

                ),
              ),

              ListTile(
                leading: Icon(Icons.access_time,
                    textDirection: LanguageProvider.getDirection()),
                title: Text(LanguageProvider.getTexts('timeimprint').toString()
                    , textDirection: LanguageProvider.getDirection()),
                onTap: () {

                  Navigator.pop(context);
                  final Body ani= new Body();
                  getLocation();

                  _determinePosition();
                  Future.delayed(const Duration(seconds: 2), (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => fingerprintPage()),
                    );});

                 /* Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => fingerprintPage()),
                  );*/
                },
              ),
              ListTile(
                leading:Icon(
                    Icons.work, textDirection: LanguageProvider.getDirection()),
                title: Text(LanguageProvider.getTexts('workingstate').toString()
                    , textDirection: LanguageProvider.getDirection()),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WorkStatePage()),
                  );
                },
              ),


              ListTile(
                leading: Icon(Icons.logout,
                    textDirection: LanguageProvider.getDirection()),
                title: Text(LanguageProvider.getTexts('leaverequest').toString()
                    , textDirection: LanguageProvider.getDirection()),

                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomePage(title: '',)),
                  );
                },
              ),

              ListTile(
                leading: Icon(Icons.logout,
                    textDirection: LanguageProvider.getDirection()),
                title: Text(LanguageProvider.getTexts('vacationrequest').toString()
                    , textDirection: LanguageProvider.getDirection()),

                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomePage(title: '',)),
                  );
                },
              ),


              ListTile(
                leading: Icon(Icons.logout,
                    textDirection: LanguageProvider.getDirection()),
                title: Text(LanguageProvider.getTexts('Logout').toString()
                    , textDirection: LanguageProvider.getDirection()),

                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomePage(title: '',)),
                  );
                },
              ),

              ListTile(
                subtitle: Column(
                  children: <Widget>[
                    FlatButton( color: Colors.deepPurple,
                        shape: CircleBorder(),child: Text(Globalvireable.languageCode,


                        ),
                        onPressed: () {

                          if(Globalvireable.languageCode=="en")
                            Globalvireable.languageCode="ar";
                          else
                            Globalvireable.languageCode="en";

                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage(title: '',)));


                        })
                  ],
                ),
              ),

             /* ListTile(
                leading: Icon(null,
                    textDirection: LanguageProvider.getDirection()),
                title: Text(*//*LanguageProvider.getTexts('En').toString()*//*
                  Globalvireable.languageCode,
                    style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23.0,// double
                ),

                     textDirection: LanguageProvider.getDirection()),


                onTap: () {

                  if(Globalvireable.languageCode=="en")
                    Globalvireable.languageCode="ar";
                  else
                    Globalvireable.languageCode="en";

                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyHomePage(title: '',)));

                },
              ),
*/
/*
      Container(
      //  margin: const EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0,bottom: 0.0),
        color: Colors.transparent,
        // color: Colors.white,
        width: 10,
        height: 10,
        // height: MediaQuery.of(context).size.height,


          child: ElevatedButton(

            onPressed: () async {

              //  Login(usenameE.text,passwordE.text);

              SharedPreferences  prefer = await SharedPreferences.getInstance();
if(prefer.getString('f') !=null) {
  if (prefer.getString('f') == "ar") {
    prefer.setString('f', "en");
  } else {
    prefer.setString('f', "ar");
  }
}else{
  prefer.setString('f', "ar");

}
              ss= prefer.getString('f')!;

            },
            child: Text(ss),
          )


              */ /* child: Switch(
                value: true
                 ,
                onChanged: (value) {
                  setState(() {
                      setval(value);

                  });
                },
                activeTrackColor: Colors.black26,
                activeColor: Colors.deepPurpleAccent,
              ),
*/ /*
      ),*/
              /* ListTile(
              leading: Icon(Icons.contacts), title: Text("Contact Us"),
              onTap: () {
                Navigator.pop(context);
              },
            ),*/
            ],
          ),
        ),

      );
  }else{
      return Scaffold(

        appBar: AppBar(
            centerTitle: true,
        titleSpacing:100.0,
      title: Text(
            LanguageProvider.getTexts('profile').toString(),
            textDirection: TextDirection.rtl)
        ),
        // appBar: AppBar(title: Text("")),
        body: Center(
          child: ProfilePage(),
        ),

        endDrawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[

              UserAccountsDrawerHeader(
                accountName: Text(Globalvireable.name),
                accountEmail: Text(Globalvireable.email),
                currentAccountPicture: CircleAvatar(
                  // backgroundColor: Colors.black12,
                  backgroundImage: AssetImage('assest/background2.png'),
                  child: Text("G",
                    textDirection: LanguageProvider.getDirection(),
                    style: TextStyle(fontSize: 40.0),
                  ),

                ),
              ),

              ListTile(
                leading: Icon(Icons.access_time,
               textDirection: LanguageProvider.getDirection()),
                title: Text(LanguageProvider.getTexts('timeimprint').toString()
                    , textDirection: LanguageProvider.getDirection()),
                onTap: () {
                  Navigator.pop(context);
                  final Body ani= new Body();
                  getLocation();

                  _determinePosition();
                   Future.delayed(const Duration(seconds: 2), (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => fingerprintPage()),
                  );});
                },
              ),
              ListTile(
                leading: Icon(
                    Icons.work, textDirection: LanguageProvider.getDirection()),
                title: Text(LanguageProvider.getTexts('workingstate').toString()
                    , textDirection: LanguageProvider.getDirection()),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WorkStatePage()),
                  );
                },
              ),
              ListTile(
                leading:Icon(
                    Icons.work, textDirection: LanguageProvider.getDirection()),
                title: Text(LanguageProvider.getTexts('workingstate').toString()
                    , textDirection: LanguageProvider.getDirection()),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WorkStatePage()),
                  );
                },
              ),


              ListTile(
                leading: Icon(Icons.logout,
                    textDirection: LanguageProvider.getDirection()),
                title: Text(LanguageProvider.getTexts('leaverequest').toString()
                    , textDirection: LanguageProvider.getDirection()),

                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomePage(title: '',)),
                  );
                },
              ),


              ListTile(
                leading: Icon(Icons.logout,
                    textDirection: LanguageProvider.getDirection()),
                title: Text(LanguageProvider.getTexts('Logout').toString()
                    , textDirection: LanguageProvider.getDirection()),

                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomePage(title: '',)),
                  );
                },
              ),


             /* ListTile(
                subtitle: Column(
                  children: <Widget>[
                    FlatButton( color: Colors.deepPurple,
                        shape: CircleBorder(),child: Text(Globalvireable.languageCode),
                        onPressed: () {

                          if(Globalvireable.languageCode=="en")
                            Globalvireable.languageCode="ar";
                          else
                            Globalvireable.languageCode="en";

                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage(title: '',)));


                        })
                  ],
                ),
              ),
*/
              ListTile(
                subtitle: Column(
                  children: <Widget>[
                    FlatButton( color: Colors.deepPurple,
                        shape: CircleBorder(),child: Text(Globalvireable.languageCode,


                        ),
                        onPressed: () {

                          if(Globalvireable.languageCode=="en")
                            Globalvireable.languageCode="ar";
                          else
                            Globalvireable.languageCode="en";

                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage(title: '',)));


                        })
                  ],
                ),
              ),

             /* ListTile(
                leading: Icon(Icons.logout,
                    textDirection: LanguageProvider.getDirection()),
                title: Text(*//*LanguageProvider.getTexts('En').toString()*//*
                    Globalvireable.languageCode
                    , textDirection: LanguageProvider.getDirection()),

                onTap: () {

                  if(Globalvireable.languageCode=="en")
                    Globalvireable.languageCode="ar";
                  else
                    Globalvireable.languageCode="en";

                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => MyHomePage(title: '',)));

                },
              ),
*/

/*
      Container(
      //  margin: const EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0,bottom: 0.0),
        color: Colors.transparent,
        // color: Colors.white,
        width: 10,
        height: 10,
        // height: MediaQuery.of(context).size.height,


          child: ElevatedButton(

            onPressed: () async {



              //  Login(usenameE.text,passwordE.text);

              SharedPreferences  prefer = await SharedPreferences.getInstance();
if(prefer.getString('f') !=null) {
  if (prefer.getString('f') == "ar") {
    prefer.setString('f', "en");
  } else {
    prefer.setString('f', "ar");
  }
}else{
  prefer.setString('f', "ar");

}


              ss= prefer.getString('f')!;

            },
            child: Text(ss),
          )

              */ /* child: Switch(
                value: true
                 ,
                onChanged: (value) {
                  setState(() {
                      setval(value);

                  });
                },
                activeTrackColor: Colors.black26,
                activeColor: Colors.deepPurpleAccent,
              ),
*/ /*
      ),*/
              /* ListTile(
              leading: Icon(Icons.contacts), title: Text("Contact Us"),
              onTap: () {
                Navigator.pop(context);
              },
            ),*/
            ],
          ),
        ),

      );
    }


  }
  addStringToSF(String key,String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

 /* getStringValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = prefs.getString(key);
    if(stringValue !="en" && stringValue !="ar")
      return "ar";
    return stringValue;
  }*/

 /*bool getval(){
    if(Globalvireable.language=="ar")
      return true;
    return false;
  }*/

  void getLocation() async {
    Globalvireable.currentPosition = await GeolocatorPlatform.instance.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

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

}