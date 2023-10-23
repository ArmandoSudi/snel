import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../models/invoice_model.dart';
import '../../service/api.dart';
import '../../service/sms_service.dart';

enum PaymentMethod {
  mpesa,
  airtelMOney,
  orangeMoney,
  visa,
}

class PaymentScreen extends StatefulWidget {
  final Invoice invoice;

  PaymentScreen(this.invoice, {super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  TextEditingController _phoneController = TextEditingController();

  var paymentMethod = PaymentMethod.mpesa;
  final _api = API(FirebaseFirestore.instance);
  final _smsAPI = SMSService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Méthode de paiement"),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: (paymentMethod == PaymentMethod.mpesa)
                              ? Colors.blue
                              : Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: ListTile(
                      title: const Text('Mpesa'),
                      leading: Image.asset(
                        "assets/icons/mpesa_logo.png",
                      ),
                      trailing: Radio<PaymentMethod>(
                        value: PaymentMethod.mpesa,
                        groupValue: paymentMethod,
                        activeColor: Colors.red,
                        // Change the active radio button color here
                        fillColor: MaterialStateProperty.all(Colors.blue),
                        // Change the fill color when selected
                        splashRadius: 20,
                        // Change the splash radius when clicked
                        onChanged: (value) {
                          setState(() {
                            paymentMethod = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: (paymentMethod == PaymentMethod.airtelMOney)
                              ? Colors.blue
                              : Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: ListTile(
                      title: const Text('Airtel Money'),
                      leading: Image.asset(
                        "assets/icons/airtel_money_logo.png",
                      ),
                      trailing: Radio<PaymentMethod>(
                        value: PaymentMethod.airtelMOney,
                        groupValue: paymentMethod,
                        activeColor: Colors.red,
                        // Change the active radio button color here
                        fillColor: MaterialStateProperty.all(Colors.blue),
                        // Change the fill color when selected
                        splashRadius: 20,
                        // Change the splash radius when clicked
                        onChanged: (value) {
                          setState(() {
                            paymentMethod = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: (paymentMethod == PaymentMethod.orangeMoney)
                              ? Colors.blue
                              : Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: ListTile(
                      title: const Text('Orange Money'),
                      leading: Image.asset(
                        "assets/icons/orange_money_logo.png",
                      ),
                      trailing: Radio<PaymentMethod>(
                        value: PaymentMethod.orangeMoney,
                        groupValue: paymentMethod,
                        activeColor: Colors.red,
                        // Change the active radio button color here
                        fillColor: MaterialStateProperty.all(Colors.blue),
                        // Change the fill color when selected
                        splashRadius: 20,
                        // Change the splash radius when clicked
                        onChanged: (value) {
                          setState(() {
                            paymentMethod = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: (paymentMethod == PaymentMethod.visa)
                              ? Colors.blue
                              : Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: ListTile(
                      title: const Text('Visa'),
                      leading: Image.asset(
                        "assets/icons/visa_logo.png",
                      ),
                      trailing: Radio<PaymentMethod>(
                        value: PaymentMethod.visa,
                        groupValue: paymentMethod,
                        activeColor: Colors.red,
                        // Change the active radio button color here
                        fillColor: MaterialStateProperty.all(Colors.blue),
                        // Change the fill color when selected
                        splashRadius: 20,
                        // Change the splash radius when clicked
                        onChanged: (value) {
                          setState(() {
                            paymentMethod = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  (paymentMethod == PaymentMethod.visa)
                      ? bankPayment()
                      : mobilePayment(),
                ],
              ),
            ),
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: _showAlertDialog,
                    child: Text("Continuer")),
              ),
            )
          ],
        ));
  }

  Widget mobilePayment() {
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child:  Column(
          children: [
            const Text("Entrez votre numero de telephone pour effectuer le paiement",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: "ex: +2438234123",
                label: Text("Numéro de téléphone")
              ),
              controller: _phoneController,
            )
          ],
        ));
  }

  Widget bankPayment() {
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Entrez le numéro de votre carte bancaire",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            TextField(
              decoration: InputDecoration(hintText: "ex: 2354432525345"),
            ),
          ],
        ));
  }

  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog( // <-- SEE HERE
          title: const Text('Confirmation de paiement'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Etes-vous sur de vouloir payer ?'),
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
    var message = await _smsAPI.sendSMS(_phoneController.text, "Votre facture ${invoice.id} a été payée avec succès");
    log("counter invoice message:: $message");

  }

}
