import 'package:flutter/material.dart';
import 'package:image_gallery_app/presentation/routes/app_router.dart';
import 'package:image_gallery_app/presentation/viewmodels/image_gallery_viewmodel.dart';
import 'package:image_gallery_app/presentation/views/image_gallery_view.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked.dart';
import 'package:image_gallery_app/injectable_config.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: AppRouter().onGenerateRoute,
      home: ViewModelBuilder<ImageGalleryViewModel>.reactive(
        viewModelBuilder: () => ImageGalleryViewModel(),
        builder: (context, viewModel, child) => const ImageGalleryView(),
      ),
    );
  }
}
