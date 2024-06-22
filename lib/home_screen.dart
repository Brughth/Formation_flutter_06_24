import 'package:flutter/material.dart';
import 'package:formation_flutter_join24/stl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        // leading: const Icon(
        //   Icons.menu,
        //   color: Colors.white,
        //   size: 30,
        // ),
        // centerTitle: true,
        title: const MyStateLessWidget(),
        // title: const Text(
        //   "Formation",
        //   textAlign: TextAlign.center,
        //   style: TextStyle(
        //     color: Colors.white,
        //   ),
        // ),
        actions: const [
          Icon(
            Icons.notification_add,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(width: 20),
          CircleAvatar(
            backgroundColor: Colors.yellow,
          ),
          SizedBox(width: 10),
        ],
      ),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // for (int i = 0; i <= 15; i++)
          //   Padding(
          //     padding: const EdgeInsets.only(
          //       bottom: 8,
          //     ),
          //     child: CircleAvatar(
          //       backgroundColor: Colors.primaries[i],
          //       radius: 50,
          //     ),
          //   ),
          // for (int i = 0; i <= 15; i++)
          //   Padding(
          //     padding: const EdgeInsets.all(8),
          //     child: Container(
          //       height: 100,
          //       decoration: BoxDecoration(
          //         color: Colors.primaries[i],
          //       ),
          //     ),
          //   ),
          for (int i = 0; i <= 15; i++)
            ListTile(
              leading: Container(
                height: 60,
                width: 60,
                // color: Colors.red,
                decoration: BoxDecoration(
                  color: Colors.primaries[i],
                  shape: BoxShape.circle,
                ),
              ),
              title: const Text(
                "Olice SONA",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                "Yo!! Douala dit quoi ce soir ?",
              ),
              trailing: Column(
                children: [
                  const Text("19h30"),
                  Container(
                    padding: const EdgeInsets.all(6),
                    // color: Colors.red,
                    decoration: BoxDecoration(
                      color: Colors.primaries[i],
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "${i + 1}",
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(
          //     horizontal: 16,
          //     vertical: 8,
          //   ),
          //   child: Row(
          //     children: [
          //       Container(
          //         height: 60,
          //         width: 60,
          //         // color: Colors.red,
          //         decoration: BoxDecoration(
          //           color: Colors.primaries[0],
          //           shape: BoxShape.circle,
          //         ),
          //       ),
          //       const SizedBox(width: 15),
          //       const Expanded(
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           children: [
          //             Text(
          //               "Olice SONA",
          //               style: TextStyle(
          //                 fontSize: 16,
          //                 fontWeight: FontWeight.w600,
          //               ),
          //             ),
          //             Text(
          //               "Yo!! Douala dit quoi ce soir ?",
          //             )
          //           ],
          //         ),
          //       ),
          //       Column(
          //         children: [
          //           const Text("19h30"),
          //           Container(
          //             padding: const EdgeInsets.all(6),
          //             // color: Colors.red,
          //             decoration: BoxDecoration(
          //               color: Colors.primaries[i],
          //               shape: BoxShape.circle,
          //             ),
          //             child: Text(
          //               "${i + 1}",
          //               style: const TextStyle(
          //                 fontSize: 13,
          //                 color: Colors.white,
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             ),
          //           ),
          //         ],
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
