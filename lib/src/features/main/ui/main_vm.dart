import 'package:flutter/widgets.dart';
import 'package:pick_office/src/core/domain/tab_type.dart';
import 'package:pick_office/src/core/ui/handlers/error_handler.dart';
import 'package:pick_office/src/core/ui/vm/view_model.dart';
import 'package:pick_office/src/features/booking/ui/screens/history/history_route.dart';
import 'package:pick_office/src/features/booking/ui/screens/offices/offices_route.dart';

/// ВьюМодель главного экрана
class MainVm extends ViewModel {
  late final tabsRoutes = <String, Route<dynamic>>{
    TabType.history.name: HistoryRoute(),
    TabType.home.name: OfficesRoute(),
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
        activeTab =
            TabType.values.firstWhere((element) => element.index == index);

        notifyListeners();
      },
    );
  }
}
