import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:snel/widgets/facture_card.dart';

import '../../models/invoice_model.dart';
import '../../service/api.dart';
import 'invoice_details_screen.dart';

class InvoicesScreen extends StatefulWidget {
  const InvoicesScreen({super.key});

  @override
  State<InvoicesScreen> createState() => _InvoicesScreenState();
}

class _InvoicesScreenState extends State<InvoicesScreen> {

  final _api = API(FirebaseFirestore.instance);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text("Mes factures"),
          actions: [
            IconButton(
              icon: Container(
                // color: Colors.red,
                child: SizedBox(
                  height: 35,
                  width: 35,
                  child: Stack(
                    children: [
                      Icon(Icons.notifications, size: 25),
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
                  stream: _api.getUnpaidInvoices(),
                  builder: (context, snapshot) {

                    if (snapshot.hasError) {
                      return const Text("something wen wrong");
                    }

                    if (snapshot.data == null || snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (!snapshot.hasData) {
                      return const Text("There is no payment yet");
                    }

                    print("Invoices :: ${snapshot.data!.docs.length}");

                    return _buildInvoiceList(context, snapshot.data?.docs ?? []);
                  }

              )
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: StreamBuilder<QuerySnapshot>(
                    stream: _api.getPaidInvoices(),
                    builder: (context, snapshot) {

                      if (snapshot.hasError) {
                        return const Text("something wen wrong");
                      }

                      if (snapshot.data == null || snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (!snapshot.hasData) {
                        return const Center(child: Text("There is no payment yet"));
                      } else if (snapshot.data!.docs.length == 0) {
                        return const Center(child: Text("Il n'y a pas des factures payées"));
                      }
                      print("Unpaid Invoices :: ${snapshot.data!.docs.length}");

                      return _buildInvoiceList(context, snapshot.data?.docs ?? []);
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

    print("Invoice ID ::: ${invoice.id}");

    return FactureCard(invoice);
  }
}
