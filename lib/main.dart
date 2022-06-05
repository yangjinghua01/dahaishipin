import 'package:dahaishipin/router/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: YRouter.inintialRouter,
      routes: YRouter.routes,
      onGenerateRoute: YRouter.generateRoute,
      onUnknownRoute: YRouter.unknowRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}

