import 'package:flutter/material.dart';

class PaymentHistoryPage extends StatelessWidget {
  const PaymentHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.menu), onPressed: () => Scaffold.of(context).openDrawer()),
          title: const Text("Historique des paiements"),
          actions: [
            IconButton(
              icon: Container(
                // color: Colors.red,
                child: SizedBox(
                  height: 35,
                  width: 35,
                  child: Stack(
                    children: [
                      Icon(Icons.notifications, size: 25),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            border: Border.all(color: Colors.white, width: 2)
                          ),
                          child: Text("4", style: TextStyle(fontSize: 10, color: Colors.white),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onPressed: () {},
            )
          ],
        ),
        body: SafeArea(
          child: ListView.builder(
            itemCount: 15,
            itemBuilder: (contex, index) {
              return const ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("FACT 63234342234/88"),
                    Text("14000 FC"),
                  ],
                ),
                subtitle: Text("15/10/2023"),
              );
            },
          ),
        ));
  }
}
