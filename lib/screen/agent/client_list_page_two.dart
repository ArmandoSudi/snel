import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/client_model.dart';
import 'client_add_screen.dart';
import 'client_details_screen.dart';

class ClientListPageTwo extends StatefulWidget {
  const ClientListPageTwo({super.key});

  @override
  State<ClientListPageTwo> createState() => _ClientListPageTwoState();
}

class _ClientListPageTwoState extends State<ClientListPageTwo> {

  List _allResults = [];
  List _resultsList = [];
  final TextEditingController _searchController = TextEditingController();

  bool _isLoading = true;

  getClientStream() async {
    var data = await FirebaseFirestore.instance
        .collection('clients')
        .orderBy('name').get();

    setState(() {
      _allResults = data.docs;
      _isLoading = false;
    });
    searchResultList();
  }

  searchResultList(){
      var showResults = [];

    if(_searchController.text != "") {
      for(var clientSnapshot in _allResults) {
        var name =   Client.fromJson(clientSnapshot.data()! as Map<String, dynamic>).name.toLowerCase();
        if(name.contains(_searchController.text.toLowerCase())) {
          showResults.add(clientSnapshot);
        }
      }
    } else {
      showResults = List.from(_allResults);
    }

    setState(() {
      _resultsList = showResults;
    });
   }

  @override
  void initState() {

    _searchController.addListener(_onSearchChanged);
    super.initState();
  }

  _onSearchChanged() {
    print(_searchController.text);
    searchResultList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CupertinoSearchTextField(
          controller: _searchController, 
        ),
      ),
      body: _isLoading ? const Center(child: CircularProgressIndicator()) : ListView.builder(
        itemCount: _resultsList.length,
        itemBuilder: (context, index) {
          return InkWell(
            child: ListTile(
              title: Text(_resultsList[index]['name']),
              subtitle: Text(_resultsList[index]['phone_number']),
            ),
            onTap: () {

              var client = Client.fromDocument(_resultsList[index]);
              print(client);


              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ClientDetailsScreen(client.id)));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ClientAddScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    getClientStream();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
      _searchController.removeListener(_onSearchChanged);
      _searchController.dispose();
    super.dispose();
  }
}
