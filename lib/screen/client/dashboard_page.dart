import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snel/models/agent_model.dart';
import 'package:snel/screen/client/power_reading_screen.dart';
import 'package:snel/widgets/my_graph.dart';

import '../../providers/counter_provider.dart';
import '../../service/api.dart';
import 'invoices_screen.dart';

class DashboardPage extends ConsumerWidget {
  DashboardPage({super.key});

  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var api = API(db);
    var counter = ref.watch(selectedCounterProvider);
    print("COUNER ==> $counter");

    List<double> weeklySummary = [20, 34.4, 40, 10, 67, 34, 56];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer()),
        title: const Text("Tableau de bord"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
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
                  title: Text(counter?.id ?? "no address selected"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(counter?.category ?? "no address selected"),
                      Text(counter?.address ?? "no address selected"),
                    ],
                  ),
                  onTap: () async {
                    // Add a new document with a generated ID
                    await db
                        .collection("agents")
                        .doc("yituPkYknIRh7Yj7rUqE")
                        .get()
                        .then((value) {
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
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                InvoicesScreen()));
                                  },
                                  child: const Text("    Voir    "),
                                  style: OutlinedButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      side: BorderSide(color: Colors.black)))
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
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PowerReadingScreen()));
                                  },
                                  style: OutlinedButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      side: const BorderSide(
                                          color: Colors.black)),
                                  child: const Text("    Voir    "))
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
                const SizedBox(height: 20),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 200,
                      child: MyGraph(weeklySum: weeklySummary,),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
