import 'package:adhd_app/shared/design_system/constants/ds_spacing.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_text/ds_text.dart';
import 'package:flutter/material.dart';

// TODO (docs)
class DsScaffold extends StatelessWidget {
  final List<Widget> children;
  final PreferredSizeWidget? appBar;
  final String? pageTitle;
  final double? defaultSpacing;
  final Widget? bottomNavBar;
  final FabData? fabData;

  const DsScaffold({
    required this.children,
    this.appBar,
    this.pageTitle,
    this.defaultSpacing,
    this.bottomNavBar,
    this.fabData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: bottomNavBar,
        floatingActionButton: fabData != null
            ? FloatingActionButton(
                onPressed: () {
                  fabData!.onTap();
                },
                shape: CircleBorder(),
                child: Icon(fabData!.icon),
              )
            : null,
        appBar:
            appBar ??
            (pageTitle != null ? AppBar(title: DsText(pageTitle!)) : null),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(DsSpacing.md),
          child: Column(
            spacing: defaultSpacing ?? DsSpacing.none,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children,
          ),
        ),
      ),
    );
  }
}

class FabData {
  final VoidCallback onTap;
  final IconData icon;

  const FabData({required this.onTap, this.icon = Icons.add});
}
