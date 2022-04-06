import 'package:flutter/material.dart';
import 'package:pick_office/src/core/ui/vm/view_model.dart';

typedef ViewModelBuilder<VM> = VM Function(BuildContext);

/// Базовый стейт всех StatefulWidget  c ViewModel
///
/// Подписывается и отписывается от ченджнотифайера
abstract class VmState<T extends StatefulWidget, VM extends ViewModel>
    extends State<T> {
  ViewModelBuilder<VM> get vmBuilder;
  VM get vm => _vm;
  
  late VM _vm;

  @override
  void initState() {
    super.initState();
    _vm = vmBuilder(context);

    _vm
      ..addListener(_listen)
      ..onInit();
  }

  @override
  void didUpdateWidget(covariant T oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget != widget) {
      _vm.removeListener(_listen);

      _vm = vmBuilder(context);

      _vm
        ..addListener(_listen)
        ..onInit();
    }
  }

  @override
  void dispose() {
    _vm
      ..onDispose()
      ..removeListener(_listen);

    super.dispose();
  }

  //ignore: no-empty-block
  void _listen() => setState(() {});
}
