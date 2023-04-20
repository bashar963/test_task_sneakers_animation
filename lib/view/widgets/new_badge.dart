import 'package:flutter/material.dart';
import 'dart:math' as math;

class NewBadge extends StatelessWidget {
  const NewBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: math.pi / -2,
      child: Container(
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 2),
        child: Center(
          child: Text(
            'New',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
