
import 'dart:async';

import 'package:consol_info/screens/login_screen.dart';
import 'package:consol_info/utils/CommonFuction.dart';
import 'package:consol_info/utils/font_text_Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();

    Timer(
      const Duration(seconds: 3),
          () => navigateUser(context),
    );
  }
  @override
  Widget build(BuildContext context) {
    var valueType = CommonFunction.getMyDeviceType(MediaQuery.of(context));
    var displayType = valueType.toString().split('.').last;

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1)),
      child:  Scaffold(
        backgroundColor:Colors.white,
        body: Padding(
          padding: EdgeInsets.all(12.0),
          child: Center(
            child: Container(
              // alignment: Alignment.topCenter,

              child: Image.asset(
                'assets/Images/logo.png',
                width: (displayType == 'desktop' || displayType == 'tablet')
                    ? 450.w
                    : 350,
                height: (displayType == 'desktop' || displayType == 'tablet')
                    ? 100.h
                    : 170,
              ),
            ),
          ),
        ),
      ),

    );
  }

  navigateUser(BuildContext context) {

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (BuildContext context) {
        return const LoginScreen();
      }),
          (route) => false,
    );
  }
}