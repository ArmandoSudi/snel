import 'package:flutter/material.dart';

class CustomBottomNavbar extends StatefulWidget {
  final int curTabIndex;
  final Function(int) onTap;

  const CustomBottomNavbar(Key? key, this.onTap, this.curTabIndex)
      : super(key: key);

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (tabIndex) {
        widget.onTap(tabIndex);
      },
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      currentIndex: widget.curTabIndex,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'account',
        ),
      ],
    );
  }
}
