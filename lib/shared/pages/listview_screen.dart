import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  late ScrollController scrollController;
  bool showScrollUp = false;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(_listener);
    super.initState();
  }

  _listener() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent) {
      setState(() {
        showScrollUp = true;
      });
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List view"),
      ),
      floatingActionButton: showScrollUp
          ? FloatingActionButton(
              onPressed: () {
                scrollController.animateTo(
                  0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.linear,
                );
                setState(() {
                  showScrollUp = false;
                });
              },
              child: const Icon(Icons.arrow_upward),
            )
          : null,
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                20,
                (e) => Padding(
                  padding: EdgeInsets.only(
                    right: 8,
                    left: e == 0 ? 12 : 0,
                  ),
                  child: Chip(
                    label: Text("Item ${e + 1}"),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              controller: scrollController,
              // reverse: true,
              // physics: BouncingScrollPhysics(),
              children: List.generate(
                50,
                (index) {
                  return ListTile(
                    title: Text("Item ${index + 1}"),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
