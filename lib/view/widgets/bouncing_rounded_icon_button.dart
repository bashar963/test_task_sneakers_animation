import 'package:flutter/material.dart';
import 'package:test_task/utils/app_theme.dart';
import 'package:test_task/view/widgets/bouncing_widget.dart';

class BouncingRoundedIconButton extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;
  final Color? iconColor;
  final Color? backgroundColor;
  final bool showShadow;

  const BouncingRoundedIconButton({
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
      child: BouncingWidget(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: backgroundColor ?? AppTheme.colorSecondarySwatch.shade100,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Icon(
              icon,
              color: iconColor ?? AppTheme.colorSecondarySwatch.shade600,
            ),
          ),
        ),
      ),
    );
  }
}
