import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hrmsapp/GlobalVar/Globalvireables.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';
import 'homePage.dart';
import 'sqlite/DatabaseHelper.dart';
import 'package:http/http.dart' as http;

void main() {

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  final dbHelper = DatabaseHelper.instance;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreenPage(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.deepPurple,
      ),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final dbHelper = DatabaseHelper.instance;


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  TextEditingController myController = TextEditingController();

  TextEditingController usenameE = TextEditingController();
  TextEditingController passwordE = TextEditingController();
String logo="";
  final dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset : false,

  //    body: SingleChildScrollView(

        body: Container(

          margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 100.0,bottom: 40.0),
          /*margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 50.0,bottom: 10.0),
        color: Colors.white,
            */
          width: MediaQuery.of(context).size.height,
          height: MediaQuery.of(context).size.height,
            child: Column(children: [
     Container(
       margin: const EdgeInsets.only(left: 0.0,right: 0.0,top: 0.0,bottom: 15.0),
       width: MediaQuery.of(context).size.height,
      // height: MediaQuery.of(context).size.height,
       //    child:  Image.network('http://www.gi-group.com/images/img/logo.png'),
       //  child: Image.file(File(Globalvireable.logo), width: 400.0, height: 300.0)
    ),


            Card(
              shape: RoundedRectangleBorder(

                borderRadius:BorderRadius.circular(15), // if you need this
                side: BorderSide(
                   width:MediaQuery.of(context).size.height,
                  color: Colors.black12.withOpacity(0.1),

                ),
              ),
                margin: const EdgeInsets.only(left: 0.0,right: 0.0,top: 20.0,bottom: 0.0),

                    child: Column(children: [
                     // Container(height: 100.0),
                    /*  Expanded(
                        child: TextField(expands: true),
                      )*/





               Container(
                        margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 30.0,bottom: 0.0),

                        color: Colors.white,
                        width: MediaQuery.of(context).size.height,
                        // height: MediaQuery.of(context).size.height,

                        child: TextFormField(
                            controller:usenameE,
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'أدخل اسم المستخدم'
                          ),
                        ),

                      ),



                    Container(
                margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 20.0,bottom: 0.0),

                color: Colors.white,
                width: MediaQuery.of(context).size.height,
               // height: MediaQuery.of(context).size.height,
                  child: TextFormField(
                    controller:passwordE,

                    decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'أدخل كلمة المرور'
                    ),
                  ),

              ),

   Container(
                margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 120.0,bottom: 50.0),

                color: Colors.white,
                width: MediaQuery.of(context).size.height,
               // height: MediaQuery.of(context).size.height,
                  child: ElevatedButton(
  onPressed: () {
    signIn_post(usenameE.text,passwordE.text);
  //  Login(usenameE.text,passwordE.text);


/*    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => homePage()),
    );*/


},
  child: Text('تسجيل الدخول'),
)
              ),

                    ])
            ),
            ])
     // This trailing comma makes auto-formatting nicer for build methods.
        ), );
  }
  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:'+allRows.toString());
    allRows.forEach(print);
  }



  signIn_post(String id ,String password) async {
    Uri apiUrl = Uri.parse("http://10.0.1.63:8017/api/User/CheckUser");

    final json = {
      "User_ID": id,
      "User_Password":password
    };

    http.Response response = await http.post(apiUrl, body: json);

    var jsonResponse = jsonDecode(response.body);
    if(jsonResponse=="1"){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => homePage()),);
    }else{


    }


  }




}

class SplashScreenPage extends StatelessWidget {
  final dbHelper = DatabaseHelper.instance;

  @override
  //_query();
  Widget build(BuildContext context) {
    _asyncMethod("https://www.aeromobil.com/images/home_big.png","loginTop");
    return SplashScreen(

      seconds: 6,
      navigateAfterSeconds: new MyHomePage(title: '',),
      backgroundColor: Colors.white,
      title: new Text('',textScaleFactor: 1.5, style: TextStyle(
        decoration: TextDecoration.underline,
      ),),
      image: new Image.asset('assest/galaxylogo.png'
      ),
      photoSize: 210.0,
     // loaderColor: Colors.red,
    );
  }

  void _insert(String uri,String name) async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName : name,
      DatabaseHelper.columnUrl : uri
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }
  _asyncMethod(String uri,String name) async {
    //comment out the next two lines to prevent the device from getting
    // the image from the web in order to prove that the picture is
    // coming from the device instead of the web.
    //  /mnt/sdcard/Android/data/
    Uri url =Uri.parse(uri);
    // Uri url = uri as Uri; // <-- 1
    var response = await get(url); // <--2
    var documentDirectory = await getApplicationDocumentsDirectory();
    var firstPath = documentDirectory.path + "/images";
    var filePathAndName = documentDirectory.path + '/images/'+name+'.png';

    // var filePathAndName ='/mnt/sdcard/Android/data/'+name+'.png';
    //comment out the next three lines to prevent the image from being saved
    //to the device to show that it's coming from the internet
    await Directory(firstPath).create(recursive: true); // <-- 1
    File file2 = new File(filePathAndName);             // <-- 2
    file2.writeAsBytesSync(response.bodyBytes);
    if(filePathAndName.isNotEmpty) {
     // _insert(filePathAndName, name); // <-- 3
      Globalvireable.logo=filePathAndName;
    //  _query();
    } else{}
     // _insert("error in download image",name);
/*    setState(() {
      imageData = filePathAndName;
      dataLoaded = true;
    });*/
  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:'+allRows.toString());
    allRows.forEach(print);
  }

    // ignore: non_constant_identifier_names
    /*signIn_post(String id ,String password) async {
   Uri apiUrl = "http://10.0.1.63:8017/api/User/CheckUser" as Uri;

  final json = {
    "User_ID": id,
    "User_Password":password
  };

  http.Response response = await http.post(apiUrl, body: json);

  var jsonResponse = jsonDecode(response.body);
  print("jsonn :"+jsonResponse);
  }*/
}
