import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/features/choos_service.dart';
import 'package:flutter_app/features/map_screen.dart';
import 'package:flutter_app/global/custom_color.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showButton = false;

  @override
  void initState() {
    startTime();
    super.initState();
  }

  Timer startTime() {
    Duration duration = new Duration(seconds: 3);
    return new Timer(duration, () {
      showButton = true;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child:
                Image(width: 200, image: AssetImage("assets/images/logo.png")),
          ),
          showButton
              ? Positioned(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChooseServiceScreen()));
                                  //builder: (context) => MapScreen()));
                        },
                        child: Container(
                          width: 40,
                          margin: EdgeInsets.only(bottom: 10),
                          height: 40,
                          child: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: CustomColor.mainColor),
                        ),
                      ),
                      Text(
                        "GO",
                        style: TextStyle(
                          color: CustomColor.mainColor,
                          fontSize: 23,
                        ),
                      )
                    ],
                  ),
                  right: 60,
                  bottom: 50,
                )
              : SizedBox(),
        ],
      ),
    )));
  }
}
