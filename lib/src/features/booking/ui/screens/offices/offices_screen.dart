import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pick_office/src/core/ui/res/app_colors.dart';
import 'package:pick_office/src/core/ui/res/app_text_styles.dart';
import 'package:pick_office/src/core/ui/state/vm_state.dart';
import 'package:pick_office/src/features/booking/ui/screens/offices/offices_vm.dart';

class OfficesScreen extends StatefulWidget {
  final OfficesVm vm;

  const OfficesScreen({
    Key? key,
    required this.vm,
  }) : super(key: key);

  @override
  State<OfficesScreen> createState() => _OfficesScreenState();
}

class _OfficesScreenState extends VmState<OfficesScreen, OfficesVm> {
  @override
  OfficesVm get vm => widget.vm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.officeTitle,
        ),
      ),
      body: Builder(builder: (context) {
        if (vm.office.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (vm.office.hasError) {
          return const Center(
            child: Text('SomeError'),
          );
        }

        if (vm.office.data!.isEmpty) {
          return const Center(
            child: Text('Empty'),
          );
        }

        final offices = vm.office.data!;

        return ListView.builder(
          itemCount: vm.office.data?.length,
          itemBuilder: (ctx, i) {
            return Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowColor,
                    blurRadius: 10,
                  )
                ],
              ),
              child: Text(
                offices[i].name,
                style: AppTextStyles.text700size18Dark,
              ),
            );
          },
        );
      }),
    );
  }
}
