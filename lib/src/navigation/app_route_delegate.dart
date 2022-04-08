import 'package:flutter/material.dart';
import 'package:pick_office/src/navigation/app_navigation.dart';
import 'package:pick_office/src/navigation/app_path.dart';

class AppRouteDelegate extends RouterDelegate<AppPath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppPath> {
  AppPath currentPath = HomePath();

  @override
  AppPath? get currentConfiguration => currentPath;

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Navigator(
          pages: [
            if (currentConfiguration == null) //show 404
              AppNavigation.pages[HomePath]!(
                HomePath(),
              ),
              
            if (currentConfiguration != null)
              AppNavigation.pages[currentConfiguration.runtimeType]!(
                currentConfiguration!,
              ),
          ],
          onPopPage: (route, dynamic result) {
            if (!route.didPop(result)) {
              return false;
            }

            currentPath = HomePath();

            notifyListeners();

            return true;
          },
        ),
      ],
    );
  }

  @override
  Future<void> setNewRoutePath(AppPath configuration) async {
    currentPath = configuration;

    notifyListeners();
  }
}