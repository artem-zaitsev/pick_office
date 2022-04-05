import 'package:pick_office/src/core/ui/handlers/error_handler.dart';
import 'package:pick_office/src/core/ui/vm/view_model.dart';
import 'package:pick_office/src/features/main/ui/models/tab_type.dart';


/// ВьюМодель главного экрана
class MainVm extends ViewModel {
  TabType activeTab = TabType.home;

  MainVm({
    required ErrorHandler errorHandler,
  }) : super(
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
