import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formation_flutter_join24/person/data/person_service.dart';
import 'package:formation_flutter_join24/shared/widgets/app_snackbar.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../shared/app_colors.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_input.dart';

class AddOrUpdatePersonScreen extends StatefulWidget {
  const AddOrUpdatePersonScreen({super.key});

  @override
  State<AddOrUpdatePersonScreen> createState() =>
      _AddOrUpdatePersonScreenState();
}

class _AddOrUpdatePersonScreenState extends State<AddOrUpdatePersonScreen> {
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController phoneController;

  File? image;

  bool isLoading = false;

  @override
  void initState() {
    emailController = TextEditingController();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Person"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            Center(
              child: GestureDetector(
                onTap: () async {
                  final ImagePicker picker = ImagePicker();

                  final XFile? _image = await picker.pickImage(
                    source: ImageSource.gallery,
                  );

                  if (_image != null) {
                    setState(() {
                      image = File(_image.path);
                    });
                  }
                },
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: image != null ? FileImage(image!) : null,
                ),
              ),
            ),
            const Gap(20),
            AppInput(
              controller: emailController,
              label: "Enter email",
              keyboardType: TextInputType.emailAddress,
              // validators: [
              //   FormBuilderValidators.required(),
              //   FormBuilderValidators.email(),
              // ],
            ),
            const Gap(20),
            AppInput(
              controller: nameController,
              label: "Enter full name",
              keyboardType: TextInputType.name,
              // validators: [
              //   FormBuilderValidators.required(),
              // ],
            ),
            const Gap(20),
            AppInput(
              controller: phoneController,
              label: "Enter your phone number",
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              // validators: [
              //   FormBuilderValidators.required(),
              // ],
            ),
            const Gap(30),
            AppButton(
              text: "Add",
              loading: isLoading,
              bgColor: AppColors.primary,
              onPressed: () async {
                try {
                  if (image == null) {
                    AppSnackBar.showError(
                      message: "Selectionnez une image",
                      context: context,
                    );
                    return;
                  }

                  setState(() {
                    isLoading = true;
                  });

                  var service = PersonService();

                  var imageUrl =
                      await service.uploadFileToStorageAndReturnUrl(image!);

                  var id = const Uuid().v4();

                  var data = {
                    'id': id,
                    'email': emailController.text,
                    'name': nameController.text,
                    'phone': phoneController.text,
                    'createdAt': DateTime.now().toUtc().toIso8601String(),
                    'updatedAt': DateTime.now().toUtc().toIso8601String(),
                    'image': imageUrl,
                  };

                  var person = await service.setPerson(
                    id: id,
                    data: data,
                  );

                  setState(() {
                    isLoading = false;
                  });
                } catch (e) {
                  print(e);
                  setState(() {
                    isLoading = false;
                  });
                  AppSnackBar.showError(
                    message: "$e",
                    context: context,
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
