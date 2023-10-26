import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snel/firebase_options.dart';
import 'package:snel/screen/agent/agent_dashboard.dart';
import 'package:snel/screen/loading_screen.dart';

enum Mode { client, agent }

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()) );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Mode mode = Mode.agent;

    return MaterialApp(
      title: 'SNEL',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: ScreenSelection(),
    );
  }
}

class ScreenSelection extends StatelessWidget {
  const ScreenSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Se connecter comme : ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoadingScreen(),
                  ),
                );
              },
              child: const Text("Client", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AgentDashboard(),
                  ),
                );
              },
              child: const Text("Agent",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            ),
          ],
        ),
      ),
    );
  }
}


