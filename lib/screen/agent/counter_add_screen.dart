import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:snel/models/counter_model.dart';

import '../../service/api.dart';

class CounterAddScreen extends StatefulWidget {

  var clientID;

  CounterAddScreen(this.clientID, {super.key});

  @override
  State<CounterAddScreen> createState() => _CounterAddScreenState();
}

class _CounterAddScreenState extends State<CounterAddScreen> {

  TextEditingController addresseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  final _api = API(FirebaseFirestore.instance);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enregistrer nouveau compteur"),),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                        labelText: "Adresse",
                        hintText: "Adresse du compteur"),
                    controller: addresseController,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: const InputDecoration(
                        labelText: "Catégorie",
                        hintText: "catégorie du compteur"),
                    controller: categoryController,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {

                  Counter counter = Counter(
                    address: addresseController.text,
                    category: categoryController.text,
                    clientId: widget.clientID,
                  );

                  var counterRef = await _api.createCounter(counter);
                  Counter counterWithId = counter.copyWith(id: counterRef.id);

                  log("Counter with id :: ${counterWithId}");

                  _api.addCounterToClient(widget.clientID, counterWithId);

                  log("Counter Reference :: ${counterRef.id}");

                  Navigator.of(context).pop();

                },
                child: const Text("Enregistrer"),
              ),
            ),
          )
        ],
      ),
    );
  }

  createCounter() async {
    Counter counter = Counter(
      address: addresseController.text,
      category: categoryController.text,
      clientId: widget.clientID,
    );

    var counterRef = await _api.createCounter(counter);
    Counter counterWithId = counter.copyWith(id: counterRef.id);

    log("Counter with id :: ${counterWithId}");

    _api.addCounterToClient(widget.clientID, counterWithId);

    log("Counter Reference :: ${counterRef.id}");
  }
}
