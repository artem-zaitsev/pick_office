import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pick_office/src/core/ui/res/app_colors.dart';
import 'package:pick_office/src/core/ui/res/app_text_styles.dart';
import 'package:pick_office/src/core/ui/state/vm_state.dart';
import 'package:pick_office/src/features/booking/domain/office.dart';
import 'package:pick_office/src/features/booking/ui/screens/offices/offices_route.dart';
import 'package:pick_office/src/features/booking/ui/screens/offices/offices_vm.dart';
import 'package:pick_office/src/navigation/app_router.dart';

class OfficesScreen extends StatefulWidget {
  final ViewModelBuilder<OfficesVm> vm;

  const OfficesScreen({
    Key? key,
    ViewModelBuilder<OfficesVm>? vm,
  })  : vm = vm ?? createVm,
        super(key: key);

  @override
  State<OfficesScreen> createState() => _OfficesScreenState();
}

class _OfficesScreenState extends VmState<OfficesScreen, OfficesVm>
    with AutomaticKeepAliveClientMixin<OfficesScreen> {
  @override
  bool get wantKeepAlive => true;

  @override
  ViewModelBuilder<OfficesVm> get vmBuilder => widget.vm;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.officeTitle,
        ),
      ),
      body: Builder(
        builder: (context) {
          if (vm.office.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (vm.office.hasError) {
            return Center(
              child: Text(AppLocalizations.of(context)!.errorText),
            );
          }

          if (vm.office.data!.isEmpty) {
            return Center(
              child: Text(AppLocalizations.of(context)!.empty),
            );
          }

          final offices = vm.office.data!;

          return ListView.builder(
            itemCount: vm.office.data?.length,
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 30,
            ),
            itemBuilder: (ctx, i) {
              return _Office(
                office: offices[i],
                onTap: vm.selectOffice,
              );
            },
          );
        },
      ),
    );
  }
}

class _Office extends StatelessWidget {
  final Office office;
  final void Function(Office) onTap;

  const _Office({
    Key? key,
    required this.office,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 10,
          )
        ],
        color: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      clipBehavior: Clip.hardEdge,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () {
             AutoTabsRouter.of(context).navigate(SelectPlaceScreenRoute(officeId: 1));
            onTap(office);
          },
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              office.name,
              style: AppTextStyles.text700size18Dark,
            ),
          ),
        ),
      ),
    );
  }
}
