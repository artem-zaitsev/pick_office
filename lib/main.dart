import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pick_office/src/features/booking/services/storage/data/hive_booking.dart';

import 'src/features/app/app.dart';

// ignore: avoid_void_async
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(HiveBookingAdapter());

  runApp(const App());
}
