import 'package:flutter/material.dart';

import 'counter_screen.dart';
import 'gridview_builder_screen.dart';
import 'gridview_screen.dart';
import 'home_screen.dart';
import 'listview_builder_screen.dart';
import 'listview_screen.dart';
import 'listview_separated_screen.dart';

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formation Flutter 06-2024"),
      ),
      body: SingleChildScrollView(
        child: Column(
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
            ),
            ListTile(
              title: const Text("Listview"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ListViewScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Listview Builder"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ListViewBuilderScreen(),
                  ),
                );
              },
            ),
            // for (int i = 1; i <= 15; i++)
            ListTile(
              title: const Text("Listview Separated"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ListViewSeparatedScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Gridview"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const GridViewScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Gridview Builder"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const GridviewBuilderScreen(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
