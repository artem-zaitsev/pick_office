import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pick_office/src/core/domain/tab_type.dart';
import 'package:pick_office/src/core/ui/res/app_assets.dart';
import 'package:pick_office/src/core/ui/res/app_colors.dart';
import 'package:pick_office/src/core/ui/state/vm_state.dart';
import 'package:pick_office/src/features/animations/ui/button/button_screen.dart';
import 'package:pick_office/src/features/animations/ui/play/play_screen.dart';
import 'package:pick_office/src/features/main/ui/main_route.dart';
import 'package:pick_office/src/features/main/ui/main_vm.dart';
import 'package:pick_office/src/navigation/app_router.dart';

class MainScreen extends StatefulWidget {
  final ViewModelBuilder<MainVm> vm;

  const MainScreen({
    Key? key,
    // @PathParam('name') required String selectedTabName,
    ViewModelBuilder<MainVm>? vm,
  })  : vm = vm ?? createVm,
        super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends VmState<MainScreen, MainVm> {
  @override
  ViewModelBuilder<MainVm> get vmBuilder => widget.vm;

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        const OfficeTab(),
        const HistoryTab(),
      ],
      builder: (context, child, _) {
        final tabsRoute = AutoTabsRouter.of(context);
        vm.tabsRouter = tabsRoute;

        return Scaffold(
          body: Stack(
            children: [
              child,
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                           Navigator.of(context).push(MaterialPageRoute<void>(builder: (ctx) => ButtonScreen()));
                        },
                        child: Text('Buttons'),
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                           Navigator.of(context).push(MaterialPageRoute<void>(builder: (ctx) => PlayScreen()));
                        },
                        child: Text('Play'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          bottomNavigationBar: SizedBox(
            height: 82,
            child: Row(
              children: [
                for (final tab in TabType.values)
                  Expanded(
                    child: Column(
                      children: [
                        if (tab.index == tabsRoute.activeIndex)
                          Container(
                            height: 3,
                            decoration: const BoxDecoration(
                              color: AppColors.dark,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0.5)),
                            ),
                          ),
                        Expanded(
                          child: Material(
                            type: MaterialType.transparency,
                            child: InkWell(
                              onTap: () {
                                tabsRoute.setActiveIndex(tab.index);
                                vm.selectTab(tab.index);
                              },
                              child: Center(
                                child: _Icon(
                                  tab: tab,
                                  isActive: tab == vm.activeTab,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Icon extends StatelessWidget {
  final TabType tab;
  final bool isActive;

  const _Icon({
    Key? key,
    required this.tab,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (tab) {
      case TabType.home:
        return SvgPicture.asset(
          AppAssets.icHome,
          width: 20,
          height: 15,
          color: _getColor(),
        );

      case TabType.history:
        return SvgPicture.asset(
          AppAssets.icHistory,
          width: 15,
          height: 15,
          color: _getColor(),
        );
    }
  }

  Color _getColor() =>
      isActive ? AppColors.dark : AppColors.dark.withOpacity(0.4);
}
