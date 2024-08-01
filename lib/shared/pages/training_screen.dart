import 'package:flutter/material.dart';
import 'package:formation_flutter_join24/counter/presentation/counter1_screen.dart';
import 'package:formation_flutter_join24/form/form_screen.dart';
import 'package:formation_flutter_join24/genderize/presentation/genderize_screen.dart';
import 'package:formation_flutter_join24/post/presentation/post_screen.dart';
import 'package:formation_flutter_join24/post/presentation/post_screen_with_bloc.dart';

import '../../bmi/presentation/bmi_screen.dart';
import '../../counter/presentation/counter2_screen.dart';
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
            ),
            ListTile(
              title: const Text("Post "),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PostScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Genderize "),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const GenderizeScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Form "),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FormScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("BMI Calculator"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BMIScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Counter with Bloc"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Counter1Screen(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Counter with Cubic"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Counter2Screen(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Post WIth Bloc"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PostScreenWithBloc(),
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
