import 'package:flutter/material.dart';
import 'package:snel/users/screens/user_account_page.dart';
import 'package:snel/users/screens/user_home_page.dart';
import 'package:snel/widgets/admin_bottom_navbar.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {

  int _selectedIndex = 0;

  List pages = [
    const UserHomePage(),
    const UserAccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: false,
      //   title: const Text('Acceuil'),
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: const Icon(Icons.notifications),
      //     ),
      //   ],
      // ),
      body: pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        // selectedItemColor: Colors.amber[800],
        onTap: (int index) {
          setState(() {
              _selectedIndex = index;
            },
          );
        },
      ),
    );
  }
}
