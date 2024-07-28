import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formation_flutter_join24/counter/logic/bloc/counter1_bloc.dart';
import 'package:formation_flutter_join24/genderize/data/genderize_repository.dart';

class GenderizeScreen extends StatefulWidget {
  const GenderizeScreen({super.key});

  @override
  State<GenderizeScreen> createState() => _GenderizeScreenState();
}

class _GenderizeScreenState extends State<GenderizeScreen> {
  late TextEditingController _controller;
  GenderizeRepository repository = GenderizeRepository();

  bool isLoading = false;

  @override
  void initState() {
    _controller = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Genderize"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: ListView(
          children: [
            Center(
              child: Text(
                "${context.read<Counter1Bloc>().state.counter}",
                style: const TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: "Entrez votre nom...",
                border: OutlineInputBorder(),
                errorBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            OutlinedButton(
              onPressed: () async {
                try {
                  setState(() {
                    isLoading = true;
                  });
                  var gender = await repository.getGenderFromName(
                    _controller.text,
                  );

                  setState(() {
                    isLoading = false;
                  });

                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(gender.name),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Gender: ${gender.gender}"),
                            Text("Probability: ${gender.probability}"),
                            Text("Count: ${gender.count}"),
                          ],
                        ),
                      );
                    },
                  );
                } catch (e) {
                  setState(() {
                    isLoading = false;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.toString())),
                  );
                }
              },
              child: isLoading
                  ? const CircularProgressIndicator()
                  : const Text("Check Probability"),
            ),
          ],
        ),
      ),
    );
  }
}
