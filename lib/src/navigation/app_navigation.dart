import 'package:go_router/go_router.dart';
import 'package:pick_office/src/core/ui/handlers/error_handler.dart';
import 'package:pick_office/src/features/main/ui/main_route.dart';
import 'package:pick_office/src/features/main/ui/main_vm.dart';

/// Граф навигации
abstract class AppNavigation {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (ctx, state) => MainRoute(
          vm: MainVm(
            errorHandler: ErrorHandler(ctx),
          ),
        ),
      )
    ],
  );
}
