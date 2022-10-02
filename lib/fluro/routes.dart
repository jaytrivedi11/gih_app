import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:gih/default.dart';
import 'package:gih/phone.dart';

class Flurorouter {
  static final router = FluroRouter();
  static var usersHandler = Handler(handlerFunc:
      (BuildContext? context, Map<String, List<String>> parameters) {
    return MyPhone(id: parameters['id']![0]);
  });

  static var defaultHandler = Handler(handlerFunc:
      (BuildContext? context, Map<String, List<String>> parameters) {
    return DefaultScreen();
  });

  static void defineRoutes() {
    router.define("/form/:id", handler: usersHandler);
    router.define("/", handler: defaultHandler);
  }
}
