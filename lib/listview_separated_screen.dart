import 'package:flutter/material.dart';

class ListViewSeparatedScreen extends StatelessWidget {
  const ListViewSeparatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Item ${index + 1}"),
          );
        },
        separatorBuilder: (context, index) {
          return Row(
            children: [
              const Expanded(
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text("Pub pour Item: ${index + 1}"),
              ),
              const Expanded(
                flex: 2,
                child: Divider(),
              )
            ],
          );
        },
        itemCount: 500,
      ),
    );
  }
}
