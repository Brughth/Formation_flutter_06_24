import 'package:flutter/material.dart';

class ListViewBuilderScreen extends StatelessWidget {
  const ListViewBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 16,
        ),
        itemCount: 500,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: index == 500 - 1
                  ? null
                  : Border(
                      bottom: BorderSide(
                        color: index == 93 ? Colors.red : Colors.black,
                        width: index == 93 ? 50 : 1,
                      ),
                    ),
            ),
            child: ListTile(
              // shape: RoundedRectangleBorder(
              //     side: BorderSide(
              //   color: Colors.black,
              // )),
              title: Text("Item ${index + 1}"),
            ),
          );
        },
      ),
    );
  }
}
