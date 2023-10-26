import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snel/screen/agent/client_list_page_two.dart';
import 'package:snel/screen/client/payment_history_page.dart';
import 'package:snel/screen/client/user_account_page.dart';
import 'package:snel/widgets/admin_bottom_navbar.dart';

import '../../models/counter_model.dart';
import '../../providers/client_provider.dart';
import '../../providers/counter_provider.dart';
import '../../service/api.dart';
import '../../models/client_model.dart';
import 'dashboard_page.dart';

class UserHomeScreen extends ConsumerStatefulWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  _UserHomeScreenState createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends ConsumerState<UserHomeScreen> {

  int _selectedIndex = 0;
  String? _selectedCompteurId;
  Client? _client;
  List<Counter> _counters = [];

  final _api = API(FirebaseFirestore.instance);

  List pages = [
    DashboardPage(),
    const PaymentHistoryPage(),
    const UserAccountPage(),
    // const ClientListPageTwo(),
  ];


  @override
  void initState() {
    super.initState();
    // getClientTwo();
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
    getClientTwo();
  }

  getClientData() async {
    _client = await _api.getClient("+24389568659");
    print("Client init ::: $_client");
  }

  getClientTwo() {
    _client = ref.watch(clientProvider);
    _counters = ref.watch(clientCountersProvider);
    _selectedCompteurId = _counters.first.id;
  }

  @override
  Widget build(BuildContext context) {

    // ref.watch(selectedCounterProvider.notifier).state = _counters.first;

    return Scaffold(
      drawer: Drawer(
        child: _client == null ? CircularProgressIndicator() :
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue[900],
              ),
              child: Center(child: Image.asset("assets/icons/snel_logo.png")),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 16.0),
              child: Text(_client!.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 16.0),
              child: Text(_client!.phoneNumber, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
            ),
            const SizedBox(height: 30),

            for (var counter in _counters) buildCompteur(counter),

          ],
        )
      ),
      body: pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Paiements',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Compte',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.group),
          //   label: 'Clients',
          // ),
        ],
        currentIndex: _selectedIndex,
        // selectedItemColor: Colors.amber[800],
        onTap: (int index) {
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      ),
    );
  }

  // Widget _buildDrawer(){
  //   return FutureBuilder<Client>(
  //       future: _api.getClient("+243815509291"),
  //       builder: (context, snapshot) {
  //
  //         if(snapshot.hasError){
  //           return const Center(child: Text("Une erreur s'est produite"),);
  //         }
  //         if (snapshot.data == null || snapshot.connectionState == ConnectionState.waiting) {
  //           return const Center(child: CircularProgressIndicator());
  //         } else if (!snapshot.hasData) {
  //           return const Text("There is no client with that phone number");
  //         }
  //
  //         // Client client = Client.fromJson(snapshot.data!.docs.first.data()! as Map<String, dynamic>);
  //
  //         print("Building drawerrrrr");
  //
  //         return Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             DrawerHeader(
  //               decoration: BoxDecoration(
  //                 color: Colors.blue[900],
  //               ),
  //               child: Center(child: Image.asset("assets/icons/snel_logo.png")),
  //             ),
  //             const SizedBox(height: 10),
  //             Padding(
  //               padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 16.0),
  //               child: Text(snapshot.data!.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 16.0),
  //               child: Text(snapshot.data!.phoneNumber, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
  //             ),
  //             const SizedBox(height: 30),
  //
  //             for (var compteur in snapshot.data!.compteurs) buildCompteur(compteur),
  //
  //           ],
  //         );
  //       }
  //   );
  // }

  Widget buildCompteur(Counter counter){
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: _selectedCompteurId == counter.id
              ? Colors.blue[900]
              : Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          Icons.home_outlined,
          size: 40,
          color: _selectedCompteurId == counter.id
              ? Colors.white
              : Colors.black,
        ),
      ),
      title: Text(counter.id??""),
      subtitle: Text(counter.address),
      onTap: () {

        ref.watch(selectedCounterProvider.notifier).state = counter;

        setState(() {
          _selectedCompteurId = counter.id;
        });

        Navigator.of(context).pop();
      },
    )
    ;
  }

}
