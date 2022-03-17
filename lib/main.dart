import 'package:cab_rider/dataprovider/appdata.dart';
import 'package:cab_rider/globalvariable.dart';
import 'package:cab_rider/screens/loginpage.dart';
import 'package:cab_rider/screens/mainpage.dart';
import 'package:cab_rider/screens/registrationpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:provider/provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await FirebaseApp.configure(
    name: 'db2',
    options: Platform.isIOS
        ? const FirebaseOptions(
      googleAppID: '1:196923410803:ios:dab0db1346a1005fba9d06',
      gcmSenderID: '196923410803',
      databaseURL: 'https://kabukabu-b5c62-default-rtdb.firebaseio.com',
    )
        : const FirebaseOptions(
      googleAppID: '1:196923410803:android:9897e871ef1e1511ba9d06',
      apiKey: 'AIzaSyA1aT2w4kCM8a7ecK3p4gP8uGghtTDiAQo',
      databaseURL: 'https://kabukabu-b5c62-default-rtdb.firebaseio.com',
    ),
  );

  currentFirebaseUser = await FirebaseAuth.instance.currentUser();

  runApp(MyApp());

}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Brand-Regular',
          primarySwatch: Colors.blue,
        ),
        initialRoute: (currentFirebaseUser == null) ? LoginPage.id : MainPage.id,
        routes: {
          RegistrationPage.id: (context) => RegistrationPage(),
          LoginPage.id: (context) => LoginPage(),
          MainPage.id: (context) => MainPage(),
        },
      ),
    );
  }
}

