import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pick_office/src/core/ui/res/app_assets.dart';
import 'package:pick_office/src/core/ui/res/app_colors.dart';
import 'package:pick_office/src/core/ui/state/vm_state.dart';
import 'package:pick_office/src/features/main/ui/main_vm.dart';
import 'package:pick_office/src/features/main/ui/models/tab_type.dart';

class MainScreen extends StatefulWidget {
  final MainVm vm;
  const MainScreen({
    Key? key,
    required this.vm,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends VmState<MainScreen, MainVm> {
  @override
  MainVm get vm => widget.vm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: SizedBox(
        height: 82,
        child: Row(
          children: [
            for (final tab in TabType.values)
              Expanded(
                child: Column(
                  children: [
                    if (tab == vm.activeTab)
                      Container(
                        height: 3,
                        decoration: const BoxDecoration(
                          color: AppColors.dark,
                          borderRadius: BorderRadius.all(Radius.circular(0.5)),
                        ),
                      ),
                    Expanded(
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          onTap: () => vm.selectTab(tab.index),
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
