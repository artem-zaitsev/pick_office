import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pick_office/src/core/ui/res/app_assets.dart';
import 'package:pick_office/src/core/ui/res/app_colors.dart';
import 'package:pick_office/src/core/ui/res/app_text_styles.dart';
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
          AppLocalizations.of(context)!.bookingHistoryTitle,
        ),
      ),
      body: Builder(
        builder: (context) {
          if (vm.bookings.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (vm.bookings.hasError) {
            return Center(
              child: Text(AppLocalizations.of(context)!.errorText),
            );
          }

          if (vm.bookings.data!.isEmpty) {
            return Center(
              child: Text(AppLocalizations.of(context)!.empty),
            );
          }

          return ListView.builder(
            itemCount: vm.bookings.data?.length,
            padding: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 15,
            ),
            itemBuilder: (ctx, i) {
              final booking = vm.bookings.data![i];

              return Container(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 51),
                margin: const EdgeInsets.only(
                  bottom: 15,
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowColor,
                      blurRadius: 10,
                    ),
                  ],
                  color: AppColors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          AppAssets.icRepeat,
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(width: 15),
                        Text(
                          booking.name,
                          style: AppTextStyles.text700size18Dark,
                        ),
                        const Spacer(flex: 2),
                        Text(
                          booking.formattedDate,
                          style: AppTextStyles.text400size15MediumGray,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text(
                      booking.officeName,
                      style: AppTextStyles.text400size18Dark,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      '${AppLocalizations.of(context)!.placePointText} ${booking.place.name}',
                      style: AppTextStyles.text400size18Dark,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
