import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:services_management/config/router/routes.dart';
import 'package:services_management/config/theme/app_theme.dart';
import 'package:services_management/cubit/auth_cubit.dart';
import 'package:services_management/firebase_options.dart';
import 'package:services_management/presentation/screens/auth_view.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    BlocProvider(
      create: (_) => AuthCubit()..checkAuthStatus(),
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      theme: AppTheme().getTheme(),
      home: const AuthView(),
      onGenerateRoute: Routes.routes,
    );
  }
}
