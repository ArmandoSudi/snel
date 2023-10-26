import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdf/pdf.dart';
import 'package:snel/providers/client_provider.dart';
import 'package:snel/screen/client/payment_screen.dart';

import '../../models/invoice_model.dart';
import '../../models/client_model.dart';
import '../../service/pdf_api.dart';
import '../../service/pdf_invoice_api.dart';

class InvoiceDetailsScreen extends ConsumerWidget {

  final Invoice invoice;

  InvoiceDetailsScreen(this.invoice, {super.key});

  final db = FirebaseFirestore.instance;


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    Client? client = ref.watch(clientProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Ma Facture"),
        actions: [
          IconButton(
            onPressed: () async {
              final pdfFile = await PdfInvoiceApi.generateInvoice(invoice);
              PdfApi.openFile(pdfFile);
            },
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "No",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Text("${invoice.id}",
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ],
                        ),

                        const SizedBox(height: 10),

                        // CLIENT DETAILS
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Client",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Text("${client!.name}",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ],
                        ),
                        const SizedBox(height: 10),

                        // NUMERO COMPTEUR
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "No compteur",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Text(invoice.counterId,
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ],
                        ),
                        const SizedBox(height: 10),

                        // PERIODE DE FACTURATION
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Période",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Text(invoice.period,
                                style: const TextStyle(
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
                          Expanded(
                            flex: 1,
                            child: Text("${invoice.amount - invoice.amount * 0.01}", style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)),
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
                          Expanded(
                            flex: 1,
                            child: Text("${invoice.amount * 0.01}", style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                          const Expanded(
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
                          Expanded(
                            flex: 3,
                            child: Text(
                              "${invoice.amount} CDF",
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentScreen(invoice)));
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
