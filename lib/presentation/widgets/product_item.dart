import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String productName;
  final String category;
  final double price;
  final int quantity;

  const ProductItem({
    super.key,
    required this.productName,
    required this.category,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(productName, style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 8),
            Text(
              'Category: $category',
              style: const TextStyle(color: Colors.grey),
            ),
            const Spacer(),
            Text(
              '\$${price.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text('Stock: $quantity'),
          ],
        ),
      ),
    );
  }
}
