import 'package:flutter/material.dart';
import 'package:image_gallery_app/presentation/views/image_gallery_view.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:image_gallery_app/injectable_config.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

import 'core/utils/theme_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(Environment.prod);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Gallery App',
      theme: ThemeSetup(
        Colors.black,
        TW3Colors.orange.shade300,
      ).defaultThemeData,
      navigatorKey: StackedService.navigatorKey,
      home: const ImageGalleryView(),
    );
  }
}
