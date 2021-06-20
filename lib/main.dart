import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';
import 'homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {



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
           child: Image.asset('asset/staticimages/galaxylogo.jpg'),// Image.network('http://www.gi-group.com/images/img/logo.png'),
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
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => homePage()),
  ); },
  child: Text('تسجيل الدخول'),
)
              ),


                    ])

            ),
            ])
     // This trailing comma makes auto-formatting nicer for build methods.
        ), );
  }
}

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return SplashScreen(

      seconds: 6,
      navigateAfterSeconds: new MyHomePage(title: '',),
      backgroundColor: Colors.white,
      title: new Text('Galaxy HRMS APP',textScaleFactor: 1.5, style: TextStyle(
        decoration: TextDecoration.underline,
      ),),
      image: new Image.network(
          'https://thumbs.dreamstime.com/b/human-resources-recruitment-concept-web-page-banner-presentation-social-media-documents-cards-posters-vector-illustration-129833766.jpg'
      ),
//      child: Image.network('https://www.yello.ae/img/ae/r/1418637587-galaxy-international-group-emirates-llc.jpg'),

     // loadingText: Text("Loading"),
      photoSize: 210.0,
     // loaderColor: Colors.red,
    );
  }
}
