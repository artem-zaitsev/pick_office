// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i6;

import '../features/booking/ui/screens/history/history_screen.dart' as _i5;
import '../features/booking/ui/screens/history/history_vm.dart' as _i10;
import '../features/booking/ui/screens/offices/offices_screen.dart' as _i3;
import '../features/booking/ui/screens/offices/offices_vm.dart' as _i8;
import '../features/booking/ui/screens/select_place/select_place_screen.dart'
    as _i4;
import '../features/booking/ui/screens/select_place/select_place_vm.dart'
    as _i9;
import '../features/main/ui/main_screen.dart' as _i1;
import '../features/main/ui/main_vm.dart' as _i7;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    MainScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MainScreenRouteArgs>(
          orElse: () => const MainScreenRouteArgs());
      return _i2.MaterialPageX<void>(
          routeData: routeData,
          child: _i1.MainScreen(key: args.key, vm: args.vm));
    },
    OfficeTab.name: (routeData) {
      return _i2.MaterialPageX<void>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    HistoryTab.name: (routeData) {
      return _i2.MaterialPageX<void>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    OfficesScreenRoute.name: (routeData) {
      final args = routeData.argsAs<OfficesScreenRouteArgs>(
          orElse: () => const OfficesScreenRouteArgs());
      return _i2.MaterialPageX<void>(
          routeData: routeData,
          child: _i3.OfficesScreen(key: args.key, vm: args.vm));
    },
    SelectPlaceScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SelectPlaceScreenRouteArgs>(
          orElse: () =>
              SelectPlaceScreenRouteArgs(officeId: pathParams.getInt('id')));
      return _i2.MaterialPageX<void>(
          routeData: routeData,
          child: _i4.SelectPlaceScreen(
              key: args.key, officeId: args.officeId, vm: args.vm));
    },
    HistoryScreenRoute.name: (routeData) {
      final args = routeData.argsAs<HistoryScreenRouteArgs>(
          orElse: () => const HistoryScreenRouteArgs());
      return _i2.MaterialPageX<void>(
          routeData: routeData,
          child: _i5.HistoryScreen(key: args.key, vm: args.vm));
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(MainScreenRoute.name, path: '/', children: [
          _i2.RouteConfig('#redirect',
              path: '',
              parent: MainScreenRoute.name,
              redirectTo: 'home',
              fullMatch: true),
          _i2.RouteConfig(OfficeTab.name,
              path: 'home',
              parent: MainScreenRoute.name,
              children: [
                _i2.RouteConfig(OfficesScreenRoute.name,
                    path: '', parent: OfficeTab.name),
                _i2.RouteConfig(SelectPlaceScreenRoute.name,
                    path: 'bookings/:id', parent: OfficeTab.name)
              ]),
          _i2.RouteConfig(HistoryTab.name,
              path: 'history',
              parent: MainScreenRoute.name,
              children: [
                _i2.RouteConfig(HistoryScreenRoute.name,
                    path: '', parent: HistoryTab.name)
              ])
        ])
      ];
}

/// generated route for
/// [_i1.MainScreen]
class MainScreenRoute extends _i2.PageRouteInfo<MainScreenRouteArgs> {
  MainScreenRoute(
      {_i6.Key? key,
      _i7.MainVm Function(_i6.BuildContext)? vm,
      List<_i2.PageRouteInfo>? children})
      : super(MainScreenRoute.name,
            path: '/',
            args: MainScreenRouteArgs(key: key, vm: vm),
            initialChildren: children);

  static const String name = 'MainScreenRoute';
}

class MainScreenRouteArgs {
  const MainScreenRouteArgs({this.key, this.vm});

  final _i6.Key? key;

  final _i7.MainVm Function(_i6.BuildContext)? vm;

  @override
  String toString() {
    return 'MainScreenRouteArgs{key: $key, vm: $vm}';
  }
}

/// generated route for
/// [_i2.EmptyRouterPage]
class OfficeTab extends _i2.PageRouteInfo<void> {
  const OfficeTab({List<_i2.PageRouteInfo>? children})
      : super(OfficeTab.name, path: 'home', initialChildren: children);

  static const String name = 'OfficeTab';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class HistoryTab extends _i2.PageRouteInfo<void> {
  const HistoryTab({List<_i2.PageRouteInfo>? children})
      : super(HistoryTab.name, path: 'history', initialChildren: children);

  static const String name = 'HistoryTab';
}

/// generated route for
/// [_i3.OfficesScreen]
class OfficesScreenRoute extends _i2.PageRouteInfo<OfficesScreenRouteArgs> {
  OfficesScreenRoute(
      {_i6.Key? key, _i8.OfficesVm Function(_i6.BuildContext)? vm})
      : super(OfficesScreenRoute.name,
            path: '', args: OfficesScreenRouteArgs(key: key, vm: vm));

  static const String name = 'OfficesScreenRoute';
}

class OfficesScreenRouteArgs {
  const OfficesScreenRouteArgs({this.key, this.vm});

  final _i6.Key? key;

  final _i8.OfficesVm Function(_i6.BuildContext)? vm;

  @override
  String toString() {
    return 'OfficesScreenRouteArgs{key: $key, vm: $vm}';
  }
}

/// generated route for
/// [_i4.SelectPlaceScreen]
class SelectPlaceScreenRoute
    extends _i2.PageRouteInfo<SelectPlaceScreenRouteArgs> {
  SelectPlaceScreenRoute(
      {_i6.Key? key,
      required int officeId,
      _i9.SelectPlaceVm Function(_i6.BuildContext)? vm})
      : super(SelectPlaceScreenRoute.name,
            path: 'bookings/:id',
            args: SelectPlaceScreenRouteArgs(
                key: key, officeId: officeId, vm: vm),
            rawPathParams: {'id': officeId});

  static const String name = 'SelectPlaceScreenRoute';
}

class SelectPlaceScreenRouteArgs {
  const SelectPlaceScreenRouteArgs({this.key, required this.officeId, this.vm});

  final _i6.Key? key;

  final int officeId;

  final _i9.SelectPlaceVm Function(_i6.BuildContext)? vm;

  @override
  String toString() {
    return 'SelectPlaceScreenRouteArgs{key: $key, officeId: $officeId, vm: $vm}';
  }
}

/// generated route for
/// [_i5.HistoryScreen]
class HistoryScreenRoute extends _i2.PageRouteInfo<HistoryScreenRouteArgs> {
  HistoryScreenRoute(
      {_i6.Key? key, _i10.HistoryVm Function(_i6.BuildContext)? vm})
      : super(HistoryScreenRoute.name,
            path: '', args: HistoryScreenRouteArgs(key: key, vm: vm));

  static const String name = 'HistoryScreenRoute';
}

class HistoryScreenRouteArgs {
  const HistoryScreenRouteArgs({this.key, this.vm});

  final _i6.Key? key;

  final _i10.HistoryVm Function(_i6.BuildContext)? vm;

  @override
  String toString() {
    return 'HistoryScreenRouteArgs{key: $key, vm: $vm}';
  }
}
