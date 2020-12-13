import 'package:chat_app/screens/auth_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Flutter Chat',
            theme: ThemeData(
              primarySwatch: Colors.teal,
              backgroundColor: Colors.teal,
              accentColor: Colors.tealAccent,
              accentColorBrightness: Brightness.dark,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              buttonTheme: ButtonTheme.of(context).copyWith(
                buttonColor: Colors.teal,
                textTheme: ButtonTextTheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            home: AuthScreen(),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
