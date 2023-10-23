import 'package:flutter/material.dart';

import '../models/invoice_model.dart';
import '../screen/client/invoice_details_screen.dart';

class FactureCard extends StatelessWidget {
  final Invoice invoice;

  const FactureCard(this.invoice, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // FACTURE ID
              const Text(
                "numéro facture",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),

              // CLIENT ID
              Text(
                invoice.counterId,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),

              // PERIODE DE FACTURATION
              Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text(
                      "Période",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      invoice.period,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // MONTANT
              Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text("Montant",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text("${invoice.amount} CDF",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16),
                    ),
                  ),
                  // const Expanded(
                  //   flex: 1,
                  //   child: Text("A payer",
                  //       style: TextStyle(
                  //           fontSize: 12, fontWeight: FontWeight.bold)),
                  // ),
                  // const Expanded(
                  //   flex: 1,
                  //   child: Text("34000 FC"),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => InvoiceDetailsScreen(invoice),
          ),
        );
      },
    );
  }
}
