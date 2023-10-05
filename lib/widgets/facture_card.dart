import 'package:flutter/material.dart';

class FactureCard extends StatelessWidget {
  const FactureCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // FACTURE ID
          Text(
            "FAC 02-2023",
            style: Theme.of(context).textTheme.bodyLarge,
          ),

          // CLIENT ID
          Text(
            "Client 0000123",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 10),

          // PERIODE DE FACTURATION
          const Row(
            children: [
              Expanded(
                flex: 1,
                child: Text("Période",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              ),
              Expanded(
                flex: 3,
                child: Text("asd"),
              ),
            ],
          ),

          // MONTANT
          const Row(
            children: [
              Expanded(
                flex: 1,
                child: Text("Montant",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              ),
              Expanded(
                flex: 1,
                child: Text("34000 FC"),
              ),
              Expanded(
                flex: 1,
                child: Text("A payer",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              ),
              Expanded(
                flex: 1,
                child: Text("34000 FC"),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
