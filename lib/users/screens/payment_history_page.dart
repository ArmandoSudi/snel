import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../models/payment_model.dart';
import '../../service/api.dart';

class PaymentHistoryPage extends StatefulWidget {
  const PaymentHistoryPage({super.key});

  @override
  State<PaymentHistoryPage> createState() => _PaymentHistoryPageState();
}

class _PaymentHistoryPageState extends State<PaymentHistoryPage> {

  final _api = API(FirebaseFirestore.instance);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer()),
          title: const Text("Historique des paiements"),
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
                        child: const Text("4", style: TextStyle(fontSize: 10,
                            color: Colors.white),),
                      ),
                    ),
                  ],
                ),
              ),
              onPressed: () {
                // populatePayment();
              },
            )
          ],
        ),
        body: SafeArea(
          child: PaymentList(),
        ));
  }

  Widget PaymentList() {
    return StreamBuilder<QuerySnapshot>(
        stream: _api.getPayments(),
        builder: (context, snapshot) {

          if (snapshot.hasError) {
            return const Text("something wen wrong");
          }

          if (snapshot.data == null || snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData) {
            return const Text("There is no payment yet");
          }

          return _buildPaymentList(context, snapshot.data?.docs ?? []);
        }

    )
    ;
  }

  Widget _buildPaymentList( BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      children: snapshot.map((data) => _buildPayment(context, data)).toList(),
    );
  }

  Widget _buildPayment(BuildContext context, DocumentSnapshot data) {
    print("Data: ${data.data()}");
    final Payment payment = Payment.fromJson(data.data() as Map<String, dynamic>);
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(payment.counter),
          Text("${payment.amount} ${payment.currency}"),
        ],
      ),
      subtitle: Text("${payment.date.day}/${payment.date.month}/${payment.date.year}"),
      onTap: () {

        debugPrint("Doc ID: ${payment}");

      },
    );
  }

  void populatePayment(){
    List<Payment> payment = [];
    payment.add(Payment(counter: "COMP2234/234", amount: 23423, date: DateTime.now(), currency: 'CDF'));
    payment.add(Payment(counter: "COMP2234/235", amount: 8594, date: DateTime.now(), currency: 'CDF'));
    payment.add(Payment(counter: "COMP2234/236", amount: 5849, date: DateTime.now(), currency: 'CDF'));
    payment.add(Payment(counter: "COMP2234/237", amount: 2938, date: DateTime.now(), currency: 'CDF'));
    payment.add(Payment(counter: "COMP2234/238", amount: 19384, date: DateTime.now(), currency: 'CDF'));

    for (var item in payment) {
      _api.savePayment(item);
    }
  }
}
