import 'package:flutter/material.dart';
import 'package:snel/widgets/facture_card.dart';

import 'invoice_details_screen.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

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
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: "A Payer"),
              Tab(text: "Payé"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: FactureCard(),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => InvoiceDetailsScreen()))
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return InkWell(
                      child: FactureCard(),
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => InvoiceDetailsScreen()))
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
