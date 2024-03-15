import 'package:auto_route/auto_route.dart';

import '../../feature/auth/presentation/page/auth.dart';
import '../../feature/home/presentation/page/home.dart';
import '../../feature/settings/presentation/page/settings.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AuthRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: SettingsRoute.page),
      ];
}
