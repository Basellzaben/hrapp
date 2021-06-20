import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'fingerprintPage.dart';


class homePage extends StatelessWidget {

  goBackToPreviousScreen(BuildContext context){

    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: Center(



      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Galaxy Hrms System"),
              accountEmail: Text("http://www.gi-group.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.black12,
                child: Text(
                  "G",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.login), title: Text("بصمة الدوام الالكترونية"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => fingerprintPage()),
                );
              },
            ),
    /*        ListTile(
              leading: Icon(Icons.settings), title: Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
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