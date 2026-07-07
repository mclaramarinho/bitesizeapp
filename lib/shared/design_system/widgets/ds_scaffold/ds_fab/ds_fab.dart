import 'package:flutter/material.dart';

class DsFab extends StatelessWidget {
  final FabData fabData;

  const DsFab({super.key, required this.fabData});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        fabData.onTap();
      },
      tooltip: fabData.tooltip,
      shape: CircleBorder(),
      child: Icon(fabData.icon),
    );
  }
}

class FabData {
  final VoidCallback onTap;
  final IconData icon;
  final String tooltip;

  const FabData({
    required this.onTap,
    required this.tooltip,
    this.icon = Icons.add,
  });
}
