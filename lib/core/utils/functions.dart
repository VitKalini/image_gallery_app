import 'package:flutter/material.dart';

import '../widgets/responsive_widget.dart';

int getColumnsNumber(BuildContext context) {
  if (ResponsiveWidget.isSmallScreen(context)) {
    return 3;
  } else if (ResponsiveWidget.isMediumScreen(context)) {
    return 6;
  } else if (ResponsiveWidget.isLargeScreen(context)) {
    return 12;
  } else {
    return 3;
  }
}

double getImageTileHeight(BuildContext context) {
  if (ResponsiveWidget.isSmallScreen(context)) {
    return 100;
  } else if (ResponsiveWidget.isMediumScreen(context)) {
    return 150;
  } else if (ResponsiveWidget.isLargeScreen(context)) {
    return 200;
  } else {
    return 100;
  }
}
