import 'dart:convert';
import 'dart:io';
import 'dart:io' show Platform;
import 'package:hrmsapp/LanguageProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:hrmsapp/GlobalVar/Globalvireables.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';
import 'homePage.dart';
import 'sqlite/DatabaseHelper.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_localizations/flutter_localizations.dart';

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
      title: 'title.en',
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

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController myController = TextEditingController();
bool reload=true;
  TextEditingController usenameE = TextEditingController();
  TextEditingController passwordE = TextEditingController();
String logo="";
  final dbHelper = DatabaseHelper.instance;
  bool _isObscure = true;
  bool rememberme = false;


  @override
  Widget build(BuildContext context) {
    //var lan=Provider.of<LanguageProvider>(context,listen: true);
    SharedPreferences prefer;


    if(reload) {
  getuserdata();
  reload=false;
}else{

}
    return Scaffold(

      key: _scaffoldKey,

      resizeToAvoidBottomInset : false,
  //    body: SingleChildScrollView(


        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assest/background2.png"), fit: BoxFit.cover),
            ),


           /* decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assest/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),*/
       //  margin: const EdgeInsets.only(left: 0.0,right: 0.0,top: 0.0,bottom: 0.0),
          /*margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 50.0,bottom: 10.0),
        color: Colors.white,
            */
          width: MediaQuery.of(context).size.height,
          height: MediaQuery.of(context).size.height,
            child: Column(children: [

            Card(

              shape: RoundedRectangleBorder(

                borderRadius:BorderRadius.circular(25), // if you need this
                side: BorderSide(
                  width:MediaQuery.of(context).size.height,
                //  color: Colors.black12.withOpacity(0.1),


                ),
              ),
                margin: const EdgeInsets.only(left: 15.0,right: 15.0,top: 120.0,bottom: 0.0),

                    child: Column(children: [
                     // Container(height: 100.0),
                    /*  Expanded(
                        child: TextField(expands: true),
                      )*/

                      Container(
                          color: Colors.transparent,
                         margin: const EdgeInsets.only(left:
                         .0,right: 10.0,top: 30.0,bottom: 15.0),
                          width: MediaQuery.of(context).size.height,
                          // height: MediaQuery.of(context).size.height,
                          //  child:  Image.network('http://www.gi-group.com/images/img/logo.png'),
                          child: Image.file(File(Globalvireable.logo), width: 400.0, height: 100.0)
                      ),



               Container(
                        margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 30.0,bottom: 0.0),
                 color: Colors.transparent,
                       // color: Colors.white,
                        width: MediaQuery.of(context).size.height,
                        // height: MediaQuery.of(context).size.height,

                        child: TextFormField(
textAlign: LanguageProvider.TxtAlign(),
                            controller:usenameE,
                          decoration: InputDecoration(

                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                borderSide: BorderSide(color: Colors.deepPurple, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.deepPurple),
                              ),

                              border: UnderlineInputBorder(),
                              labelText: LanguageProvider.getTexts('username').toString()

                              ,labelStyle:  TextStyle(

    color:Colors.black87,
    )
                          ),
                        ),

                      ),

                    Container(
                      color: Colors.transparent,
                margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 40.0,bottom: 12.0),

              //  color: Colors.white,
                width: MediaQuery.of(context).size.height,
               // height: MediaQuery.of(context).size.height,
                  child: TextFormField(
                    textAlign: LanguageProvider.TxtAlign(),

                    /*controller:passwordE,
                      obscureText:true,

                    decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'أدخل كلمة المرور'
                    ),
                  ),*/
                    controller:passwordE,
                    obscureText: _isObscure,
    decoration: InputDecoration(

    enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
    borderSide: BorderSide(color: Colors.deepPurple, width: 2),

    ),
    focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(color: Colors.deepPurple),
    ),

    border: UnderlineInputBorder(),

    labelText: LanguageProvider.getTexts('password').toString(),


    labelStyle:  TextStyle(
    color:Colors.black87,
    )
    ),
    ),
    ),




      Container(
        margin: const EdgeInsets.only(left: 12.0,right: 12.0,top: 5.0,bottom: 50.0),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: rememberme,
                checkColor: Colors.white,

                onChanged:(bool? value) {
                  setState(() {
                    //_valueCheck = value;
                  rememberme=value!; });
                  },
                activeColor: Theme.of(context).primaryColor),
           //Text("تذكر معلومات الدخول")
          //  Text(lan.getTexts('login').toString())
            Text(LanguageProvider.getTexts('savelogindetails').toString())
          ],
        ),
      ),







                      /*  Align(
                        alignment: Alignment.topLeft,
                      child: Container(
                        margin: const EdgeInsets.only(left: 0.0,right: 0.0,top: 20.0,bottom: 0.0),

                      color: Colors.white,
                      width: MediaQuery.of(context).size.height,
                        child: CheckboxListTile(
                          title: Text("تذكر معلومات الدخول"),
                          checkColor: Colors.greenAccent,
                          activeColor: Colors.red,
                          value: rememberme,

                           onChanged: (bool? value) {

                             rememberme=value!;

                        },),
                        ),),
*/






                    ])
            ),

              Container(
                  margin: const EdgeInsets.only(left: 20.0,right: 20.0,top: 50.0,bottom: 20.0),
                  color: Colors.transparent,

            //      color: Colors.deepPurple,
                  width: MediaQuery.of(context).size.height,
                   height:60,
                  child: ElevatedButton(

                    onPressed: () async {

                      String languageCode = Platform.localeName.split('_')[0];


                      _scaffoldKey.currentState!.showSnackBar(
                          new SnackBar(duration: new Duration(seconds: 4), content:
                          new Row(
                            children: <Widget>[
                              new CircularProgressIndicator(),
//                              new Text("جار تسجيل الدخول")
                              new Text(languageCode)
                            ],
                          ),
                          ));
                      signIn_post(usenameE.text,passwordE.text)
                          .whenComplete(() =>
                          Navigator.of(context).pushNamed("/Home")
                      );


                      //  Login(usenameE.text,passwordE.text);

                      prefer = await SharedPreferences.getInstance();
                      prefer.setString('usenameinfo', usenameE.text);
Globalvireable.id=usenameE.text;
                      if(rememberme)
                      {
                        prefer.setString('usenameE', usenameE.text);
                        prefer.setString('passwordE', passwordE.text);

                      }

                    },
                    child: Text(LanguageProvider.getTexts('login').toString()),
                  )
              ),



              Container(
                  alignment: Alignment.bottomCenter,
                  width:180, //MediaQuery.of(context).size.height,
                  height:12, //MediaQuery.of(context).size.height,
                // margin: const EdgeInsets.only(left: 12.0,right: 12.0,top: 5.0,bottom: 0.0),
             //     color: Colors.black38,
                  child: Align(

                    alignment: Alignment.bottomCenter,

                    child: Text(
                      "powered by galaxy international group",
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.black45,
                        /*  fontWeight: FontWeight.bold*/),
                    ),)

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


  void getuserdata()async{
    SharedPreferences prefer;

    prefer = await SharedPreferences.getInstance();

    var userid = prefer.getString('usenameE');
    var password = prefer.getString('passwordE');

    usenameE.text=userid!;
    passwordE.text=password!;
  }

  /*signIn_post(String id ,String password) async {

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => homePage()),);
  }*/

 signIn_post(String id ,String password) async {
    Uri apiUrl = Uri.parse("http://10.0.1.63:8017/api/User/CheckUser");

    final json = {
      "User_ID": id,
      "User_Password": password
    };
    http.Response response = await http.post(apiUrl, body: json);


    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse == "1") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => homePage()),);
    }
    else if (id.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("يرجى تعبئة جميع المعلومات"),
      ));
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("رقم المستخدم او رمز المرور خطأ"),
      ));
    }
  }
}

class SplashScreenPage extends StatelessWidget {
  final dbHelper = DatabaseHelper.instance;

  @override
  //_query();
  Widget build(BuildContext context) {
    _asyncMethod("https://www.yello.ae/img/ae/r/1418637587-galaxy-international-group-emirates-llc.jpg","loginTop");
    return SplashScreen(
      imageBackground: AssetImage('assest/background2.png'),
      seconds: 6,
      navigateAfterSeconds: new MyHomePage(title: '',),
     // backgroundColor: Colors.white,
      title: new Text('',textScaleFactor: 1.5, style: TextStyle(
        decoration: TextDecoration.underline,
      ),),
      image: new Image.asset('assest/logo.png'
      ),
      photoSize: 180.0,
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
    var filePathAndName = documentDirectory.path + '/images/'+name+'.jpg';

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
    } else{



    }

     // _insert("error in download image",name);
/*    setState(() {
      imageData = filePathAndName;
      dataLoaded = true;
    });*/
  }





/*
  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:'+allRows.toString());
    allRows.forEach(print);
  }*/


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
