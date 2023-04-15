import 'package:flutter/material.dart';

class PilarAppBar extends StatelessWidget with PreferredSizeWidget {
  final List<Widget>? actions;
  const PilarAppBar({
    super.key,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Pilar'),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
