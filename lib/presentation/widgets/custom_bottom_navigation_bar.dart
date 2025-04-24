import 'package:flutter/material.dart';
import 'package:services_management/config/theme/app_theme.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  const CustomBottomNavigationBar({super.key, required this.currentIndex});

  final bottomNavigationBar = const BoxDecoration(
    color: Colors.black12,
    borderRadius: BorderRadius.all(Radius.circular(30)),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5, right: 5, left: 5, top: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BottomNavigationBar(
          selectedFontSize: 14,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          backgroundColor: AppTheme().getTheme().primaryColor,
          currentIndex: currentIndex,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_rounded, color: Colors.white),
              label: 'Orders List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.import_contacts_sharp, color: Colors.white),
              label: 'Products List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout, color: Colors.white),
              label: 'Logout',
            ),
          ],
          onTap: (value) => {},
        ),
      ),
    );
  }
}
