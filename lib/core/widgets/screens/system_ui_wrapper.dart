import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class SystemUiWrapper extends StatelessWidget {
  final Widget child;
  final Color navBarColor;
  final Brightness iconBrightness;

  const SystemUiWrapper({
    super.key,
    required this.child,
    this.navBarColor = Colors.white,
    this.iconBrightness = Brightness.dark,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: navBarColor,
        systemNavigationBarIconBrightness: iconBrightness,
      ),
      child: child,
    );
  }
}
