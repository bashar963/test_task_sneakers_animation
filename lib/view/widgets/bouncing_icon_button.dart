import 'package:flutter/material.dart';
import 'package:test_task/utils/app_theme.dart';
import 'package:test_task/view/widgets/bouncing_widget.dart';

class BouncingIconButton extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;
  final Color? iconColor;
  final Color? backgroundColor;
  final bool showShadow;

  const BouncingIconButton({
    super.key,
    this.onTap,
    this.iconColor,
    this.backgroundColor,
    this.showShadow = false,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: showShadow ? 4 : 0,
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: BouncingWidget(
        onTap: onTap,
        child: CircleAvatar(
          backgroundColor:
              backgroundColor ?? AppTheme.colorSecondarySwatch.shade100,
          child: Icon(
            icon,
            color: iconColor ?? Colors.black,
          ),
        ),
      ),
    );
  }
}
