import 'package:auto_route/auto_route.dart';
import 'package:formation_flutter_join24/shared/router/app_routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AppInitRoute.page,
          initial: true,
        )
      ];
}
