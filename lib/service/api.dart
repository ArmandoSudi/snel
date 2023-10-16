import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/agent_model.dart';
import '../models/payment_model.dart';

class API {
   final FirebaseFirestore _firebase;

   API(this._firebase);

   Future<Map<String, dynamic>?> getAgentByEmail(String email) async {
     try {
        _firebase.collection('agents')
           .where("email", isEqualTo: email)
           .get()
           .then((value) => print("$value"));
     } catch (e) {
       print("getUserData::: ${e.toString()}");
       return null;
     }
   }

   Future<Agent?> getAgentByPhone(String phone) async {
     try {
       return await _firebase.collection('agents')
           .where("phone", isEqualTo: phone)
           .get()
           .then((querySnapshot) => Agent.fromJson(querySnapshot.docs.first.data()! as Map<String, dynamic>));
     } catch (e) {
       print("getUserData::: ${e.toString()}");
       return null;
     }
   }

   // Get a stream of payment from firebase
    Stream<QuerySnapshot> getPayments() {
      return _firebase.collection('payments').snapshots();
    }

    // Save payment to firestore
    Future<void> savePayment(Payment payment) {
      final paymentMap = payment.toJson();
      return _firebase.collection('payments').add(paymentMap);
    }
}