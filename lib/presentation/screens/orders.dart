import 'package:flutter/material.dart';
import 'package:services_management/presentation/widgets/widgets.dart';
import 'package:table_calendar/table_calendar.dart';

class OrdersScreen extends StatefulWidget {
  static const name = 'orders-screen';
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  // Filtros de estado: 0=En proceso, 1=Cumplidos, 2=Cancelados
  int _selectedFilter = 0;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final Map<DateTime, List<String>> _events = {
    DateTime.now(): ['pending', 'done', 'cancelled'],
    DateTime.now().add(Duration(days: 2)): ['pending', 'pending'],
  };
  List<String> _getEventsForDay(DateTime day) {
    return _events[DateTime(day.year, day.month, day.day)] ?? [];
  }

  final orderStatus = ['En proceso', 'Cumplidos', 'Cancelados'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Órdenes')),
      body: CustomScrollView(
        slivers: [
          // Sliver con la lista de los filtros
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 8,
                children: List.generate(orderStatus.length, (i) {
                  return ChoiceChip(
                    label: Text(orderStatus[i]),
                    selected: _selectedFilter == i,
                    onSelected: (_) => setState(() => _selectedFilter = i),
                  );
                }),
              ),
            ),
          ),

          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //     child: TableCalendar<String>(
          //       firstDay: DateTime.utc(2020, 1, 1),
          //       lastDay: DateTime.utc(2030, 12, 31),
          //       focusedDay: _focusedDay,
          //       selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          //       eventLoader: _getEventsForDay,
          //       calendarStyle: CalendarStyle(
          //         markerDecoration: BoxDecoration(shape: BoxShape.circle),
          //       ),
          //       onDaySelected: (selectedDay, focusedDay) {
          //         setState(() {
          //           _selectedDay = selectedDay;
          //           _focusedDay = focusedDay;
          //         });
          //       },
          //     ),
          //   ),
          // ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => OrderItem(
                  orderId: '99KDOTB9mFzDtrxNoMJg',
                  clientName: 'Juanito Álvarez',
                  status:
                      index % 3 == 0
                          ? 'pending'
                          : index % 3 == 1
                          ? 'done'
                          : 'cancelled',
                  total: 100.0 + index * 20,
                ),
                childCount: 6,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 0),
    );
  }
}
