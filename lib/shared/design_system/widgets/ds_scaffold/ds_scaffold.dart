import 'package:adhd_app/shared/design_system/constants/ds_spacing.dart';
import 'package:flutter/material.dart';

class DsScaffold extends StatelessWidget {
  final List<Widget> children;
  final PreferredSizeWidget? appBar;
  final String? pageTitle;
  final double? defaultSpacing;

  const DsScaffold({
    required this.children,
    this.appBar,
    this.pageTitle,
    this.defaultSpacing,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          appBar ??
          (pageTitle != null ? AppBar(title: Text(pageTitle!)) : null),
      body: SafeArea(
        child: SingleChildScrollView(
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
