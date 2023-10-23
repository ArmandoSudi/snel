import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../models/invoice_model.dart';
import '../../service/api.dart';
import '../../service/sms_service.dart';
import 'client_invoice_screen.dart';

class CounterInvoicesScreen extends StatefulWidget {
  var counterId;

  CounterInvoicesScreen(this.counterId, {super.key});

  @override
  State<CounterInvoicesScreen> createState() => _CounterInvoicesScreenState();
}

class _CounterInvoicesScreenState extends State<CounterInvoicesScreen> {

  final _api = API(FirebaseFirestore.instance);
  final _smsAPI = SMSService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Factures"),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _api.getInvoicesByCounterId(widget.counterId),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text("something wen wrong");
            }

            if (snapshot.data == null ||
                snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.data!.docs.length == 0) {
              return const Center(
                  child:
                      Text("Il n'y a pas de facture pour ce compteur"));
            }

            print("Invoices :: ${snapshot.data!.docs.length}");

            return _buildInvoiceList(context, snapshot.data?.docs ?? []);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          var message = await _smsAPI.sendSMS("+243815509291", "Test from flutter app");
          // var message = await payInvoice();
          log("counter invoice message:: $message");
        },
        child: const Icon(Icons.add),
      )
    );
  }

  Widget _buildInvoiceList(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(children: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          "No Compteur",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        child: Text(
          "${widget.counterId}",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      ...snapshot.map((data) => _buildInvoice(context, data)).toList(),
    ]);
  }

  Widget _buildInvoice(BuildContext context, DocumentSnapshot data) {

    final Invoice invoice = Invoice.fromDocument(data);

    return InkWell(
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Numéro facture",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            Text(invoice.id ?? ''),
            const SizedBox(height: 5),
          ],
        ),
        subtitle: Text(invoice.period ?? ''),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "${invoice.amount} CDF",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            invoice.isPaid
                ? const Text("Payée", style: TextStyle(color: Colors.green))
                : const Text("Non payée", style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ClientInvoiceScreen(invoice),
          ),
        );
      },
    );
  }

  void payInvoice(Invoice invoice) async {
    // set invoice isPaid to true
    await _api.setPaidInvoice(invoice);
    var message = await _smsAPI.sendSMS("+243815509291", "Votre facture ${invoice.id} a été payée avec succès");
    log("counter invoice message:: $message");
  }
}
