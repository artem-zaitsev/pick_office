// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../features/booking/ui/screens/history/history_screen.dart' as _i3;
import '../features/booking/ui/screens/history/history_vm.dart' as _i9;
import '../features/booking/ui/screens/offices/offices_screen.dart' as _i2;
import '../features/booking/ui/screens/offices/offices_vm.dart' as _i8;
import '../features/booking/ui/screens/select_place/select_place_screen.dart'
    as _i4;
import '../features/booking/ui/screens/select_place/select_place_vm.dart'
    as _i10;
import '../features/main/ui/main_screen.dart' as _i1;
import '../features/main/ui/main_vm.dart' as _i7;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    MainScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<MainScreenRouteArgs>(
          orElse: () => MainScreenRouteArgs(
              selectedTabName: pathParams.getString('name')));
      return _i5.MaterialPageX<void>(
          routeData: routeData,
          child: _i1.MainScreen(
              key: args.key,
              selectedTabName: args.selectedTabName,
              vm: args.vm));
    },
    OfficesScreenRoute.name: (routeData) {
      final args = routeData.argsAs<OfficesScreenRouteArgs>(
          orElse: () => const OfficesScreenRouteArgs());
      return _i5.MaterialPageX<void>(
          routeData: routeData,
          child: _i2.OfficesScreen(key: args.key, vm: args.vm));
    },
    HistoryScreenRoute.name: (routeData) {
      final args = routeData.argsAs<HistoryScreenRouteArgs>(
          orElse: () => const HistoryScreenRouteArgs());
      return _i5.MaterialPageX<void>(
          routeData: routeData,
          child: _i3.HistoryScreen(key: args.key, vm: args.vm));
    },
    SelectPlaceScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SelectPlaceScreenRouteArgs>(
          orElse: () =>
              SelectPlaceScreenRouteArgs(officeId: pathParams.getInt('id')));
      return _i5.MaterialPageX<void>(
          routeData: routeData,
          child: _i4.SelectPlaceScreen(
              key: args.key, officeId: args.officeId, vm: args.vm));
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig('/#redirect',
            path: '/', redirectTo: '/home', fullMatch: true),
        _i5.RouteConfig(MainScreenRoute.name, path: '/:name', children: [
          _i5.RouteConfig(OfficesScreenRoute.name,
              path: 'home',
              parent: MainScreenRoute.name,
              children: [
                _i5.RouteConfig(SelectPlaceScreenRoute.name,
                    path: 'bookings/:id', parent: OfficesScreenRoute.name)
              ]),
          _i5.RouteConfig(HistoryScreenRoute.name,
              path: 'history', parent: MainScreenRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.MainScreen]
class MainScreenRoute extends _i5.PageRouteInfo<MainScreenRouteArgs> {
  MainScreenRoute(
      {_i6.Key? key,
      required String selectedTabName,
      _i7.MainVm Function(_i6.BuildContext)? vm,
      List<_i5.PageRouteInfo>? children})
      : super(MainScreenRoute.name,
            path: '/:name',
            args: MainScreenRouteArgs(
                key: key, selectedTabName: selectedTabName, vm: vm),
            rawPathParams: {'name': selectedTabName},
            initialChildren: children);

  static const String name = 'MainScreenRoute';
}

class MainScreenRouteArgs {
  const MainScreenRouteArgs({this.key, required this.selectedTabName, this.vm});

  final _i6.Key? key;

  final String selectedTabName;

  final _i7.MainVm Function(_i6.BuildContext)? vm;

  @override
  String toString() {
    return 'MainScreenRouteArgs{key: $key, selectedTabName: $selectedTabName, vm: $vm}';
  }
}

/// generated route for
/// [_i2.OfficesScreen]
class OfficesScreenRoute extends _i5.PageRouteInfo<OfficesScreenRouteArgs> {
  OfficesScreenRoute(
      {_i6.Key? key,
      _i8.OfficesVm Function(_i6.BuildContext)? vm,
      List<_i5.PageRouteInfo>? children})
      : super(OfficesScreenRoute.name,
            path: 'home',
            args: OfficesScreenRouteArgs(key: key, vm: vm),
            initialChildren: children);

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
/// [_i3.HistoryScreen]
class HistoryScreenRoute extends _i5.PageRouteInfo<HistoryScreenRouteArgs> {
  HistoryScreenRoute(
      {_i6.Key? key, _i9.HistoryVm Function(_i6.BuildContext)? vm})
      : super(HistoryScreenRoute.name,
            path: 'history', args: HistoryScreenRouteArgs(key: key, vm: vm));

  static const String name = 'HistoryScreenRoute';
}

class HistoryScreenRouteArgs {
  const HistoryScreenRouteArgs({this.key, this.vm});

  final _i6.Key? key;

  final _i9.HistoryVm Function(_i6.BuildContext)? vm;

  @override
  String toString() {
    return 'HistoryScreenRouteArgs{key: $key, vm: $vm}';
  }
}

/// generated route for
/// [_i4.SelectPlaceScreen]
class SelectPlaceScreenRoute
    extends _i5.PageRouteInfo<SelectPlaceScreenRouteArgs> {
  SelectPlaceScreenRoute(
      {_i6.Key? key,
      required int officeId,
      _i10.SelectPlaceVm Function(_i6.BuildContext)? vm})
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

  final _i10.SelectPlaceVm Function(_i6.BuildContext)? vm;

  @override
  String toString() {
    return 'SelectPlaceScreenRouteArgs{key: $key, officeId: $officeId, vm: $vm}';
  }
}
