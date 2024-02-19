import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SabCachedNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Alignment alignment;
  final Widget? placeholder;
  final Widget? errorWidget;

  const SabCachedNetworkImage(
    this.imageUrl, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.placeholder,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) => imageUrl != null
      ? CachedNetworkImage(
          imageUrl: imageUrl!,
          width: width,
          height: height,
          fit: fit,
          alignment: alignment,
          placeholder: placeholder != null ? (_, __) => placeholder! : null,
          errorWidget:
              errorWidget != null ? (_, __, ___) => errorWidget! : null,
        )
      : SizedBox(
          width: width,
          height: height,
          child: errorWidget,
        );
}
