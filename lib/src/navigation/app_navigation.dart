import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pick_office/src/core/domain/tab_type.dart';
// import 'package:go_router/go_router.dart';
import 'package:pick_office/src/features/booking/ui/screens/history/history_route.dart';
import 'package:pick_office/src/features/booking/ui/screens/offices/offices_route.dart';
import 'package:pick_office/src/features/booking/ui/screens/select_place/select_place_route.dart';
import 'package:pick_office/src/features/booking/ui/screens/select_place/select_place_screen.dart';
import 'package:pick_office/src/features/main/ui/main_route.dart';
import 'package:pick_office/src/features/main/ui/main_screen.dart';
import 'package:pick_office/src/navigation/app_path.dart';
import 'package:pick_office/src/navigation/app_route_delegate.dart';
import 'package:pick_office/src/navigation/app_route_information_parser.dart';

/// Граф навигации
abstract class AppNavigation {
  static final nestedRoutes = <String, Route<dynamic> Function(RouteSettings)>{
    SelectPlaceRoute.routeName: (rs) => SelectPlaceRoute(
          officeId: rs.arguments as int,
        ),
    OfficesRoute.routeName: (rs) => OfficesRoute(),
    HistoryRoute.routeName: (rs) => HistoryRoute(),
  };

  static final pages = <Type, MaterialPage<dynamic> Function(AppPath)>{
    HomePath: (path) => MaterialPage<void>(
          child: MainScreen(
            vm: (ctx) => createMainVm(ctx, (path as MainPath).selectedTab),
          ),
        ),
    HistoryPath: (path) => MaterialPage<void>(
          child: MainScreen(
            vm: (ctx) => createMainVm(ctx, (path as MainPath).selectedTab),
          ),
        ),
    BookOfficePath: (path) => MaterialPage<void>(
          child: SelectPlaceScreen(
            vm: (ctx) =>
                createSelectPlaceVm(ctx, (path as BookOfficePath).officeId),
          ),
        ),
  };

  static final delegate = AppRouteDelegate();
  static final parser = AppRouteInformationParser();

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: MainRoute.routeName,
        redirect: (_) => '/${TabType.home.name}',
        pageBuilder: (ctx, state) => MainRoute(selectedTab: TabType.home),
      ),
      GoRoute(
        path: '/:tab',
        pageBuilder: (ctx, state) {
          final tab = TabType.values.firstWhere(
            (element) => element.name == (state.params['tab'] ?? TabType.home),
          );

          return MainRoute(
            selectedTab: tab,
          );
        },
      ),
    ],
  );
}
