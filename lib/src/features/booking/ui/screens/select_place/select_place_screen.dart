import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pick_office/src/core/ui/res/app_assets.dart';
import 'package:pick_office/src/core/ui/res/app_colors.dart';
import 'package:pick_office/src/core/ui/res/app_text_styles.dart';
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
        leading: IconButton(
          onPressed: vm.pop,
          iconSize: 24,
          icon: SvgPicture.asset(
            AppAssets.icBack,
          ),
        ),
        title: Text(
          vm.office.data?.name ?? '',
        ),
      ),
      body: Builder(
        builder: (ctx) {
          if (vm.office.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (vm.office.hasError) {
            return  Center(
              child: Text(AppLocalizations.of(context)!.errorText),
            );
          }

          if (vm.office.data == null) {
            return  Center(
              child: Text(AppLocalizations.of(context)!.empty),
            );
          }

          return Stack(
            children: [
              Align(
                child: GestureDetector(
                  onTapDown: vm.tapOnPlace,
                  child: CustomPaint(
                    painter: _PlacesPainter(
                      vm.drawable,
                    ),
                    child: const SizedBox(
                      width: 170,
                      height: 230,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 15,
                right: 15,
                height: 50,
                child: SelectPlaceButton(
                  enabled: vm.chosenPlace != null,
                  onTap: vm.accept,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class SelectPlaceButton extends StatelessWidget {
  final bool enabled;
  final void Function() onTap;

  const SelectPlaceButton({
    Key? key,
    required this.enabled,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled ? onTap : null,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                100,
              ),
            ),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.dark.withOpacity(0.6);
            }

            return AppColors.dark;
          },
        ),
      ),
      child: Text(
        !enabled
            ? AppLocalizations.of(context)!.choosePlaceText
            : AppLocalizations.of(context)!.continueText,
        style: !enabled
            ? AppTextStyles.text700size18White60
            : AppTextStyles.text700size18White,
      ),
    );
  }
}

class _PlacesPainter extends CustomPainter {
  final DrawableRoot drawable;

  _PlacesPainter(this.drawable);

  @override
  void paint(Canvas canvas, Size size) {
    drawable.draw(
      canvas,
      Rect.fromLTWH(0, 0, size.width, size.height),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
