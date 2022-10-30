import 'package:fasai_task/routes.dart';
import 'package:fasai_task/screens/splash.dart';
import 'package:fasai_task/utils/my_singelton.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(
      child: MaterialApp(
    home: MyApp(),
  )));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Session();
    return ProviderScope(
        child: MaterialApp(
      title: 'Flutter Task',
      key: navigatorKey,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoutes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    ));
  }
}
