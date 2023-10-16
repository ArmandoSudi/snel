import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:snel/models/agent_model.dart';
import 'package:snel/users/screens/invoices_screen.dart';
import 'package:snel/users/screens/power_reading_screen.dart';

import '../../service/api.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final db = FirebaseFirestore.instance;


  @override
  Widget build(BuildContext context) {

    var api = API(db);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () => Scaffold.of(context).openDrawer()),
        title: const Text("Tableau de bord"),
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
                  child: const Icon(
                    Icons.home_outlined,
                    size: 40,
                    color: Colors.black,
                  ),
                ),
                title: const Text('Immeuble Huilerie'),
                subtitle: const Text("C. Ngaliema, Kinshasa"),
                onTap: () async {

                  // Add a new document with a generated ID
                  await db.collection("agents")
                      .doc("yituPkYknIRh7Yj7rUqE")
                      .get()
                      .then((value){
                        var agent = Agent.fromJson(value.data()!);

                        print("Agent:: $agent");
                  });

                 var agent = await api.getAgentByPhone("+243815509291");
                 print("Agent --->>> $agent");
                },
              ),
              const SizedBox(height: 20),
              Card(
                  color: const Color(0xFFCDE7FB),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Factures",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "14 544 CDF",
                              style: TextStyle(fontSize: 32),
                            ),
                            const SizedBox(height: 20),
                            OutlinedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => InvoicesScreen()));
                              },
                              child: const Text("    Voir    "),
                              style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  side: BorderSide(color: Colors.black))
                            )
                          ],
                        ),
                        const Icon(
                          Icons.receipt_outlined,
                          size: 100,
                          color: Colors.white,
                        )
                      ],
                    ),
                  )),
              const SizedBox(height: 20),
              Card(
                  color: const Color(0xFFDAF9CF),
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
