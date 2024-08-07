import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:formation_flutter_join24/auth/presentation/register_screen.dart';
import 'package:formation_flutter_join24/shared/context_extensions.dart';

import 'package:gap/gap.dart';

import '../../shared/app_colors.dart';
import '../../shared/app_routes.dart';
import '../../shared/pages/application_screen.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_input.dart';
import '../../shared/widgets/app_snackbar.dart';
import '../logic/bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController pwdController;
  late AuthBloc authBloc;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();

    pwdController = TextEditingController();
    authBloc = AuthBloc();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();

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
          if (state is LoginFailure) {
            AppSnackBar.showError(
              message: state.message,
              context: context,
            );
          }

          if (state is LoginSuccess) {
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
                      text: "Login",
                      loading: state is LoginLoading,
                      bgColor: AppColors.primary,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          authBloc.add(
                            LoginEvent(
                              email: emailController.text.trim(),
                              password: pwdController.text,
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
                const Gap(30),
                Text.rich(
                  TextSpan(
                    text: "Don't have and account ? ",
                    children: [
                      TextSpan(
                        text: "Register",
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: AppColors.primary,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            navigateTo(context, const RegisterScreen());
                          },
                      )
                    ],
                    style: context.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
