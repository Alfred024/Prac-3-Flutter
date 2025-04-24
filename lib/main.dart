import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:services_management/config/router/routes.dart';
import 'package:services_management/config/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().getTheme(),
      onGenerateRoute: Routes.routes,
    );
  }
}
