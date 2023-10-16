import 'package:flutter/material.dart';
import 'package:snel/widgets/facture_card.dart';

import 'invoice_details_screen.dart';

class InvoicesScreen extends StatelessWidget {
  const InvoicesScreen({super.key});

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
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: const FactureCard(),
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
                      child: const FactureCard(),
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
