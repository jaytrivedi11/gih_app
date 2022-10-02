import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gih/default.dart';
import 'package:gih/firebase_options.dart';
import 'package:gih/fluro/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Flurorouter.defineRoutes();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    initialRoute: "/",
    debugShowCheckedModeBanner: false,
    onGenerateRoute: Flurorouter.router.generator,
    routes: {
      "/": (context) => const DefaultScreen(),
    },
  ));
}
