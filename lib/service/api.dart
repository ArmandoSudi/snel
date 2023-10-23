import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/agent_model.dart';
import '../models/client_model.dart';
import '../models/counter_model.dart';
import '../models/invoice_model.dart';
import '../models/payment_model.dart';

class API {
  final FirebaseFirestore _firebase;

  API(this._firebase);

  Future<Map<String, dynamic>?> getAgentByEmail(String email) async {
    try {
      _firebase
          .collection('agents')
          .where("email", isEqualTo: email)
          .get()
          .then((value) => print("$value"));
    } catch (e) {
      print("getUserData::: ${e.toString()}");
      return null;
    }
  }

  Stream<QuerySnapshot> getAgentByPhone(String phone) {
    return _firebase
        .collection('clients')
        .where("phone", isEqualTo: phone)
        .snapshots();
    // .then((querySnapshot) => Agent.fromJson(querySnapshot.docs.first.data()! as Map<String, dynamic>));
  }

  Stream<QuerySnapshot> getClientByPhone(String phone) {
    return _firebase
        .collection('clients')
        .where("phone_number", isEqualTo: phone)
        .snapshots();
  }

  Future<Client> getClient(String phone) async {
    return await _firebase
        .collection('clients')
        .where("phone_number", isEqualTo: phone)
        .snapshots()
        .first
        .then((value) => Client.fromDocument(value.docs.first));
  }

  // Get stream of all clients
  Stream<QuerySnapshot> getClients() {
    return _firebase.collection('clients').snapshots();
  }

  Future<List<Counter>> getCounterByAgentId(String agentId) async {
    try {
      return await _firebase
          .collection('counters')
          .where("agent_id", isEqualTo: agentId)
          .get()
          .then((querySnapshot) => querySnapshot.docs
              .map((e) => Counter.fromJson(e.data()! as Map<String, dynamic>))
              .toList());
    } catch (e) {
      print("getUserData::: ${e.toString()}");
      return [];
    }
  }

  // Get a stream of payment from firebase
  Stream<QuerySnapshot> getPayments() {
    return _firebase.collection('payments').snapshots();
  }

  // Get a Stream of payment by compteur_id
  Stream<QuerySnapshot> getPaymentsByCompteurId(String counterId) {
    return _firebase
        .collection('payments')
        .where("counter", isEqualTo: counterId)
        .snapshots();
  }

  // Create client on firestore
  Future<DocumentReference> createClient(Client client) {
    final clientMap = client.toJson();
    return _firebase.collection('clients').add(clientMap);
  }

  // Create a counter on firestore
  Future<DocumentReference> createCounter(Counter counter) {
    final counterMap = counter.toJson();
    return _firebase.collection('counters').add(counterMap);
  }

  // Add the created counter to the agent
  Future<void> addCounterToClient(String clientId, Counter counter) {
    print("Counter.toJson() :: ${counter.toJson()}");

    return _firebase.collection('clients').doc(clientId).update({
      'compteurs': FieldValue.arrayUnion([counter.toJson()])
    });
  }

  // Get client by id from firestore
  Future<Client> getClientById(String id) async {
    final client = await _firebase.collection('clients').doc(id).get();
    return Client.fromJson(client.data()! as Map<String, dynamic>);
  }

  // Save payment to firestore
  Future<void> savePayment(Payment payment) {
    final paymentMap = payment.toJson();
    return _firebase.collection('payments').add(paymentMap);
  }

  // Get a stream of payment where isPaid is true
  Stream<QuerySnapshot> getPaidInvoices() {
    return _firebase
        .collection('invoices')
        .where('is_paid', isEqualTo: true)
        .snapshots();
  }

  // Get a stream of payment where isPaid is false
  Stream<QuerySnapshot> getUnpaidInvoices() {
    return _firebase
        .collection('invoices')
        .where('is_paid', isEqualTo: false)
        .snapshots();
  }

  // Get Invoices of a counterId
  Stream<QuerySnapshot> getInvoicesByCounterId(String counterId) {
    return _firebase
        .collection('invoices')
        .where('counter_id', isEqualTo: counterId)
        .snapshots();
  }

  // Set the isPaid parameter of invoice to true
  Future<void> setPaidInvoice(Invoice invoice) {
    createPayment(invoice.counterId!);
    return _firebase
        .collection('invoices')
        .doc(invoice.id)
        .update({'is_paid': true});
  }

  // Create an payment on firestore for the given invoice
  Future<void> createPayment(String invoiceId) {
    final payment = Payment(
      counter: invoiceId,
      amount: 0,
      currency: 'CDF',
      date: DateTime.now(),
    );
    final paymentMap = payment.toJson();
    return _firebase.collection('payments').add(paymentMap);
  }
}
