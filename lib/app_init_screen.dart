import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formation_flutter_join24/auth/logic/bloc/auth_bloc.dart';
import 'package:formation_flutter_join24/auth/presentation/login_screen.dart';
import 'package:formation_flutter_join24/shared/app_routes.dart';
import 'package:formation_flutter_join24/shared/pages/application_screen.dart';
import 'package:gap/gap.dart';

@RoutePage()
class AppInitScreen extends StatefulWidget {
  const AppInitScreen({super.key});

  @override
  State<AppInitScreen> createState() => _AppInitScreenState();
}

class _AppInitScreenState extends State<AppInitScreen> {
  late AuthBloc authBloc;

  @override
  void initState() {
    authBloc = AuthBloc()..add(CheckAuthStateEvent());
    super.initState();
  }

  _handleNextScreen() async {
    await Future.delayed(
      const Duration(milliseconds: 2500),
      () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
          (route) => false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        bloc: authBloc,
        listener: (context, state) {
          if (state is CheckAuthStateFailure) {
            setRoot(context, const LoginScreen());
          }

          if (state is CheckAuthStateSuccess) {
            setRoot(context, const ApplicationScreen());
          }
        },
        child: Column(
          children: [
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.train,
                  color: Colors.purpleAccent,
                ),
                const Gap(8),
                Text(
                  "Formation Flutter",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Colors.purpleAccent,
                        fontSize: 24,
                      ),
                )
              ],
            ),
            const Spacer(),
            const Center(
              child: CircularProgressIndicator(
                color: Colors.purpleAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
