import 'package:flutter/material.dart';
import 'package:formation_flutter_join24/shared/pages/application_screen.dart';
import 'package:gap/gap.dart';

class AppInitScreen extends StatefulWidget {
  const AppInitScreen({super.key});

  @override
  State<AppInitScreen> createState() => _AppInitScreenState();
}

class _AppInitScreenState extends State<AppInitScreen> {
  @override
  void initState() {
    _handleNextScreen();
    super.initState();
  }

  _handleNextScreen() async {
    await Future.delayed(
      const Duration(milliseconds: 2500),
      () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const ApplicationScreen(),
          ),
          (route) => false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.train,
                color: Colors.purpleAccent,
              ),
              const Gap(8),
              Text(
                "Formation Flutter",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Colors.purpleAccent,
                      fontSize: 24,
                    ),
              )
            ],
          ),
          const Spacer(),
          const Center(
            child: CircularProgressIndicator(
              color: Colors.purpleAccent,
            ),
          )
        ],
      ),
    );
  }
}
