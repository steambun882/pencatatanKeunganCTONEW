import 'package:flutter/widgets.dart';

class ResponsiveBreakpoints {
  const ResponsiveBreakpoints._();

  static const double compact = 640;
  static const double medium = 1024;

  static bool isCompact(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width < compact;
  }

  static bool isMedium(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width >= compact && width < medium;
  }

  static bool isExpanded(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width >= medium;
  }

  static EdgeInsets pagePadding(BuildContext context) {
    if (isExpanded(context)) {
      return const EdgeInsets.symmetric(horizontal: 48, vertical: 32);
    }

    if (isMedium(context)) {
      return const EdgeInsets.symmetric(horizontal: 32, vertical: 24);
    }

    return const EdgeInsets.symmetric(horizontal: 16, vertical: 16);
  }
}
