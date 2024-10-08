import 'package:flutter/material.dart';
import 'package:formation_flutter_join24/auth/data/auth_service.dart';
import 'package:formation_flutter_join24/auth/presentation/login_screen.dart';
import 'package:formation_flutter_join24/person/presentation/person_list_screen.dart';
import 'package:formation_flutter_join24/shared/app_routes.dart';

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
          const PersonListScreen(),
          Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Like",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ],
              ),
            ),
          ),
          Scaffold(
            body: Center(
              child: IconButton(
                onPressed: () {
                  AuthService().logout();
                  setRoot(context, const LoginScreen());
                },
                icon: const Icon(Icons.logout),
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
            icon: Icon(
              Icons.person_add,
            ),
            label: "Staff",
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
