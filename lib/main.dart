import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paulina_knop/routes.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAAlR5drNq99bYrfHolfzpye2ruow0vs14",
            authDomain: "paulina-knop.firebaseapp.com",
            projectId: "paulina-knop",
            storageBucket: "paulina-knop.appspot.com",
            messagingSenderId: "906950632784",
            appId: "1:906950632784:web:69cbbae9a4806b792d3855",
            measurementId: "G-KKYWK4C03D"));
  } else {
    GoogleFonts.config.allowRuntimeFetching = false;
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => Routes.generateRoute(settings),
      initialRoute: '/',
    );
  }
}
