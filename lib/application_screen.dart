import 'package:flutter/material.dart';
import 'package:formation_flutter_join24/counter_screen.dart';
import 'package:formation_flutter_join24/home_screen.dart';

class ApplicationScreen extends StatelessWidget {
  const ApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formation Flutter 06-2024"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("WhatsApp UI"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: Text("Counter"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CounterScreen(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
