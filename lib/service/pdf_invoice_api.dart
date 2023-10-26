import 'dart:io';

import 'package:pdf/widgets.dart';
import 'package:snel/service/pdf_api.dart';
import '../models/invoice_model.dart';

class PdfInvoiceApi {
  static Future<File> generateInvoice(Invoice invoice) async {
    final pdf = Document();
    pdf.addPage(
      MultiPage(
        // pageFormat: PdfPageFormat.a4,
        build: (context) => [
          buildLogo(),
          SizedBox(height: 30),
          buildHeader(),
          SizedBox(height: 10),
          buildDetails(invoice),
        ],
      ),
    );
    return PdfApi.saveDocument(name: 'invoice.pdf', pdf: pdf);
  }

  static  Widget buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('SNEL', style: TextStyle(fontSize: 32)),
      ],
    );
  }

  static  Widget buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Facture', style: TextStyle(fontSize: 24)),
        Text('Date: ${DateTime.now()}'),
      ],
    );
  }

  static Widget buildDetails(Invoice invoice) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Facture no: '),
            Text(invoice.id!),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Numero compteur: '),
            Text(invoice.counterId),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Periode: '),
            Text(invoice.period),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Montant: '),
            Text('${invoice.amount} ${invoice.currency}', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ]
    );
  }
}