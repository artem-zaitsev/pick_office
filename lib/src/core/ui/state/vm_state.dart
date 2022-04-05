import 'package:flutter/material.dart';
import 'package:pick_office/src/core/ui/vm/view_model.dart';


/// Базовый стейт всех StatefulWidget  c ViewModel
/// 
/// Подписывается и отписывается от ченджнотифайера
abstract class VmState<T extends StatefulWidget, VM extends ViewModel>
    extends State<T> {
  VM get vm;
  @override
  void initState() {
    super.initState();

    vm.addListener(_listen);
  }

  @override
  void dispose() {
    vm.removeListener(_listen);

    super.dispose();
  }

  void _listen() => setState(() {});
}
