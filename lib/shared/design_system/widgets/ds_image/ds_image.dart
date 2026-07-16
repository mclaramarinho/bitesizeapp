import 'dart:convert';
import 'dart:typed_data';
import 'package:adhd_app/shared/design_system/constants/ds_themes.dart';
import 'package:flutter/material.dart';

enum ImageSourceType { base64 }

class DsImage extends StatefulWidget {
  final ImageSourceType sourceType;
  final String source;
  final double? width;
  final double? height;

  const DsImage({
    required this.sourceType,
    required this.source,
    this.width,
    this.height,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _DsImageState();
}

class _DsImageState extends State<DsImage> {
  late Uint8List imageBytes;
  late bool isLoading;
  late bool error;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    if (widget.sourceType == ImageSourceType.base64) {
      _handleBase64();
    }
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return CircularProgressIndicator(
        color: DsThemes.current.colorScheme.inversePrimary,
      );
    }
    if (error) return const Placeholder();

    final imageWidget = Image.memory(
      imageBytes,
      width: widget.width,
      height: widget.height,
      fit: BoxFit.cover,
    );

    if (widget.width != null || widget.height != null) {
      return SizedBox(
        width: widget.width,
        height: widget.height,
        child: imageWidget,
      );
    }

    return imageWidget;
  }

  _handleBase64() {
    try {
      final base64String = widget.source;
      String cleanBase64 = base64String.contains(',')
          ? base64String.split(',').last
          : base64String;

      imageBytes = base64Decode(cleanBase64.trim());
      error = false;
    } catch (e) {
      error = true;
    }
  }
}
