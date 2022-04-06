import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pick_office/src/core/ui/state/vm_state.dart';
import 'package:pick_office/src/features/booking/ui/screens/select_place/select_place_vm.dart';

class SelectPlaceScreen extends StatefulWidget {
  final ViewModelBuilder<SelectPlaceVm> vm;

  const SelectPlaceScreen({
    Key? key,
    required this.vm,
  }) : super(key: key);

  @override
  State<SelectPlaceScreen> createState() => _SelectPlaceScreenState();
}

class _SelectPlaceScreenState
    extends VmState<SelectPlaceScreen, SelectPlaceVm> {
  @override
  ViewModelBuilder<SelectPlaceVm> get vmBuilder => widget.vm;

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
