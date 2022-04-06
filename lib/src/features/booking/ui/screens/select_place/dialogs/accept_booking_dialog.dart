import 'package:flutter/material.dart' hide DialogRoute;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pick_office/src/core/ui/res/app_colors.dart';
import 'package:pick_office/src/core/ui/res/app_text_styles.dart';
import 'package:pick_office/src/core/ui/widgets/dialog_route.dart';

class AcceptBookingDialog extends DialogRoute<bool> {
  AcceptBookingDialog()
      : super(
          child: const Center(
            child: _AcceptDialog(),
          ),
        );
}

class _AcceptDialog extends StatelessWidget {
  const _AcceptDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      height: 167,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(14),
        ),
        color: AppColors.white,
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
            child: Text(
              AppLocalizations.of(context)!.successfulBooking,
              style: AppTextStyles.text700size18Dark,
              textAlign: TextAlign.center,
            ),
          ),
          const _Divider(),
          Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: () => Navigator.of(context).pop(true),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
                child: Text(
                  AppLocalizations.of(context)!.oneMoreText,
                  style: AppTextStyles.text400size18Blue,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          const _Divider(),
          Expanded(
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () => Navigator.of(context).pop(false),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
                  child: Text(
                    AppLocalizations.of(context)!.finishText,
                    style: AppTextStyles.text400size18Blue,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.gray,
      height: 1,
    );
  }
}
