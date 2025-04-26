import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:services_management/presentation/screens/screens.dart';
import 'package:services_management/cubit/auth_cubit.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        switch (state) {
          case AuthState.initial:
            return const SplashScreen();
          case AuthState.signedOut:
            return const LoginScreen();
          case AuthState.logged:
            return const OrdersScreen();
        }
      },
    );
  }
}
