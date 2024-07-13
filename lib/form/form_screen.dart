import 'package:flutter/material.dart';
import 'package:formation_flutter_join24/app_input.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;

  late FocusNode firstNameNode;
  late FocusNode lastNameNode;
  late FocusNode emailNode;

  GlobalKey _globalKey = GlobalKey();
  bool obscureText = true;

  @override
  void initState() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();

    firstNameNode = FocusNode();
    lastNameNode = FocusNode();
    emailNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: ListView(
          children: [
            AppInput(
              controller: firstNameController,
              label: "First Name",
              hint: "First Name",
              focusNode: firstNameNode,
              nextNode: lastNameNode,
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 20),
            AppInput(
              controller: lastNameController,
              label: "Last Name",
              hint: "Last Name",
              focusNode: lastNameNode,
              textInputAction: TextInputAction.done,
              nextNode: emailNode,
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 20),
            AppInput(
              controller: emailController,
              label: "Email",
              hint: "Email",
              focusNode: emailNode,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (value) {},
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: const Text("Submit"),
            )
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TextFormField(
            //     obscureText: obscureText,
            //     focusNode: focusNode,
            //     obscuringCharacter: "\$",
            //     key: _globalKey,
            //     controller: _controller,
            //     // onTap: () {
            //     //   showModalBottomSheet(
            //     //       context: context,
            //     //       builder: (context) {
            //     //         return Column(
            //     //           children: ["Pain", "Patate", "Macabo", "Riz"].map((e) {
            //     //             return ListTile(
            //     //               title: Text(e),
            //     //               onTap: () {
            //     //                 _controller.text = e;
            //     //                 setState(() {});
            //     //                 Navigator.of(context).pop();
            //     //               },
            //     //             );
            //     //           }).toList(),
            //     //         );
            //     //       });
            //     // },
            //     // readOnly: true,
            //     keyboardType: TextInputType.text,
            //     // autofocus: true,
            //     textCapitalization: TextCapitalization.sentences,
            //     // textInputAction: TextInputAction.continueAction,
            //     // maxLines: 5,
            //     // minLines: 2,
            //     decoration: InputDecoration(
            //         // icon: Icon(Icons.search),
            //         // labelText: "Entrez votre nom",
            //         hintText: "Bonjour",
            //         prefixIcon: Icon(Icons.person),
            //         // prefix: Icon(Icons.error),

            //         // fillColor: Colors.red,
            //         // filled: true,
            //         border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(20),
            //         ),
            //         focusedBorder: const UnderlineInputBorder(),
            //         enabledBorder: const OutlineInputBorder(),
            //         errorBorder: const OutlineInputBorder(
            //           borderSide: BorderSide(
            //             color: Colors.red,
            //           ),
            //         ),
            //         suffixIcon: IconButton(
            //           onPressed: () {
            //             setState(() {
            //               obscureText = !obscureText;
            //             });
            //           },
            //           icon: obscureText
            //               ? const Icon(Icons.visibility)
            //               : const Icon(Icons.visibility_off),
            //         )
            //         // enabled: false,
            //         ),
            //   ),
            // ),
            // OutlinedButton(
            //   onPressed: () {
            //     focusNode.requestFocus();
            //   },
            //   child: Text("Give Focus"),
            // )
          ],
        ),
      ),
    );
  }
}
