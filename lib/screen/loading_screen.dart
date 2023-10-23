import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snel/screen/client/user_home_screen.dart';

import '../models/counter_model.dart';
import '../providers/client_provider.dart';
import '../providers/counter_provider.dart';
import '../service/api.dart';
import '../models/client_model.dart';

class LoadingScreen extends ConsumerWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef widgetRef) {

    final _api = API(FirebaseFirestore.instance);

    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: _api.getClientByPhone("+243815509291"),
          builder: (context, snapshot) {

            if (snapshot.hasError) {
              return const Center(child: Text("Erreur de connection"));
            }

            if (snapshot.data == null || snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (!snapshot.hasData) {
              return const Text("Ce client n'existe pas");
            }

            Client client = Client.fromDocument(snapshot.data!.docs.first);
            List<Counter> counters = client.compteurs.map((e) {
              e.addAll({"category": "not defined", "client_id": client.id });
              return Counter.fromJson(e).copyWith(id: e["id"]);
            }).toList();

            Future((){
              print("Loading Screen counters ==> $counters");
              widgetRef.read(clientCountersProvider.notifier).state = counters;
              widgetRef.read(selectedCounterProvider.notifier).state = counters.first;
              widgetRef.read(clientProvider.notifier).state = client;
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserHomeScreen()));
            });

            return const Center(child: CircularProgressIndicator());
          }

      ),
    );
  }
}
