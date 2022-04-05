import 'package:go_router/go_router.dart';
import 'package:pick_office/src/core/ui/handlers/error_handler.dart';
import 'package:pick_office/src/features/booking/services/office_service.dart';
import 'package:pick_office/src/features/booking/services/repository/api/office_api.dart';
import 'package:pick_office/src/features/booking/services/repository/office_repository.dart';
import 'package:pick_office/src/features/booking/ui/screens/offices/offices_route.dart';
import 'package:pick_office/src/features/booking/ui/screens/offices/offices_vm.dart';
import 'package:pick_office/src/features/main/ui/main_route.dart';
import 'package:pick_office/src/features/main/ui/main_vm.dart';
import 'package:pick_office/src/features/main/ui/models/tab_type.dart';

/// Граф навигации
abstract class AppNavigation {
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
            vm: MainVm(
              errorHandler: ErrorHandler(ctx),
              selectedTab: tab,
            ),
          );
        },
        routes: [
          GoRoute(
            path: 'offices',
            pageBuilder: (ctx, state) {
              return OfficesRoute(
                vm: OfficesVm(
                  OfficeService(
                    OfficeRepository(
                      OfficeApi(),
                    ),
                  ),
                  errorHandler: ErrorHandler(ctx),
                ),
              );
            },
          )
        ],
      )
    ],
  );
}
