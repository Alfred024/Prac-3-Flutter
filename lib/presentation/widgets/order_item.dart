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
    final borderColor = _statusColor(status);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: borderColor, width: 4)),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
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
