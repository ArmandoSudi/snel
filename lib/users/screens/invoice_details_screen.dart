import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:snel/users/screens/payment_screen.dart';

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
            icon: Icon(Icons.download),
          )
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.grey)
                    ),
                    child: Column(
                      children: [
                        // FACTURE ID
                        Text(
                          "FAC 024332452023/18",
                          style: Theme.of(context).textTheme.headlineSmall,
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
                                  color: Colors.grey),
                            ),
                            Text("LANDU SUNGU Jeremie",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ],
                        ),
                        const SizedBox(height: 10),

                        // NUMERO COMPTEUR
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "No compteur",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Text("109226772",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ],
                        ),
                        const SizedBox(height: 10),

                        // PERIODE DE FACTURATION
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Période",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Text("Janvier 2023",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ],
                        ),
                        const SizedBox(height: 10),

                        // CONSOMMATION
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Consomation",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),
                            Text("2000kWh",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text("Tranches", style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold)),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text("KWh", style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold)),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text("Tarif", style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold)),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text("Valeur", style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      const Divider(),
                      const Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text("1 - 100", style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text("100", style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text("74", style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text("7400", style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child:
                            Text("101 - 200", style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text("100", style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text("73",style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text("7300", style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)),
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
                            child: Text("Total", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey)),
                          ),
                          const Expanded(
                            flex: 1,
                            child: Text("14700", style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)),
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
                          const Expanded(
                            flex: 2,
                            child: Text("Taxe Provinciale 1%",
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey)),
                          ),
                          const Expanded(
                            flex: 1,
                            child: Text("294", style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)),
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
                            child: Text("Montant", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey)),
                          ),
                          const Expanded(
                            flex: 3,
                            child: Text(
                              "49 3434,00 CDF",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

              ],
            ),
          ),
          Positioned(
            bottom: 30,
              left: 0, right: 0,
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentScreen()));
                },
                child: Text("Payer")),
          ),
          )
        ],
      )
    );
  }

  void createUser() {

    // Create a new user with a first and last name
    final user = <String, dynamic>{
      "first": "Elie",
      "last": "Mbobola",
      "born": 1994
    };

    // Add a new document with a generated ID
    db.collection("users").add(user).then(
            (DocumentReference doc) =>
            print('DocumentSnapshot added with ID: ${doc.id}'));
  }
}
