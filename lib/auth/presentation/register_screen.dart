import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:formation_flutter_join24/auth/logic/bloc/auth_bloc.dart';
import 'package:formation_flutter_join24/shared/app_colors.dart';
import 'package:formation_flutter_join24/shared/app_routes.dart';
import 'package:formation_flutter_join24/shared/pages/application_screen.dart';
import 'package:formation_flutter_join24/shared/widgets/app_button.dart';
import 'package:formation_flutter_join24/shared/widgets/app_input.dart';
import 'package:formation_flutter_join24/shared/widgets/app_snackbar.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController emailController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController phoneController;
  late TextEditingController pwdController;
  late AuthBloc authBloc;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneController = TextEditingController();
    pwdController = TextEditingController();
    authBloc = AuthBloc();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        bloc: authBloc,
        listener: (context, state) {
          if (state is RegisterFailure) {
            AppSnackBar.showError(
              message: state.message,
              context: context,
            );
          }

          if (state is RegisterSuccess) {
            setRoot(context, const ApplicationScreen());
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                AppInput(
                  controller: emailController,
                  label: "Enter your email",
                  keyboardType: TextInputType.emailAddress,
                  validators: [
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ],
                ),
                const Gap(20),
                AppInput(
                  controller: firstNameController,
                  label: "Enter your first name",
                  keyboardType: TextInputType.name,
                  validators: [
                    FormBuilderValidators.required(),
                  ],
                ),
                const Gap(20),
                AppInput(
                  controller: lastNameController,
                  label: "Enter your last name",
                  keyboardType: TextInputType.name,
                  validators: [
                    FormBuilderValidators.required(),
                  ],
                ),
                const Gap(20),
                AppInput(
                  controller: phoneController,
                  label: "Enter your phone number",
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validators: [
                    FormBuilderValidators.required(),
                  ],
                ),
                const Gap(20),
                AppInput(
                  controller: pwdController,
                  label: "Enter your password",
                  keyboardType: TextInputType.visiblePassword,
                  validators: [
                    FormBuilderValidators.password(
                      minLength: 6,
                    ),
                  ],
                ),
                const Gap(30),
                BlocBuilder<AuthBloc, AuthState>(
                  bloc: authBloc,
                  builder: (context, state) {
                    return AppButton(
                      text: "Register",
                      loading: state is RegisterLoading,
                      bgColor: AppColors.primary,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          authBloc.add(
                            RegisterEvent(
                              email: emailController.text.trim(),
                              password: pwdController.text,
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              phoneNumber: phoneController.text,
                            ),
                          );
                        }
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
