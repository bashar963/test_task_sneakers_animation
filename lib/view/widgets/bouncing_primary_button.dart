import 'package:flutter/material.dart';
import 'package:test_task/view/widgets/bouncing_widget.dart';

class BouncingPrimaryButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;

  const BouncingPrimaryButton({
    super.key,
    this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BouncingWidget(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(child: child),
      ),
    );
  }
}
