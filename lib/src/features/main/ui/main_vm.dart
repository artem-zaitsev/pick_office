import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:pick_office/src/core/domain/tab_type.dart';
import 'package:pick_office/src/core/ui/handlers/error_handler.dart';
import 'package:pick_office/src/core/ui/vm/view_model.dart';
import 'package:pick_office/src/features/booking/ui/screens/history/history_route.dart';
import 'package:pick_office/src/features/booking/ui/screens/offices/offices_route.dart';

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

  TabsRouter? _tabsRouter;
  set tabsRouter(TabsRouter value) {
    _tabsRouter?.removeListener(_updateTab);
    _tabsRouter = value;
    _tabsRouter?.addListener(_updateTab);
  }

  void _updateTab() {
    activeTab = TabType.values.firstWhere((element) => element.index == _tabsRouter?.activeIndex);
    notifyListeners();
  }
  
  TabType activeTab;

  MainVm({
    required ErrorHandler errorHandler,
    TabType selectedTab = TabType.home,
  })  : activeTab = TabType.home,
        super(
          errorHandler: errorHandler,
        );

  @override
  void onInit() {
    super.onInit();

    // tabsRouter.setActiveIndex(activeTab.index);
  }

  void selectTab(int index) {
    _tabsRouter?.setActiveIndex(index);

    safe(
      () {
        activeTab =
            TabType.values.firstWhere((element) => element.index == index);

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
