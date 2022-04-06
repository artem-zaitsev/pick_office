import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pick_office/src/core/domain/tab_type.dart';
import 'package:pick_office/src/features/booking/ui/screens/history/history_route.dart';
import 'package:pick_office/src/features/booking/ui/screens/offices/offices_route.dart';
import 'package:pick_office/src/features/booking/ui/screens/select_place/select_place_route.dart';
import 'package:pick_office/src/features/main/ui/main_route.dart';

/// Граф навигации
abstract class AppNavigation {
  static final nestedRoutes = <String, Route<dynamic> Function(RouteSettings)>{
    SelectPlaceRoute.routeName: (rs) => SelectPlaceRoute(
          officeId: rs.arguments as int,
        ),
    OfficesRoute.routeName: (rs) => OfficesRoute(),
    HistoryRoute.routeName: (rs) => HistoryRoute(),
  };

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        redirect: (_) => '/${TabType.home.name}',
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
