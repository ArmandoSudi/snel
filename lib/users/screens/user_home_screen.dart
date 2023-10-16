import 'package:flutter/material.dart';
import 'package:snel/users/screens/payment_history_page.dart';
import 'package:snel/users/screens/user_account_page.dart';
import 'package:snel/users/screens/invoices_screen.dart';
import 'package:snel/widgets/admin_bottom_navbar.dart';

import 'dashboard_page.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {

  int _selectedIndex = 0;

  List pages = [
    const DashboardPage(),
    const PaymentHistoryPage(),
    const UserAccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
             DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue[900],
              ),
              child: Center(child: Image.asset("assets/icons/snel_logo.png")),
            ),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: BorderRadius.circular(10),
                ),
                  child: Icon(Icons.home_outlined, size: 40, color: Colors.white,),),
              title: const Text('Residence Familiale'),
              subtitle: const Text("C. Ngaliema, Kinshasa"),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                  child: Icon(Icons.home_outlined, size: 40, color: Colors.black,),),
              title: const Text('Immeuble Huilerie'),
              subtitle: const Text("C. Ngaliema, Kinshasa"),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            const SizedBox(height: 20,),
            TextButton(
              onPressed: () => print("Ajouter"),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add),
                  Text("Ajouter")
                ],
              ),
            )
          ],
        ),
      ),
      body: pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
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
