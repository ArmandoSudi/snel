import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snel/widgets/facture_card.dart';

import '../../models/invoice_model.dart';
import '../../service/api.dart';
import '../../providers/counter_provider.dart';

class InvoicesScreen extends ConsumerStatefulWidget {
  const InvoicesScreen({super.key});

  @override
  _InvoicesScreenState createState() => _InvoicesScreenState();
}

class _InvoicesScreenState extends ConsumerState<InvoicesScreen> {

  final _api = API(FirebaseFirestore.instance);

  @override
  Widget build(BuildContext context) {

    var selectedCounter = ref.watch(selectedCounterProvider);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text("Mes factures"),
          actions: [
            IconButton(
              icon: SizedBox(
                height: 35,
                width: 35,
                child: Stack(
                  children: [
                    const Icon(Icons.notifications, size: 25),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                            border: Border.all(color: Colors.white, width: 2)
                        ),
                        child: Text("4", style: TextStyle(fontSize: 10, color: Colors.white),),
                      ),
                    ),
                  ],
                ),
              ),
              onPressed: () {},
            )
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: "A Payer"),
              Tab(text: "Payés"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder<QuerySnapshot>(
                  stream: _api.getInvoicesByCounterId(selectedCounter!.id!),
                  builder: (context, snapshot) {

                    if (snapshot.hasError) {
                      return const Center(child: Text("Erreur de connection"));
                    } else if (snapshot.data == null || snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (!snapshot.hasData) {
                      return Center(child: Text("Erreur de connection"));
                    }

                    // Filter the list of invoices and display only UNPAID INVOICES
                    var unpaidInvoices = snapshot
                        .data!
                        .docs
                        .where((element) => element['is_paid'] == false)
                        .toList();

                    if (unpaidInvoices.isEmpty) {
                      return Center(child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Il n'y a pas de factures à payer pour le compteur"),
                          Text("no: ${selectedCounter.id}"),
                          Text("adresse: ${selectedCounter.address}"),
                        ],
                      ));
                    }

                    return _buildInvoiceList(context, unpaidInvoices);
                  }

              )
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: StreamBuilder<QuerySnapshot>(
                    stream: _api.getInvoicesByCounterId(selectedCounter!.id!),
                    builder: (context, snapshot) {

                      if (snapshot.hasError) {
                        return const Center(child: Text("Erreur de connection"));
                      } else if (snapshot.data == null || snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (!snapshot.hasData) {
                        return Center(child: Text("Erreur de connection"));
                      }

                      // Filter the list of invoices and display only PAID INVOICES
                      var paidInvoices = snapshot
                          .data!
                          .docs
                          .where((element) => element['is_paid'] == true)
                          .toList();

                      if (paidInvoices.isEmpty) {
                        return Center(child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Il n'y a pas de factures à payer pour le compteur"),
                            Text("no: ${selectedCounter.id}"),
                            Text("adresse: ${selectedCounter.address}"),
                          ],
                        ));
                      }

                      print("PAID INVOICE :: $paidInvoices");

                      return _buildInvoiceList(context, paidInvoices);
                    }

                )
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInvoiceList( BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      children: snapshot.map((data) => _buildInvoice(context, data)).toList(),
    );
  }

  Widget _buildInvoice(BuildContext context, DocumentSnapshot data) {
    // final Invoice invoice = Invoice.fromJson(data.data() as Map<String, dynamic>);
    final Invoice invoice = Invoice.fromDocument(data);

    return FactureCard(invoice);
  }
}
