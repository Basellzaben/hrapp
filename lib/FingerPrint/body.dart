
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hrmsapp/models/my_theme_provider.dart';
import 'package:provider/provider.dart';
import 'clock.dart';
import 'time_in_hour_and_minute.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [

             Consumer<MyThemeModel>(
              builder: (context, theme, child) => GestureDetector(
                onTap: () => theme.changeTheme(),
                child: Text(
                  theme.isLightTheme
                      ?   "Check In"
                      :   "Check Out",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
            TimeInHourAndMinute(),
            Spacer(),
            Clock(),
            Spacer()
            ,
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0,bottom: 50.0),

            child: Consumer<MyThemeModel>(
              builder: (context, theme, child) => GestureDetector(

                child: SvgPicture.asset(

                 "assest/fingerprint.svg",
                  alignment: Alignment.center,
                  height: 150,
                  width: 150,
                   color:
                  theme.isLightTheme
                      ?    Color(0xFF101112)
                      :   Colors.white ,

                ),
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
