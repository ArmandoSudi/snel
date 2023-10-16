import 'package:flutter/material.dart';
import 'package:snel/users/screens/invoices_screen.dart';
import 'package:snel/users/screens/power_reading_screen.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () => Scaffold.of(context).openDrawer()),
        title: Text("Tableau de bord"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.home_outlined,
                    size: 40,
                    color: Colors.black,
                  ),
                ),
                title: const Text('Immeuble Huilerie'),
                subtitle: const Text("C. Ngaliema, Kinshasa"),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              const SizedBox(height: 20),
              Card(
                  color: Color(0xFFCDE7FB),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Factures",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "14 544 CDF",
                              style: TextStyle(fontSize: 32),
                            ),
                            const SizedBox(height: 20),
                            OutlinedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => InvoicesScreen()));
                              },
                              child: Text("    Voir    "),
                              style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  side: BorderSide(color: Colors.black))
                            )
                          ],
                        ),
                        Icon(
                          Icons.receipt_outlined,
                          size: 100,
                          color: Colors.white,
                        )
                      ],
                    ),
                  )),
              const SizedBox(height: 20),
              Card(
                  color: Color(0xFFDAF9CF),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Consomation du mois",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "345 Kwh",
                              style: TextStyle(fontSize: 32),
                            ),
                            const SizedBox(height: 20),
                            OutlinedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PowerReadingScreen()));
                              },
                              style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  side: const BorderSide(color: Colors.black)),
                              child: const Text("    Voir    ")
                            )
                          ],
                        ),
                        const Icon(
                          Icons.speed,
                          size: 100,
                          color: Colors.white,
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
