import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/client_model.dart';
import '../../service/api.dart';
import 'client_add_screen.dart';
import 'client_details_screen.dart';

class ClientListPage extends StatefulWidget {
  const ClientListPage({super.key});

  @override
  State<ClientListPage> createState() => _ClientListPageState();
}

class _ClientListPageState extends State<ClientListPage> {
  final _api = API(FirebaseFirestore.instance);
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title:
        title: _isSearching ? CupertinoSearchTextField() : Text("Liste des clients"),
        actions:[
          IconButton(
            icon: _isSearching ? Icon(Icons.close) : Icon(Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
              });
            },
          )
        ]
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _api.getClients(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text("something wen wrong");
            }

            if (snapshot.data == null ||
                snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (!snapshot.hasData) {
              return const Text("There is no payment yet");
            }

            print("Invoices :: ${snapshot.data!.docs.length}");

            return _buildClientList(context, snapshot.data?.docs ?? []);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ClientAddScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildClientList(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      children: snapshot.map((data) => _buildClient(context, data)).toList(),
    );
  }

  Widget _buildClient(BuildContext context, DocumentSnapshot data) {
    // final Client client = Client.fromJson(data.data() as Map<String, dynamic>);
    final Client client = Client.fromDocument(data);

    return ListTile(
      title: Text(client.name),
      subtitle: Text(client.phoneNumber),
      trailing: IconButton(
        icon: Icon(Icons.arrow_forward_ios),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ClientDetailsScreen(client.id)));
        },
      ),
    );
  }
}
