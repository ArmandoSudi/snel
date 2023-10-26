import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../models/client_model.dart';
import '../../service/api.dart';
import 'client_details_screen.dart';

class ClientAddScreen extends StatefulWidget {
  const ClientAddScreen({super.key});

  @override
  State<ClientAddScreen> createState() => _ClientAddScreenState();
}

class _ClientAddScreenState extends State<ClientAddScreen> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _sexeController = TextEditingController();

  final _api = API(FirebaseFirestore.instance);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enregistrer nouveau client")
      ),
      body: Stack(
        children:  [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                        labelText: "Nom",
                        hintText: "Nom du client"
                    ),
                    controller: _nameController,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: const InputDecoration(
                        labelText: "Telephone",
                        hintText: "Numero du client"
                    ),
                    controller: _phoneController,
                  ),
                  const SizedBox(height: 10),TextField(
                    decoration: const InputDecoration(
                        labelText: "Sexe",
                        hintText: "Sexe du client"
                    ),
                    controller: _sexeController,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 16,
            left: 16,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () async {

                  Client client = Client(
                    name: _nameController.text,
                    phoneNumber: _phoneController.text,
                    sexe: _sexeController.text, compteurs: []
                  );

                  var agentRef = await _api.createClient(client);

                  log("Agent Reference :: ${agentRef.id}");

                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => ClientDetailsScreen(agentRef.id)));

                },
                child: const Text("Enregistrer"),
              ),
            ),
          )
        ]
      )
    );
  }
}
