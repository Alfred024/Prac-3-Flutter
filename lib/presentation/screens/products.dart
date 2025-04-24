import 'package:flutter/material.dart';
import 'package:services_management/presentation/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  static const name = 'home-screen';

  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Productos')),
      body: Center(
        child: Text(
          'Products Screen...',
          style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: 0),
    );
  }
}
