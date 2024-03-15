import 'package:flutter/material.dart';
import 'package:frontend/app.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/dependency_injection/service_locator.dart';
import 'core/domain/entities/period_entity.dart';
import 'core/domain/entities/user_entity.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserEntityAdapter());
  Hive.registerAdapter(PeriodEntityAdapter());

  await Hive.openBox<UserEntity>('users');
  await Hive.openBox<PeriodEntity>('periods');

  configureDependencies();

  runApp(const App());
}
