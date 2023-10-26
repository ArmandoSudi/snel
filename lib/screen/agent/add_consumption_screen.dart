import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:snel/models/consumption_model.dart';

import '../../service/api.dart';

class AddConsumptionScreen extends StatefulWidget {

  String counterId;

  AddConsumptionScreen(this.counterId, {super.key});

  @override
  State<AddConsumptionScreen> createState() => _AddConsumptionScreenState();
}

class _AddConsumptionScreenState extends State<AddConsumptionScreen> {

  TextEditingController _powerController = TextEditingController();
  TextEditingController _unitController = TextEditingController();
  TextEditingController _periodeController = TextEditingController();

  final _api = API(FirebaseFirestore.instance);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enregistrer un prélevement"),
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Puissance",
                  ),
                  controller: _powerController,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Unité",
                      hintText: "MWh ou KWh"
                  ),
                  controller: _unitController,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Période",
                      hintText: "ex: Mars 2023"
                  ),
                  controller: _periodeController,
                ),
                const SizedBox(height: 16.0),
              ],
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

                   saveComsumption();

                },
                child: const Text("Enregistrer", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
            ),
          )
        ],
      )
        
    );
  }
  
  void saveComsumption(){
    
    Consumption consumption = Consumption(
        counterId: widget.counterId,
        power: double.parse(_powerController.text),
        unit: _unitController.text);
    
    _api.addPowerConsumptionToCounter(consumption, _periodeController.text);

  }
}
