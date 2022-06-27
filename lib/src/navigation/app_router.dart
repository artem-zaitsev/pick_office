import 'package:auto_route/auto_route.dart';
import 'package:pick_office/src/features/booking/ui/screens/history/history_screen.dart';
import 'package:pick_office/src/features/booking/ui/screens/offices/offices_screen.dart';
import 'package:pick_office/src/features/booking/ui/screens/select_place/select_place_screen.dart';
import 'package:pick_office/src/features/main/ui/main_screen.dart';

// part 'app_router.gr.dart';

export 'app_router.gr.dart';

@MaterialAutoRouter(
  routes: [
    // RedirectRoute(path: '*', redirectTo: '/'),
    AutoRoute<void>(
      path: '/',
      page: MainScreen,
      children: [
        AutoRoute<void>(
          path: 'home',
          page: EmptyRouterPage,
          name: 'OfficeTab',
          initial: true,
          children: [
            AutoRoute<void>(
              path: '',
              page: OfficesScreen,
            ),
            AutoRoute<void>(
              path: 'bookings/:id',
              page: SelectPlaceScreen,
            ),
          ],
        ),
        AutoRoute<void>(
          path: 'history',
          page: EmptyRouterPage,
          name: 'HistoryTab',
          children: [
            AutoRoute<void>(
              path: '',
              page: HistoryScreen,
            )
          ]
        ),
      ],
    )
  ],
)
class $AppRouter {}
