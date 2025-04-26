import 'package:flutter/material.dart';
import 'package:services_management/config/theme/app_theme.dart';
import 'package:services_management/presentation/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorScheme = AppTheme().getTheme().colorScheme;
    //final textTheme = AppTheme().getTheme().textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: BezierCurveClipper(size: size),
              child: Container(
                height: size.height * 0.55,
                width: double.infinity,
                decoration: BoxDecoration(color: colorScheme.primary),
                child: Stack(
                  children: [
                    Positioned(
                      top: 200,
                      left: 30,
                      child: Text(
                        'Inicio de sesión',
                        style: TextStyle(
                          color: colorScheme.background,
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: size.height * 0.45,
              width: double.infinity,
              child: const Center(child: _LoginForm()),
              //child: const Center(child: Text('data')),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  //Method that displays scaffold message
  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final iconScheme = AppTheme().getTheme().iconTheme;
    final textStyles = Theme.of(context).textTheme;
    // Watch: Get the value of the state and know when if it changes

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Correo',
            suffixIcon: Icon(Icons.email, color: iconScheme.color),
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              // Read: Get the value of a provider just once (dont listen for state changes)
            },
          ),
          const SizedBox(height: 25),
          CustomTextFormField(
            //obscureText: true,
            suffixIcon: Icon(Icons.remove_red_eye, color: iconScheme.color),
            label: 'Contraseña',
            onChanged: (value) {},
          ),
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: FilledButton(onPressed: () {}, child: Text('Ingresar')),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('¿Aún no tienes una cuenta?', style: textStyles.labelSmall),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Crea una aquí',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
