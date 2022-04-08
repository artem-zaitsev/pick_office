import 'package:flutter/widgets.dart';
import 'package:pick_office/src/core/domain/tab_type.dart';
import 'package:pick_office/src/core/ui/handlers/error_handler.dart';
import 'package:pick_office/src/core/ui/vm/view_model.dart';
import 'package:pick_office/src/features/booking/ui/screens/history/history_route.dart';
import 'package:pick_office/src/features/booking/ui/screens/offices/offices_route.dart';
import 'package:pick_office/src/navigation/app_navigation.dart';
import 'package:pick_office/src/navigation/app_path.dart';

/// ВьюМодель главного экрана
class MainVm extends ViewModel {
  final tabsRoutes = <String, Route<dynamic>>{
    TabType.history.name: HistoryRoute(),
    TabType.home.name: OfficesRoute(),
  };

  final tabNavKeys = <TabType, GlobalKey<NavigatorState>>{
    TabType.home: GlobalKey(),
    TabType.history: GlobalKey(),
  };

  TabType activeTab;

  MainVm({
    required ErrorHandler errorHandler,
    TabType selectedTab = TabType.home,
  })  : activeTab = selectedTab,
        super(
          errorHandler: errorHandler,
        );

  void selectTab(int index) {
    safe(
      () {
        // activeTab =
        //     TabType.values.firstWhere((element) => element.index == index);

        AppNavigation.delegate.setNewRoutePath(
          index == TabType.home.index ? HomePath() : HistoryPath(),
        );
        
        notifyListeners();
      },
    );
  }

  /// Обрабатывает нажатие системной кнопки назад, если находимся в табах.
  Future<bool> willPop() async {
    final current = tabNavKeys[activeTab];

    return !(await current?.currentState?.maybePop() ?? false);
  }
}
