import 'package:flutter/widgets.dart';

// Использовать чтобы отключить глоу эффект у листвью андроида
class NoGlowBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}
