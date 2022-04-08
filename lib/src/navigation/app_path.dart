import 'package:pick_office/src/core/domain/tab_type.dart';

abstract class AppPath {}

class MainPath extends AppPath {
  final TabType selectedTab;

  MainPath(this.selectedTab);
}

class HomePath extends MainPath {
  HomePath() : super(TabType.home);
}

class HistoryPath extends MainPath {
  HistoryPath() : super(TabType.history);
}

class BookOfficePath extends AppPath {
  final int officeId;

  BookOfficePath(this.officeId);
}


