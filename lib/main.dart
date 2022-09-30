import 'package:firebase_core/firebase_core.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:gih/finish_screen.dart';
import 'package:gih/firebase_options.dart';
import 'package:gih/fluro/routes.dart';
import 'package:gih/form_screen.dart';
import 'package:gih/phone.dart';
import 'package:gih/verify.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Flurorouter.defineRoutes();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    initialRoute: 'phone',
    debugShowCheckedModeBanner: false,
    onGenerateRoute: Flurorouter.router.generator,
    routes: {

    },
  ));
}
