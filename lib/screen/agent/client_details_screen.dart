import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../models/client_model.dart';
import '../../service/api.dart';
import 'counter_add_screen.dart';
import 'counter_invoices_screen.dart';

class ClientDetailsScreen extends StatefulWidget {
  final clientID;

  const ClientDetailsScreen(this.clientID, {super.key});

  @override
  State<ClientDetailsScreen> createState() => _ClientDetailsScreenState();
}

class _ClientDetailsScreenState extends State<ClientDetailsScreen> {

  final _api = API(FirebaseFirestore.instance);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Détails du client")
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder<Client>(
            future: _api.getClientById(widget.clientID),
            builder: (context, snapshot) {

              if (snapshot.hasError) {
                return const Text("something wen wrong");
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Nom du Client
                  const Text("Nom du client ",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                  Text(snapshot.data!.name,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10,),

                  // Adresse du Client
                  const Text("Telephone",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                  Text(snapshot.data!.phoneNumber,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10,),

                  // Sexe du Client
                  Text("Sexe",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                  Text(snapshot.data!.sexe,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20,),

                  // Compteurs
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Compteurs",
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator
                                        .of(context)
                                        .push(MaterialPageRoute(builder: (context) => CounterAddScreen(widget.clientID)));
                                  },
                                  child: const Text("Ajouter")
                              ),
                            ],
                          ),
                          if (snapshot.data!.compteurs.length == 0)
                            Text("Aucun compteur")
                          else
                            ...snapshot.data!.compteurs.map(
                                    (e) => _buildCompteur(e["id"], e["address"])
                            ).toList()
                        ],
                      ),
                    ),
                  )
                ],
              );
            }
          ),
        ),
      )
    );
  }

  Widget _buildCompteur(String compteurId, String address ){
    return InkWell(
      child: ListTile(
        title: Text(compteurId),
        subtitle: Text(address),
        trailing: Icon(Icons.arrow_forward_ios)
      ),
      onTap: () {
        log("Compteur id :: $compteurId");
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CounterInvoicesScreen(compteurId)));
      },
    );
  }
}
