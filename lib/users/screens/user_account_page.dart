import 'package:flutter/material.dart';

class UserAccountPage extends StatelessWidget {
  const UserAccountPage({super.key});

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
        child: Column(
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
            const Text("LANDU SUNGU Jeremie"),
            const Text("000236782"),
            const SizedBox(height: 30),
            const Card(
              child: ListTile(
                title: Text("Adresse"),
                subtitle: Text("C. NGALIEMA/ Q. JOLI-PARC/ AV. KIMPESE N° 12"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
