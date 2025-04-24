import 'package:flutter/material.dart';
import 'package:services_management/presentation/widgets/widgets.dart';
import 'package:table_calendar/table_calendar.dart'; // si lo necesitas en otro archivo

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  // Datos de ejemplo para grid
  final List<Map<String, dynamic>> _products = List.generate(
    6,
    (i) => {
      'name': 'Producto $i',
      'categoryId': 'cat${i % 3}',
      'price': (10 + i * 5).toDouble(),
      'quantity': 1 + i,
    },
  );

  // Controladores del formulario
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();
  final _categoryController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _quantityController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  void _showAddProductForm() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Registrar Producto',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _categoryController,
                decoration: const InputDecoration(
                  labelText: 'Category ID',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Precio',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _quantityController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Cantidad',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.save),
                  label: const Text('Guardar'),
                  onPressed: () {
                    // Aquí iría la lógica de guardado
                    Navigator.of(context).pop();
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Productos')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 3 / 4,
          ),
          itemCount: _products.length,
          itemBuilder: (context, index) {
            final item = _products[index];
            return ProductItem(
              productName: item['name'],
              category: item['categoryId'],
              price: item['price'],
              quantity: item['quantity'],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddProductForm,
        child: const Icon(Icons.add),
      ),
    );
  }
}
