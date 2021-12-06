import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shoes_ecommerce_app/constance.dart';
import 'package:shoes_ecommerce_app/core/helper/binding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shoes_ecommerce_app/view/control_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  await Firebase.initializeApp();
  runApp(ShoesApp());
}

class ShoesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return GetMaterialApp(
      theme: ThemeData(
          primarySwatch: primarySwatch,
          scaffoldBackgroundColor: Colors.blueGrey[50],
          // scaffoldBackgroundColor: primarySwatch[50],
          textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            headline2: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            headline3: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            headline4: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            headline5: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          )
          // fontFamily: "Quicksand",
          ),
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      home: ControlView(),
    );
  }
}
