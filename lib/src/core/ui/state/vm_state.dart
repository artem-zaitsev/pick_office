import 'package:flutter/material.dart';
import 'package:pick_office/src/core/ui/vm/view_model.dart';

typedef ViewModelBuilder<VM> = VM Function(BuildContext);

/// Базовый стейт всех StatefulWidget  c ViewModel
///
/// Подписывается и отписывается от ченджнотифайера
abstract class VmState<T extends StatefulWidget, VM extends ViewModel>
    extends State<T> {
  late final VM vm;

  ViewModelBuilder<VM> get vmBuilder;
  
  @override
  void initState() {
    super.initState();
    vm = vmBuilder(context);

    vm
      ..addListener(_listen)
      ..onInit();
  }

  @override
  void dispose() {
    vm
      ..onDispose()
      ..removeListener(_listen);

    super.dispose();
  }

  //ignore: no-empty-block
  void _listen() => setState(() {});
}
