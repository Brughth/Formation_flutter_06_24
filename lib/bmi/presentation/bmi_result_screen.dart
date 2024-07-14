import 'package:flutter/material.dart';
import 'package:formation_flutter_join24/bmi/data/bmi_model.dart';

class BmiResultScreen extends StatelessWidget {
  final BmiModels bmi;
  const BmiResultScreen({
    super.key,
    required this.bmi,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ListTile(
            title: const Text("BMI"),
            subtitle: Text(bmi.index.toStringAsFixed(2)),
          ),
          ListTile(
            title: const Text("Status"),
            subtitle: Text(bmi.status.status),
          ),
          ListTile(
            title: const Text("Description"),
            subtitle: Text(bmi.status.description),
          ),
          ListTile(
            title: const Text("Advice"),
            subtitle: Text(bmi.status.advice),
          ),
        ],
      ),
    );
  }
}
