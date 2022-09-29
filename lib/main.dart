import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gih/finish_screen.dart';
import 'package:gih/form_screen.dart';
import 'package:gih/phone.dart';
import 'package:gih/verify.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: 'phone',
    debugShowCheckedModeBanner: false,
    routes: {
      'phone': (context) => MyPhone(),
      'verify': (context) => MyVerify(),
      'finish': (context) => FinishScreen()
    },
  ));
}