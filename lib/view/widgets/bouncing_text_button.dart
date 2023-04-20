import 'package:flutter/material.dart';
import 'package:test_task/view/widgets/bouncing_widget.dart';

class BouncingTextButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;

  const BouncingTextButton({
    super.key,
    this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BouncingWidget(
      onTap: onTap,
      child: TextButton(
        onPressed: null,
        child: child,
      ),
    );
  }
}
