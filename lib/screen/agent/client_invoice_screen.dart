import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../models/invoice_model.dart';
import '../../service/api.dart';
import '../../service/sms_service.dart';

class ClientInvoiceScreen extends StatefulWidget {

  final Invoice invoice;

  ClientInvoiceScreen(this.invoice, {super.key});

  @override
  State<ClientInvoiceScreen> createState() => _ClientInvoiceScreenState();
}

class _ClientInvoiceScreenState extends State<ClientInvoiceScreen> {

  final _api = API(FirebaseFirestore.instance);
  final _smsAPI = SMSService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text("Facture"),
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
                            "${widget.invoice.id}",
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
                              Text(widget.invoice.counterId,
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
                              Text(widget.invoice.period,
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
                    padding: const EdgeInsets.all(16.0),
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
                            Expanded(
                              flex: 3,
                              child: Text(
                                "${widget.invoice.amount} CDF",
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
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: widget.invoice.isPaid ? null : () {
                      _showAlertDialog();
                    },
                    child: widget.invoice.isPaid ? Text("Payé") : Text("Payer")),
              ),
            )
          ],
        )
    );
  }

  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button to dismiss the dialog !
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation de paiement'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Etes-vous sûr de vouloir marquer cette facture comme payée ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Non'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Oui'),
              onPressed: () {

                print("paying invoice");

                payInvoice(widget.invoice);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Pay invoice, set isPaid to true and create a payment in firestore
  void payInvoice(Invoice invoice) async {
    // set invoice isPaid to true
    await _api.setPaidInvoice(invoice);
    var message = await _smsAPI.sendSMS("+243815509291", "Votre facture ${invoice.id} a été payée avec succès");
    log("counter invoice message:: $message");

  }
}

