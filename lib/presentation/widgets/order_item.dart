import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final String orderId;
  final String clientName;
  final String status;
  final double total;

  const OrderItem({
    Key? key,
    required this.orderId,
    required this.clientName,
    required this.status,
    required this.total,
  }) : super(key: key);

  Color _statusColor(String status) {
    switch (status) {
      case 'pending':
        return Colors.green.shade600;
      case 'cancelled':
        return Colors.red.shade600;
      case 'done':
        return Colors.grey.shade300;
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ClipRRect(
        child: ListTile(
          title: Text('Id: $orderId'),
          subtitle: Text('Client Id: $clientName'),
          trailing: Text(
            '\$${total.toStringAsFixed(2)}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
