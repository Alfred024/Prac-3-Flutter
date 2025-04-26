import 'package:flutter/material.dart';
import 'package:services_management/config/router/routes.dart';
import 'package:services_management/config/theme/app_theme.dart';
import 'package:services_management/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppTheme().getTheme().colorScheme;
    final size = MediaQuery.of(context).size;
    //final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;
    // TODO: IMPLEMENT THEME AND COLORS
    //final textStyles = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipPath(
              clipper: BezierCurveClipper(size: size),
              child: Container(
                height: size.height * 0.35,
                width: double.infinity,
                decoration: BoxDecoration(color: colorScheme.primary),
                child: Stack(
                  children: [
                    Positioned(
                      top: 100,
                      left: 30,
                      child: Text(
                        'Crea una cuenta',
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
              height: size.height * 0.65,
              width: double.infinity,
              child: const Center(child: _RegisterForm()),
            ),
          ],
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    const textFieldsWidth = 320.0;
    const textFieldsHeight = 65.0;
    final iconScheme = AppTheme().getTheme().iconTheme;
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          CustomTextFormField(
            width: textFieldsWidth,
            height: textFieldsHeight,
            label: 'Nombre completo',
            keyboardType: TextInputType.name,
            suffixIcon: Icon(
              Icons.account_circle_rounded,
              color: iconScheme.color,
            ),
            onChanged: (value) {},
          ),
          const SizedBox(height: 25),
          CustomTextFormField(
            width: textFieldsWidth,
            height: textFieldsHeight,
            label: 'Correo',
            keyboardType: TextInputType.emailAddress,
            suffixIcon: Icon(Icons.email, color: iconScheme.color),
            onChanged: (value) {},
          ),
          const SizedBox(height: 25),
          CustomTextFormField(
            //obscureText: true,
            width: textFieldsWidth,
            height: textFieldsHeight,
            label: 'Contraseña',
            suffixIcon: Icon(Icons.lock, color: iconScheme.color),
            onChanged: (value) {},
          ),
          const SizedBox(height: 25),
          CustomTextFormField(
            //obscureText: true,
            width: textFieldsWidth,
            height: textFieldsHeight,
            label: 'Confirme la contraseña',
            suffixIcon: Icon(Icons.lock, color: iconScheme.color),
            onChanged: (value) {},
          ),
          const SizedBox(height: 60),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: FilledButton(
              onPressed: () {},
              child: Text('Registrar cuenta'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('¿Ya tienes una cuenta?', style: textStyles.labelSmall),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, Routes.login),
                child: const Text(
                  'Ingresa aquí',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
