import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class InvoiceDetailsScreen extends StatelessWidget {
  InvoiceDetailsScreen({super.key});

  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Facture"),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.notifications),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // FACTURE ID
                    Text(
                      "FAC 02-2023",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),

                    const SizedBox(height: 10),

                    // CLIENT DETAILS
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Client",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("LANDU SUNGU Jeremie",
                            style: TextStyle(fontSize: 14)),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // NUMERO COMPTEUR
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("No compteur",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                        Text("109226772"),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // PERIODE DE FACTURATION
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Periode",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                        Text("Janvier 2023"),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // CONSOMMATION
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Consomation",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                        Text("2000kWh"),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              )),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text("Tranches", style: TextStyle(fontSize: 14)),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text("KWh"),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text("Tarif", style: TextStyle(fontSize: 14)),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text("Valeur"),
                      ),
                    ],
                  ),
                  const Divider(),
                  const Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text("1 - 100", style: TextStyle(fontSize: 14)),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text("100"),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text("74", style: TextStyle(fontSize: 14)),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text("7400"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child:
                            Text("101 - 200", style: TextStyle(fontSize: 14)),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text("100"),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text("73", style: TextStyle(fontSize: 14)),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text("7300"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      const Expanded(
                        flex: 1,
                        child: Divider(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      const Expanded(
                        flex: 1,
                        child: Text("Total", style: TextStyle(fontSize: 14)),
                      ),
                      const Expanded(
                        flex: 1,
                        child: Text("14700"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text("Taxe Provinciale 1%",
                            style: TextStyle(fontSize: 14)),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text("294"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 3,
                        child: Divider(),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      const Expanded(
                        flex: 3,
                        child: Text("Montant", style: TextStyle(fontSize: 20)),
                      ),
                      const Expanded(
                        flex: 3,
                        child: Text(
                          "49 3434,00 CDF",
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                  onPressed: () {

                    debugPrint("Creating new user on firebase");

                    // Create a new user with a first and last name
                    final user = <String, dynamic>{
                      "first": "Elie",
                      "last": "Mbobola",
                      "born": 1994
                    };

                    // Add a new document with a generated ID
                    db.collection("users").add(user).then((DocumentReference doc) =>
                        print('DocumentSnapshot added with ID: ${doc.id}'));
                  },
                  child: Text("Payer")),
            )
          ],
        ),
      ),
    );
  }
}
