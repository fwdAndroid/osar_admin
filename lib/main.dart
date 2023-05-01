import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:osar_admin/auth/login_page.dart';
import 'package:osar_admin/provider/circular_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyDlKokAjg07dubIUYStflfDtwZWiBhaZjs",
      authDomain: "osar-ea440.firebaseapp.com",
      projectId: "osar-ea440",
      storageBucket: "osar-ea440.appspot.com",
      messagingSenderId: "1019822089181",
      appId: "1:1019822089181:web:4859547955dc8d050e4c34",
    ));
  } else {
    await Firebase.initializeApp();
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CircularProgressProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Osar Admin',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
