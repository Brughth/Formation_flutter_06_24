import 'package:flutter/material.dart';

import 'package:formation_flutter_join24/shared/pages/training_screen.dart';

class ApplicationScreen extends StatefulWidget {
  const ApplicationScreen({super.key});

  @override
  State<ApplicationScreen> createState() => _ApplicationScreenState();
}

class _ApplicationScreenState extends State<ApplicationScreen> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: activeIndex,
        children: [
          const TrainingScreen(),
          Scaffold(
            appBar: AppBar(
              title: const Text("Search"),
            ),
            body: Center(
              child: Text(
                "Search",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ),
          Scaffold(
            body: Center(
              child: Text(
                "Like",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ),
          Scaffold(
            body: Center(
              child: Text(
                "Profil",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: activeIndex,
        onTap: (value) {
          setState(() {
            activeIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Like",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profil",
            backgroundColor: Colors.black,
          )
        ],
      ),
    );
  }
}
