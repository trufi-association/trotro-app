import 'package:flutter/material.dart';
import 'package:trotro_app/configuration_service.dart';
import 'package:trotro_app/theme/theme.dart';
import 'package:trufi_core/trufi_app.dart';

import 'drawer_menu/drawer_menu.dart';

void main() async {
  runApp(
    TrufiApp(
      configuration: setupConfiguration(),
      theme: trotroTheme,
      bottomBarTheme: bottomBarTheme,
      menuItems: menuItems,
    ),
  );
}
