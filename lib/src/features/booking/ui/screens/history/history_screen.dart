import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pick_office/src/core/ui/state/vm_state.dart';
import 'package:pick_office/src/features/booking/ui/screens/history/history_vm.dart';

class HistoryScreen extends StatefulWidget {
  final ViewModelBuilder<HistoryVm> vm;

  const HistoryScreen({
    Key? key,
    required this.vm,
  }) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends VmState<HistoryScreen, HistoryVm> {
  @override
  ViewModelBuilder<HistoryVm> get vmBuilder => widget.vm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.officeTitle,
        ),
      ),
    );
  }
}
