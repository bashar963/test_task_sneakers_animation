import 'package:flutter/material.dart';
import 'package:test_task/view/widgets/bouncing_icon_button.dart';

class DiscoverAppBar extends StatelessWidget {
  const DiscoverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      title: Text(
        'Discover',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      actions: [
        BouncingIconButton(
          onTap: () {},
          icon: Icons.search_rounded,
        ),
        const SizedBox(
          width: 8,
        ),
        BouncingIconButton(
          onTap: () {},
          icon: Icons.notifications_none_rounded,
        ),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }
}
