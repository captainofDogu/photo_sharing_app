import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snaphot)
      {
        if(snaphot.connectionState ==   ConnectionState.waiting)
        {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: Center(
                  child: Text("Welcome to Photo Sharing App"),
                ),
              ),
            ),
          );
        }
        else if(snaphot.hasError)
        {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: Center(
                  child: Text("An error occured, Please wait..."),
                ),
              ),
            ),
          );
        }
        return const MaterialApp(
          title: "Flutter Photo Sharing App",
          home: Scaffold(),
        );
      }

    );
  }
}



