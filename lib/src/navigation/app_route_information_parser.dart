import 'package:flutter/material.dart';
import 'package:pick_office/src/navigation/app_path.dart';

class AppRouteInformationParser extends RouteInformationParser<AppPath> {
  @override
  Future<AppPath> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    // /home
    // /home/book/1
    // /home/history

    final uri = Uri.parse(routeInformation.location ?? '');

    if (uri.pathSegments.length >= 2) {
      if (uri.pathSegments[1] == 'book') {
        return BookOfficePath(int.tryParse(uri.pathSegments[2]) ?? 1);
      }

      return BookOfficePath(1);
    } else if (uri.pathSegments.isNotEmpty &&
        uri.pathSegments.first == 'home') {
      return HomePath();
    } else if (uri.pathSegments.isNotEmpty &&
        uri.pathSegments.first == 'history') {
      return HistoryPath();
    } else {
      debugPrint(uri.pathSegments.join(','));
      // /home/book/1

      return HomePath();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(AppPath configuration) {
    if (configuration is HomePath) {
      return const RouteInformation(location: '/home');
    }
    if (configuration is HistoryPath) {
      return const RouteInformation(location: '/history');
    }
    if (configuration is BookOfficePath) {
      return RouteInformation(location: '/home/book/${configuration.officeId}');
    }

    return null;
  }
}
