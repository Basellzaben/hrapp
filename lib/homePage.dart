import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrmsapp/sqlite/DatabaseHelper.dart';
import 'FingerPrint/fingerprintPage.dart';
import 'ProfilePage.dart';
import 'WorkStatePage.dart';
import 'main.dart';

class homePage extends StatelessWidget {
  final dbHelper = DatabaseHelper.instance;

  //onPressed:() => Navigator.of().pop();

 /* goBackToPreviousScreen(BuildContext context){
   // Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => homePage()),);
  }
*/

  @override
  Widget build(BuildContext context) {
   // final dbHelper = DatabaseHelper.instance;

    return Scaffold(
      appBar: AppBar(title: Text('')


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
              accountName: Text("Galaxy Hr System"),
              accountEmail: Text("http://www.gi-group.com"),
              currentAccountPicture: CircleAvatar(
               // backgroundColor: Colors.black12,
                  backgroundImage: AssetImage('assest/background2.png'),
                child: Text(
                  "G",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),

            ListTile(
              leading: Icon(Icons.access_time), title: Text("بصمة الدوام الالكترونية"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => fingerprintPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.work), title: Text("حالة الدوام"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WorkStatePage()),
                );
              },
            ),



            ListTile(
              leading: Icon(Icons.logout), title: Text("تـسجيل الخروج"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(title: '',)),
                );
              },
            ),

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