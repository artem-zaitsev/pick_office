import 'package:auto_route/auto_route.dart';
import 'package:pick_office/src/features/booking/ui/screens/history/history_route.dart';
import 'package:pick_office/src/features/booking/ui/screens/history/history_screen.dart';
import 'package:pick_office/src/features/booking/ui/screens/offices/offices_route.dart';
import 'package:pick_office/src/features/booking/ui/screens/offices/offices_screen.dart';
import 'package:pick_office/src/features/booking/ui/screens/select_place/select_place_screen.dart';
import 'package:pick_office/src/features/main/ui/main_route.dart';
import 'package:pick_office/src/features/main/ui/main_screen.dart';
import 'package:flutter/material.dart';

// part 'app_router.gr.dart';

export 'app_router.gr.dart';

@MaterialAutoRouter(
  routes: [
    RedirectRoute(path: '/', redirectTo: '/home'),
    AutoRoute<void>(
      path: '/:name',
      page: MainScreen,
      children: [
        AutoRoute<void>(
          path: 'home',
          page: OfficesScreen,
          children: [
            AutoRoute<void>(
              path: 'bookings/:id',
              page: SelectPlaceScreen,
            ),
          ],
        ),
        AutoRoute<void>(
          path: 'history',
          page: HistoryScreen,
        ),
      ],
    )
  ],
)
class $AppRouter {}
