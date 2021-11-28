import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_user_authentication_application/screens/login_screen.dart';

//This is for removing the initialization error for firebase when running the app
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter User Authentication',
      theme: ThemeData(
        // This is the theme of your application.

        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
