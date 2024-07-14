import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      // body: GridView.count(
      //   crossAxisCount: screenWidth <= 600
      //       ? 1
      //       : (screenWidth > 600 && screenWidth <= 1000)
      //           ? 2
      //           : 3,
      //   mainAxisSpacing: 10,
      //   crossAxisSpacing: 10,
      // ),
      body: GridView(
        padding: const EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: screenWidth <= 600
              ? 1
              : (screenWidth > 600 && screenWidth <= 1000)
                  ? 2
                  : 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        children: List.generate(10, (index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.primaries[index],
              borderRadius: BorderRadius.circular(12),
            ),
          );
        }),
      ),
    );
  }
}
