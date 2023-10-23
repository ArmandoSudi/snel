import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:snel/models/client_model.dart';

import '../../service/api.dart';

class UserAccountPage extends StatefulWidget {
  const UserAccountPage({super.key});

  @override
  State<UserAccountPage> createState() => _UserAccountPageState();
}

class _UserAccountPageState extends State<UserAccountPage> {

  final _api = API(FirebaseFirestore.instance);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Compte SNEL"),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.notifications),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: _api.getClientByPhone("+24389568659"),
          builder: (context, snapshot) {

            if(snapshot.hasError){
              return const Center(child: Text("Une erreur s'est produite"),);
            }
            if (snapshot.data == null || snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (!snapshot.hasData) {
              return const Text("There is no client with that phone number");
            }

            print("snapshot.data:: ${snapshot.data!.docs.first.data()}");

            Client client = Client.fromJson(snapshot.data!.docs.first.data()! as Map<String, dynamic>);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey
                  ),
                  child: const Icon(Icons.person, size: 75,),
                ),
                const SizedBox(height: 10),
                Text(client.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Text(client.phoneNumber, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                const SizedBox(height: 30),

                for (var compteur in client.compteurs) buildCompteur(compteur),

              ],
            );
          }
        ),
      ),
    );
  }

  Widget buildCompteur(Map<String, dynamic> compteur){

    print("Compteur ::: $compteur");

    return Card(
      child: ListTile(
        title: Text(compteur["id"]),
        subtitle: Text(compteur["address"]),
      ),
    );
  }
}
