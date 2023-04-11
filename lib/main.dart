import 'package:fast_feet/firebase_options.dart';
import 'package:fast_feet/routes/routes.dart';
import 'package:fast_feet/services/firebase/auth_service.dart';
import 'package:fast_feet/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Fast_Feet',
        theme: getTheme(),
        initialRoute:
            AuthService().currentUser == null ? Routes.login : Routes.home,
        routes: Routes.routes);
  }
}
